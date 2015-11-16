require (jsonlite)
getJsonData <- function (dir, fileName) {
  fn <- paste0 (dir, "/", fileName);
  if (file.exists(fn)) {
    #df <- fromJSON(txt=fn, flatten = FALSE, simplifyVector = FALSE);
    df <- stream_in(file(fn))
    df <- data.frame(df);
    df
  } else {
    print (paste0(fn, " is not available for reading"));
  }
}
