### LDA
## first find optimak k  topics

## ===================================================================
## AZ.dtm.sp  Sparse matrix have rows that have NO words
##            Must remove these rows
## ===================================================================
rowTotals <- apply(AZ.dtm.sp, 1, sum)
AZ.dtm.sp.new <- AZ.dtm.sp[rowTotals > 0,]

## ==================================================================
## Good practice:  remove these empty rows from corpus as well
## ==================================================================
empty.rows <- AZ.dtm.sp[rowTotals == 0,]$dimnames[1][[1]]
AZ_df.corpus.clean <- AZ_df.corpus.clean[-as.numeric(empty.rows)]

## ==================================================================
## Now, try to find out the optimal topic numbers
## ==================================================================
optK <- loglikeAsModelSelection(AZ.dtm.sp.new)

