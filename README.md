# RBANS Factor Score Shiny app

This is an application for Shiny that can be used to calculate factor scores (Global and Visual Production) for the Repeatable Battery for the Assessment of Neuropsychological Status (RBANS).
To run this app, the user must download and install the free R software package from http://www.r-project.org
Once R is installed, the shiny package must be installed. In R, simply type the code below to install shiny.

```R
install.packages("shiny", dependencies = TRUE)
```

The easiest way to run the RBANS Shiny app is by typing the code below into R.

```R
library(shiny)

runGitHub("RBANS", "begavett")
```
