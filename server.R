library(shiny)

data <- read.csv("travel.csv")
colnames(data)[4] <- "Driven"
colnames(data)[7] <- "Biked"
colnames(data)[10] <- "Walked"

## Define a server for the Shiny app
shinyServer(function(input, output) {
    
    dataInput <- reactive({
        subset(data, select=c(input$travel), subset=(substring(data$Date,1,4) == input$year))
    })
    
    ## Fill in the spot we created for a plot
    output$plot1 <- renderPlot({
        
        ## Render a barplot
        barplot(dataInput()[,input$travel],
                main=paste(input$travel, "in", input$year),
                ylab="Distance, in Miles", ylim=c(0,80),
                xlab="Weeks, January to December")
    })
})