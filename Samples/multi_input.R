# you'll need dev version
# devtools::install_github("dreamRs/shinyWidgets")

library(shiny)
library(shinyWidgets)
library(shinyFiles)

ui <- fluidPage(
  titlePanel("Connect dir chooser with multiInput"),
  shinyDirButton(id = 'directory', label = 'Folder select', title = 'Please select a folder'),
  fluidRow(
    column(
      width = 6,
      wellPanel(
        multiInput(
          inputId = "xpt", label = "Files :",
          choices =  "",
          selected = "", 
          width = '400px' 
        ),
        verbatimTextOutput(outputId = "mfiles")
      )
    )
  )
)
server <- function(input, output, session) {
  
  volumes <- getVolumes()
  shinyDirChoose(input = input, id = 'directory', roots = volumes, session = session)
  path1 <- reactive({
    parseDirPath(volumes, input$directory)
  })
  
  observeEvent(path1(), {
    updateMultiInput(session = session, inputId = "xpt", choices = list.files(path1()))
  })
  
  output$mfiles <- renderPrint({ input$xpt })
}
shinyApp(ui = ui, server = server)