
getDataFromDB <- function() {
  
library('RODBC')
library(jsonlite)
library(ggplot2)
library(tm)
require(wordcloud)
require("topicmodels")
## Proposals for AISL, Year 2016, summarization
## Using: LDA on All documents
##
options(stringAsFactors=FALSE)

connHandle <- odbcConnect("p-sql-w-ehr01.athena_dev", uid="ehruser", pwd="ehruser123");

sqlString <- paste0(
  "select b.state, COUNT(distinct b.id) number_of_reviews		   "
  ," from athena_dev.dbo.temp_bdf  b					   "
  ," where 1 = 1										   "
  ," and   (lower(categories) like '%doctor%'			   "
  ,"       or    lower(categories) like '%physician%'	   "
  ,"       or    lower(categories) like '%health%'	   "
  ,"       or    LOWER(categories) like '%medic%')	   "
  ," and   (      LOWER(categories) not like '%market%'		 "
  ,"        and   LOWER(categories) not like '%Massage%'  	 "
  ,"        and   LOWER(categories) not like '%Gyms%' 		 "
  ,"        and   LOWER(categories) not like '%pilate%'		 "
  ,"        and   LOWER(categories) not like '%phopping%'		 "
  ,"        and   LOWER(categories) not like '%ppa%'			 "
  ,"        and   LOWER(categories) not like '%peight Loss%'	 "
  ,"        and   LOWER(categories) not like '%acupuncture%' )	 "
  ," group by b.state									   "
  ," order by COUNT(*)								   "
)

df <- sqlQuery (connHandle,as.is=TRUE, sqlString);

close (connHandle);

df
}










 







