library(tm)
library(lsa)
library(ggplot2)



## The distance seems not working, lets calculate again.
## clock date and time when it starts 
dsName <- "AZ"
## clock date and time when it starts 
start_dt <- paste0 ("START building LSA Space for <", dsName, "> at: ", Sys.time())
start_dt
## LSAspace <- lsa(AZ.tdm.sp.new, dims=dimcalc_raw())
LSAspace.tdm.sp<- lsa(AZ.tdm.sp, dims=dimcalc_raw())
# Clock the date and time when it ends
end_dt <- paste0 ("END building LSA Space for <", dsName, "> at: ", Sys.time())
end_dt

myMatrix = as.matrix(LSAspace.tdm.sp)

#fit using MDS.  this also take long time, k is too small
## LSAspace.tdm.sp.fit <- cmdscale(dist.lsa, eig = TRUE, k=47)


## ==============================================
## look at the LSA results
## ==============================================

s = svd(myMatrix)
D = diag(s$d)
# A = T . S . t(D)   This is R lsa notatioT 
T <- LSAspace$tk   
S <- LSAspace$sk
dia <- diag(S)
tD <- LSAspace$dk
D  <- t(tD)


DocSim <- tD %*% dia
WordSim <- T %*% dia 

DocSim_2 <- D %*% dia




###==========================================
### Prerequisites:  LSASpace, dist.lsa, fit 
## AZ_df.new
##===========================================
## Want to load this data into the db
## ==========================================
library('RODBC')

temp_AZ_df <- AZ_df[,-votes]


## 
lsa_sim_df <- data.frame(bid = AZ_df.new$bid, x=fit$points[,1], y=fit$point[,2])
connHandle <- odbcConnect("p-sql-w-ehr01.athena_dev", uid="ehruser", pwd="ehruser123");
sqlSave(connHandle, AZ_df, tablename='dbo.temp_AZ_lsa_sim', rownames=FALSE)
close (connHandle);


