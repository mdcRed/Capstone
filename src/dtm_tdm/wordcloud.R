require(wordcloud)
library("tm")

## compare sparse and nonsparse

## AZ

AZ.dtm.mat <- as.matrix(AZ.dtm);
AZ_freq      <- colSums(AZ.dtm.mat);
AZ_freq       <- sort(AZ_freq, decreasing = TRUE)
AZ_words <- names(AZ_freq)
wordcloud(AZ_words,AZ_freq, scale=c(8,.2),min.freq=200,
          max.words=Inf, random.order=FALSE, rot.per=.15
          , colors=brewer.pal(8,"Dark2"))

## Less sparse
AZ.dtm.sp.mat <- as.matrix(AZ.dtm.sp);
AZ_freq       <- colSums(AZ.dtm.sp.mat);
AZ_freq       <- sort(AZ_freq, decreasing = TRUE)
AZ_words <- names(AZ_freq)
wordcloud(AZ_words,AZ_freq, scale=c(8,.2),min.freq=200,
          max.words=Inf, random.order=FALSE, rot.per=.15
          , colors=brewer.pal(8,"Set3"))


## NV
NV.dtm.mat <- as.matrix(NV.dtm);
NV_freq      <- colSums(NV.dtm.mat);
NV_freq       <- sort(NV_freq, decreasing = TRUE)
NV_words <- names(NV_freq)
wordcloud(NV_words,NV_freq, scale=c(8,.2),min.freq=200,
          max.words=Inf, random.order=FALSE, rot.per=.15
          , colors=brewer.pal(8,"Dark2"))

## Less sparse
NV.dtm.sp.mat <- as.matrix(NV.dtm.sp);
NV_freq       <- colSums(NV.dtm.sp.mat);
NV_freq       <- sort(NV_freq, decreasing = TRUE)
NV_words <- names(NV_freq)
wordcloud(NV_words,NV_freq, scale=c(8,.2),min.freq=200,
          max.words=Inf, random.order=FALSE, rot.per=.15
          , colors=brewer.pal(8,"Set3"))



## NC
NC.dtm.mat <- as.matrix(NC.dtm);
NC_freq      <- colSums(NC.dtm.mat);
NC_freq       <- sort(NC_freq, decreasing = TRUE)
NC_words <- names(NC_freq)
wordcloud(NC_words,NC_freq, scale=c(8,.2),min.freq=200,
          max.words=Inf, random.order=FALSE, rot.per=.15
          , colors=brewer.pal(8,"Dark2"))

## Less sparse
NC.dtm.sp.mat <- as.matrix(NC.dtm.sp);
NC_freq       <- colSums(NC.dtm.sp.mat);
NC_freq       <- sort(NC_freq, decreasing = TRUE)
NC_words <- names(NC_freq)
wordcloud(NC_words,NC_freq, scale=c(8,.2),min.freq=200,
          max.words=Inf, random.order=FALSE, rot.per=.15
          , colors=brewer.pal(8,"Set3"))












