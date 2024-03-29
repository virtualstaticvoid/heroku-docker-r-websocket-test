# example from http://shiny.rstudio.com/gallery/kmeans-example.html

library(shiny)

shinyUI(
  pageWithSidebar(
    headerPanel('Iris k-means clustering'),
    sidebarPanel(
      selectInput('xcol', 'X Variable', names(iris)),
      selectInput('ycol', 'Y Variable', names(iris), selected=names(iris)[[2]]),
      numericInput('clusters', 'Cluster count', 3, min=1, max=9)
    ),
    mainPanel(
      plotOutput('plot1'),
      tags$div(
        textOutput("keepalive"),
        style = "position: absolute; left: -1000px; top: -1000px;"
      )
    )
  )
)
