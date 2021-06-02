#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
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

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    
    data <- read.csv("data/compiled_data.csv")
    
    output$trends1 <- renderPlot({
        country <- input$country
        country.data <- subset(data, select = c("year", "price_aggregate", country))
        colnames(country.data) <- c("year", "price_aggregate", "country")
        if (country == "Global") {
            country = "the Earth"
        }
        ggplot(country.data, aes(x = year, y = price_aggregate)) + 
            geom_point() +
            labs(x = "Year", y = "Median Price of Home in United States", main = "Trends 1")
    })
    
    output$trends2 <- renderPlot({
        country <- input$country
        country.data <- subset(data, select = c("year", "price_aggregate", country))
        colnames(country.data) <- c("year", "price_aggregate", "country")
        if (country == "Global") {
            country = "the Earth"
        }
        ggplot(country.data, aes(x = year, y = country)) + 
            geom_point() +
            labs(x = "Year", y = paste("Total Forest Area of", country, "in sq. km"))
    })
    
    output$scatterplot <- renderPlot({
        country <- input$country
        country.data <- subset(data, select = c("year", "price_aggregate", country))
        colnames(country.data) <- c("year", "price_aggregate", "country")
        if (country == "Global") {
            country = "the Earth"
        }
        ggplot(country.data, aes(x = country, y = price_aggregate, color = year)) + 
            geom_point() +
            labs(x = paste("Total Forest Area of", country, "in sq. km"), y = "Median Price of Home in United States", color = "Year")
    })
    
    output$something <- renderPlot({
        
    })
    
    output$intro <- renderPrint("put introduction here")
    output$analysis <- renderPrint("put analysis here")
    
    
})
