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

shinyUI(fluidPage(
  title = "RBANS Factor Score Calculator",
  fluidRow(
    column(8,
           h2("RBANS Factor Score Calculator")),
    column(4,
           img(src = "http://www.uccs.edu/Images/brand/uccs-logo.png", width=400, height=58))),
  
  #Sidebar with controls to enter hits, etc.
  sidebarLayout(sidebarPanel(
    numericInput("coding", "Coding:",0,min=0,max=90),
    numericInput("figurec", "Figure Copy:",0,min=0,max=20),
    numericInput("figurer", "Figure Recall:",0,min=0,max=20),
    numericInput("line_o", "Line Orientation:",0,min=0,max=20),
    numericInput("list_lrn", "List Learning:",0,min=0,max=40),
    numericInput("list_rcl", "List Recall:",0,min=0,max=10),
    numericInput("storymem", "Story Memory:",0,min=0,max=24),
    numericInput("storyrcl", "Story Recall:",0,min=0,max=12),
  submitButton("Calculate")),
  
  mainPanel(h4("Factor Scores (M = 100, SD = 15)"),
            tableOutput("FScores"))
  
)))
