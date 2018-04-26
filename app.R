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