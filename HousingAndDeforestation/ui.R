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
      lumber and thus increase the price of houses.We wanted 
      this data to be valuable to individuals concerned about 
      sectors that could impact the rates of deforestation, 
      an important factor for  climate change."),
    
    p("We used three sources of data:"),
    
    tags$ol(
        tags$li("Global Forest Cover by sq. km."),
        tags$li("New Privately-Owned One-Family Houses Sold
                 by Region and Type of Financing, and by
                 Sales-Price Group in the US."),
        tags$li("US Lumber Imports by Country.")
    ),
    
    
    
    p("This scatterplot maps the relationship between total forest
      coverage across the globe (data source 1), and the median price 
      of homes in the United States (data source 2) between the years 
      1990 - 2010. This scatterplot can be separated into regions. The 
      regions above were chosen by largest US lumber import percentage 
      in 2020 (data source 3)."),
    
    p("When we look at forest coverage globally, there seems to be a 
      correlation between decreasing forest cover and rising housing costs 
      in the US. However, we do not think that this is a causal relationship. 
      This is because opposing patterns emerge when we look at region-specific
      forest coverage data."),
    
    p("Because the US imports more lumber from China than any other country, 
     if we take our hypothesis that global deforestation affects the US housing 
      market, we would assume that China’s lumber availability would have the 
      largest impact on US housing prices. We would expect to see that as China’s
      forest coverage decreases, US housing prices increase."),
    
    p("But, the opposite is true ― we see a complete inverse of the trend when 
      compared to global forest coverage. This is because China’s forest coverage 
      generally increased, as did US housing prices, during our observed time 
      period beginning from 1990 and ending in 2010."),
    
    p("So, while it is possible that global lumber availability affects the US 
      housing market, it is unlikely that it is a significant factor. Our limited 
      data-set indicates that housing prices are simply increasing with time. The 
      trend we see from the global graph only appears because global forest 
      coverage is consistently decreasing with time."),
    
    p("It is highly likely that other unobserved variables affecting the US housing 
      market are also changing over time, and create a spurious relationship between 
      forest coverage and US housing prices. "),
    
    p("This conclusion is further supported by the graphs of other major contributors 
      of lumber to the US, which all have the oldest observations at the lowest housing
      prices regardless of where that happens to be on the axis of forest coverage in 
      that country."),
    
    
    h3("Bibliography"),
    
    p("Data source 1: The World Bank, obtained from:",
      tags$a(href="https://data.worldbank.org/indicator/AG.LND.FRST.K2?end=2010&start=1990",
             "data.worldbank.org"), "."),
    
    p("Data source 2: US Census, Section 20.974, obtained from:",
      tags$a(href="https://www.census.gov/library/publications/2011/compendia/statab/131ed/construction-housing.html",
             "www.census.gov"), "."),
    
    p("Data source 3: Trading Economics, obtained from:",
      tags$a(href="https://tradingeconomics.com/united-states/imports-of-lumber-wood-in-the-rough.",
             "tradingeconomics.com"), ".")

    
))