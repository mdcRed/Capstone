library('topicmodels')


### ===== MODEL   SELECtION ======================
### RUN BOTH: Loglikelihood aelihood to figure out the optimal number of topics for the model
### THIS TAKE VERY LONG TIME.  RUN ONCE GET the number of topics
### DO NOT RUN AGAIN!!
###     Divide all awards to batch of 200 awardsnd other method
### Use log lik
### ===========================================================================
optK <- 16    ## from modSelectionUsingLDATunning
nTopics <- optK

#===================================================================
# find the number of topics k = nTopics
#   alpha = 1/k
# Using these terminology in terms of LDA
#===================================================================
myK = nTopics
myAlpha = (1/myK)

burnin = 1000;
iter = 1000;
keep = 50;
fittedR <-  LDA(dtm.sp, method="Gibbs", k=myK,
                LDA_Gibbscontrol=list(burnin=burnin, iter=iter, keep=keep));

#==================================================================
# doc_topic
#==================================================================
doc_topic <- data.frame (lda_topic= topics(fittedR))
#==================================================================
# topic_term
#==================================================================
topic_term <- data.frame(lda_term = terms(fittedR))
#==================================================================
# doc_term,  Index is document i, lda_topic number, and the lda_terms
#==================================================================
doc_term  <- data.frame(prop_id=df$id, doc_topic, lda_terms = topic_term$lda_term[doc_topic$lda_topic])
#==================================================================
# write the list of topics
#==================================================================
fn <- paste0("c://Users//mcoyne//Documents//R//basicTm//lda_topicModel//EHR_2015//Topics.txt");
crln <- "\n"
write(crln, file=fn);

for (i in 1: myK) {
   ln <- paste0( terms(fittedR,10)[,i])
   write(ln, file=fn, append=TRUE);  #quote=FALSE, sep="", col.names=FALSE
   write(crln, file=fn, append=TRUE);
}
## ===============================================================
## column is topic, rows are document
## ===============================================================
#gammaDf <- as.data.frame(fittedR@gamma)
#names(gammaDf) <- c(1:k)
##================================================================
## to get 10 terms for each topic
##================================================================
#representativeTerms <- data.frame(get_terms(lda_i, 10))



#relevantSentences <- relevantSentences(lda_i, content, 5)
#fn <- paste0("c://Users//mcoyne//Documents//R//basicTm//lda_topicModel//",df$prop_id[1],".txt");
#write.table(na.omit(relevantSentences$sentence), file=fn, quote=FALSE, sep="", col.names=FALSE)

### convert dtm to lda format to use LDA package

##=====================================================
## Get award id per topic
## ===================================================
t1 <- subset(doc_term, doc_term$lda_topic==1)
fn <- paste0("c://Users//mcoyne//Documents//R//basicTm//lda_topicModel//EHR_2015//Topic_1_awardIds.txt");
write.table(t1$prop_id, file=fn, quote=FALSE, sep="", col.names=FALSE, row.names = FALSE)