# The MIT License (MIT)
# 
# Copyright (c) 2014 Brandon Gavett
# 
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#   
#   The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

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
    return(data.frame(round(f.scores*15.38765+89.31138,3)))
  })
  output$FScores <- renderTable({FScores()})
  #output$VisualPro <- renderText({paste("Visual Production : ", VisualPro())})
})
