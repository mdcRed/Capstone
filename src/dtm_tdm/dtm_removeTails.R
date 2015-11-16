## ===============================================
## input: document term matrix dtm
## ouput: dtm.adjust with the 1% terms and 99% terms
##        are removed
## =================================================
  
dtm_removeTails <- function (myCorpus, dtm, myStopwords, sparse) {
  
  dtm.mat <- as.matrix(dtm)
  rowMaxThreshold<-ceiling(dtm$nrow*0.99)
  rowMinThreshold<-ceiling(dtm$nrow*0.01)
  
  if(sum(colSums(dtm.mat)>rowMaxThreshold)>0){
    temp<-which(colSums(dtm.mat)>rowMaxThreshold)
    newWords<-names(temp)
    myStopwords<-c(myStopwords,newWords)
  }
  
  
  ## 
  source('~/R/basicTm/capstone/src/dtm_tdm/clean.R')
  temp.corpus.clean <- clean(myCorpus, myStopwords)
  dtm.adj <- DocumentTermMatrix(temp.corpus.clean);
  dtm.adj.sp <- removeSparseTerms  (dtm.adj, sparse= 0.85)
  
  # return new dtm
  dtm.adj.sp
  
  
}