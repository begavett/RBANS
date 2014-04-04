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