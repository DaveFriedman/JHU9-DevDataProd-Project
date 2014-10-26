library(shiny)

# Define the overall UI
shinyUI(
    
    # Use a fluid Bootstrap layout
    fluidPage(
        
        # Give the page a title
        titlePanel("Miles Driven, Biked, & Walked over one year"),
        
        # Generate a row with a sidebar
        sidebarLayout(
            
            # Define the sidebar with one input
            sidebarPanel(
                selectInput("travel", "Type of travel:",
                            choices=c("Driven", "Biked", "Walked")),
                selectInput("year", "Year:",
                            choices=c("2012", "2013", "2014")),
                hr(),
                helpText("Distance traveled, 2012-2014.", br(),
                         "Select a method of transportation and a year.")),
            
            # Create a spot for the barplot
            mainPanel(
                plotOutput("plot1")))))