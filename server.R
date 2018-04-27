library(wordcloud)
library(dplyr)
library(shiny)

source("data.R")

server <- function(input, output, session) {
  # fetch slider values
  minFreq <- reactive({input$minimum})
  maxFreq <- reactive({input$maximum})
  set.seed(222)
  
  # create wordcloud
  output$wordcloud <- renderPlot({
    tempWordFreq <- wordFreq
    tempWordFreq <- tempWordFreq %>% subset(wordFreq >= minFreq()) %>% subset(wordFreq <= maxFreq())
    tempWordFreq <- tempWordFreq %>% sort(decreasing=TRUE)
    tempWordFreq %>% wordcloud(words = names(.), freq = ., random.order = F, min.freq = minFreq(), colors = brewer.pal(8, 'Dark2'), max.words = Inf)
  }, height=600, width=600)
  
  # plot twitter sentiment analysis
  output$twitterSA <- renderPlot({
    temp <- tweetSentiment
    percent <- round(temp/sum(temp)*100, digits=2)
    lbls <- paste(names(temp), " ", percent, "% (", temp, " pts)", sep="")
    pie(temp, labels = lbls, col=rainbow(10), main="Tweets Sentiment Analysis")
  })
  output$twitterSABar <- renderPlot({
    temp <- tweetSentiment
    percent <- temp/sum(temp)*100
    # lbls <- paste(names(temp), " ", percent, "% (", temp, " pts)", sep="")
    barplot(percent, ylab = 'percentage (%)', xlab = 'emotion', col=rainbow(10), main="Tweets Sentiment Analysis", ylim = c(0,30))
  })
  
  # plot NY times sentiment analysis
  output$nytimesSA <- renderPlot({
    temp <- round(nySentiment, digits=2)
    percent <- round(temp/sum(temp)*100, digits=2)
    lbls <- paste(names(temp), " ", percent, "% (", temp, " pts)", sep="")
    pie(temp, labels = lbls, col=rainbow(10), main="NY Times Sentiment Analysis")
  })
  output$nytimesSABar <- renderPlot({
    temp <- nySentiment
    percent <- temp/sum(temp)*100
    # lbls <- paste(names(temp), " ", percent, "% (", temp, " pts)", sep="")
    barplot(percent, ylab = 'percentage (%)', xlab = 'emotion', col=rainbow(10), main="NY Times Sentiment Analysis", ylim = c(0,30))
  })
}