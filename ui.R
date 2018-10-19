# load package
library(shiny)

# Define UI to line regression model for mpg dataset 
fluidPage(
        title = 'Line Regression Model for MPG dataset',
        sidebarLayout(
                
                # select one predictor from drop-down memu
                sidebarPanel(
                        selectInput('x', 'Select one predictor :',
                                    choices = names(mtcars)[-1])
                ),
                
                # show scatter plot and add fit line from model
                mainPanel(
                        verbatimTextOutput("summary"),
                        plotOutput("Plot")
                )
        )
)
