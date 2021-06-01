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
            textOutput("desc"),
        )
        
    ), 
    h3("Analysis"),
    
    p("We initially set out to see if the US Housing market was
      impacted by deforestation, with the logic being that
      deforestation would lead to a decrease in the supply of
      lumber and thus increase the price of houses."),
    
    p("We used three sources of data:"),
    
    tags$ol(
        tags$li("Global Forest Cover by sq. km."),
        tags$li("New Privately-Owned One-Family Houses Sold
                 by Region and Type of Financing, and by
                 Sales-Price Group in the US."),
        tags$li("US Lumber Imports by Country.")
    ),
    
    
    
    p("This scatterplot interactively maps the relationship
      between total forest coverage across the globe (data
      source 1), and the median price of homes in the United
      States (data source 2) between the years 1990 - 2010. "),
    
    p("The scatterplot can be separated into regions. The regions
      above were chosen by largest US lumber import percentage in
      2020 (data source 3)."),
    
    p(""),
    
    
    h3("Bibliography"),
    
))