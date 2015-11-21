## =================================
##  Get all 5-star business and 5-star review, that have topic #1
##  ================================
library('RODBC')
library('ggplot2')

options(stringAsFactors=FALSE)

connHandle <- odbcConnect("p-sql-w-ehr01.athena_dev", uid="ehruser", pwd="ehruser123");



sqlString = paste0 (
  "select distinct rt.bid  						 "
  ," from athena_dev.dbo.temp_AZ_review_topic rt	 "
  ," , athena_dev.dbo.temp_AZ_df azdf		 "
  ," where 1 = 1									 "	 
  ," and   rt.b_stars = 4.5						 "
  ," and   rt.r_stars = 5						 "
  ," and   rt.lda_topic = 1						 "
  ," and   rt.bid = azdf.bid						 "
  
				   
)
five_five_rankDf <- sqlQuery (connHandle,as.is=TRUE, sqlString);

close (connHandle);
##

library(sqldf)
library(tcltk)

m <- merge(AZ_df, five_five_rankDf, by.x="bid", by.y="bid")

ind <- data.frame( matrix(data=NA, ncol=dim(dist.lsa.mat)[2]))
for (i in 1:dim(five_five_rankDf)[1]) {
  x <- data.frame(ind = matrix(which(AZ_df$bid == five_five_rankDf$bid[2]), ncol=1, byrow=TRUE))
  ind <- rbind(ind,x)
}
ind <- na.omit(ind)

## find the distance of the 5 star business and reviews
dist.x <- data.frame(matrix(data=NA, ncol=dim(dist.lsa.mat)[2]))
colnames(dist.x) <-  seq(1,dim(dist.lsa.mat)[2], by=1)
for (i in 1: dim(ind)[1]) {
  j <- ind[i,1]
  dist.i <-  data.frame(dist.lsa.mat[j,])
  ## get only 5 closest points
  
  
  dist.i <- t(dist.i)
  colnames(dist.i) <-  seq(1,dim(dist.lsa.mat)[2], by=1)
  dist.x <- rbind(dist.x,dist.i)
}

dist.x <- na.omit(dist.x)

## Note:  k=200 as dimension in LSA
fit.x <- data.frame(matrix(data=NA, ncol=200))
colnames(fit.x) <-  seq(1,200, by=1)
for (i in 1: dim(ind)[1]) {
  j <- ind[i,1]
  fit.i <-  data.frame( fit.tdm.sp.new.200$points[j,1:200])
 
  fit.i <- t(fit.i)
  colnames(fit.i) <-  seq(1,200, by=1)

  fit.x <- rbind(fit.x,fit.i)
}

fit.x <- na.omit(fit.x)
## cbin the fit with k=200 and the index
fit.x <- cbind(ind,fit.x)

$$ NOw fit.x has 200 dimension of the b-stars=5, and r-star=5


