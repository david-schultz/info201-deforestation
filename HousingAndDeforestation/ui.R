#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(tidyverse)
data <- read.csv("data/compiled_data.csv")
countries <- c("Global", "United.States", "China", "Mexico", "Canada",
               "Japan", "Germany", "Vietnam", "South.Korea", "Switzerland",
               "Ireland", "India")

# Define UI for application that draws a histogram
shinyUI(fluidPage(

    titlePanel("US Housing Prices and Global Deforestation"),
    sidebarLayout(
        sidebarPanel(
            selectInput(inputId = "country", label = strong("Deforestation by Country"),
                        choices = countries, selected = "Global")
        ),
        
        mainPanel(
            plotOutput("scatterplot"),
            textOutput("desc")
        )
        
    )
))
