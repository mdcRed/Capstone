library(tm)
library(lsa)
library(ggplot2)

load("AZ_df.corpus.clean.Rdata")
AZ.tdm <- TermDocumentMatrix (AZ_df.corpus.clean);
## Remove sparsity
AZ.tdm.sp <- removeSparseTerms  (AZ.tdm, sparse= 0.85)


dsName <- "AZ"

start_dt <- paste0 ("START building LSA Space for <", dsName, "> at: ", Sys.time())
start_dt

LSAspace.tdm<- lsa(AZ.tdm, dims=dimcalc_raw())
# Clock the date and time when it ends
end_dt <- paste0 ("END building LSA Space for <", dsName, "> at: ", Sys.time())
end_dt

myMatrix <- as.textmatrix(LSAspace.tdm)

## ==============================================
## look at the LSA results
## S is NULL ???
## ==============================================

s = svd(myMatrix)
D = diag(s$d)
# A = T . S . t(D)   This is R lsa notatioT 
T <- LSAspace.tdm$tk   
S <- LSAspace.tdm$sk ## NULL ???
dia <- diag(S)
tD <- LSAspace.tdm$dk
D  <- t(tD)

## ==============================================
## Reduce dimensionalilty
## ==============================================
start_dt <- paste0 ("START building LSA Space for <", dsName, "> at: ", Sys.time())
start_dt
##dist.lsa <- dist(t(myMatrix)
fit.tdm.sp.new.200 <- cmdscale(dist.lsa.AZ.tdm.sp.new, eig = TRUE, k=200)
end_dt <- paste0 ("END building LSA Space for <", dsName, "> at: ", Sys.time())
end_dt

fit.mat <- as.matrix(fit.tdm.sp.new.200)





