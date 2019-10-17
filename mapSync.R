library(leaflet)
library(leafsync)
library(shiny)

my_map <- function(x){
    m <- leaflet() %>%
        addTiles() %>%  # Add default OpenStreetMap map tiles
        addMarkers(lng=x[1], lat=x[2], popup="The birthplace of R")
    m
}

y <- c(174.968, 37.852)
x <- c(0.112281, 51.523001)

ui <- fluidPage(
    leafletOutput("mymap1"),
    leafletOutput("mymap2")
)

server = function(input, output){
    
    output$mymap1 = renderLeaflet({
        my_map(x)
    })
    output$mymap2 = renderLeaflet({
        my_map(y)
    })
    
    observe({
        coords <- input$mymap1_bounds
        if (!is.null(coords)) {
            leafletProxy("mymap2") %>% 
                fitBounds(coords$west,
                          coords$south,
                          coords$east,
                          coords$north)
        }
    })
}

shinyApp(ui, server)