load('C:/Users/mcoyne/Documents/R/basicTm/capstone/processData/AZ_df.tdm.Rdata')

## ===================================================
## This script load the R object data  
## Load all R-objects that are output from LSA
## ===================================================
## LSA space using sparse tdm with column will all zeroes were removed
load("C:/Users/mcoyne/Documents/R/basicTm/capstone/processData/LSAspace_AZ.tdm.sp.new.Rdata")
## load the distanct
load("C:/Users/mcoyne/Documents/R/basicTm/capstone/processData/dist.lsa.AZ.tdm.sp.new.Rdata")
## load fit using MDS using above distance matrix
load("C:/Users/mcoyne/Documents/R/basicTm/capstone/processData/fitMDS.AZ.tdm.sp.new.Rdata")
##  May need the original corpus
load("C:/Users/mcoyne/Documents/R/basicTm/capstone/processData/AZ_df.corpus.clean.Rdata")
## may need the original AZ_df
load("C:/Users/mcoyne/Documents/R/basicTm/capstone/processData/AZ_df.Rdata")
## load the AZ_df.new, with rows that contains all zeros removed
load('C:/Users/mcoyne/Documents/R/basicTm/capstone/processData/AZ_df.tdm.lsa.new.lsa.Rdata')
## fit with k=200.
## Note on how this fit is produced: fit.tdm.sp.new.200 <- cmdscale(dist.lsa.AZ.tdm.sp.new, eig = TRUE, k=200)
load('C:/Users/mcoyne/Documents/R/basicTm/capstone/processData/fit.tdm.sp.new.200.Rdata')


