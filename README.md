# Vaping: A Sentiment Analysis towards Vaping from Twitter and New York Times

### Introduction

**Vaping**, or smoking electronic cigarettes, is already a lifestyle for most of us. But, is there any health awareness remains in the society? What is exactly the internet society thinks about vaping? We are comparing sentiments between netizens of Twitter and journalists at New York Times,  to compare their opinion towards this issue.

### Methodology

We use NRC Emotion Lexicon to determine emotions from the words used in each tweet and articles from Twitter and New York Times in the Sentiment Analysis process. 

There are 10 emotions that are going to be classified: negative, positive, fear, anger, trust, sadness, disgust, anticipation, joy, and surprise. When a word is being picked from a tweet/article, it is classified based on the entry in the lexicon. We make this classification only in English,
because it is the base language of the lexicon and it makes the result much more accurate.

After being picked, the word will be given points from the lexicon for each emotion. Higher points means the word tends to express that emotion. 
After we get the points, we sum it up from each tweet or article to reveal the general tendencies of emotions from Twitter and New York Times. [(Saif M. Mohammad, 2013;](https://arxiv.org/pdf/1308.6297.pdf) [ Saif M. Mohammad, 2017)](http://saifmohammad.com/WebDocs/TweetEmotionIntensities-starsem2017.pdf)

We also add a wordcloud of Twitter to determine what words they are using when talking about vaping. It is simply a text mining process and it's collecting words from tweets and count it. Bigger cloud means the word has higher frequency across all tweets. [(Ah-Hwee Tan, 1999; ](http://www.ntu.edu.sg/home/asahtan/papers/tm_pakdd99.pdf)[ Weiwei Cui, 2010)](https://ieeexplore.ieee.org/abstract/document/5429600/)


### How to Use

You need to provide your own Twitter and New York Times API key in order to use this project. 
There are five keys in total that you have to provide, four for Twitter and one for New York Times.

For Twitter, you have to provide your Consumer Key, Consumer Secret Key, Access Token, and Access Token Secret.

```R
api_key <- "XXX" # Consumer Key
api_sec <- "XXX" # Consumer Secret Key
access_token <- "XXX" # Access Token
access_token_sec <-"XXX" # Access Token Secret
```
You can get the Twitter API keys [here.](https://apps.twitter.com)

For New York Times, you have to provide your Article Search API key which you can get from [here.](https://developer.nytimes.com/)
```R
Sys.setenv(NYTIMES_AS_KEY = "XXX")
```
Find these lines in one of the .R files and replace `XXX` with your own key.

