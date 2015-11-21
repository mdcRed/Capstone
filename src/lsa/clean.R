clean <- function(corpus, mystopWords) {

  ##=================================================================
  ##
  ##=================================================================
  
  
  corpus.tmp <- tm_map (corpus,  content_transformer(tolower)) 
  # corpus.tmp <- tm_map (corpus.tmp, removePunctuation)
  # Want to preserve the intra hyphen
  corpus.tmp <- tm_map (corpus.tmp, removePunctuation, preserve_intra_word_dashes = TRUE)
  ## Need to preserve the intra hyphen, and preserve hashtag (for example)
  ##corpus.tmp <- tm_map (corpus.tmp, content_transformer(removeMostPunctuation), preserve_intra_word_dashes=TRUE)
  corpus.tmp <- tm_map (corpus.tmp, removeNumbers)
  corpus.tmp <- tm_map (corpus.tmp, removeWords, myStopwords) ;
  
  corpus.tmp <- tm_map (corpus.tmp, stripWhitespace)
  
  ### Stemming
  dictionaryCorpus <- corpus.tmp;
  corpus.tmp <- tm_map (corpus.tmp, stemDocument);
  ### Stemming completion
  ###     This stemCompletion never return
  ## corpus.tmp <- tm_map(corpus.tmp, stemCompletion, dictionary=dictionaryCorpus);
  
  return (corpus.tmp)
}