### =============================================================================================
###  getMyBusinessDf.R
##   Function:  select only data elements of interest from the business data file of the 
###             Yelp Data Challenge dataset
###  Additional process:  execute the vector in the categories if necessary
###  Output:    write the output data into a table in a SQL server database
### ==============================================================================================
bdf <- data.frame(matrix(nrow=1, ncol=7))
colnames(bdf) <- c("id", "name", "categories",  "review_count", "city", "state", "stars") 
for (i in 1:dim(businessDf)[1]) {
    tryCatch(
      {
          cat <- paste(eval(parse(text=businessDf$categories[i])), sep= "", collapse=",")
          cat
      },
    error= function(cond) {
            message(cond)
            cat <- businessDf$categories[i];
            cat
      }
    )
    t_bdf <- data.frame(id = businessDf$business_id[i], name= businessDf$name[i], categories = cat
                        , review_count = businessDf$review_count[i]
                        , city=businessDf$city[i]
                        , state = businessDf$state[i], stars = businessDf$stars[i])
    t_bdf
    bdf <- rbind(bdf, t_bdf)
  
}

## write bdf to db to save
library('RODBC')

options(stringAsFactors=FALSE)

connHandle <- odbcConnect("p-sql-w-ehr01.athena_dev", uid="ehruser", pwd="ehruser123");

sqlSave(connHandle, bdf, tablename='dbo.temp_bdf', rownames=FALSE)
close (connHandle);
