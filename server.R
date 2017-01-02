library(shiny)
library(ggplot2)
library(grid)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  output$distPlot <- renderPlot({
    norm1 <- rnorm(input$male.phys.sample, mean = input$male.mean, sd = input$male.spread)
    norm2 <- rnorm(input$female.phys.sample, mean = input$female.mean, sd = input$female.spread)
    t.result <- t.test(norm1, norm2)
    p <- ggplot(data.frame(data = c(norm1, norm2), Groups = c(rep('Male', length(norm1)), rep('Female', length(norm2)))), aes(data, color = Groups)) + 
      geom_histogram(position = "dodge", fill = 'white', alpha = 0.5) + 
      labs(x="", y="") +
      theme_bw() +
      theme(plot.margin = unit(c(2,1,1,1), "lines")) + 
      annotate("text", label = paste("p = ", t.result$p.value, sep = ""), x = Inf, y = Inf, hjust = 1, vjust = -1)
    
    gg2 <- ggplot_gtable(ggplot_build(p))
    gg2$layout$clip[gg2$layout$name == "panel"] <- "off"
    grid.draw(gg2)
  })
  
})