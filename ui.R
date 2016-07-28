#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinythemes)
dataset <- CO2

# Define UI for application that draws a histogram
shinyUI(navbarPage("Carbon-dioxide data explorer", theme = shinytheme("united"),
                   tabPanel("Plot",
  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
       selectInput("inp1", label = "Select X-variable", names(dataset)),
       selectInput("inp2", label = "Select Y-variable", names(dataset)),
       selectInput("inp3", label = "Color", c("None", "Plant", "Type", "Treatment")),
       selectInput("inp3a", label = "Facet row", c(None = "." ,"Plant", "Type", "Treatment")),
       selectInput("inp3b", label = "Facet column", c(None = ".","Plant", "Type", "Treatment")),
       selectInput("inp4", label = "Type of fit", c("Smooth", "Linear")),
       sliderInput("inp6", "Point Size", min = 1, max = 5, step = 0.5, value = 1, animate = TRUE),
       textInput("inp7", "Label title of plot")
    ),

    # Show a plot of the generated distribution
    mainPanel(
       plotOutput("plot")
    )
  )),
  tabPanel("Hypothesis testing",
    fluidRow(
      sidebarLayout(
        sidebarPanel(
          selectInput("inp8", label = "Select a categorical variable", list("Type", "Treatment"))
              ),
          mainPanel(
            verbatimTextOutput("t.test")
          )
    )),
    fluidRow(
      column(2
      ),
      column(8,
        dataTableOutput("table")
  )
  )
  ),
  tabPanel("Documentation",
           includeHTML("documentation.html"))
  )
)