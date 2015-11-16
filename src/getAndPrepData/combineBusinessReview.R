## extract only healthcare business in AZ, NV, and NC
b_AZ_Df <- getMedicalCatBusinesPerState("AZ")
b_NV_Df <- getMedicalCatBusinesPerState("NV")
b_NC_Df <- getMedicalCatBusinesPerState("NC")

## Extract only data for AZ
AZ_df <- merge(reviewDf, b_AZ_Df, by.x= "business_id", by.y= "id")
colnames(AZ_df) <- c("bid", "votes","u_id","r_id","r_stars" ,"r_date"  , "r_text", "r_type", "b_name","b_categories"  
                     ,"b_review_count", "city",       "state",        "b_stars")

## Extract only data for AZ
NV_df <- merge(reviewDf, b_NV_Df, by.x= "business_id", by.y= "id")
colnames(NV_df) <- c("bid", "votes","u_id","r_id","r_stars" ,"r_date"  , "r_text", "r_type", "b_name","b_categories"  
                     ,"b_review_count", "city",       "state",        "b_stars")

## Extract only data for AZ
NC_df <- merge(reviewDf, b_NC_Df, by.x= "business_id", by.y= "id")
colnames(NC_df) <- c("bid", "votes","u_id","r_id","r_stars" ,"r_date"  , "r_text", "r_type", "b_name","b_categories"  
                     ,"b_review_count", "city",       "state",        "b_stars")








