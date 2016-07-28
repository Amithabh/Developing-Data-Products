#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)
library(shinythemes)
CO2_uptake <- CO2$uptake

shinyServer(function(input, output) {
    output$plot <- renderPlot({
        facets <- paste(input$inp3a, '~', input$inp3b)
        p <- ggplot(data = CO2, aes_string(x = input$inp1, y = input$inp2 )) + geom_point(size = input$inp6) + ggtitle(paste("ScatterPlot of ",input$inp7)) 
        if (input$inp3 != 'None')
            p <- p + aes_string(color=input$inp3)
        if (facets != '. ~ .')
            p <- p + facet_grid(facets)
        if(input$inp4 == "Smooth")
            p <- p + geom_smooth()
        else if(input$inp4 == "Linear")
            p <- p + geom_smooth(method = "lm")
        print(p)
        
    })
    
    
    output$t.test <- renderPrint({
        Group_variable <- switch(input$inp8,
                                 "Type" = CO2$Type,
                                 "Treatment" = CO2$Treatment
        )
        t.test(CO2_uptake ~ Group_variable)
    })
    output$table <- renderDataTable({
        Group_variable <- switch(input$inp8,
                                 "Type" = CO2$Type,
                                 "Treatment" = CO2$Treatment
        )
        data.frame(CO2_uptake, Group_variable)
    }, options = list(pageLength = 10))
})
