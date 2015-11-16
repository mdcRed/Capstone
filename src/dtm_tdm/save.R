### Save the dtm and tdm for later use

save(AZ_df.corpus.clean,file='C:/Users/mcoyne/Documents/R/basicTm/capstone/processData/AZ_df.corpus.clean.Rdata')
save(NV_df.corpus.clean,file='C:/Users/mcoyne/Documents/R/basicTm/capstone/processData/NV_df.corpus.clean.Rdata')
save(NC_df.corpus.clean,file='C:/Users/mcoyne/Documents/R/basicTm/capstone/processData/NC_df.corpus.clean.Rdata')

### Save  DTM sparse
save(AZ.dtm,file='C:/Users/mcoyne/Documents/R/basicTm/capstone/processData/AZ.dtm.Rdata')
save(NV.dtm,file='C:/Users/mcoyne/Documents/R/basicTm/capstone/processData/NV.dtm.Rdata')
save(NC.dtm,file='C:/Users/mcoyne/Documents/R/basicTm/capstone/processData/NC.dtm.Rdata')

### Save  DTM less sparse
save(AZ.dtm.sp,file='C:/Users/mcoyne/Documents/R/basicTm/capstone/processData/AZ.dtm.sp.Rdata')
save(NV.dtm.sp,file='C:/Users/mcoyne/Documents/R/basicTm/capstone/processData/NV.dtm.sp.Rdata')
save(NC.dtm.sp,file='C:/Users/mcoyne/Documents/R/basicTm/capstone/processData/NC.dtm.sp.Rdata')


## SAVE TDM
save(AZ.tdm,file='C:/Users/mcoyne/Documents/R/basicTm/capstone/processData/AZ.tdm.Rdata')
save(NV.tdm,file='C:/Users/mcoyne/Documents/R/basicTm/capstone/processData/NV.tdm.Rdata')
save(NC.tdm,file='C:/Users/mcoyne/Documents/R/basicTm/capstone/processData/NC.tdm.Rdata')

### Save  TDM less sparse
save(AZ.tdm.sp,file='C:/Users/mcoyne/Documents/R/basicTm/capstone/processData/AZ.tdm.sp.Rdata')
save(NV.tdm.sp,file='C:/Users/mcoyne/Documents/R/basicTm/capstone/processData/NV.tdm.sp.Rdata')
save(NC.tdm.sp,file='C:/Users/mcoyne/Documents/R/basicTm/capstone/processData/NC.tdm.sp.Rdata')
