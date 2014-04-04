library(shiny)
library(lavaan)

# Define server logic required to generate factor scores
shinyServer(function(input, output) {
  FScores <- reactive({
    model.data <- readRDS("RBANS.Rda")
    new.data <- data.frame(coding = input$coding, figurec = input$figurec, figurer = input$figurer, 
                          line_o = input$line_o, list_lrn = input$list_lrn, list_rcl = input$list_rcl, 
                          storymem = input$storymem, storyrcl = input$storyrcl)
    f.scores <- data.frame(predict(model.data, newdata = new.data))
    names(f.scores) <- c("Visual","Global")
    f.scores <- f.scores[c("Global","Visual")]
    rownames(f.scores) <- "Standard Score"
    return(data.frame(round(f.scores*15+100,3)))
  })
  output$FScores <- renderTable({FScores()})
  #output$VisualPro <- renderText({paste("Visual Production : ", VisualPro())})
})