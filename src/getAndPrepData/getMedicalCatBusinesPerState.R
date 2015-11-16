### ===================================================================================
##  getMedicalCatBusinesPerState
##      Return the number of business counts per state.  Business categorie is 
##             healthcare related
## ====================================================================================
getMedicalCatBusinesPerState  <- function(state) {
  
  library('RODBC')
  
  ## Proposals for AISL, Year 2016, summarization
  ## Using: LDA on All documents
  ##
  options(stringAsFactors=FALSE)
  
  connHandle <- odbcConnect("p-sql-w-ehr01.athena_dev", uid="ehruser", pwd="ehruser123");
  
  sqlString <- paste0(
    "select b.id, b.name, b.categories, b.review_count, b.city, b.state, b.stars"
    ," from athena_dev.dbo.temp_bdf  b											 "
    ," where 1 = 1																 "
    ," and   (lower(categories) like '%doctor%'									 "
    ,"       or    lower(categories) like '%physician%'							 "
    ,"       or    lower(categories) like '%health%'							 "
    ,"       or    LOWER(categories) like '%medic%')							 "
    ," and   (LOWER(categories) not like '%market%')							 "
    ," and   b.state = '"
    ,state, "'"
  )
  
  sqlString
  
  df <- sqlQuery (connHandle,as.is=TRUE, sqlString);
  
  close (connHandle);
  
  df
}