library(tidyverse)
library(twitteR)
library(tm)
library(shiny)
library(wordcloud)
library(dplyr)
library(syuzhet)

# uncomment on run
# ===== START =====
api_key <- "XXX"
api_sec <- "XXX"
access_token <- "XXX"
access_token_sec <-"XXX"
setup_twitter_oauth(api_key,
                    api_sec,
                    access_token,
                    access_token_sec
)
print("Fetching tweets")
vapeSearch <- searchTwitter(searchString = "vape -filter:retweets", n = 1000,lang = "en", since = '2014-03-01', until = toString(Sys.Date()))
print("Fetching tweets done")
# ====== END ======

vapeDF <- vapeSearch %>% twListToDF
vapeDF$text <- sapply(vapeDF$text,function(row) iconv(row, "latin1", "ASCII", sub=""))
print("Creating tweet corpus")
vape_c <- Corpus(VectorSource(iconv(vapeDF$text, to = "UTF-8")))
print("Creating tweet corpus done")

# Text processing/cleanups
removeURL <- function(x) gsub('http[[:alnum:]]*','',x)
removeVapewords <- function(x) gsub('vape[[:alnum:]]*','',x)

vape_c <- tm_map(vape_c, tolower) # to lower cases
vape_c <- tm_map(vape_c, removePunctuation) # remove punctuations
vape_c <- tm_map(vape_c, removeNumbers) #remove numbers
vape_c <- tm_map(vape_c, removeWords, stopwords(kind = "en")) #remove commonly used stop words
vape_c <- tm_map(vape_c, removeWords, c('vape','vaping')) #remove vape and all other unrelated words
#group common plural words with it's singular counterpart
# vape_c <- tm_map(vape_c, gsub, pattern = 'vaping', replacement = 'vape')
vape_c <- tm_map(vape_c, content_transformer(removeURL)) # remove URLs
vape_c <- tm_map(vape_c, content_transformer(removeVapewords)) #remove vape-related hashtag words
vape_c <- tm_map(vape_c, stripWhitespace)

#Term document matrix
tdm <- TermDocumentMatrix(vape_c)
tdm <- as.matrix(tdm) # turn these tweets into matrix form

wordFreq <- rowSums(tdm)

tweet <- iconv(vapeDF$text, to = 'utf-8')
print("Analyzing tweet sentiment")
tweetSentiment <- get_nrc_sentiment(tweet)
print("Analyzing tweet sentiment done")
tweetSentiment <- colSums(tweetSentiment)


#But how NYT sees towards this issue?
#Loading NYT API + Data Retrieval
library(rtimes)
Sys.setenv(NYTIMES_AS_KEY = "XXX")
print("Fetching NY times news")
vape_a_df <- as_search(q = 'vaping',hl = TRUE)
vape_b_df <- as_search(q = 'vape',hl = TRUE)
print("Fetching NY times news done")

# data filtering
a_filtered <- vape_a_df$data %>% select(snippet, headline.main, headline.print_headline)
b_filtered <- vape_b_df$data %>% select(snippet, headline.main, headline.print_headline)
nytimesdata <- dplyr::union(a_filtered, b_filtered)

# Taking only Texts that represents the article
snip <- iconv(nytimesdata$snippet, to = 'utf-8')
hmain <- iconv(nytimesdata$headline.main, to = 'utf-8')
hprint <- iconv(nytimesdata$headline.print_headline, to = 'utf-8')

# get NRC Sentiment values of each texts, and take a mean value of it
print("Analyzing NY times sentiment")
snipS <- get_nrc_sentiment(snip)
hmainS <- get_nrc_sentiment(hmain)
hprintS <- get_nrc_sentiment(hprint)
print("Analyzing NY times sentiment done")

nySentiment <- snipS + hmainS + hprintS
nySentiment <- nySentiment/3
nySentiment <- colSums(nySentiment)