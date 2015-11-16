##install.packages("ldatuning")
library("ldatuning")
## Assume having dtm 
result <- FindTopicsNumber(
  dtm,
  topics=seq(from = 2, to = 50, by =1),
  metrics = c("Griffiths2004", "CaoJuan2009", "Arun2010", "Deveaud2014"),
  #metrics = c( "Arun2010"),
  method = "Gibbs",
  control = list(seed = 20151005),
  #mc.cores = 2L,
  verbose = TRUE
)

FindTopicsNumber_plot(result)

#setwd("C:/Users/mcoyne/Documents/R/basicTm/lda_topicModel/LSAMP/FindNumberOfTopics")
##save.image()
##load(".RData")
