library(topicmodels)

loglikeAsModelSelection <- function(dtm) {
  

burnin = 1000;
iter = 1000;
keep = 50;
SEED <- 20151115;

sequ <- seq(2,100, by=1);
## =========================================================
## Take time to run
## EXecute with care
## =========================================================
fitted <- lapply(sequ, function(k) {
                             LDA(dtm, method="Gibbs", k=k,
                             LDA_Gibbscontrol=list(seed = SEED, burnin=burnin, iter=iter, keep=keep));
                             });

logL  <- data.frame ( as.matrix( lapply (fitted, logLik)));
logL.df <- data.frame (topic=seq(2,50, by=1), logLikelihood=as.numeric(as.matrix(logL)));
#graph
logL.df.sort <- logL.df[order(-logL.df$logLikelihood),];
optK <- logL.df.sort[1,]$topic

title <- paste0("LDA topic modeling. Model Selection using Log Likelihood.   Optimal k =", optK);

ggplot(logL.df, aes(x = topic, y = logLikelihood)) + 
  xlab("Number of topics") + 
  ylab("Log likelihood of the model") + 
  ggtitle(title) +
  theme(plot.title=element_text(size=14, hjust=2, family="Trebuchet MS", face="bold")) +
  geom_line() + 
  geom_point(size=3,colours="#d55E00") +
  geom_vline(xintercept=optK,color="red") +
  theme_bw()  + 
  theme(axis.title.x = element_text(vjust = -0.5, size = 14)) + 
  theme(axis.title.y=element_text(size = 14, angle=90, vjust= -0.25)) 

## resturn the optK

optK

}

