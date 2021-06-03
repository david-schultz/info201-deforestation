library(shiny)
library(tidyverse)
data <- read.csv("data/compiled_data.csv")
proportion.data <- read.csv("data/proportion_data.csv")
countries <- c("Global", "United.States", "China", "Mexico", "Canada",
               "Japan", "Germany", "Chile", "Finland", "Indonesia",
               "United.Kingdom", "Brazil")


# Define UI for application that draws a histogram
shinyUI(fluidPage(
    
    titlePanel("US Housing Prices and Global Deforestation"),
    tabsetPanel(
      tabPanel("Introduction",
               
               h3("Introduction"),
               
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
               
               p("This scatterplot maps the relationship between total forest
                  coverage across the globe (data source 1), and the median price 
                  of homes in the United States (data source 2) between the years 
                  1990 - 2010. This scatterplot can be separated into regions. The 
                  regions above were chosen by largest US lumber import percentage 
                  in 2020 (data source 3).")
               
               
      ), 
      
      tabPanel("Graph 1",
        sidebarLayout(
          sidebarPanel(
            selectInput(inputId = "graph1", label = strong("Proportion of US Lumber Imports By Country"),
                        choices = c("Total", "Individual Countries"), selected = "Total")),
            mainPanel(plotOutput(("imports")))
                  
                 
        )
      ),
      
      tabPanel("Graph 2",
        sidebarLayout(
          sidebarPanel(
            selectInput(inputId = "graph2", label = strong("Deforestation by Country"),
                        choices = countries, selected = "Global")),
            mainPanel(plotOutput("trends1"), plotOutput("trends2"))
        )
      ),
      
      tabPanel("Graph 3",
        sidebarLayout(
          sidebarPanel(
            selectInput(inputId = "graph3", label = strong("Deforestation by Country"),
                        choices = countries, selected = "Global")),
          mainPanel(plotOutput("scatterplot"), textOutput("desc"))
        )
      ),
      
      
      
      tabPanel("Analysis",
               
        h3("Analysis"),
        
        p("When we look at forest coverage globally, there seems to be a 
          correlation between decreasing forest cover and rising housing costs
          in the US. However, we cannot conclude that this is a causal relationship. 
          This is because opposing patterns emerge when we look at region-specific
          forest coverage data."),
        
        p("Canada is the largest contributor to lumber imports in the US at just over
          40%, and Canada's significant decrease in forest area does support the
          hypothesis that deforestation is contributing to rising housing costs in the 
          US, but other major contributores like the US itself and China at 25% of US
          imports have seen significant increases in forest coverage. Because change in
          forest coverage for each of the major contributing countries is almost perfectly
          linear, it is impossible to determine whether change in forest coverage is actually
          reflected in changes in housing prices. It is possible that the US and China with
          increasing forest coverage are working towards decreasing housing prices, but 
          this effect is overpowered by Canada and other countries with decreasing forest
          coverage and that is why we see the general trend of increasing housing prices."),
        
        p("It is also worth mentioning that China's change in forest coverage is an increase
          of around four hundred thousand square kilometers, which dwarfs the changes in
          Canada and US which are around ten thousand and forty thousand respectively.
          Despite the signficant disparity between China and Canada in contribution of
          lumber imports for the United States, this difference in change of forest coverage
          seems even more significant and also works against the hypothesis that deforestation
          is causing increased housing prices."),
        
        p("While the worldwide trend is still significant deforestation correlated with
          rising housing prices and it is possible that this is a causal relationship,
          the issues previously raised and the fact that the scatter plot for every
          individual country follows the pattern of having the oldest years at the
          bottom of the graph and most recent years at the top of the graph regardless
          of what the forest area trend looks like, leads us to believe that other
          factors are more likely cuasing increases in housing prices and certainly stops
          us from claiming that deforestation is definitevely a major factor.")
        
      ),
      
      tabPanel("Bibliography",
               
         h3("Bibliography"),
         
         p("Data source 1: The World Bank, obtained from:",
           tags$a(href="https://data.worldbank.org/indicator/AG.LND.FRST.K2?end=2010&start=1990",
                  "data.worldbank.org"), "."),
         
         p("Data source 2: US Census, Section 20.974, obtained from:",
           tags$a(href="https://www.census.gov/library/publications/2011/compendia/statab/131ed/construction-housing.html",
                  "www.census.gov"), "."),
         
         p("Data source 3: United States Wood Imports, obtained from:",
           tags$a(href="https://tradingeconomics.com/united-states/imports-of-lumber-wood-in-the-rough.",
                  "data.worldbank.org"), ".")
       )
  )))
