library(shiny)
library(shinyFiles)

ui <- fluidPage("DIR",
  
  sidebarLayout(
  
  sidebarPanel(
    shinyDirButton("dir_in", "Chose directory", "Upload")
  ),
  
  mainPanel(
    h4("output$dir"),
    verbatimTextOutput("dir_out"), br()
    
  )
  
  )
)

server <- function(input,output,session){
  
  # dir
  shinyDirChoose(input, 'dir_in', roots = c(name = getwd()))
  dir <- reactive(input$dir_in)
  output$dir_out <- renderPrint(dir())
}

shinyApp(ui = ui, server = server)
