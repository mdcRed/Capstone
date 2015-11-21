## =================================
##  Get all 5-star business and 5-star review, that have topic #1
##  ================================
library('RODBC')
library('ggplot2')

options(stringAsFactors=FALSE)

connHandle <- odbcConnect("p-sql-w-ehr01.athena_dev", uid="ehruser", pwd="ehruser123");



sqlString = paste0 (
  "select * 											       "
  ," from 												   "
  ," (select distinct(rt.bid) 							   "
  ,"  from athena_dev.dbo.temp_AZ_review_topic rt			   "
  ,"  , athena_dev.dbo.temp_AZ_df azdf		 			   "
  ,"  where 1 = 1										 	   "
  ,"  and   rt.b_stars = 5.0								   "
  ,"  and   rt.bid = azdf.bid								   "
  ," ) bdistinct											   "
  ," , athena_dev.dbo.temp_AZ_df azdf						   "
  ," where 1 = 1											   "
  ," and bdistinct.bid = azdf.bid							   "
  ," and (azdf.b_categories not like '%Massage%'  		   "
  ,"      and azdf.b_categories not like '%Gyms%' 		   "
  ,"      and  azdf.b_categories not like '%Pilate%'		   "
  ,"      and  azdf.b_categories not like '%Shopping%'	   "
  ,"       and  azdf.b_categories not like '%Spa%'		   "
  ,"        and  azdf.b_categories not like '%Weight Loss%'  "
  ,"        and  azdf.b_categories not like '%Acupuncture%') "
  
)
df <- sqlQuery (connHandle,as.is=TRUE, sqlString);

close (connHandle);
##


library("tm")
library(jsonlite)
library(ggplot2)
library(tm)
require(wordcloud)
require("lsa")
## ===================================================
## corpus, clean, get tdm
##====================================================
df.corpus <- Corpus(VectorSource(df$r_text))
myStopwords <- c(stopwords("english"), "the", "and","she", "you", "they","ive");
source('~/R/basicTm/capstone/src/dtm_tdm/clean.R')
df.corpus.clean <- clean(df.corpus, myStopwords)
df.tdm <- TermDocumentMatrix (df.corpus.clean);
df.tdm.sp <- removeSparseTerms  (df.tdm, sparse= 0.85)

## ===================================================
##  Calculate LSA space
## ===================================================
LSAspace_3 <- lsa(df.tdm, dims=dimcalc_raw())
myMatrix_3 <- as.textmatrix(LSAspace_3)

# A = T . S . t(D)   This is R lsa notatioT 
T <- LSAspace_3$tk   
S <- LSAspace_3$sk
dia <- diag(S)
tD <- LSAspace_3$dk
D  <- t(tD)


dist.lsa.3 <- dist(t(myMatrix_3))
fit.3 <- cmdscale(dist.lsa.3, eig = TRUE, k=2)


from = 1
toid = dim(myMatrix_3)[2]

docids <- colnames(myMatrix_3)[from:toid]
r_score <- matrix(data=NA, nrow=toid)
r_id   <- matrix(data=NA, nrow=toid)
for(i in from:toid) {
  r_score[i] = df$r_stars[i]
  r_id[i] <- df$r_id
}
points <- data.frame(x=fit.3$points[from:toid,1], y=fit.3$points[from:toid,2], r_score=r_score)

title <- paste0("Distance as calculated by LSA. Colored by Review stars."
               ,"  Data: 5-star business in Arizona; category: Healthcare, doctor, physician ");
ggplot (points, x=x , y=y) +
  geom_point(data=points, aes(x=x, y=y, colour=factor(r_score)), size=2) +
  scale_color_manual(values=c("#e7298a","#551A8B","#00ffff","#0000FF","#66a61e")) +
  ggtitle(title) +
  theme(plot.title=element_text(size=14,  family="Trebuchet MS", face="bold")) 


## =============================================================================
## Select data that is 1 star business
## =============================================================================

## =================================
##  Get all 5-star business and 5-star review, that have topic #1
##  ================================
library('RODBC')
library('ggplot2')

