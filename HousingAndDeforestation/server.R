#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    
    deforestation <- read.csv("data/deforestation.csv")
    deforestation_meta <- read.csv("data/deforestation_metadata.csv")
    # housing <- read.delim("data/housing975.xls")

    print(deforestation)
    # print(housing)

})
