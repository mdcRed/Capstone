contains <- function(x, look4)  {
   library(stringr)
   str_ind <- data.frame(str_locate(tolower(x$content), look4))
   str_ind
   ## Get the index into the input content
   ind <- matrix(ncol=1)
   for (i in 1:dim(str_ind)[1]) {
     if ( !( (is.na(str_ind$start[i])) && (is.na(str_ind$end[i])) ) )  { 
       
       ind <- rbind(ind, i)
       
     }
   }
   ind <- na.omit(ind)
   y <- data.frame(id=x$id[ind], content=x$content[ind])
   
   y
   
   
}
