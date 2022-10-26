#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
data("iris")

shinyUI(fluidPage(

    # Application title
    titlePanel("Peer Assignment 4"),
    p("This application can be for predicting the species of an iris flower."),
    p("This application uses a decision tree in the background to make predictions."),
    p("Please input below the length and width of the sepal and petal to determine the species of the iris flower."),
    
    sidebarLayout(
        sidebarPanel(
            
            h4("Set the input parameters:"),
            sliderInput("slen", "Sepal Length:", min = 0, max = 10, value = 0, step = 0.1),
            sliderInput("swid", "Sepal Width:", min = 0, max = 10, value = 0, step = 0.1),
            sliderInput("plen", "Petal Length:", min = 0, max = 10, value = 0, step = 0.1),
            sliderInput("pwid", "Petal Width:", min = 0, max = 10, value = 0, step = 0.1),
            submitButton("Predict Class")
        ),

        mainPanel(
            p("For the chosen Sepal legnth and width (respectively):"),
            textOutput("test1"),
            textOutput("test2"),
            p("And for the chosen Petal legnth and width (respectively):"),
            textOutput("test3"),
            textOutput("test4"),
            p("The class for this iris flower is: "),
            textOutput("preds")
        )
    )
))
