library("tm")
library(jsonlite)
library(ggplot2)
library(tm)
require(wordcloud)
require("topicmodels")

AZ_df.corpus <- Corpus(VectorSource(AZ_df$r_text))
NV_df.corpus <- Corpus(VectorSource(NV_df$r_text))
NC_df.corpus <- Corpus(VectorSource(NC_df$r_text))

## ================================================================
## preparing stopword
## Run the wordcloud couple times to see the additional words 
##     that should be stopped
## ================================================================
myStopwords <- c(stopwords("english"), "the", "and","she", "you", "they","ive");
#idx <- which(myStopwords=="not");  ## remove Not from stopword
#myStopwords <- myStopwords[-idx];
## clean corpus
## AZ
source('~/R/basicTm/capstone/src/dtm_tdm/clean.R')
AZ_df.corpus.clean <- clean(AZ_df.corpus, myStopwords)
NV_df.corpus.clean <- clean(NV_df.corpus, myStopwords)
NC_df.corpus.clean <- clean(NC_df.corpus, myStopwords)

## Create Document Term matriz
AZ.dtm <- DocumentTermMatrix(AZ_df.corpus.clean);
NV.dtm <- DocumentTermMatrix(NV_df.corpus.clean);
NC.dtm <- DocumentTermMatrix(NC_df.corpus.clean);


## Remove sparsity
AZ.dtm.sp <- removeSparseTerms  (AZ.dtm, sparse= 0.85)
NV.dtm.sp <- removeSparseTerms  (NV.dtm, sparse= 0.85)
NC.dtm.sp <- removeSparseTerms  (NC.dtm, sparse= 0.85)


