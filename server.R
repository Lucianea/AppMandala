#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
require(ggplot2)
require(tibble)
require(dplyr)
dtc=read.csv2("curvasdamandala.csv")

# Define server logic required to draw a histogram
function(input, output, session) {
  # Define a reactive expression for the document term matrix
  terms <- reactive({
    # Change when the "update" button is pressed...
    input$update
    # ...but not for anything else
    isolate({
      withProgress({
        setProgress(message = "Processing mandala...")
        getdtmandala(input$selection)
      })
    })
  })
   
  output$Plot <- renderPlot({
    
dtc = dtc %>% filter(z==input$selection)
p=
ggplot()+
coord_fixed()+
    theme_void()

p=p+ 
geom_point(data=dtc, aes(x=x, y=y), color='black')
p

  })
}
  

