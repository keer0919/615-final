library(shiny)


shinyUI(fluidPage(
  # Application title
  titlePanel("Word Cloud"),
  
  sidebarLayout(
    # Sidebar with selection inputs
      sliderInput("freq",
                  "Minimum Frequency:",
                  min = 100,  max = 700, value = 15),
      sliderInput("max",
                  "Maximum Number of Words:",
                  min = 10,  max = 300,  value = 100)
    ),
    
    # Show Word Cloud
    mainPanel(
      plotOutput("plot")
    )
)  )

# library(rsconnect)
# rsconnect::setAccountInfo(name='keer',
#                           token='FFFCF53C5971A361B2D6855459044713',
#                           secret='r19HiHdtOi7Vrwiw460bgN0DkON0U43jn06zM6Rq')
# rsconnect::deployApp("/Users/jiangkeer/Desktop/615/615 final pro")
# shiny::runApp()
