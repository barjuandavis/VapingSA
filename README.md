# Vaping: A Sentiment Analysis towards Vaping from Twitter and New York Times

## Introduction

**Vaping**, or smoking electronic cigarettes, is already a lifestyle for most people. However, are there any remaining health concerns in the society? What does the internet community exactly think about vaping? We will compare sentiments between netizens of Twitter and journalists at New York Times, to compare their opinions towards this issue.

## Methodology

We use NRC Emotion Lexicon to determine emotions from the words used in each tweet and articles from Twitter and New York Times in the Sentiment Analysis process. 

There are 10 emotions that are going to be classified: negative, positive, fear, anger, trust, sadness, disgust, anticipation, joy, and surprise. When a word is being picked from a tweet/article, it is classified based on the entry in the lexicon. We make this classification only in English, because it is the base language of the lexicon and it makes the result much more accurate.

After being picked, the word will be given points from the lexicon for each emotion. Higher points means that the word tends to express that emotion. After we get the points, we sum it up from each tweet or article to reveal the general tendencies of emotions from Twitter and New York Times. [(Saif M. Mohammad, 2013;](https://arxiv.org/pdf/1308.6297.pdf) [Saif M. Mohammad, 2017)](http://saifmohammad.com/WebDocs/TweetEmotionIntensities-starsem2017.pdf)

We also add a wordcloud from tweets to determine what words they are using when talking about vaping. It is simply a text mining process where words are collected from tweets and then counted. Larger size in the cloud means that the word has higher frequency across the fetched tweets. [(Ah-Hwee Tan, 1999;](http://www.ntu.edu.sg/home/asahtan/papers/tm_pakdd99.pdf) [Weiwei Cui, 2010)](https://ieeexplore.ieee.org/abstract/document/5429600/)

## How to Use

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

Find these lines in `data.R` and replace `XXX` with your own key.

## Results

*Note: Twitter results shown below are fetched from March 1st, 2014 until April 27th, 2018.*

**Twitter word cloud, word frequencies ranging from 5 to 70:**
![Twitter word cloud 1](https://i.imgur.com/r8VTktA.png)

**Twitter word cloud, word frequencies ranging from 20 to 70:**
![Twitter word cloud 2](https://i.imgur.com/z6D6ADK.png)

**Sentiment analysis comparison:**
![Sentiment analysis](https://i.imgur.com/Oe3LOqF.png)

From the results shown above, it can be seen that people on Twitter mainly have a positive reaction towards vaping. Their positive reaction is mainly comprised of anticipation, joy, and trust. On the other hand, NY Times journalists reacts negatively towards the issue, with fear as their main reaction.