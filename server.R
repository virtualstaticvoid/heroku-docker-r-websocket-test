# example from http://shiny.rstudio.com/gallery/kmeans-example.html

library(shiny)

palette(c("#E41A1C", "#377EB8", "#4DAF4A", "#984EA3", "#FF7F00", "#FFFF33", "#A65628", "#F781BF", "#999999"))

# Define server logic required to generate and plot a random distribution
shinyServer(function(input, output, session) {

  # Combine the selected variables into a new data frame
  selectedData <- reactive({
    iris[, c(input$xcol, input$ycol)]
  })

  clusters <- reactive({
    kmeans(selectedData(), input$clusters)
  })

  output$plot1 <- renderPlot({
    par(mar=c(5.1, 4.1, 0, 1))
    plot(selectedData(), col=clusters()$cluster, pch=20, cex=3)
    points(clusters()$centers, pch=4, cex=4, lwd=4)
  })

  # Heroku Websocket timeout is 55 second rolling window
  # https://devcenter.heroku.com/articles/http-routing#timeouts
  output$keepalive <- renderText({
    invalidateLater(50 * 1000)
    Sys.time()
  })

})
