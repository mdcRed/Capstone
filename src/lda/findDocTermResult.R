library('topicmodels')


### ===== MODEL   SELECtION ======================
### RUN BOTH: Loglikelihood aelihood to figure out the optimal number of topics for the model
### THIS TAKE VERY LONG TIME.  RUN ONCE GET the number of topics
### DO NOT RUN AGAIN!!
###     Divide all awards to batch of 200 awardsnd other method
### Use log lik
### ===========================================================================
optK <- 48   ## from modSelectionUsingLDATunning


#===================================================================
# find the number of topics k = nTopics
#   alpha = 1/k
# Using these terminology in terms of LDA
#===================================================================
myK = optK
myAlpha = (1/myK)

burnin = 1000;
iter = 1000;
keep = 50;
SEED <- 20151115;



AZ_fitted<-  LDA(AZ.dtm.sp.new, method="Gibbs", k=myK,
                LDA_Gibbscontrol=list(seed=SEED, burnin=burnin, iter=iter, keep=keep));

#==================================================================
# doc_topic
#==================================================================
doc_topic <- data.frame (lda_topic= topics(AZ_fitted))
#==================================================================
# topic_term
#==================================================================
temp_topic_term <- data.frame(lda_term = terms(AZ_fitted, 5))
temp_topic_term <- t(temp_topic_term)
topic_term = data.frame(terms= apply(temp_topic_term, 1, paste, collapse=","))


#==================================================================
# doc_term,  Index is document i, lda_topic number, and the lda_terms
#==================================================================
doc_term  <- data.frame(bid=AZ_df.new$bid, doc_topic
                        , lda_terms = topic_term$terms[doc_topic$lda_topic]
                        , b_stars=AZ_df.new$b_stars
                        , r_stars=AZ_df.new$r_stars
                        , review = AZ_df.new$r_text)

## ================================================================
## Write doc_term to a database
## ================================================================
library('RODBC')

options(stringAsFactors=FALSE)

connHandle <- odbcConnect("p-sql-w-ehr01.athena_dev", uid="ehruser", pwd="ehruser123");

sqlSave(connHandle, doc_term, tablename='dbo.temp_AZ_review_topic', rownames=FALSE)
close (connHandle);

                      
