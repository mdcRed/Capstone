library('RODBC')
library('ggplot2')

options(stringAsFactors=FALSE)

connHandle <- odbcConnect("p-sql-w-ehr01.athena_dev", uid="ehruser", pwd="ehruser123");

sqlString = paste0 (
  "select rt.lda_topic, COUNT(*) as cnt						"
  ," from 													"
  ," (														"
  ," 		 select distinct rt.bid							"
  ," 		 from athena_dev.dbo.temp_AZ_review_topic rt	"
  ," 		 where 1 = 1									"
  ," 		 and rt.b_stars in (1.0, 1.5) 						"
  ," ) fstars_bus											"
  ," , athena_dev.dbo.temp_AZ_review_topic rt				"
  ," where 1 = 1												"
  ," and fstars_bus.bid = rt.bid								"
  ," and rt.r_stars in (5)									"
  ," group by rt.lda_topic									"
)

one_five_rankDf <- sqlQuery (connHandle,as.is=TRUE, sqlString);



sqlString = paste0 (
  "select rt.lda_topic, COUNT(*) as cnt						"
  ," from 													"
  ," (														"
  ," 		 select distinct rt.bid							"
  ," 		 from athena_dev.dbo.temp_AZ_review_topic rt	"
  ," 		 where 1 = 1									"
  ," 		 and rt.b_stars in (1.0, 1.5) 						"
  ," ) fstars_bus											"
  ," , athena_dev.dbo.temp_AZ_review_topic rt				"
  ," where 1 = 1												"
  ," and fstars_bus.bid = rt.bid								"
  ," and rt.r_stars in (1)									"
  ," group by rt.lda_topic									"
  
)
one_one_rankDf <- sqlQuery (connHandle,as.is=TRUE, sqlString);

close (connHandle);

## 5 start business and review

topic_tickmark  = c(1,2, 3, 4, 5, 6, 7,8, 9, 10, 11, 12, 13, 14, 15, 16,
                    17, 18 , 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32,
                    33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48)
cols <- c("1-stars business and 5-star review"="#66a61e", "1-star business and 1-star review"="#E7298a")
title <- paste0("Review Ranking per Topic")

ggplot() + 
  xlab("Topic") + 
  ylab("Count") +
  scale_x_discrete(limits=topic_tickmark) +
  ggtitle(title) +
  theme(plot.title=element_text(size=14, hjust=2, family="Trebuchet MS", face="bold")) +
  geom_point(data=one_five_rankDf,aes(x = lda_topic, y = cnt, colour="1-stars business and 5-star review"), size=3 )+
  geom_point(data=one_one_rankDf,aes(x = lda_topic,  y = cnt, colour="1-star business and 1-star review"), size=3 ) +
  coord_trans(y="log10") +
  theme_bw()  + 
  theme(axis.title.x = element_text(vjust = -0.5, size = 14)) + 
  theme(axis.title.y=element_text(size = 14, angle=90, vjust= -0.25) ) +
  scale_colour_manual(name="Legend", values=cols) +
  theme(legend.position="bottom")



