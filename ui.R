library(shiny)

ui <- fluidPage(
  h1('Vaping Sentiment Analysis'),
  div('Github: ', a(href='https://github.com/cokpsz/VapingSA/', 'https://github.com/cokpsz/VapingSA/'), style="margin-bottom: 10px"),
  div(
    div(h3('Twitter word cloud', style='margin:0; margin-top: 5px'), class='panel-heading'),
    div(
      sidebarLayout(
        sidebarPanel(
          sliderInput(inputId='minimum', label='Minimum frequency:', min=5, max=30, step=1, value=20),
          sliderInput(inputId='maximum', label='Maximum frequency:', min=40, max=100, step=1, value=70)
        ),
        mainPanel(
          # display word cloud
          div(plotOutput(outputId='wordcloud', inline = TRUE), style='display:flex; align-items:center; justify-content: center; height=100%')
        )
      ),
      class = 'panel-body'
    ),
    class='panel panel-primary'
  ),
  splitLayout(
    div(
      div(h3('Twitter sentiment analysis', style='margin:0; margin-top: 5px'), class='panel-heading'),
      div(
        # display twitter sentiment analysis
        plotOutput(outputId='twitterSA'),
        plotOutput(outputId='twitterSABar'),
        class = 'panel-body'
      ),
      class='panel panel-primary'
    ),
    div(
      div(h3('NY Times sentiment analysis', style='margin:0; margin-top: 5px'), class='panel-heading'),
      div(
        # display ny times sentiment analysis
        plotOutput(outputId='nytimesSA'),
        plotOutput(outputId='nytimesSABar'),
        class = 'panel-body'
      ),
      class='panel panel-primary'
    )
  )
)