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


countries <- c("Global", "United.States", "China", "Mexico", "Canada",
               "Japan", "Germany", "Chile", "Finland", "Indonesia",
               "United.Kingdom", "Brazil")

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    
    data <- read.csv("data/compiled_data.csv")
    proportion.data <- read.csv("data/proportion_data.csv")
    
    output$imports <- renderPlot({
        
        if (input$graph1 == "Total") {
            compare <- data.frame(matrix(nrow = 2, ncol = 2))
            colnames(compare) <- c("Country", "Proportion")
            compare$Country[1] <- "Total"
            compare$Country[2] <- "Top Ten Countries"
            compare$Proportion[1] <- 1
            compare$Proportion[2] <- sum(proportion.data$Proportion) - 1
            ggplot(compare, aes(x = Country, y = Proportion)) +
                geom_bar(stat = "identity") + 
                labs(x = "Proportion of US Imports")
        } else {
            proportion.data <- subset(proportion.data, Country != "World")
            ggplot(proportion.data, aes(x = Country, y = Proportion)) +
                geom_bar(stat = "identity")
        }
    })
    
    output$trends1 <- renderPlot({
        country <- input$graph2
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
        country <- input$graph2
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
        country <- input$graph3
        country.data <- subset(data, select = c("year", "price_aggregate", country))
        colnames(country.data) <- c("year", "price_aggregate", "country")
        if (country == "Global") {
            country = "the Earth"
        }
        ggplot(country.data, aes(x = country, y = price_aggregate, color = year)) + 
            geom_point() +
            labs(x = paste("Total Forest Area of", country, "in sq. km"), y = "Median Price of Home in United States", color = "Year")
    })
    
    output$conclusionplot <- renderPlot({
        country.canada_data <- subset(data, select = c("year", "price_aggregate", "Canada"))
        country.china_data <- subset(data, select = c("year", "price_aggregate", "China"))
        colnames(country.canada_data) <- c("year", "price_aggregate", "country")
        
        ggplot() + 
            geom_point(data=country.canada_data, aes(x = "Canada", y = price_aggregate, color = year)) +
            geom_point(data=country.china_data, aes(x = "China", y = price_aggregate, color = year)) +
            labs(x = paste("Country"), y = "Median Price of Home in United States", color = "Year")
    })
    
    output$canadaplot <- renderPlot({
        country <- "Canada"
        country.data <- subset(data, select = c("year", "price_aggregate", country))
        colnames(country.data) <- c("year", "price_aggregate", "country")
        if (country == "Global") {
            country = "the Earth"
        }
        ggplot(country.data, aes(x = country, y = price_aggregate, color = year)) + 
            geom_point() +
            labs(x = paste("Total Forest Area of", country, "in sq. km"), y = "Median Price of Home in United States", color = "Year")
    })
    
    output$chinaplot <- renderPlot({
        country <- "China"
        country.data <- subset(data, select = c("year", "price_aggregate", country))
        colnames(country.data) <- c("year", "price_aggregate", "country")
        if (country == "Global") {
            country = "the Earth"
        }
        ggplot(country.data, aes(x = country, y = price_aggregate, color = year)) + 
            geom_point() +
            labs(x = paste("Total Forest Area of", country, "in sq. km"), y = "Median Price of Home in United States", color = "Year")
    })
})
