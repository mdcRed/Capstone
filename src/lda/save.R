### Save the dtm and tdm for later use

save(AZ_df.corpus.clean,file='C:/Users/mcoyne/Documents/R/basicTm/capstone/processData/AZ_df.corpus.clean.Rdata')
save(NV_df.corpus.clean,file='C:/Users/mcoyne/Documents/R/basicTm/capstone/processData/NV_df.corpus.clean.Rdata')
save(NC_df.corpus.clean,file='C:/Users/mcoyne/Documents/R/basicTm/capstone/processData/NC_df.corpus.clean.Rdata')

### Save  DTM
save(AZ.dtm,file='C:/Users/mcoyne/Documents/R/basicTm/capstone/processData/AZ.dtm.Rdata')
save(NV.dtm,file='C:/Users/mcoyne/Documents/R/basicTm/capstone/processData/NV.dtm.Rdata')
save(NC.dtm,file='C:/Users/mcoyne/Documents/R/basicTm/capstone/processData/NC.dtm.Rdata')

### Save  TDM
save(AZ.dtm.sp,file='C:/Users/mcoyne/Documents/R/basicTm/capstone/processData/AZ.dtm.sp.Rdata')
save(NV.dtm.sp,file='C:/Users/mcoyne/Documents/R/basicTm/capstone/processData/NV.dtm.sp.Rdata')
save(NC.dtm.sp,file='C:/Users/mcoyne/Documents/R/basicTm/capstone/processData/NC.dtm.sp.Rdata')

### Save Fitted for model selection.


save(AZ.dtm.sp.LDA.fitted.many,file='C:/Users/mcoyne/Documents/R/basicTm/capstone/processData/AZ.dtm.sp.LDA.fitted.many.Rdata')