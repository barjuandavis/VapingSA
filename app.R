# Vaping: a Text Analysis and Sentiment Analysis
# Created by :
#   Barjuan Davis Penthalion
#   Laurentius Dominick Logan
#   Nadya Felim Bachtiar
#
# Introduction :
#   Vaping, or smoking electronic cigarettes, is already a lifestyle for most of us.
#   But, is there any health awareness remains in the society? What is exactly the internet society
#   thinks about vaping? We are comparing sentiments between netizens of Twitter and journalists at New York Times,
#   to compare their opinion towards this issue.

# install.packages("tidyverse")
# install.packages("twitteR")
# install.packages("tm")
# install.packages("wordcloud")
# install.packages("syuzhet")
# install.packages("scales")
# install.packages("reshape2")
# install.packages("rtimes")
# install.packages("shiny")

library(shiny)

source("ui.R")
source("server.R")

shinyApp(
  ui = ui,
  server = server
)