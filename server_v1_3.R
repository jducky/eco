
shinyServer(function(input, output) {

  
  observeEvent(input$login, {
    showModal(modalDialog(
      title = "You have logged in.",
      paste0("It seems you have logged in as ",input$userid,'.'),
      easyClose = TRUE,
      footer = NULL
    ))
  })
  
  observeEvent(input$SDM_MO_SDM_run, {
#      withProgress(message = 'Runing SDM model.........', value = 2, {
#        Sys.sleep(10.0)
        
    if(input$SDM_MO_SDM_run > 0) {        
        pb = winProgressBar("test progress bar", "Some information in %",0, 100, 0)
        u = c(0, sort(runif(20, 0, 100)), 100)
        for(i in u) {
          Sys.sleep(0.1)
          info <- sprintf("%d%% done", round(i))
          setWinProgressBar(pb, i, "test progress bar", info)
        }
        Sys.sleep(2)
        close(pb)
      }        
        
#    })
  })
  
  observeEvent(input$DM_MO_Action, {
    withProgress(message = 'Runing Dispersal model.........', value = 2, {
      Sys.sleep(10.0)
    })
  })
  
  observeEvent(input$IS_VA_Action_expan, {
    withProgress(message = 'Runing Invasive species expansion.........', value = 2, {
      Sys.sleep(10.0)
    })
  })
  
  observeEvent(input$IS_VA_Action_intro, {
    withProgress(message = 'Runing Invasive species introduction.........', value = 2, {
      Sys.sleep(10.0)
    })
  })
  
  observeEvent(input$VH_VA_Action_SR, {
    withProgress(message = 'Runing Species richness.........', value = 2, {
      Sys.sleep(10.0)
    })
  })
  
  observeEvent(input$VH_VA_Action_SRL, {
    withProgress(message = 'Runing Species richness loss.........', value = 2, {
      Sys.sleep(10.0)
    })
  })
  
  observeEvent(input$VH_VA_Action_SLA, {
    withProgress(message = 'Runing Species loss area.........', value = 2, {
      Sys.sleep(10.0)
    })
  })
  
  observeEvent(input$VH_VA_Action_SSA, {
    withProgress(message = 'Runing Species stay area.........', value = 2, {
      Sys.sleep(10.0)
    })
  })
  
  observeEvent(input$VH_VA_Action_SIA, {
    withProgress(message = 'Runing Species introduction area.........', value = 2, {
      Sys.sleep(10.0)
    })
  })
  

observeEvent(input$SE_Dir_In, {

    # dir
#  shinyDirChoose(input, 'SE_Dir', roots = c(name=getwd()))
  shinyDirChoose(input, 'SE_Dir_In', roots = getVolumes())
  
  volumes <- system("wmic logicaldisk get name", intern = T)
  volumes <- sub(" *\\r$", "", volumes)
  keep <- !tolower(volumes) %in% c("name", "")
  volumes <- volumes[keep]
  #  names(volumes) <- volumes
  
  
  global <- reactiveValues(datapath = getwd())
  dir <- reactive(input$SE_Dir_In)

#  output$SE_Dir_Out <- renderPrint(dir())
#  output$SE_Dir_Out <- renderPrint(file.path(normalizePath(getwd(), winslash="/"), substring(list.dirs()[[2]], 3), sep=""))

  output$SE_Dir_Out <- renderText({
    global$datapath
  })
  
  observeEvent(ignoreNULL = TRUE,
               eventExpr = {
                 input$SE_Dir_In
               },
               handlerExpr = {
                 if (!"path" %in% names(dir())) return()
#                 home <- normalizePath("~")
#                 home <- normalizePath("~", winslash="/")
                 home <- volumes
                 global$datapath <-
                   file.path(home, paste(unlist(dir()$path[-1]), collapse = .Platform$file.sep))
               })
  
})  
  
  
  output$SP_Information <- renderTable({
    # input$file1 will be NULL initially. After the user selects
    # and uploads a file, it will be a data frame with 'name',
    # 'size', 'type', and 'datapath' columns. The 'datapath'
    # column will contain the local filenames where the data can
    # be found.
    
#    inFile <- input$file1
    
#    if (is.null(input$file1))
#      return(NULL)
    
    read.csv("C:/Projects/GUI/Shiny/Motive/ecosystem/a03_speciesname_final.csv") #, header = "header")
    
  })

  output$SP_Display <- renderTable({
    # input$file1 will be NULL initially. After the user selects
    # and uploads a file, it will be a data frame with 'name',
    # 'size', 'type', and 'datapath' columns. The 'datapath'
    # column will contain the local filenames where the data can
    # be found.
    
    inFile <- input$file1
    
    if (is.null(input$file1))
      return(NULL)
    
    read.csv(inFile$datapath, header = input$SP_Header)
    
  })
  
  
  output$SP_Summary <- renderPrint({
    
    inFile <- input$file1
    if (is.null(input$file1))
      return(NULL)
    
    dataset <- read.csv(inFile$datapath, header = input$SP_Header)
    #    dataset <- datasetInput()
    summary(dataset)
  })  

  output$SP_Map <- renderLeaflet({

    species_data <- st_read("species.shp") 
    
    leaflet(data = species_data[1:297,]) %>%
      addTiles(
                        urlTemplate = "//{s}.tiles.mapbox.com/v3/jcheng.map-5ebohr46/{z}/{x}/{y}.png",
                        attribution = 'Maps by <a href="http://www.mapbox.com/">Mapbox</a>'
      ) %>%

      addMarkers(~Longitude, ~Latitude, popup = ~as.character(ID), label = ~as.character(ID)) %>%
      setView(lng = 127.00, lat = 38.00, zoom = 6)
  })


  output$LD_Summary <- renderPrint({
    
    r <- raster(file.path("C:/Projects/2019_DATA/4. forest fire, landslide/forest fire/S251", "barrier11.tif"))
    
    summary(r)
  })
  
  
  output$LD_Map <- renderLeaflet({
    
    
    r <- raster(file.path("C:/Projects/2019_DATA/4. forest fire, landslide/forest fire/S251", "barrier11.tif"))
    crs(r) <- CRS("+proj=longlat +datum=WGS84 +ellps=WGS84 +towgs84=0,0,0")
    
    pal <- colorNumeric(c("#0C2C84", "#FFFFCC", "#41B6C4"), values(r),
                        na.color = "transparent")
    
    leaflet() %>%
      addTiles(
        urlTemplate = "//{s}.tiles.mapbox.com/v3/jcheng.map-5ebohr46/{z}/{x}/{y}.png",
        attribution = 'Maps by <a href="http://www.mapbox.com/">Mapbox</a>'
      ) %>%        
      
      addRasterImage(r, colors = pal, opacity = 0.8,) %>%
      addLegend(pal = pal, values = values(r), title = "Legend")  %>%
      
      setView(lng = 127.00, lat = 38.00, zoom = 6)
  })   

    
  output$CD_Summary <- renderPrint({
    
    r_asc <- read.asc(file.path("C:/Projects/2019_DATA/0. climate data/current/current_real", paste(input$CD_Variables, ".asc", sep = "")))
    r <- raster(r_asc)

    summary(r)
  })
  
    
  output$CD_Map <- renderLeaflet({
    
    r_asc <- read.asc(file.path("C:/Projects/2019_DATA/0. climate data/current/current_real", paste(input$CD_Variables, ".asc", sep = "")))
    r <- raster(r_asc)
    
    pal <- colorNumeric(c("#0C2C84", "#FFFFCC", "#41B6C4"), values(r),
                      na.color = "transparent")
    
    leaflet() %>%
      addTiles(
                        urlTemplate = "//{s}.tiles.mapbox.com/v3/jcheng.map-5ebohr46/{z}/{x}/{y}.png",
                        attribution = 'Maps by <a href="http://www.mapbox.com/">Mapbox</a>'
      ) %>%        
       
      addRasterImage(r, colors = pal, opacity = 0.8) %>%
      addLegend(pal = pal, values = values(r), title = "Legend")  %>%
      
      setView(lng = 127.00, lat = 38.00, zoom = 6)
  })
  
  
  output$SDM_OU_Summary <- renderPrint({
    
    r <- raster(file.path("C:/Projects/2019_DATA/1. unlimited dispersal/1. 민감종 57종", "S002b_current.tif"))
    
    summary(r)
  })
  

  output$SDM_OU_Validation <- renderTable({
    # input$file1 will be NULL initially. After the user selects
    # and uploads a file, it will be a data frame with 'name',
    # 'size', 'type', and 'datapath' columns. The 'datapath'
    # column will contain the local filenames where the data can
    # be found.
    
    read.csv("C:/Projects/GUI/Shiny/Motive/ecosystem/myBiomodModelOut.csv") #, header = "header")
    
#    if (is.null(input$file1))
#      return(NULL)
    
#    read.csv(inFile) #, header = input$SP_Header)
    
  })
  
  output$SDM_OU_BoxPlot <- renderPlot({
    inFile <- read.csv("C:/Projects/GUI/Shiny/Motive/ecosystem/myBiomodModelOut.csv") #, header = "header")
    boxplot(inFile$Testing.data~ inFile$strat, ylab = "ROC AUC")
  })
    
  output$SDM_OU_Probability_map <- renderLeaflet({
    
    r <- raster(file.path("C:/Projects/2019_DATA/1. unlimited dispersal/1. 민감종 57종", "S002b_current.tif"))
    crs(r) <- CRS("+proj=longlat +datum=WGS84 +ellps=WGS84 +towgs84=0,0,0")
    
    pal <- colorNumeric(c("#0C2C84", "#FFFFCC", "#41B6C4"), values(r),
                        na.color = "transparent")
    
    leaflet() %>%
      addTiles(
        urlTemplate = "//{s}.tiles.mapbox.com/v3/jcheng.map-5ebohr46/{z}/{x}/{y}.png",
        attribution = 'Maps by <a href="http://www.mapbox.com/">Mapbox</a>'
      ) %>%        
      
      addRasterImage(r, colors = pal, opacity = 0.8,) %>%
      addLegend(pal = pal, values = values(r), title = "Legend")  %>%
      
      setView(lng = 127.00, lat = 38.00, zoom = 6)
  })
  
  output$SDM_OU_Predicted_map <- renderLeaflet({
    
    r <- raster(file.path("C:/Projects/2019_DATA/1. unlimited dispersal/1. 민감종 57종", "S002b_HR8580.tif"))
    crs(r) <- CRS("+proj=longlat +datum=WGS84 +ellps=WGS84 +towgs84=0,0,0")
    
    pal <- colorNumeric(c("#0C2C84", "#FFFFCC", "#41B6C4"), values(r),
                        na.color = "transparent")
    
    leaflet() %>%
      addTiles(
        urlTemplate = "//{s}.tiles.mapbox.com/v3/jcheng.map-5ebohr46/{z}/{x}/{y}.png",
        attribution = 'Maps by <a href="http://www.mapbox.com/">Mapbox</a>'
      ) %>%        
      
      addRasterImage(r, colors = pal, opacity = 0.8,) %>%
      addLegend(pal = pal, values = values(r), title = "Legend")  %>%
      
      setView(lng = 127.00, lat = 38.00, zoom = 6)
  })  
  

  output$DM_OU_Summary <- renderPrint({
    
    r <- raster(file.path("C:/Projects/2019_DATA/1. unlimited dispersal/1. 민감종 57종", "S002b_HR8580.tif"))
    
    summary(r)
  })
  
  
  output$DM_OU_DIspersal_map <- renderLeaflet({
    
    r <- raster(file.path("C:/Projects/2019_DATA/1. unlimited dispersal/1. 민감종 57종", "S002b_HR8580.tif"))
    crs(r) <- CRS("+proj=longlat +datum=WGS84 +ellps=WGS84 +towgs84=0,0,0")
    
    pal <- colorNumeric(c("#0C2C84", "#FFFFCC", "#41B6C4"), values(r),
                        na.color = "transparent")
    
    leaflet() %>%
      addTiles(
        urlTemplate = "//{s}.tiles.mapbox.com/v3/jcheng.map-5ebohr46/{z}/{x}/{y}.png",
        attribution = 'Maps by <a href="http://www.mapbox.com/">Mapbox</a>'
      ) %>%        
      
      addRasterImage(r, colors = pal, opacity = 0.8,) %>%
      addLegend(pal = pal, values = values(r), title = "Legend")  %>%
      
      setView(lng = 127.00, lat = 38.00, zoom = 6)
  })
  
  output$SS_SP_Change <- renderPlot({
    
    dataset <- read.csv("C:/Projects/2019_DATA/3. graph/VI_2.csv")
    a=c(2000, 2030, 2050, 2080)
    b=c(dataset$X4530_0[1],dataset$X4530_L[1],dataset$X4550_L[1],dataset$X4580_L[1])
    c=c(dataset$X4530_0[68],dataset$X4530_L[68],dataset$X4550_L[68],dataset$X4580_L[68])
    
    # Make a basic graph
    plot( b~a , type="b" , bty="l" , xlab="Year" , ylab="Vulnerability Index" , col=rgb(0.2,0.4,0.1,0.7) , lwd=3 , pch=17 , ylim=c(-1,1) )
    lines(c ~a , col=rgb(0.8,0.4,0.1,0.7) , lwd=3 , pch=19 , type="b" )
    
    # Add a legend
    legend("bottomleft", 
           #  legend = c(dataset$SPECIES[1], dataset$SPECIES[68]), 
           legend = c("구상나무", "분비나무"), 
           col = c(rgb(0.2,0.4,0.1,0.7), 
                   rgb(0.8,0.4,0.1,0.7)), 
           pch = c(17,19), 
           bty = "n", 
           pt.cex = 2, 
           cex = 1.2, 
           text.col = "black", 
           horiz = F , 
           inset = c(0.1, 0.1))
  })
  
  
  output$IS_OU_EX_Map <- renderLeaflet({
    
    r <- raster(file.path("C:/Projects/2019_DATA/1. unlimited dispersal/1. 민감종 57종", "S002b_current.tif"))
    crs(r) <- CRS("+proj=longlat +datum=WGS84 +ellps=WGS84 +towgs84=0,0,0")
    
    pal <- colorNumeric(c("#0C2C84", "#FFFFCC", "#41B6C4"), values(r),
                        na.color = "transparent")
    
    leaflet() %>%
      addTiles(
        urlTemplate = "//{s}.tiles.mapbox.com/v3/jcheng.map-5ebohr46/{z}/{x}/{y}.png",
        attribution = 'Maps by <a href="http://www.mapbox.com/">Mapbox</a>'
      ) %>%        
      
      addRasterImage(r, colors = pal, opacity = 0.8,) %>%
      addLegend(pal = pal, values = values(r), title = "Legend")  %>%
      
      setView(lng = 127.00, lat = 38.00, zoom = 6)
  })
  
  output$IS_OU_EX_SIDO_Stat <- renderPlot({
    df2 <- data.frame(시도 = rep(c("서울", "경기도"), each=3),
                      연도 = rep(c("Current", "2030", "2050"),2),
                      외래종 = c(6.8, 15, 33, 4.2, 10, 29.5))
    head(df2)
#    df_sorted <- arrange(df2, dose, supp) 
#    head(df_sorted)
    
    # Calculate the cumulative sum of len for each dose
#    df_cumsum <- ddply(df_sorted, "dose",
#                       transform, label_ypos=cumsum(len))
#    head(df_cumsum)
    
    ggplot(data=df2, aes(x=연도, y=외래종, fill=시도)) +
      geom_bar(stat="identity", position=position_dodge())+
      geom_text(aes(label=외래종), vjust=1.6, color="white",
                position = position_dodge(0.9), size=3.5)+
      scale_fill_brewer(palette="Paired")+
      theme_minimal()
  })
  
  
  output$IS_OU_EX_SIDO_Map <- renderLeaflet({
    
    r <- raster(file.path("C:/Projects/2019_DATA/1. unlimited dispersal/1. 민감종 57종", "S002b_current.tif"))
    crs(r) <- CRS("+proj=longlat +datum=WGS84 +ellps=WGS84 +towgs84=0,0,0")
    
    pal <- colorNumeric(c("#0C2C84", "#FFFFCC", "#41B6C4"), values(r),
                        na.color = "transparent")
    
    leaflet() %>%
      addTiles(
        urlTemplate = "//{s}.tiles.mapbox.com/v3/jcheng.map-5ebohr46/{z}/{x}/{y}.png",
        attribution = 'Maps by <a href="http://www.mapbox.com/">Mapbox</a>'
      ) %>%        
      
      addRasterImage(r, colors = pal, opacity = 0.8,) %>%
      addLegend(pal = pal, values = values(r), title = "Legend")  %>%
      
      setView(lng = 127.00, lat = 38.00, zoom = 6)
  })
  
  
  output$IS_OU_EX_SIGUNGU_Map <- renderLeaflet({
    
    #    r <- raster(file.path("C:/Projects/2019_DATA/6. zonal statistic/invasive species/richness", "imax_HR4550r.tif"))
    #    crs(r) <- CRS("+proj=longlat +datum=WGS84 +ellps=WGS84 +towgs84=0,0,0")
    
    #    pal <- colorNumeric(c("#0C2C84", "#FFFFCC", "#41B6C4"), values(r),
    #                        na.color = "transparent")
    
    leaflet() %>%
      addTiles(
        urlTemplate = "//{s}.tiles.mapbox.com/v3/jcheng.map-5ebohr46/{z}/{x}/{y}.png",
        attribution = 'Maps by <a href="http://www.mapbox.com/">Mapbox</a>'
      ) %>%        
      
      #      addRasterImage(r, colors = pal, opacity = 0.8,) %>%
      #      addLegend(pal = pal, values = values(r), title = "Legend")  %>%
      
      setView(lng = 127.00, lat = 38.00, zoom = 6)
  })
  
  
  output$IS_OU_SI_Map <- renderLeaflet({
    
    #    r <- raster(file.path("C:/Projects/2019_DATA/6. zonal statistic/invasive species/richness", "imax_HR4550r.tif"))
    #    crs(r) <- CRS("+proj=longlat +datum=WGS84 +ellps=WGS84 +towgs84=0,0,0")
    
    #    pal <- colorNumeric(c("#0C2C84", "#FFFFCC", "#41B6C4"), values(r),
    #                        na.color = "transparent")
    
    leaflet() %>%
      addTiles(
        urlTemplate = "//{s}.tiles.mapbox.com/v3/jcheng.map-5ebohr46/{z}/{x}/{y}.png",
        attribution = 'Maps by <a href="http://www.mapbox.com/">Mapbox</a>'
      ) %>%        
      
      #      addRasterImage(r, colors = pal, opacity = 0.8,) %>%
      #      addLegend(pal = pal, values = values(r), title = "Legend")  %>%
      
      setView(lng = 127.00, lat = 38.00, zoom = 6)
  })
  
  
  output$IS_OU_SI_SIDO_Map <- renderLeaflet({
    
    #    r <- raster(file.path("C:/Projects/2019_DATA/6. zonal statistic/invasive species/richness", "imax_HR4550r.tif"))
    #    crs(r) <- CRS("+proj=longlat +datum=WGS84 +ellps=WGS84 +towgs84=0,0,0")
    
    #    pal <- colorNumeric(c("#0C2C84", "#FFFFCC", "#41B6C4"), values(r),
    #                        na.color = "transparent")
    
    leaflet() %>%
      addTiles(
        urlTemplate = "//{s}.tiles.mapbox.com/v3/jcheng.map-5ebohr46/{z}/{x}/{y}.png",
        attribution = 'Maps by <a href="http://www.mapbox.com/">Mapbox</a>'
      ) %>%        
      
      #      addRasterImage(r, colors = pal, opacity = 0.8,) %>%
      #      addLegend(pal = pal, values = values(r), title = "Legend")  %>%
      
      setView(lng = 127.00, lat = 38.00, zoom = 6)
  })
  
  
  output$IS_OU_SI_SIGUNGU_Map <- renderLeaflet({
    
    #    r <- raster(file.path("C:/Projects/2019_DATA/6. zonal statistic/invasive species/richness", "imax_HR4550r.tif"))
    #    crs(r) <- CRS("+proj=longlat +datum=WGS84 +ellps=WGS84 +towgs84=0,0,0")
    
    #    pal <- colorNumeric(c("#0C2C84", "#FFFFCC", "#41B6C4"), values(r),
    #                        na.color = "transparent")
    
    leaflet() %>%
      addTiles(
        urlTemplate = "//{s}.tiles.mapbox.com/v3/jcheng.map-5ebohr46/{z}/{x}/{y}.png",
        attribution = 'Maps by <a href="http://www.mapbox.com/">Mapbox</a>'
      ) %>%        
      
      #      addRasterImage(r, colors = pal, opacity = 0.8,) %>%
      #      addLegend(pal = pal, values = values(r), title = "Legend")  %>%
      
      setView(lng = 127.00, lat = 38.00, zoom = 6)
  })
  
  

  
  output$VH_OU_SR_Map <- renderLeaflet({
    
    r <- raster(file.path("C:/Projects/2019_DATA/2. limited dispersal/4. 종풍부도/3. richness/전체종/long", "migHR4550TR_richness.tif"))
    crs(r) <- CRS("+proj=longlat +datum=WGS84 +ellps=WGS84 +towgs84=0,0,0")
    
    pal <- colorNumeric(c("#0C2C84", "#FFFFCC", "#41B6C4"), values(r),
                        na.color = "transparent")
    
    leaflet() %>%
      addTiles(
        urlTemplate = "//{s}.tiles.mapbox.com/v3/jcheng.map-5ebohr46/{z}/{x}/{y}.png",
        attribution = 'Maps by <a href="http://www.mapbox.com/">Mapbox</a>'
      ) %>%        
      
      addRasterImage(r, colors = pal, opacity = 0.8,) %>%
      addLegend(pal = pal, values = values(r), title = "Legend")  %>%
      
      setView(lng = 127.00, lat = 38.00, zoom = 6)
  })
  
  output$VH_OU_SR_Habitat_Map <- renderLeaflet({
    
    r <- raster(file.path("C:/Projects/2019_DATA/2. limited dispersal/4. 종풍부도/3. richness/전체종/long", "migHR4550TR_richness.tif"))
    crs(r) <- CRS("+proj=longlat +datum=WGS84 +ellps=WGS84 +towgs84=0,0,0")
    
    pal <- colorNumeric(c("#0C2C84", "#FFFFCC", "#41B6C4"), values(r),
                        na.color = "transparent")
    
    leaflet() %>%
      addTiles(
        urlTemplate = "//{s}.tiles.mapbox.com/v3/jcheng.map-5ebohr46/{z}/{x}/{y}.png",
        attribution = 'Maps by <a href="http://www.mapbox.com/">Mapbox</a>'
      ) %>%        
      
      addRasterImage(r, colors = pal, opacity = 0.8,) %>%
      addLegend(pal = pal, values = values(r), title = "Legend")  %>%
      
      setView(lng = 127.00, lat = 38.00, zoom = 6)
  })
  
  output$VH_OU_SR_Habitat_Stat <- renderPlot({
    df2 <- data.frame(서식지 = rep(c("백두대간", "지리산국립공원"), each=3),
                        연도 = rep(c("Current", "2030", "2050"),2),
                        종수 = c(6.8, 15, 33, 4.2, 10, 29.5))
    head(df2)
    #    df_sorted <- arrange(df2, dose, supp) 
    #    head(df_sorted)
    
    # Calculate the cumulative sum of len for each dose
    #    df_cumsum <- ddply(df_sorted, "dose",
    #                       transform, label_ypos=cumsum(len))
    #    head(df_cumsum)
    
    ggplot(data=df2, aes(x=연도, y=종수, fill=서식지)) +
      geom_bar(stat="identity", position=position_dodge())+
      geom_text(aes(label=종수), vjust=1.6, color="white",
                position = position_dodge(0.9), size=3.5)+
      scale_fill_brewer(palette="Paired")+
      theme_minimal()
  })
  
  output$VH_OU_SRL_Map <- renderLeaflet({
    
    r <- raster(file.path("C:/Projects/2019_DATA/1. unlimited dispersal/4. 종풍부도/3. _richness_loss/a01_300S", "HR8550F_loss.tif"))
    crs(r) <- CRS("+proj=longlat +datum=WGS84 +ellps=WGS84 +towgs84=0,0,0")
    
    pal <- colorNumeric(c("#0C2C84", "#FFFFCC", "#41B6C4"), values(r),
                        na.color = "transparent")
    
    leaflet() %>%
      addTiles(
        urlTemplate = "//{s}.tiles.mapbox.com/v3/jcheng.map-5ebohr46/{z}/{x}/{y}.png",
        attribution = 'Maps by <a href="http://www.mapbox.com/">Mapbox</a>'
      ) %>%        
      
      addRasterImage(r, colors = pal, opacity = 0.8,) %>%
      addLegend(pal = pal, values = values(r), title = "Legend")  %>%
      
      setView(lng = 127.00, lat = 38.00, zoom = 6)
  })
  
  output$VH_OU_SRL_Habitat_Map <- renderLeaflet({
    
    r <- raster(file.path("C:/Projects/2019_DATA/1. unlimited dispersal/4. 종풍부도/3. _richness_loss/a01_300S", "HR8550F_loss.tif"))
    crs(r) <- CRS("+proj=longlat +datum=WGS84 +ellps=WGS84 +towgs84=0,0,0")
    
    pal <- colorNumeric(c("#0C2C84", "#FFFFCC", "#41B6C4"), values(r),
                        na.color = "transparent")
    
    leaflet() %>%
      addTiles(
        urlTemplate = "//{s}.tiles.mapbox.com/v3/jcheng.map-5ebohr46/{z}/{x}/{y}.png",
        attribution = 'Maps by <a href="http://www.mapbox.com/">Mapbox</a>'
      ) %>%        
      
      addRasterImage(r, colors = pal, opacity = 0.8,) %>%
      addLegend(pal = pal, values = values(r), title = "Legend")  %>%
      
      setView(lng = 127.00, lat = 38.00, zoom = 6)
  })
  
  output$VH_OU_SL_Map <- renderLeaflet({
    
    r <- raster(file.path("C:/Projects/2019_DATA/1. unlimited dispersal/4. 종풍부도/3. _richness_loss/a01_300S", "HR8580F_loss.tif"))
    crs(r) <- CRS("+proj=longlat +datum=WGS84 +ellps=WGS84 +towgs84=0,0,0")
    
    pal <- colorNumeric(c("#0C2C84", "#FFFFCC", "#41B6C4"), values(r),
                        na.color = "transparent")
    
    leaflet() %>%
      addTiles(
        urlTemplate = "//{s}.tiles.mapbox.com/v3/jcheng.map-5ebohr46/{z}/{x}/{y}.png",
        attribution = 'Maps by <a href="http://www.mapbox.com/">Mapbox</a>'
      ) %>%        
      
      addRasterImage(r, colors = pal, opacity = 0.8,) %>%
      addLegend(pal = pal, values = values(r), title = "Legend")  %>%
      
      setView(lng = 127.00, lat = 38.00, zoom = 6)
  })
  
  output$VH_OU_SL_Habitat_Map <- renderLeaflet({
    
    r <- raster(file.path("C:/Projects/2019_DATA/1. unlimited dispersal/4. 종풍부도/3. _richness_loss/a01_300S", "HR8580F_loss.tif"))
    crs(r) <- CRS("+proj=longlat +datum=WGS84 +ellps=WGS84 +towgs84=0,0,0")
    
    pal <- colorNumeric(c("#0C2C84", "#FFFFCC", "#41B6C4"), values(r),
                        na.color = "transparent")
    
    leaflet() %>%
      addTiles(
        urlTemplate = "//{s}.tiles.mapbox.com/v3/jcheng.map-5ebohr46/{z}/{x}/{y}.png",
        attribution = 'Maps by <a href="http://www.mapbox.com/">Mapbox</a>'
      ) %>%        
      
      addRasterImage(r, colors = pal, opacity = 0.8,) %>%
      addLegend(pal = pal, values = values(r), title = "Legend")  %>%
      
      setView(lng = 127.00, lat = 38.00, zoom = 6)
  })
  
  output$VH_OU_SS_Map <- renderLeaflet({
    
    r <- raster(file.path("C:/Projects/2019_DATA/1. unlimited dispersal/4. 종풍부도/4. _richness_stay/a01_300S", "HR8550F_stay.tif"))
    crs(r) <- CRS("+proj=longlat +datum=WGS84 +ellps=WGS84 +towgs84=0,0,0")
    
    pal <- colorNumeric(c("#0C2C84", "#FFFFCC", "#41B6C4"), values(r),
                        na.color = "transparent")
    
    leaflet() %>%
      addTiles(
        urlTemplate = "//{s}.tiles.mapbox.com/v3/jcheng.map-5ebohr46/{z}/{x}/{y}.png",
        attribution = 'Maps by <a href="http://www.mapbox.com/">Mapbox</a>'
      ) %>%        
      
      addRasterImage(r, colors = pal, opacity = 0.8,) %>%
      addLegend(pal = pal, values = values(r), title = "Legend")  %>%
      
      setView(lng = 127.00, lat = 38.00, zoom = 6)
  })
  
  output$VH_OU_SS_Habitat_Map <- renderLeaflet({
    
    r <- raster(file.path("C:/Projects/2019_DATA/1. unlimited dispersal/4. 종풍부도/4. _richness_stay/a01_300S", "HR8550F_stay.tif"))
    crs(r) <- CRS("+proj=longlat +datum=WGS84 +ellps=WGS84 +towgs84=0,0,0")
    
    pal <- colorNumeric(c("#0C2C84", "#FFFFCC", "#41B6C4"), values(r),
                        na.color = "transparent")
    
    leaflet() %>%
      addTiles(
        urlTemplate = "//{s}.tiles.mapbox.com/v3/jcheng.map-5ebohr46/{z}/{x}/{y}.png",
        attribution = 'Maps by <a href="http://www.mapbox.com/">Mapbox</a>'
      ) %>%        
      
      addRasterImage(r, colors = pal, opacity = 0.8,) %>%
      addLegend(pal = pal, values = values(r), title = "Legend")  %>%
      
      setView(lng = 127.00, lat = 38.00, zoom = 6)
  })
  
  output$VH_OU_SI_Map <- renderLeaflet({
    
    r <- raster(file.path("C:/Projects/2019_DATA/1. unlimited dispersal/4. 종풍부도/2. _richness_expand/a01_300S", "HR8550F_expand.tif"))
    crs(r) <- CRS("+proj=longlat +datum=WGS84 +ellps=WGS84 +towgs84=0,0,0")
    
    pal <- colorNumeric(c("#0C2C84", "#FFFFCC", "#41B6C4"), values(r),
                        na.color = "transparent")
    
    leaflet() %>%
      addTiles(
        urlTemplate = "//{s}.tiles.mapbox.com/v3/jcheng.map-5ebohr46/{z}/{x}/{y}.png",
        attribution = 'Maps by <a href="http://www.mapbox.com/">Mapbox</a>'
      ) %>%        
      
      addRasterImage(r, colors = pal, opacity = 0.8,) %>%
      addLegend(pal = pal, values = values(r), title = "Legend")  %>%
      
      setView(lng = 127.00, lat = 38.00, zoom = 6)
  })
  
  output$VH_OU_SI_Habitat_Map <- renderLeaflet({
    
    r <- raster(file.path("C:/Projects/2019_DATA/1. unlimited dispersal/4. 종풍부도/2. _richness_expand/a01_300S", "HR8550F_expand.tif"))
    crs(r) <- CRS("+proj=longlat +datum=WGS84 +ellps=WGS84 +towgs84=0,0,0")
    
    pal <- colorNumeric(c("#0C2C84", "#FFFFCC", "#41B6C4"), values(r),
                        na.color = "transparent")
    
    leaflet() %>%
      addTiles(
        urlTemplate = "//{s}.tiles.mapbox.com/v3/jcheng.map-5ebohr46/{z}/{x}/{y}.png",
        attribution = 'Maps by <a href="http://www.mapbox.com/">Mapbox</a>'
      ) %>%        
      
      addRasterImage(r, colors = pal, opacity = 0.8,) %>%
      addLegend(pal = pal, values = values(r), title = "Legend")  %>%
      
      setView(lng = 127.00, lat = 38.00, zoom = 6)
  })
    
})

  