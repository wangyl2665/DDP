# load package
library(shiny)
library(datasets)


# Define server logic required to summarize model and show plot
function(input, output) {
        
        # Define formula according to input predictor
        regFormula <- reactive({
                as.formula(paste('mpg ~', input$x))
        })
        
        # Generate summary of line regression according to input predictor
        output$summary <- renderPrint({
                fit <- lm(regFormula(), data = mtcars)
                summary(fit)
        })
        
        # show scatter plot and add fit line from model
        output$Plot <- renderPlot({
                # options(digits = 4)
                fit <- lm(regFormula(), data = mtcars)

                plot(regFormula(), data = mtcars, pch = 19, col = 'red')
                abline(fit, col = 'blue', lwd = 4)
        })
}
