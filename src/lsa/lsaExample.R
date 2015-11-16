#install.packages("lsa", dependencies = TRUE)
library(lsa)

## Let LSA calculate the dimesion
LSAspace <- lsa(tdm, dims=dimcalc_raw())
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


# general
k = 9
LSAspace_k <- lsa(tdm, dims = k) 
myMatrix_k <- round(as.textmatrix(LSAspace_k))
lsvd_k <- LSAspace_k$tk
dia_k <- diag(LSAspace_k$sk)
rsvd_k <- t(LSAspace_k$dk)
C_k <- round(lsvd_k %*% dia_k %*% rsvd_k) 
## C should have same dimention as tdm
svd_k.tdm <- C_k %*% t(C_k)
t.locs <- lsvd_k %*% dia_k
from = 21
to   = 40
label <- data.frame(t=row.names(lsvd_k))
points <- data.frame(x=t.locs[from:to,1], y=t.locs[from:to,2])
ggplot (points, x=x , y=y) +
  geom_point(data=points, aes(x=x, y=y)) +
  geom_text(data =points, aes(x=x, y=y-0.1), label=label$t[from:to])



## weight
myMatrix.weight <- lw_logtf(myMatrix) * gw_idf(myMatrix)
LSAspace.weight <- lsa(myMatrix.weight, dims=dimcalc_raw())
lsvd.w <- LSAspace.weight$tk
dia.w <- diag(LSAspace.weight$sk)
rsvd.w <- t(LSAspace.weight$dk)
C.w <- round(lsvd.w %*% dia.w %*% rsvd.w) 
svd.w <- C.w %*% t(C.w)

s <- svd(myMatrix.weight)


