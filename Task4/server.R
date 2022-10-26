#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(caret)
# Define server logic required to draw a histogram
shinyServer(function(input, output) 
    {

      output$test1 <- renderText(input$slen)
      output$test2 <- renderText(input$swid)
      output$test3 <- renderText(input$plen)
      output$test4 <- renderText(input$pwid)
      
      dt_obj <- train(Species ~ .,method="rpart",data=iris)
      
      output$preds <- reactive({
        slength <- input$slen
        swidth <- input$swid
        plength <- input$plen
        pwidth <- input$pwid
        testing = data.frame(Sepal.Length = slength, Sepal.Width = swidth,
                             Petal.Length = plength, Petal.Width = pwidth)
        predict(dt_obj,newdata=testing)
      })
      
      
      

})
