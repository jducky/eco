library(shiny)
library(DT)
runApp(list(
    server = function(input, output, session) {
        mtcars2 = mtcars[, 1:8]
        output$x3 = DT::renderDataTable({
            # to create a new datatable each time the reset button is clicked
            input$resetSelection 
            mtcars2
        }, rownames = TRUE, server = TRUE
        )
        
        # print the selected indices
        selection <- reactive ({
            input$x3_rows_selected
        })
        
        output$x4 = renderPrint({
            if (length(selection())) {
                cat('These rows were selected:\n')
                output <- selection()
                cat(output, sep = '\n')
            }
        })
    },
    ui = shinyUI(fluidPage(
        title = 'Select Table Rows',
        h1('A Server-side Table'),
        fluidRow(
            column(9, DT::dataTableOutput('x3')),
            column(3, verbatimTextOutput('x4'),
                   actionButton(  'resetSelection',label = "Click to reset row selection")
            ) #end of column
        )
    ))
))