options(stringAsFactors=FALSE)

connHandle <- odbcConnect("p-sql-w-ehr01.athena_dev", uid="ehruser", pwd="ehruser123");



sqlString = paste0 (
  "select * 											       "
  ," from 												   "
  ," (select distinct(rt.bid) 							   "
  ,"  from athena_dev.dbo.temp_AZ_review_topic rt			   "
  ,"  , athena_dev.dbo.temp_AZ_df azdf		 			   "
  ,"  where 1 = 1										 	   "
  ,"  and   rt.b_stars = 1.0								   "
  ,"  and   rt.bid = azdf.bid								   "
  ," ) bdistinct											   "
  ," , athena_dev.dbo.temp_AZ_df azdf						   "
  ," where 1 = 1											   "
  ," and bdistinct.bid = azdf.bid							   "
  ," and (azdf.b_categories not like '%Massage%'  		   "
  ,"      and azdf.b_categories not like '%Gyms%' 		   "
  ,"      and  azdf.b_categories not like '%Pilate%'		   "
  ,"      and  azdf.b_categories not like '%Shopping%'	   "
  ,"       and  azdf.b_categories not like '%Spa%'		   "
  ,"        and  azdf.b_categories not like '%Weight Loss%'  "
  ,"        and  azdf.b_categories not like '%Acupuncture%') "
  
)
df_1 <- sqlQuery (connHandle,as.is=TRUE, sqlString);

close (connHandle);
##


library("tm")
library(jsonlite)
library(ggplot2)
library(tm)
require(wordcloud)
require("lsa")
## ===================================================
## corpus, clean, get tdm
##====================================================
df_1.corpus <- Corpus(VectorSource(df_1$r_text))
myStopwords <- c(stopwords("english"), "the", "and","she", "you", "they","ive");
source('~/R/basicTm/capstone/src/dtm_tdm/clean.R')
df_1.corpus.clean <- clean(df_1.corpus, myStopwords)
df_1.tdm <- TermDocumentMatrix (df_1.corpus.clean);
df_1.tdm.sp <- removeSparseTerms  (df_1.tdm, sparse= 0.85)

## ===================================================
##  Calculate LSA space
## ===================================================
LSAspace_4 <- lsa(df_1.tdm, dims=dimcalc_raw())
myMatrix_4 <- as.textmatrix(LSAspace_4)

# A = T . S . t(D)   This is R lsa notatioT 
T <- LSAspace_4$tk   
S <- LSAspace_4$sk
dia <- diag(S)
tD <- LSAspace_4$dk
D  <- t(tD)


dist.lsa.4 <- dist(t(myMatrix_4))

fit.4 <- cmdscale(dist.lsa.1, eig = TRUE, k=2)


from = 1
toid = dim(myMatrix_4)[2]

docids.1 <- colnames(myMatrix_4)[from:toid]
r_score.1 <- matrix(data=NA, nrow=toid)
r_id.1   <- matrix(data=NA, nrow=toid)
for(i in from:toid) {
  r_score.1[i] = df_1$r_stars[i]
  r_id.1[i]   <- i;
}
points.1 <- data.frame(x=fit.4$points[from:toid,1], y=fit.4$points[from:toid,2], r_score=r_score.1, r_id = r_id.1)

## "#1b9e77","#d95f02","#7570b3","#e7298a","#66a61e"


title <- paste0("Distance as calculated by LSA. Colored by Review stars."
                ,"  Data: 1-star business in Arizona; category: Healthcare, doctor, physician ");

 ggplot (points.1, x=x , y=y) +
  geom_point(data=points.1, aes(x=x, y=y, colour=factor(r_score)), shape=17, size=2) +
  scale_color_manual(values=c("#e7298a","#551A8B","#00ffff","#0000FF","#66a61e")) +
  ggtitle(title) +
  theme(plot.title=element_text(size=14,  family="Trebuchet MS", face="bold")) 
  ## geom_text(data =points.1, aes(x=x, y=y-0.1), label=points.1$r_id, angle=20, size=4)
  

