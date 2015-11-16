library(tm)
library(lsa)

## ===================================================================
## Using the corpus to regenerate the tdm
## ===================================================================
AZ.tdm <- TermDocumentMatrix (AZ_df.corpus.clean);
## Remove sparsity
AZ.tdm.sp <- removeSparseTerms  (AZ.tdm, sparse= 0.85)

dsName <- "AZ"
## Let LSA calculate the dimesion
## Strange:  using AZ.tdm.sp does not work ???
tdm <- AZ.tdm
## clock date and time when it starts 
start_dt <- paste0 ("START building LSA Space for <", dsName, "> at: ", Sys.time())
start_dt
LSAspace <- lsa(tdm, dims=dimcalc_raw())
# Clock the date and time when it ends
end_dt <- paste0 ("END building LSA Space for <", dsName, "> at: ", Sys.time())
end_dt

myMatrix <- as.textmatrix(LSAspace)

# A = U . D . t(V)
s = svd(myMatrix)
D = diag(s$d)
Wordsim = s$u %*%
  
  lsvd <- LSAspace$tk
dia <- diag(LSAspace$sk)  ## This is same as D= diag(s$d)
rsvd <- t(LSAspace$dk)
DocSimilarity <- rsvd %*% dia
WordSimilarity <- lsvd %*% dia

C <- round(lsvd %*% dia %*% rsvd) 

## C should have same dimention as tdm
svd.tdm <- C %*% t(C)

dist.lsa <- dist(t(myMatrix))
dist.lsa

fit <- cmdscale(dist.lsa, eig = TRUE, k=2)
points <- data.frame(x=fit$points[,1], y=fit$points[,2])
ggplot (points, x=x , y=y) +
  geom_point(data=points, aes(x=x, y=y)) +
  geom_text(data =points, aes(x=x, y=y-1.0), label=row.names(df))


