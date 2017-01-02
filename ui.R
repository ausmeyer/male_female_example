library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Sidebar with a slider input for the number of bins
  sidebarLayout(
    sidebarPanel(
      sliderInput("male.phys.sample",
                  "Number of Male Physicians",
                  min = 0,
                  max = 40000,
                  value = 37823,
                  step = 100),
      sliderInput("female.phys.sample",
                  "Number of Female Physicians",
                  min = 0,
                  max = 40000,
                  value = 17174,
                  step = 100),
      sliderInput("male.mean",
                  "Mortality of Male Physicians",
                  min = 0,
                  max = 20,
                  value = 11.5,
                  step = 0.1),
      sliderInput("female.mean",
                  "Mortality of Female Physicians",
                  min = 0,
                  max = 20,
                  value = 11.1,
                  step = 0.1),
      sliderInput("male.spread",
                  "Standard Deviation",
                  min = 0,
                  max = 10,
                  value = 5.8,
                  step = 0.1),
      sliderInput("female.spread",
                  "Standard Deviation",
                  min = 0,
                  max = 10,
                  value = 7.9,
                  step = 0.1)
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("distPlot")
    )
  )
))