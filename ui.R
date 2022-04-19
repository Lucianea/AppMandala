#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
curva <<- list("Círculo" = "circulo",
              "Elipse" = "elipse",
              "Lemniscata" = "lemniscata",
  "Cardioide" = "cardioide",
  "Limaçon"="limaçon", "Deltóide"="deltoide",
  "Astróide"="astroide")

# Define UI for application that draws a histogram
fluidPage(
  
  # Application title
  titlePanel("Mandala"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    # Sidebar with a slider and selection inputs
    sidebarPanel(
      selectInput("selection", "Escolha uma curva:",
                  choices = curva),
      actionButton("update", "Change"),
      hr(),
      tags$p("Nota: As construções destas mandalas foram baseadas em curvas clássicas da geometria plana. Este trabalho foi desenvolvido e apresentado no VI Seminário Intenacional de Estatística com R pelos professores da Divisão de Ensino da AFA: Dra. Luciane Alcoforado & Dr. João Paulo Martins dos Santos")
  ),
    
    
    # Mostre a mandala
    mainPanel(
       plotOutput("Plot")
    )
  )
)

