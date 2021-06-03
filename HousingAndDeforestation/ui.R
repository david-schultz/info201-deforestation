library(shiny)
library(tidyverse)
data <- read.csv("data/compiled_data.csv")
proportion.data <- read.csv("data/proportion_data.csv")
countries <- c("Global", "United.States", "China", "Mexico", "Canada",
               "Japan", "Germany", "Chile", "Finland", "Indonesia",
               "United.Kingdom", "Brazil")
filename <- normalizePath(file.path('./assets/deforestation.jpg'))

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
               
               p("Given the alarming rate that Earth's forests are disappearing,
                 and the systematic use of wood in the construction of private
                 US homes, it would be interesting to see if there is a significant
                 correlation there."),
               
               tags$img(src = "https://images.unsplash.com/photo-1602484894924-75eddc89d32b?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=900&q=80",
                        alt = "Clear-cut forest"),
               
               p("We used three sources of data, which you can view in our bibliography:"),
               
               tags$ol(
                 tags$li("Global Forest Cover by sq. km."),
                 tags$li("New Privately-Owned One-Family Houses Sold
                 by Region and Type of Financing, and by
                 Sales-Price Group in the US."),
                 tags$li("US Lumber Imports by Country.")
               ),
               
               p("Regarding the data, it is worth noting that we analyzed the US
                 housing market, and not the cost of house construction. We did this
                 because we could not find a reliable source of data about construction
                 prices. However, we did decide to specify the housing market
                 to 'One-Family Houses', as these homes are more likely to rely on
                 wood/lumber, rather than steel, concrete, or other materials."),
               
               p("The following scatterplots map the relationship between total forest
                  coverage across the globe (data source 1), and the median price 
                  of homes in the United States (data source 2) between the years 
                  1990 - 2010. The scatterplots can be separated into regions. The 
                  regions above were chosen by largest US lumber import percentage 
                  in 2020 (data source 3).")
               
               
      ), 
      
      tabPanel("Graph 1",
        sidebarLayout(
          sidebarPanel(
            selectInput(inputId = "graph1", label = strong("Proportion of US Lumber Imports By Country"),
                        choices = c("Total", "Individual Countries"), selected = "Total")),
            mainPanel(plotOutput(("imports")))
        ),
        p("This graph uses the data from source 3 (US Lumber imports by country) to help us
          first understand which countries' imports would impact the US housing market
          most significantly."),
        p("We can see that the US imports nearly half its lumber from Canada, and about
          a quarter of its lumber from China. As such, it tells us we should specifically look at
          Canadian and Chinese deforestation as primary influences to the US housing market.")
      ),
      
      tabPanel("Graph 2",
        sidebarLayout(
          sidebarPanel(
            selectInput(inputId = "graph2", label = strong("Deforestation by Country"),
                        choices = countries, selected = "Global")),
            mainPanel(plotOutput("trends1"), plotOutput("trends2"))
        ),
        p("In this panel, we have two graphs--the first graph *just* describes the
          US housing market over time from data source 2. Remember, this data
          only deals with privately owned, one-family houses."),
        p("The second graph can be interacted with to view country-specific forest coverage
          data over the same period as the US housing market data (data source 1)."),
        p("If we remember our top importers, Canada and China, we see two completely
          opposite trends. In Canada, forest coverage has linearly decreased, while
          in China, the opposite is true. There doesn't seem to be any correlation
          with the US housing market 'crash' in 2008."),
        p("This is worrying for our hypothesis, as we are not seeing any kind of
          correlation between changing forest coverage, and the prices of homes in the US.")
      ),
      
      tabPanel("Graph 3",
        sidebarLayout(
          sidebarPanel(
            selectInput(inputId = "graph3", label = strong("Deforestation by Country"),
                        choices = countries, selected = "Global")),
          mainPanel(plotOutput("scatterplot"), textOutput("desc"))
        ),
        p("When we look at the scatter plots for every individual
          country in Graph 3, a pattern can be observed. Regardless of the 'direction'
          of deforestation (forest coverage increasing/decreasing), the oldest years
          sit at the bottom of the graph--i.e., where median house prices are lower.
          This pattern seems to be much more significant than any correlation regarding
          forest coverage, which leads us to believe that while our hypothesis may still
          be correct, deforestation is not nearly as significant as other factors in
          the US housing market.")
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
          US. But, other major contributors like China (who provide 25% of US imports)
          have seen significant increases in forest coverage."),
        
        p("Because change in forest coverage for each of the major contributing countries
          is almost perfectly linear, it is impossible to determine whether change in forest
          coverage is actually reflected in changes in housing prices. It IS possible that
          the US and China, with increasing forest coverage, are working towards decreasing
          housing prices. However, this effect is in a sense 'overpowered' by Canada and the
          other countries whose forest cover is decreasing."),
        
        p("The below graphs are taken Graph 3, regarding the Canada and China data.
          As described, both show that the US housing market prices increased with time--regardless
          of whether forest coverage increased or decreased."),
        
        plotOutput("canadaplot"),
        plotOutput("chinaplot"),
        
        p("It's worth mentioning that over our observed time period (1990-2010), China's
          forest coverage increased by about 400,000 square kilometers. This massively
          dwarfs the changes of forest coverage in Canada and the US, which are around
          10,000 and 40,000 square kilometers, respectively."),
        
        p("So, despite the significant disparity between China and Canada (in regards to
          their contribution to US lumber imports), the even more significant disparity
          in changing forest coverage seems to outweigh & work against our hypothesis that
          deforestation is causing increasing housing prices."),
        
        p("It is very possible that global deforestation is correlated with rising US
          house prices. It is also possible that there is a causal relationship between
          the two. However, given the issues we have raised, it is most likely that other factors
          such as the state of the economy have a larger influence on house prices in the US."),
        
        p("Given our data, we believe that our hypothesis that deforestation has significantly
          affected the US housing market is inconclusive. Many other factors need to be
          taken into account. While it is possible deforestation does have a casual
          effect on the US housing market, it's effect is likely minimal when compared to other
          factors.")
      ),
      
      tabPanel("Bibliography",
               
         h3("Bibliography"),
         
         p("Data source 1: The World Bank, obtained from:",
           tags$a(href="https://data.worldbank.org/indicator/AG.LND.FRST.K2?end=2010&start=1990",
                  "data.worldbank.org"), "."),
         
         p("Data source 2: US Census, Section 20.974, obtained from:",
           tags$a(href="https://www.census.gov/library/publications/2011/compendia/statab/131ed/construction-housing.html",
                  "www.census.gov"), "."),
         
         p("Data source 3: US Lumber Imports, obtained from:",
           tags$a(href="https://wits.worldbank.org/CountryProfile/en/Country/USA/Year/2018/TradeFlow/Import/Partner/all/Product/44-49_Wood.",
                  "wits.worldbank.org"), ".")
       )
  )))
