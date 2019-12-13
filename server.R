

shinyServer(function(input, output, session) {
  
  
  
  output$SP_Loc_K_Name_UI <- renderUI({
    
    rs <- input$SP_Info_rows_selected
    
    if(length(rs)){
      
      checkboxGroupInput("SP_Loc_K_Name", "K_NAME",
                         choices = R_LOC_SelectBox$SP_LOC_Info_Table_K_NAME,
                         selected = NULL)
    }
    
    
  })
  
  observeEvent(input$c_kname, {
    print('SP_LOC_Info_Table')
    print(isolate(R_LOC_SelectBox$SP_LOC_Info_Table))
    
    print(unique(isolate(R_LOC_SelectBox$SP_LOC_Info_Table$K_NAME)))
  })
  
  # selectAll
  observeEvent(input$all_SP_Info_inst, {
    # print('isolate(input$SP_Info_inst)')
    # print(isolate(input$SP_Info_inst))
    
    updateCheckboxGroupInput(session, inputId = 'SP_Info_inst', choices = unique(Temp_G_FILE_speciesinfo_02$INSTITUTE),
                             selected = unique(Temp_G_FILE_speciesinfo_02$INSTITUTE), inline = FALSE)
  })
  
  
  observeEvent(input$all_SP_Info_type, {
    # print('isolate(input$all_SP_Info_type)')
    # print(isolate(input$all_SP_Info_type))
    
    updateCheckboxGroupInput(session, inputId = 'SP_Info_type', choices = ut,
                             selected = ut, inline = FALSE)
  })
  
  # Reset
  observeEvent(input$reset_SP_Info_inst, {
    # print('isolate(input$SP_Info_inst)')
    # print(isolate(input$SP_Info_inst))
    
    updateCheckboxGroupInput(session, inputId = 'SP_Info_inst', choices = unique(Temp_G_FILE_speciesinfo_02$INSTITUTE),
                             selected = NULL, inline = FALSE)
  })
  
  
  observeEvent(input$reset_SP_Info_type, {
    # print('isolate(input$all_SP_Info_type)')
    # print(isolate(input$all_SP_Info_type))
    
    updateCheckboxGroupInput(session, inputId = 'SP_Info_type', choices = ut,
                             selected = NULL, inline = FALSE)
  })


  
  printTable <- function(){
    # print('institute or type')
    
    print('Temp_G_FILE_speciesinfo_02')
    print(Temp_G_FILE_speciesinfo_02)
    
    resInfo <- Temp_G_FILE_speciesinfo_02[, c("ID", "INSTITUTE", "TYPE", "K_NAME", "n"), drop = F]
    # resLoc <- Temp_G_FILE_specieslocation_02
    
    
    SP_Info_inst <- isolate(input$SP_Info_inst)
    SP_Info_type <- isolate(input$SP_Info_type)
    # print('resInfo <- Temp_G_FILE_speciesinfo_02[, c("ID", "INSTITUTE", "TYPE", "K_NAME", "n"), drop = F]')
    # print(resInfo)
    # print('SP_Info_inst')
    # print(SP_Info_inst)
    # print('SP_Info_type')
    # print(SP_Info_type)
    
    if(!is.null(SP_Info_inst) & is.null(SP_Info_type)) {
      
      G_FILE_speciesinfo_02 <<- subset(resInfo, INSTITUTE %in% SP_Info_inst)
      
      # x <- subset(resInfo, INSTITUTE %in% SP_Info_inst)
    } else if(is.null(SP_Info_inst) & !is.null(SP_Info_type)){
      # print('else if(is.null(SP_Info_inst) & !is.null(SP_Info_type))')
      G_FILE_speciesinfo_02 <<- subset(resInfo, TYPE %in% SP_Info_type)
      # x <- subset(resInfo, TYPE %in% SP_Info_type)
    } else {
      if(is.null(SP_Info_inst)) {SP_Info_inst <- ""}
      if(is.null(SP_Info_type)) {SP_Info_type <- ""}
      G_FILE_speciesinfo_02 <<- subset(resInfo, INSTITUTE %in% SP_Info_inst & TYPE %in% SP_Info_type)
      # x <- subset(resInfo, INSTITUTE %in% SP_Info_inst & TYPE %in% SP_Info_type)
    }
    
    renderTable("SP_Info", G_FILE_speciesinfo_02)
  }
  
  renderTable <- function(name, table) {
    output[[name]] <- DT::renderDataTable({
      table
    })
  }
  

  
  observeEvent(input$SP_Info_inst,{printTable()}, ignoreNULL = F, ignoreInit = T)
  observeEvent(input$SP_Info_type,{printTable()}, ignoreNULL = F, ignoreInit = T)
  
  
  # observeEvent(input$SP_Loc_K_Name,{
  #   
  #   
  #   resInfo_Loc <- isolate(R_LOC_SelectBox$SP_LOC_Info_Table)
  #   
  #   selectedNames <- isolate(input$SP_Loc_K_Name)
  #   
  #   
  #   if( is.null(selectedNames) ) {
  #     selectedList <- NULL
  # 
  #   } else {
  #     selectedList <- subset(resInfo_Loc, K_NAME %in% selectedNames)
  #   }
  #   
  #   
  #   renderTable("SP_LOC_Info", selectedList)
  #   
  #   
  #   }, ignoreNULL = T, ignoreInit = T)
  

  
  
  observeEvent(input$reset_SP_Info, {
    if(is.null(isolate(input$SP_Info_inst)) & is.null(isolate(input$SP_Info_type))) {
      G_FILE_speciesinfo_02 <<- Temp_G_FILE_speciesinfo_02
      renderTable("SP_Info", Temp_G_FILE_speciesinfo_02[, c("ID", "INSTITUTE", "TYPE", "K_NAME", "n"), drop = F])
    } else {
      printTable()
    }
  })
  
  
  # observeEvent(input$SP_Info_Apply, {
  #   
  #   print('clicked apply')
  #   
  #   resInfo <- Temp_G_FILE_speciesinfo_02[, c("ID", "INSTITUTE", "TYPE", "K_NAME", "n"), drop = F]
  #   SP_Info_inst <- isolate(input$SP_Info_inst)
  #   SP_Info_type <- isolate(input$SP_Info_type)
  #   
  #   print('SP_Info_inst')
  #   print(SP_Info_inst)
  #   
  #   print('SP_Info_type')
  #   print(SP_Info_type)
  #   
  #   
  #   if(!is.null(SP_Info_inst) & is.null(SP_Info_type)) {
  #     G_FILE_speciesinfo_02 <<- subset(resInfo, INSTITUTE %in% SP_Info_inst)
  #     
  #   } else {
  #     
  #     if(is.null(SP_Info_inst)) {
  #       SP_Info_inst <- ""
  #     }
  #     
  #     if(is.null(SP_Info_type)) {
  #       SP_Info_type <- ""
  #     }
  #     
  #     G_FILE_speciesinfo_02 <<- subset(resInfo, INSTITUTE %in% SP_Info_inst & TYPE %in% SP_Info_type)
  #     
  #   }
  #   
  #   output[["SP_Info"]] <- DT::renderDataTable({
  #     G_FILE_speciesinfo_02
  #   })
  #   
  # })

  
  observeEvent(input$Reset_IS_AO_SR_Map, {
    
    leafletProxy("IS_AO_SR_Map") %>%
      setView(lng = 128.00, lat = 36.00, zoom = 7)
    
  })
  
  observeEvent(input$IS_AO_SR_Map_bounds, {
    
    coords <- isolate(input$IS_AO_SR_Map_bounds)
    if (!is.null(coords)) {
      leafletProxy("IS_AO_SR_SIDO_Map") %>%
        fitBounds(coords$west,
                  coords$south,
                  coords$east,
                  coords$north)
      
    }
  })
  
  
  observeEvent(input$IS_AO_SR_SIDO_Map_bounds, {
    
    coords <- isolate(input$IS_AO_SR_SIDO_Map_bounds)
    if (!is.null(coords)) {
      leafletProxy("IS_AO_SR_SGG_Map") %>%
        fitBounds(coords$west,
                  coords$south,
                  coords$east,
                  coords$north)
      
    }
  })
  
  
  onclick("kor_link_top", {
    
    SE_Language <<- "Korean" 
    # print(SE_Language)
    
  })
  
  
  onclick("eng_link_top", {
    
    SE_Language <<- "English" 
    # print(SE_Language)
    
  })
  
  
  output$kor_link_top <- renderUI({
    a("한국어", style = "cursor:pointer; margin-right: 5px; color: white;")
  })
  
  output$eng_link_top <- renderUI({
    a("English", style = "cursor:pointer; margin-right: 5px; color: white;")
  })
  
  
  
  observeEvent(input$Reset_VH_OU_SI_Map, {
    
    leafletProxy("VH_OU_SI_Map") %>%
      setView(lng = 128.00, lat = 36.00, zoom = 6)
    
  })
  
  observeEvent(input$Reset_VH_OU_SI_Habitat_Map, {
    
    leafletProxy("VH_OU_SI_Habitat_Map") %>%
      setView(lng = 128.00, lat = 36.00, zoom = 6)
    
  })
  
  
  observeEvent(input$Reset_VH_OU_SS_Map, {
    
    leafletProxy("VH_OU_SS_Map") %>%
      setView(lng = 128.00, lat = 36.00, zoom = 6)
    
  })
  
  observeEvent(input$Reset_VH_OU_SS_Habitat_Map, {
    
    leafletProxy("VH_OU_SS_Habitat_Map") %>%
      setView(lng = 128.00, lat = 36.00, zoom = 6)
    
  })
  
  
  observeEvent(input$Reset_VH_OU_SL_Map, {
    
    leafletProxy("VH_OU_SL_Map") %>%
      setView(lng = 128.00, lat = 36.00, zoom = 6)
    
  })
  
  observeEvent(input$Reset_VH_OU_SL_Habitat_Map, {
    
    leafletProxy("VH_OU_SL_Habitat_Map") %>%
      setView(lng = 128.00, lat = 36.00, zoom = 6)
    
  })
  
  
  
  observeEvent(input$Reset_VH_OU_SRL_Map, {
    
    leafletProxy("VH_OU_SRL_Map") %>%
      setView(lng = 128.00, lat = 36.00, zoom = 6)
    
  })
  
  observeEvent(input$Reset_VH_OU_SRL_Habitat_Map, {
    
    leafletProxy("VH_OU_SRL_Habitat_Map") %>%
      setView(lng = 128.00, lat = 36.00, zoom = 6)
    
  })
  
  
  
  
  observeEvent(input$Reset_VH_OU_SR_Map, {
    
    leafletProxy("VH_OU_SR_Map") %>%
      setView(lng = 128.00, lat = 36.00, zoom = 6)
    
  })
  
  observeEvent(input$Reset_VH_OU_SR_Habitat_Map, {
    
    leafletProxy("VH_OU_SR_Habitat_Map") %>%
      setView(lng = 128.00, lat = 36.00, zoom = 6)
    
  })
  
  
  
  observeEvent(input$Reset_IS_OU_SI_Map, {
    
    leafletProxy("IS_OU_SI_Map") %>%
      setView(lng = 128.00, lat = 36.00, zoom = 6)
    
  })
  
  observeEvent(input$Reset_IS_OU_SI_SIDO_Map, {
    
    leafletProxy("IS_OU_SI_SIDO_Map") %>%
      setView(lng = 128.00, lat = 36.00, zoom = 6)
    
  })
  
  observeEvent(input$Reset_IS_OU_SI_SIGUNGU_Map, {
    
    leafletProxy("IS_OU_SI_SIGUNGU_Map") %>%
      setView(lng = 128.00, lat = 36.00, zoom = 6)
    
  })
  
  
  observeEvent(input$Reset_IS_OU_EX_Map, {
    
    leafletProxy("IS_OU_EX_Map") %>%
      setView(lng = 128.00, lat = 36.00, zoom = 6)
    
  })
  
  observeEvent(input$Reset_IS_OU_EX_SIDO_Map, {
    
    leafletProxy("IS_OU_EX_SIDO_Map") %>%
      setView(lng = 128.00, lat = 36.00, zoom = 6)
    
  })
  
  observeEvent(input$Reset_IS_OU_EX_SIGUNGU_Map, {
    
    leafletProxy("IS_OU_EX_SIGUNGU_Map") %>%
      setView(lng = 128.00, lat = 36.00, zoom = 6)
    
  })
  
  
  observeEvent(input$Reset_IS_AO_Map1, {
    
    leafletProxy("IS_AO_Map1") %>%
      setView(lng = 128.00, lat = 36.00, zoom = 7)
    
  })
  
  observeEvent(input$Reset_IS_AO_Map2, {
    
    leafletProxy("IS_AO_Map2") %>%
      setView(lng = 128.00, lat = 36.00, zoom = 7)
    
  })
  
  
  observeEvent(input$Reset_DM_OU_DIspersal_map, {
    
    leafletProxy("DM_OU_DIspersal_map") %>%
      setView(lng = 128.00, lat = 36.00, zoom = 7)
    
  })
  
  observeEvent(input$Reset_CD_Map, {
    
    leafletProxy("CD_Map") %>%
      setView(lng = 128.00, lat = 36.00, zoom = 7)
    
  })
  
  observeEvent(input$Reset_LD_Map, {
    
    leafletProxy("LD_Map") %>%
      setView(lng = 128.00, lat = 36.00, zoom = 7)
    
  })
  
  
  output$SP_Map_Reset_UI = renderUI({
    
    x <- NULL
    if (length(input$SP_Info_rows_selected)) {
      
      
      # print(isolate(input$SP_Info_rows_selected))
      x <- actionButton("Reset_SP_Map", label = "Reset")
    } 
    
    return (x)
    
  })
  
  
  observeEvent(input$Reset_SP_Map, {
    
    leafletProxy("SP_Map") %>%
      setView(lng = 127.00, lat = 36.00, zoom = 6)
    
  })
  
  
  output$SP_LOC_Map_Reset_UI = renderUI({
    
    x <- NULL
    
    if (length(input$SP_LOC_Info_rows_selected)) {
      x <- actionButton("Reset_SP_LOC_Map", label = "Reset")
    } 
    
    return (x)
    
  })
  
  
  observeEvent(input$Reset_SP_LOC_Map, {
    
    leafletProxy("SP_LOC_Map") %>%
      setView(lng = 127.00, lat = 36.00, zoom = 6)
    
  })
  
  
  output$VH_AO_DT_CM_CS_PY = renderUI({
    x <- NULL
    input$reset_VH_AO
    x <- div(
      
      checkboxGroupInput("VH_AO_Dispersal_type", VH_Name_DM_Models,
                         choices = c(VH_Name_DM_Models_list),
                         selected = VH_Name_DM_Models_selected
      ),
      
      # Input: Checkbox if file has header ----
      checkboxGroupInput("VH_AO_Climate_model", VH_Name_CD_Models,
                         choices = c(VH_Name_CD_Models_list),
                         selected = VH_Name_CD_Models_selected
      ),
      
      # Input: Checkbox if file has header ----
      checkboxGroupInput("VH_AO_Climate_scenario", VH_Name_CD_Scenarios,
                         choices = c(VH_Name_CD_Scenarios_list),
                         selected = VH_Name_CD_Scenarios_selected
      ),
      
      # Input: Checkbox if file has header ----
      checkboxGroupInput("VH_AO_Project_year", VH_Name_CD_Year,
                         choices = c(VH_Name_CD_Year_list),
                         selected = VH_Name_CD_Year_selected
      )
      
    )
    
    return (x)
  })
  
  
  
  
  output$VH_CA_Col_Box_02 = renderUI({
    x <- NULL
    input$reset_VH_CA
    x <- div(
      checkboxGroupInput("VH_CA_Dispersal_type", VH_Name_DM_Models,
                         choices = c(VH_Name_DM_Models_list),
                         selected = VH_Name_DM_Models_selected
      ),
      
      # Input: Checkbox if file has header ----
      checkboxGroupInput("VH_CA_Climate_model", VH_Name_CD_Models,
                         choices = c(VH_Name_CD_Models_list),
                         selected = VH_Name_CD_Models_selected
      ),
      
      # Input: Checkbox if file has header ----
      checkboxGroupInput("VH_CA_Climate_scenario", VH_Name_CD_Scenarios,
                         choices = c(VH_Name_CD_Scenarios_list),
                         selected = VH_Name_CD_Scenarios_selected
      ),
      
      # Input: Checkbox if file has header ----
      checkboxGroupInput("VH_CA_Project_year", VH_Name_CD_Year,
                         choices = c(VH_Name_CD_Year_list),
                         selected = VH_Name_CD_Year_selected
      )
    )
    
    return (x)
  })
  
  
  output$VH_CA_Habitat_Weighting = renderUI({
    x <- NULL
    input$reset_VH_CA
    x <- div(
      
      checkboxGroupInput("VH-VA_Habitat_type", "Select a habitat types",
                         choices = c("Protected Area" = "Protected",
                                     "Others" = "MISC"),
                         selected = "Protected"
      ),
      
      checkboxGroupInput("VH-VA_Weight", "Select a weighting type",
                         choices = c("None" = "W_NA",
                                     "Area" = "W_Area",
                                     "VUlnerabiity index" = "W_VIndex"),
                         selected = "W_NA"
      )
      
    )
    
    return (x)
  })
  
  
  
  output$IS_CA_Col_Box_02 = renderUI({
    x <- NULL
    input$reset_IS_CA
    x <- div(
      checkboxGroupInput("IS_CA_Dispersal_type", IS_Name_DM_Models,
                         choices = c(IS_Name_DM_Models_list),
                         selected = IS_Name_DM_Models_selected
      ),
      
      # Input: Checkbox if file has header ----
      checkboxGroupInput("IS_CA_Climate_model", IS_Name_CD_Models,
                         choices = c(IS_Name_CD_Models_list),
                         selected = IS_Name_CD_Models_selected
      ),
      
      # Input: Checkbox if file has header ----
      checkboxGroupInput("IS_CA_Climate_scenario", IS_Name_CD_Scenarios,
                         choices = c(IS_Name_CD_Scenarios_list),
                         selected = IS_Name_CD_Scenarios_selected
      ),
      
      # Input: Checkbox if file has header ----
      checkboxGroupInput("IS_CA_Project_year", IS_Name_CD_Year,
                         choices = c(IS_Name_CD_Year_list),
                         selected = IS_Name_CD_Year_selected
      )
    )
    
    return (x)
  })
  
  
  output$IS_CA_Admin = renderUI({
    x <- NULL
    input$reset_IS_CA
    x <- checkboxGroupInput("IS-VA_Admin", "Select a administration type",
                            choices = c("SIDO" = "SIDO",
                                        "SIGUNGU" = "SIGUNGU"),
                            selected = c("SIDO", "SIGUNGU") )
    
    return (x)
  })
  
  
  
  
  
  output$SS_CA_Types = renderUI({
    x <- NULL
    input$reset_SS_CA
    x <- div(
      checkboxGroupInput("SS_CA_Dispersal_type", SS_Name_DM_Models,
                         choices = c(SS_Name_DM_Models_list),
                         selected = SS_Name_DM_Models_selected
      )
    )
    return (x)
  })
  
  
  output$SS_CA_Col_Box_02 = renderUI({
    x <- NULL
    input$reset_SS_CA
    x <- div(
      # Input: Checkbox if file has header ----
      checkboxGroupInput("SS_CA_Climate_model", SS_Name_CD_Models,
                         choices = c(SS_Name_CD_Models_list),
                         selected = SS_Name_CD_Models_selected
      ),
      
      # Input: Checkbox if file has header ----
      checkboxGroupInput("SS_CA_Climate_scenario", SS_Name_CD_Scenarios,
                         choices = c(SS_Name_CD_Scenarios_list),
                         selected = SS_Name_CD_Scenarios_selected
      ),
      
      # Input: Checkbox if file has header ----
      checkboxGroupInput("SS_CA_Project_year", SS_Name_CD_Year,
                         choices = c(SS_Name_CD_Year_list),
                         selected = SS_Name_CD_Year_selected
      )
    )
    
    return (x)
  })
  
  
  
  
  output$SS_AO_DT_CM_CS_PY = renderUI({
    x <- NULL
    input$reset_SS_AO
    x <- div(
      checkboxGroupInput("SS_AO_Dispersal_type", SS_Name_DM_Models,
                         choices = c(SS_Name_DM_Models_list),
                         selected = SS_Name_DM_Models_selected
      ),
      
      # Input: Checkbox if file has header ----
      checkboxGroupInput("SS_AO_Climate_model", SS_Name_CD_Models,
                         choices = c(SS_Name_CD_Models_list),
                         selected = SS_Name_CD_Models_selected
      ),
      
      # Input: Checkbox if file has header ----
      checkboxGroupInput("SS_AO_Climate_scenario", SS_Name_CD_Scenarios,
                         choices = c(SS_Name_CD_Scenarios_list),
                         selected = SS_Name_CD_Scenarios_selected
      ),
      
      # Input: Checkbox if file has header ----
      checkboxGroupInput("SS_AO_Project_year", SS_Name_CD_Year,
                         choices = c(SS_Name_CD_Year_list),
                         selected = SS_Name_CD_Year_selected
      )
    )
    return (x)
  })
  
  

  
  output$DM_MO_Col_Box_01 = renderUI({
    
    x <- NULL
    
    input$reset_DM_MO
    
    x <- div(
      
      selectInput("DM-MO_SDM_model", "Model Types",
                  choices = c("GLM" = "GLM",
                              "GAM" = "GAM",
                              "GBM" = "GBM",
                              "CTA" = "CTA",
                              "ANN" = "ANN",
                              "SRE" = "SRE",
                              "FDA" = "FDA",
                              "MARS" = "MARS",
                              "RF" = "RF",
                              "MAXENT.Phillips" = "MAXENT.Phillips",
                              "MAXENT" = "MAXENT",
                              "Ensemble" = "Ensemble"),
                  selected = "MAXENT.Phillips"
      ),
      
      
      # Input: Checkbox if file has header ----
      checkboxGroupInput("DM-MO_Climate_model", "Climate Models",
                         choices = c("KMA" = "KMA",
                                     "KEI" = "KEI"),
                         selected = "KMA"
      ),
      
      # Input: Checkbox if file has header ----
      checkboxGroupInput("DM-MO_Climate_scenario", "Climate Scenarios",
                         choices = c("RCP 4.5" = "RCP4.5",
                                     "RCP 8.5" = "RCP8.5"),
                         selected = "RCP4.5"
      )
    )
    
    
    
    return (x)
    
  })
  
  
  output$DM_MO_Col_Box_02 = renderUI({
    
    x <- NULL
    input$reset_DM_MO
    x <- div(
      checkboxGroupInput("DM-MO_Protect_year", "Projection Year",
                         choices = c("2010" = "10",
                                     "2020" = "20",
                                     "2030" = "30",
                                     "2040" = "40",
                                     "2050" = "50",
                                     "2060" = "60",
                                     "2070" = "70",
                                     "2080" = "80"),
                         selected = c("10", "20", "30","40", "50", "60","70", "80")
      )
      
      
      # checkboxGroupInput("DM-MO_Barrier", "Select Barrier Data",
      #                    choices = c("토지이용" = "토지이용",
      #                                "산불" = "FORESTFIRE",
      #                                "산사태" = "산사태"),
      #                    selected = c("토지이용", "FORESTFIRE", "산사태")
      # )
    )
    return (x)
    
  })
  
  output$DM_MO_Col_Box_03 = renderUI({
    
    x <- NULL
    input$reset_DM_MO
    x <- div(
      
      # checkboxGroupInput("DM-MO_Dispersal_type", "Dispersal Types",
      #                    choices = c("ND (No Dispersal)" = "ND",
      #                                "SDD (Short Distance Dispersal)" = "SDD",
      #                                "MDD (Middle Distance Dispersal)" = "MDD",
      #                                "LDD (Long Distance Dispersal)" = "LDD",
      #                                "UD (Unlimited Dispersal)" = "UD"),
      #                    selected = "LDD"),
      
      sliderInput("DM-MO_Slider", label = h5("Select a dispersal distance"), min = 0, 
                  max = 10000, value = 1000, step = 50)
      
    )
    return (x)
    
  })
  
  
  output$SDM_MO_Condition_CheckBoxGroup = renderUI({
    
    input$resetSpeciesInfo
    
    x <- NULL
    
    x <- sidebarPanel(  width = 9,
                        div( style = "display: inline-block;",
                             checkboxGroupInput("SDM_MO_Climate_model", SDM_Name_CD_Models,
                                                choices = c(SDM_Name_CD_Models_list),
                                                selected = SDM_Name_CD_Models_selected
                             ),
                             # Input: Checkbox if file has header ----
                             checkboxGroupInput("SDM_MO_Climate_scenario", SDM_Name_CD_Scenarios,
                                                choices = c(SDM_Name_CD_Scenarios_list),
                                                selected = SDM_Name_CD_Scenarios_selected
                             ),
                             
                             #            # Input: Checkbox if file has header ----
                             checkboxGroupInput("SDM_MO_Protect_year", SDM_Name_CD_Year,
                                                choices = c(SDM_Name_CD_Year_list),
                                                selected = SDM_Name_CD_Year_selected
                             )
                        )
    )
    
    return (x)
    
  })
  
  
  
  output$SDM_Sel_Box = renderUI({
    
    s_id <- as.character(G_FILE_speciesinfo[input$SDM_SP_Info_rows_selected, , drop = FALSE]$ID)
    s_kname <- as.character(G_FILE_speciesinfo[input$SDM_SP_Info_rows_selected, , drop = FALSE]$K_NAME)
    
    
    
    x <- NULL
    
    if(length(s_id)) {
      
      x <- div(
        infoBox("Speices ID", toString(s_id), icon = icon("check"), width = 2),
        infoBox("Species Name", toString(s_kname), icon = icon("sun"), width = 3),
        infoBox("Climate Models", toString(input$SDM_MO_Climate_model), icon = icon("clock"), width = 2),
        infoBox("Climate Scenarios", toString(input$SDM_MO_Climate_scenario), icon = icon("calendar"), width = 2),
        infoBox("Projecting Years", toString(input$SDM_MO_Protect_year), icon = icon("chart-area"), width = 2)
      )
      
    }
    
    return (x)
    
  })
  
  
  
  output$DM_Sel_Box = renderUI({
    
    div(
      # infoBox("선택종명", toString(input[['DM-MO_Species']]), icon = icon("tree"), width = 2),
      infoBox("기후모델", toString(input[['DM-MO_Climate_model']]), icon = icon("sun"), width = 2),
      infoBox("기후시나리오", toString(input[['DM-MO_Climate_scenario']]), icon = icon("clock"), width = 2),
      infoBox("YEAR", toString(input[['DM-MO_Protect_year']]), icon = icon("calendar"), width = 2)
      # infoBox("Barrier ", toString(input[['DM-MO_Barrier']]), icon = icon("chart-area"), width = 3),
      # infoBox("Dispersal", toString(input[['DM-MO_Dispersal_type']]), icon = icon("external-link-square-alt"), width = 3)
    )
    
  })
  
  
  
  output$Species_Link <- renderUI({
    
    rs <- input$SP_Info_rows_selected
    rowsLen <- length(rs)
    
    if (rowsLen > 0) {
      
      # x1 <- read.csv(file.path("/home/admin/R/Ecosystem_Data_191106/MOTIVE_Ecosystem/DATA/Species", "shin_specieslocation.csv"), header = T, sep = ",",stringsAsFactors = F)
      # x2 <- read.csv(file.path("/home/admin/R/Ecosystem_Data_191106/MOTIVE_Ecosystem/DATA/Species", "speciesname_final.csv"), header = T, sep = "," ,stringsAsFactors = F)
      # c <- count(x1, ID)
      # x3 <- inner_join(c, x2, by = "ID")
      # x4 <- inner_join(x1, x3, by = "ID")
  
      # 초기 테이블 상태가 아니라면 테이블 선택 시 다른 종이 선택됨
      species_info <- G_FILE_speciesinfo_02[rs, , drop = FALSE]
      # species_info <- x4[rs, , drop = FALSE]
      
      l_f_species_info_K_NAME <- levels(factor(species_info$K_NAME))
      
      links_x <- c()
      x <- NULL
      
      for(name in l_f_species_info_K_NAME) {
    
        url <- paste0('https://species.nibr.go.kr/home/mainHome.do?searchType=total&cont_link=009&subMenu=009001&contCd=009001&searchField=', URLencode( iconv(name , to = 'UTF-8')) )
        # x <- paste0("<a href='https://species.nibr.go.kr/home/mainHome.do?searchType=total&cont_link=009&subMenu=009001&contCd=009001&searchField='",URLencode( iconv(name , to = 'UTF-8'))," target='_blank' class = 'btn btn-default'>","</a>"  )
        x <- a(href=url,name, target = '_blank', class = "btn btn-default", style = "margin-bottom: 8px; margin-left: 30px; display: table; ")
        # x <- a(href='#',
        #   "123", class = "btn btn-default")
        
        links_x <- paste0(links_x, x)
      }
      
      # print('links_x')
      # print(links_x)
      # links_x <- gsub("^,", "", links_x)
      # print('gsub links_x')
      # print(links_x)
      return ( HTML(links_x) )
      
      
    } else {
      return (NULL)
    }
    
  })
  
  
  
  output$SS_Analy_Box = renderUI({
    
    div(
      infoBox("Species", toString(input$SS_CA_Species) , icon = icon("credit-card"), width = 3),
      infoBox("Dispersal type", toString(input$SS_CA_Dispersal_type) , icon = icon("credit-card"), width = 2),
      infoBox("Climate model", toString(input$SS_CA_Climate_model) , icon = icon("credit-card"), width = 2),
      infoBox("Climate scenario", toString(input$SS_CA_Climate_scenario) , icon = icon("credit-card"), width = 2),
      infoBox("Project year", toString(input$SS_CA_Project_year) , icon = icon("credit-card"), width = 3),
      infoBox("Models", toString(input$SS_CA_SDM_model) , icon = icon("credit-card"), width = 3)
      
    )
    
  })
  
  
  output$DM_CD_Selection = renderPrint({
    
    cat("Species Name: ")
    if(input[["DM-MO_Species"]] == "option1") {
      cat("구상나무", sep = ', ')  
      
    } else if(input[["DM-MO_Species"]] == "option2") {
      cat("가문비나무", sep = ', ')  
    }
    
    cat('\n')
    
    cat("Model Types: ")
    cat(input[["DM-MO_SDM_model"]], sep = ', ')
    cat('\n')
    
    cat('Climate Models: ')
    cat(input[["DM-MO_Climate_model"]], sep = ', ')
    cat('\n')
    
    cat("Climate Scenarios: ")
    cat(input[["DM-MO_Climate_scenario"]], sep = ', ')
    cat('\n')
    
    cat('Projecting Years: ')
    cat(input[["DM-MO_Protect_year"]], sep = ', ')
    cat('\n')
    
    cat('Select Barrier Data: ')
    cat(input[["DM-MO_Barrier"]], sep = ', ')
    cat('\n')
    
    cat('Dispersal Types: ')
    cat(input[["DM-MO_Dispersal_type"]], sep = ', ')
    
    
  })
  
  
  observeEvent(input$Reset_Probability_View, {
    
    leafletProxy("SDM_OU_Probability_map") %>%
      setView(lng = 127.00, lat = 36.00, zoom = 6)
    
  })
  
  observeEvent(input$Reset_Predicted_View, {
    
    leafletProxy("SDM_OU_Predicted_map") %>%
      setView(lng = 127.00, lat = 36.00, zoom = 6)
    
  })
  
  ## LD Value
  output$LD_Value_TY <- reactive(
    input$LD_Value_TY
  )
  
  output$LD_Value_TY <- renderValueBox({
    valueBox(input$LD_Type, "Climate Models",
             icon = icon("credit-card"), color = "blue"
    )
  })
  
  output$LD_Value_CM <- renderValueBox({
    valueBox(input$LD_Climate_model, "Climate Models",
             icon = icon("credit-card"), color = "blue", width = 2
    )
  })
  
  output$LD_Value_CS <- renderValueBox({
    valueBox(input$LD_Climate_scenario, "Climate Scenarios",
             icon = icon("list"), color = "purple", width = 2
    )
  })  
  
  output$LD_Value_YR <- renderValueBox({
    valueBox(input$LD_Project_year, "Projecting Years",
             icon = icon("thumbs-up"), color = "yellow", width = 2
    )
  })  
  
  ## CD Value
  output$CD_Value_CM <- renderValueBox({
    valueBox(input$CD_Climate_model, "Climate Models",
             icon = icon("credit-card"), color = "blue", width = 3
    )
  })
  
  output$CD_Value_CS <- renderValueBox({
    valueBox(input$CD_Climate_scenario, "Climate Scenarios",
             icon = icon("list"), color = "purple", width = 3
    )
  })  
  
  output$CD_Value_YR <- renderValueBox({
    valueBox(input$CD_Project_year, "Projecting Years",
             icon = icon("thumbs-up"), color = "yellow", width = 3
    )
  })  
  
  ## SDM Value
  output$Value_CM <- renderValueBox({
    valueBox(input$SDM_OU_Climate_model, "Climate Models",
             icon = icon("credit-card"), color = "blue", width = 3
    )
  })
  
  output$Value_CS <- renderValueBox({
    valueBox(input$SDM_OU_Climate_scenario, "Climate Scenarios",
             icon = icon("list"), color = "purple", width = 3
    )
  })  
  
  output$Value_YR <- renderValueBox({
    valueBox(input$SDM_OU_Project_year, "Projecting Years",
             icon = icon("thumbs-up"), color = "yellow", width = 3
    )
  })  
  
  ## DM Value
  output$DM_Value_SP <- renderValueBox({
    valueBox("구상나무", "선택종명",
             icon = icon("tree"), color = "green", width =3
    )
  })
  
  output$DM_Value_CM <- renderValueBox({
    valueBox(input$DM_OU_Climate_model, "Climate Models",
             icon = icon("credit-card"), color = "blue", width = 3
    )
  })
  
  output$DM_Value_CS <- renderValueBox({
    valueBox(input$DM_OU_Climate_scenario, "Climate Scenarios",
             icon = icon("list"), color = "purple", width = 3
    )
  })  
  
  output$DM_Value_YR <- renderValueBox({
    valueBox(input$DM_OU_Project_year, "Projecting Years",
             icon = icon("thumbs-up"), color = "yellow", width = 3
    )
  })  
  
  ## IS Value
  output$IS_Value_CM <- renderValueBox({
    valueBox(input$IS_AO_Dispersal_type, IS_Name_DM_Models,
             icon = icon("credit-card"), color = "blue", width = 3
    )
  })
  
  output$IS_Value_CM <- renderValueBox({
    valueBox(input$IS_AO_Climate_model, "Climate Models",
             icon = icon("credit-card"), color = "blue", width = 3
    )
  })
  
  output$IS_Value_CS <- renderValueBox({
    valueBox(input$IS_AO_Climate_scenario, "Climate Scenarios",
             icon = icon("list"), color = "purple", width = 3
    )
  })  
  
  output$IS_Value_YR <- renderValueBox({
    valueBox(input$IS_AO_Project_year, "Projecting Years",
             icon = icon("thumbs-up"), color = "yellow", width = 3
    )
  })  
  
  
  output$CM_UI <- renderUI({
    actionButton("CM_btn", input$SDM_OU_Climate_model, style = "display: inline-block;")
  })
  
  output$CS_UI <- renderUI({
    actionButton("CS_btn", input$SDM_OU_Climate_scenario, style = "display: inline-block;")
  })
  
  output$PY_UI <- renderUI({
    actionButton("PY_btn", input$SDM_OU_Project_year, style = "display: inline-block;")
  })
  
  # output$SYNC_UI <- renderUI({
  #   actionButton("SYNC_btn", '동기화', style = "display: inline-block;")
  # })
  # 
  # observeEvent(input$SYNC_btn, {
  #   
  # 
  #   
  #   
  #   
  # })
  
  observeEvent(input$SDM_OU_Probability_map_bounds, {
    
    coords <- isolate(input$SDM_OU_Probability_map_bounds)
    if (!is.null(coords)) {
      leafletProxy("SDM_OU_Predicted_map") %>%
        fitBounds(coords$west,
                  coords$south,
                  coords$east,
                  coords$north)
    }
  })
  
  
  
  output$SE_Dir_Project <- renderText({G$SE_Dir_Project})
  output$SE_Dir_Climate <- renderText({G$SE_Dir_Climate})
  output$SE_Dir_Link <- renderText({G$SE_Dir_Link})
  output$SE_Dir_Species <- renderText({G$SE_Dir_Species})
  output$SE_speciesindex <- renderText({G$SE_speciesindex})
  output$SE_specieslocation <- renderText({G$SE_specieslocation})
  
  
  
  observeEvent(input$login, {
    showModal(modalDialog(
      title = "You have logged in.",
      paste0("It seems you have logged in as ",input$userid,'.'),
      easyClose = TRUE,
      footer = NULL
    ))
  })
  
  observeEvent(input$SE_Dir_Project, {
    volumes <- getVolumes()
    shinyDirChoose(input, 'SE_Dir_Project', roots = volumes)
    G$SE_Dir_Project <<- parseDirPath(volumes, input$SE_Dir_Project)
    # print('volumes()')
    # print(volumes())
    # print('input$SE_Dir_Project')
    # print(isolate(input$SE_Dir_Project))
    # print('G$SE_Dir_Project')
    # print(isolate(G$SE_Dir_Project))
    output$SE_Dir_Project <- renderText({G$SE_Dir_Project})
  })
  
  
  observeEvent(input$SE_Dir_Climate, {
    volumes <- getVolumes()
    shinyDirChoose(input, 'SE_Dir_Climate', roots = volumes)
    G$SE_Dir_Climate <<- parseDirPath(volumes, input$SE_Dir_Climate)
    output$SE_Dir_Climate <- renderText({G$SE_Dir_Climate})
  })
  
  observeEvent(input$SE_Dir_Link, {
    volumes <- getVolumes()
    shinyDirChoose(input, 'SE_Dir_Link', roots = volumes)
    G$SE_Dir_Link <<- parseDirPath(volumes, input$SE_Dir_Link)
    output$SE_Dir_Link <- renderText({G$SE_Dir_Link})
  })
  
  observeEvent(input$SE_Dir_Species, {
    volumes <- getVolumes()
    shinyDirChoose(input, 'SE_Dir_Species', roots = volumes)
    G$SE_Dir_Species <<- parseDirPath(volumes, input$SE_Dir_Species)
    output$SE_Dir_Species <- renderText({G$SE_Dir_Species})
  })
  
  observeEvent(input$SE_speciesindex, {
    G$SE_speciesindex <<- input$SE_speciesindex$name
    G_FILE_speciesindex <<- read.csv(file.path(G$SE_Dir_Species, G$SE_speciesindex), header = T, sep = ",", fileEncoding = "CP949", encoding = "UTF-8")
    output$SE_speciesindex <- renderText({G$SE_speciesindex})
  })
  
  observeEvent(input$SE_specieslocation, {
    G$SE_specieslocation <<- input$SE_specieslocation$name
    G_FILE_specieslocation <<- read.csv(file.path(G$SE_Dir_Species, G$SE_specieslocation), header = T, sep = ",", fileEncoding = "CP949", encoding = "UTF-8")
    output$SE_specieslocation <- renderText({G$SE_specieslocation})
  })
  
  observeEvent(input$SDM_MO_SDM_run, {
    
    # setting Climate change scenarios, Future time, Species and current environmental path
    dlist <- input$SDM_MO_Climate_model  # c("KMA") # c("KMA", "KEI", "WORLDCLIM")
    clist <- input$SDM_MO_Climate_scenario  # c("RCP4.5") # c("RCP4.5", "RCP8.5")
    ylist <- input$SDM_MO_Protect_year  # c("2000", "2050") # c("2000", "2050", "2070")
    slist <- as.character(G_FILE_speciesinfo[input$SDM_SP_Info_rows_selected, , drop = FALSE]$ID) #c("S251") # input$SDM_MO_Species  # c("S251") # c("S015", "S134", "S145")
    
    n <- 0
    ld <- length(dlist)
    lc <- length(clist)
    ly <- length(ylist)
    ls <- length(slist)
    tl <- ld * lc * ly * ls
    withProgress(message = 'Runing SDM model.........', value = 0, {
      
      
      
      # 191017
      
      cat('input$SDM_MO_Climate_model: ')
      # print(isolate(input$SDM_MO_Climate_model))
      
      cat('input$SDM_MO_Climate_scenario: ')
      # print(isolate(input$SDM_MO_Climate_scenario))
      
      cat('input$SDM_MO_Protect_year: ')
      # print(isolate(input$SDM_MO_Protect_year))
      
      cat('as.character(G_FILE_speciesinfo[input$SDM_SP_Info_rows_selected, , drop = FALSE]$ID): ')
      # print(isolate(as.character(G_FILE_speciesinfo[input$SDM_SP_Info_rows_selected, , drop = FALSE]$ID)))
      # print(isolate(as.character(G_FILE_speciesinfo[input$SDM_SP_Info_rows_selected, , drop = FALSE]$K_NAME)))
      
      
      cat('SDM_Name_CD_Models_selected: ')
      # print(SDM_Name_CD_Models_selected)
      
      cat('SDM_Name_CD_Scenarios_selected: ')
      # print(SDM_Name_CD_Scenarios_selected)
      
      cat('SDM_Name_CD_Year_selected: ')
      # print(SDM_Name_CD_Year_selected)
      
      cat('SDM_Name_CD_Variables_selected: ')
      # print(SDM_Name_CD_Variables_selected)
      
      
      
      ##############################################################
      ### Species Distribution Modeling
      ### Biomod2
      ###
      ### by Changwan Seo
      ##############################################################
      
      #####=========================================================
      ##### Setting variables ======================================
      
      # setting Paths
      PATH_SPECIES   <- G$SE_Dir_Species
      PATH_ENV       <- G$SE_Dir_Climate
      PATH_ENV_INPUT <- file.path(PATH_ENV, "2000", sep = "")
      PATH_PROJECT   <- G$SE_Dir_Project
      #        PATH_MODEL_OUTPUT  <- PATH_PROJECT
      #        setwd(PATH_PROJECT)
      
      # creating Species_Distribution output path
      if (dir.exists(file.path(PATH_PROJECT, "Species_Distribution"))) {
        cat(paste("Species_Distribution exists in", PATH_PROJECT, "and is a directory"))
      } else if (file.exists(file.path(PATH_PROJECT, "Species_Distribution"))) {
        cat(paste("Species_Distribution exists exists in", PATH_PROJECT, "but is a file"))
      } else {
        cat(paste("Species_Distribution does not exist in", PATH_PROJECT, "- creating"))
        dir.create(file.path(PATH_PROJECT, "Species_Distribution"))
      }
      
      # creating Sensitive_Species output path
      if (dir.exists(file.path(PATH_PROJECT, "Sensitive_Species"))) {
        cat(paste("Sensitive_Species exists in", PATH_PROJECT, "and is a directory"))
      } else if (file.exists(file.path(PATH_PROJECT, "Sensitive_Species"))) {
        cat(paste("Sensitive_Species exists exists in", PATH_PROJECT, "but is a file"))
      } else {
        cat(paste("Sensitive_Species does not exist in", PATH_PROJECT, "- creating"))
        dir.create(file.path(PATH_PROJECT, "Sensitive_Species"))
      }
      
      # creating Invasive_Species output path
      if (dir.exists(file.path(PATH_PROJECT, "Invasive_Species"))) {
        cat(paste("Invasive_Species exists in", PATH_PROJECT, "and is a directory"))
      } else if (file.exists(file.path(PATH_PROJECT, "Invasive_Species"))) {
        cat(paste("Invasive_Species exists exists in", PATH_PROJECT, "but is a file"))
      } else {
        cat(paste("Invasive_Species does not exist in", PATH_PROJECT, "- creating"))
        dir.create(file.path(PATH_PROJECT, "Invasive_Species"))
      }
      
      # creating Vulnerable_Species output path
      if (dir.exists(file.path(PATH_PROJECT, "Vulnerable_Species"))) {
        cat(paste("Vulnerable_Species exists in", PATH_PROJECT, "and is a directory"))
      } else if (file.exists(file.path(PATH_PROJECT, "Vulnerable_Species"))) {
        cat(paste("Vulnerable_Species exists exists in", PATH_PROJECT, "but is a file"))
      } else {
        cat(paste("Vulnerable_Species does not exist in", PATH_PROJECT, "- creating"))
        dir.create(file.path(PATH_PROJECT, "Vulnerable_Species"))
      }
      
      # print("####111")
      PATH_MODEL_OUTPUT  <- file.path(PATH_PROJECT, "Species_Distribution")
      # print("####222")
      # print(file.path(getwd()))
      file.copy(file.path(getwd(), "maxent.jar"), PATH_MODEL_OUTPUT)
      # print("####333")
      setwd(PATH_MODEL_OUTPUT)
      # Setting Column Name of species data
      # print("####444")
      NAME_ID <- "ID"
      NAME_SPECIES <- "K_NAME"
      NAME_LONG <- "Longitude"
      NAME_LAT <- "Latitude"
      
      # setting speices and environmental data
      FILE_SPECIES_NAME <- G$SE_speciesindex
      FILE_SPECIES_LOCATION <- G$SE_specieslocation
      # ENV_VARIABLES <<- input$SDM_MO_Variables   # c("bio01.asc", "bio02.asc", "bio03.asc", "bio12.asc", "bio13.asc", "bio14.asc")
      ENV_VARIABLES <<- SDM_Name_CD_Variables_selected
      
      # Defining Models Data Options using default options.
      BIOMOD_eval.resp.var <- NULL
      BIOMOD_eval.expl.var <- NULL
      BIOMOD_eval.resp.xy <- NULL
      BIOMOD_PA.nb.rep <- 1
      BIOMOD_PA.nb.absences <- 1000
      BIOMOD_PA.strategy <- 'random'
      BIOMOD_PA.dist.min <- 0
      BIOMOD_PA.dist.max <- NULL
      BIOMOD_PA.sre.quant <- 0.025
      BIOMOD_PA.table <- NULL
      BIOMOD_na.rm <- TRUE
      
      # Defining Models Options using default options.
      # BIOMOD_models <- input$SDM_MO_SDM_model # c('GAM', 'GLM')  # c('MAXENT.Phillips') 
      BIOMOD_models <- c(SDM_Name_models_selected)
      BIOMOD_models.options <- BIOMOD_ModelingOptions()
      BIOMOD_NbRunEval <- 1
      BIOMOD_DataSplit <- 100
      BIOMOD_Yweights <- NULL
      BIOMOD_VarImport <- 5
      BIOMOD_models.eval.meth <- c('ROC', 'TSS') # c('KAPPA', 'ROC', 'TSS')
      BIOMOD_SaveObj <- TRUE
      BIOMOD_rescal.all.models <- TRUE
      BIOMOD_do.full.models <- TRUE
      
      # Defining projection Options using default options.
      BIOMOD_selected.models = 'all'
      BIOMOD_binary.meth = c('ROC', 'TSS') # c('KAPPA', 'ROC', 'TSS')
      BIOMOD_compress = FALSE
      BIOMOD_build.clamping.mask = FALSE
      BIOMOD_output.format = '.img'
      BIOMOD_do.stack = TRUE
      
      # Defining ensemble modelling Options using default options.
      EM_chosen.models <- 'all'
      EM_em.by <- 'PA_dataset+repet'
      EM_eval.metric <- 'all'
      EM_eval.metric.quality.threshold <- NULL
      EM_models.eval.meth = c('ROC', 'TSS') # c('KAPPA', 'ROC', 'TSS')
      EM_prob.mean <- T
      EM_prob.cv <- F
      EM_prob.ci <- F
      EM_prob.ci.alpha <- 0.05
      EM_prob.median <- F
      EM_committee.averaging <- F
      EM_prob.mean.weight <- T
      EM_prob.mean.weight.decay <- 'proportional'
      ##### End Setting variables ==================================
      #####=========================================================
      
      
      #####=========================================================
      ##### Setting path and data ==================================
      # creating working a project
      
      # print("####555")
      
      # Loading speices data
      DATA_SPECIES_NAME <- read.table(file.path(PATH_SPECIES, FILE_SPECIES_NAME), header = T, sep = ",")
      DATA_SPECIES_LOCATION <- read.table(file.path(PATH_SPECIES, FILE_SPECIES_LOCATION), header = T, sep = ",")
      ##### End Path and Data setting =============================
      #####=========================================================
      
      
      #####========================================================
      #####============ Rinning models ============================
      #####========================================================
      
      #####========================================================
      ##### Modeling loop =========================================
      
      for (s in slist) {
        n <- n + 1
        ##### Setting Environmental variables ======================= 
        SPECIES_ID <- s
        SPECIES_NAME <- subset(DATA_SPECIES_NAME, get(NAME_ID) == SPECIES_ID, select = c(get(NAME_SPECIES)))
        SPECIES_NAME <- as.character(SPECIES_NAME$K_NAME)
        SPECIES_DATA <- subset(DATA_SPECIES_LOCATION, get(NAME_ID) == SPECIES_ID, select = c(NAME_ID, NAME_LONG, NAME_LAT))
        
        myResp <- as.numeric(SPECIES_DATA[,NAME_ID] <- 1)
        myResp <- as.numeric(SPECIES_DATA[,NAME_ID])
        
        CUR_PATH <- getwd()
        setwd(PATH_ENV_INPUT)
        myExpl <- stack(ENV_VARIABLES)
        setwd(CUR_PATH)
        
        myRespXY <- SPECIES_DATA[,c(NAME_LONG, NAME_LAT)]
        myRespName <- SPECIES_NAME
        ##### End Setting Environmental variables ===================
        
        
        ##### BIOMOD ================================================
        ### Formatting Data
        myBiomodData <- BIOMOD_FormatingData(resp.var = myResp,
                                             expl.var = myExpl,
                                             resp.xy = myRespXY,
                                             resp.name = myRespName,
                                             eval.resp.var = BIOMOD_eval.resp.var,
                                             eval.expl.var = BIOMOD_eval.expl.var,
                                             eval.resp.xy = BIOMOD_eval.resp.xy,
                                             PA.nb.rep = BIOMOD_PA.nb.rep,
                                             PA.nb.absences = BIOMOD_PA.nb.absences,
                                             PA.strategy = BIOMOD_PA.strategy,
                                             PA.dist.min = BIOMOD_PA.dist.min,
                                             PA.dist.max = BIOMOD_PA.dist.max,
                                             PA.sre.quant = BIOMOD_PA.sre.quant,
                                             PA.table = BIOMOD_PA.table,
                                             na.rm = BIOMOD_na.rm)
        ### End Formatting Data
        
        ### Modeling BIOMOD
        # Running BIOMOD
        myBiomodModelOut <- BIOMOD_Modeling( myBiomodData,
                                             models = BIOMOD_models,
                                             models.options = BIOMOD_models.options,
                                             NbRunEval = BIOMOD_NbRunEval,
                                             DataSplit = BIOMOD_DataSplit, 
                                             Yweights = BIOMOD_Yweights, 
                                             VarImport = BIOMOD_VarImport, 
                                             models.eval.meth = BIOMOD_models.eval.meth, 
                                             SaveObj = BIOMOD_SaveObj, 
                                             rescal.all.models = BIOMOD_rescal.all.models, 
                                             do.full.models = BIOMOD_do.full.models)
        
        # creating Biomod2 output path
        if (dir.exists(file.path(PATH_MODEL_OUTPUT, SPECIES_NAME, "BIOMOD2"))) {
          cat(paste("BIOMOD2 exists in", PATH_MODEL_OUTPUT, "/", SPECIES_NAME, "and is a directory"))
        } else if (file.exists(file.path(PATH_MODEL_OUTPUT, SPECIES_NAME, "BIOMOD2"))) {
          cat(paste("BIOMOD2 exists in", PATH_MODEL_OUTPUT, "/", SPECIES_NAME, "but is a file"))
        } else {
          cat(paste("BIOMOD2 does not exist in", PATH_MODEL_OUTPUT, "/", SPECIES_NAME, "- creating"))
          dir.create(file.path(PATH_MODEL_OUTPUT, SPECIES_NAME, "BIOMOD2"))
        }
        
        # Evaluating the model
        myBiomodModelEval <- get_evaluations(myBiomodModelOut)
        write.csv(myBiomodModelEval, file = file.path(PATH_MODEL_OUTPUT, SPECIES_NAME, "BIOMOD2", paste(SPECIES_NAME, "_eval.csv", sep = "", collapse = "--")), fileEncoding = "CP949", encoding = "UTF-8")
        myBiomodModelImport <- get_variables_importance(myBiomodModelOut)
        write.csv(myBiomodModelImport, file = file.path(PATH_MODEL_OUTPUT, SPECIES_NAME, "BIOMOD2", paste(SPECIES_NAME, "_impot.csv",  sep = "", collapse = "--")), fileEncoding = "CP949", encoding = "UTF-8")
        ### End Modeling BIOMOD
        
        ### Projection on current and future environemental conditions
        # Projecting loop
        for (d in dlist) {
          for (c in clist) {
            for (y in ylist) {
              incProgress(1/tl, detail = paste("Doing part", n, "/", ls, "(", SPECIES_NAME, ")", "_", d, "_", c, "_", y))
              PATH_ENV_OUTPUT <- file.path(PATH_ENV, d, c, y, sep = "")
              
              # Setting Projection Environmenta variables
              CUR_PATH <- getwd()
              setwd(PATH_ENV_OUTPUT)
              myExpl <- stack(ENV_VARIABLES)
              setwd(CUR_PATH)
              
              # Defining projection Options using default options.
              BIOMOD_proj.name = paste(d, "_", c, "_", y, sep = "")
              
              # Running BIOMOD projection
              myBiomodProjection <- BIOMOD_Projection(modeling.output = myBiomodModelOut,
                                                      new.env = myExpl,
                                                      proj.name = BIOMOD_proj.name,
                                                      selected.models = BIOMOD_selected.models,
                                                      binary.meth = BIOMOD_binary.meth,
                                                      compress = BIOMOD_compress,
                                                      build.clamping.mask = BIOMOD_build.clamping.mask, 
                                                      output.format = BIOMOD_output.format,
                                                      do.stack = BIOMOD_do.stack)
              
              # save projections and prodictions
              all_proj <- get_predictions(myBiomodProjection)
              mod_proj <- get_projected_models(myBiomodProjection)
              sel_proj <- grep("Full", mod_proj, value = TRUE)
              mlist <- c(sel_proj)
              for (i in mlist) {
                proj <- all_proj[[i]]
                proj[proj > 1000] <- 1000
                writeRaster(proj, file = file.path(PATH_MODEL_OUTPUT, SPECIES_NAME, "BIOMOD2", paste(as.name(paste("PROJ_", BIOMOD_proj.name, "_", i, ".tif", sep = "")), sep = "", collapse = "--")), format = "GTiff", overwrite = TRUE)
                
                for (j in BIOMOD_binary.meth) {
                  if (!is.na(myBiomodModelEval[j, "Cutoff", strapplyc(i, "Full_(.*)", simplify = TRUE), "Full", "PA1"])) {
                    cutoffvalue <- as.integer(myBiomodModelEval[j, "Cutoff", strapplyc(i, "Full_(.*)", simplify = TRUE), "Full", "PA1"])
                    pred <- BinaryTransformation(proj, cutoffvalue)
                    writeRaster(pred, file = file.path(PATH_MODEL_OUTPUT, SPECIES_NAME, "BIOMOD2",paste(as.name(paste("PRED_", BIOMOD_proj.name, "_", i, "_by", j, ".tif", sep = "")), sep = "", collapse = "--")), format = "GTiff", overwrite = TRUE)
                  }
                }  
              }  
              ### End Projection on current and future environemental conditions
              ##### ENd BIOMOD ================================================
              
              
              ##### Modeling ensemble model ===================================
              # Runing ensemble modelling
              
              # if(input$SDM_MO_SDM_EMmodel) {
              if(F) {
                myBiomodEM <- BIOMOD_EnsembleModeling(modeling.output = myBiomodModelOut,
                                                      chosen.models = EM_chosen.models,
                                                      em.by = EM_em.by,
                                                      eval.metric = EM_eval.metric,
                                                      eval.metric.quality.threshold = EM_eval.metric.quality.threshold,
                                                      models.eval.meth = EM_models.eval.meth,
                                                      prob.mean = EM_prob.mean,
                                                      prob.cv = EM_prob.cv,
                                                      prob.ci = EM_prob.ci,
                                                      prob.ci.alpha = EM_prob.ci.alpha,
                                                      prob.median = EM_prob.median,
                                                      committee.averaging = EM_committee.averaging,
                                                      prob.mean.weight = EM_prob.mean.weight,
                                                      prob.mean.weight.decay = EM_prob.mean.weight.decay)
                
                # get evaluation scores
                myBiomodEMEval <- get_evaluations(myBiomodEM)
                write.csv(myBiomodEMEval, file = file.path(PATH_MODEL_OUTPUT, SPECIES_NAME, "BIOMOD2", paste(SPECIES_NAME, "_EM_eval.csv", sep = "", collapse = "--")))
                
                
                # Ensemble Models Projections
                myBiomodEnsembleForecasting <- BIOMOD_EnsembleForecasting(projection.output = myBiomodProjection,
                                                                          EM.output = myBiomodEM)
                
                # save projections and prodictions projections and prodictions
                EM_all_proj <- get_predictions(myBiomodEnsembleForecasting)
                EM_mod_proj <- get_projected_models(myBiomodEnsembleForecasting)
                EM_sel_proj <- grep(SPECIES_NAME, EM_mod_proj, value = TRUE)
                emlist <- c(EM_sel_proj)
                for (i in emlist) {
                  proj <- EM_all_proj[[i]]
                  proj[proj > 1000] <- 1000
                  writeRaster(proj, file = file.path(PATH_MODEL_OUTPUT, SPECIES_NAME, "BIOMOD2", paste(as.name(paste("PROJ_", BIOMOD_proj.name, "_", i, ".tif", sep = "")), sep = "", collapse = "--")), format = "GTiff", overwrite = TRUE)
                  
                  for (j in EM_models.eval.meth) {
                    if (!is.na(eval(parse(text = as.name(paste("myBiomodEMEval$", i))))[j, "Cutoff"])) {
                      cutoffvalue <- as.integer(eval(parse(text = as.name(paste("myBiomodEMEval$", i))))[j, "Cutoff"])
                      pred <- BinaryTransformation(proj, cutoffvalue)
                      writeRaster(pred, file = file.path(PATH_MODEL_OUTPUT, SPECIES_NAME, "BIOMOD2", paste(as.name(paste("PRED_", BIOMOD_proj.name, "_", i, ".tif", sep = "")), sep = "", collapse = "--")), format = "GTiff", overwrite = TRUE)
                    }
                  }
                }
              }
              ##### End ensemble modelling =================================
              
            } # End Year loop y
          } # End climate change Scenarios loop c
        } # End climate data loop d
        
        
        ### Creating species evaluation information 
        destfile <- file.path(PATH_MODEL_OUTPUT, SPECIES_NAME, "BIOMOD2", paste(as.name(paste(SPECIES_NAME, "_eval.csv", sep = "")), sep = "", collapse = "--"))
        if (!file.exists(destfile))
          return
        
        old_eval <- read.csv(destfile)
        lc <- length(colnames(old_eval))
        lr <- length(row.names(old_eval))
        nc <- (lc - 1) / 4
        nr <- nc * lr
        
        new_eval <- setNames(data.frame(matrix(ncol = 6, nrow = nr)), c("Model", "Type", "Accuracy", "Cutoff", "Sensitivity", "specificity")) 
        
        for (i in 1:nc) {
          k <- (2 + (i * 4)) - 4  
          ek <- i*lr
          sk <- ek - (lr - 1)  
          new_eval$Model[sk:ek] <- sub(".*(Testing.data.)", "", colnames(old_eval[k]))
          
          n <- 0
          for (j in sk:ek) {
            n <- n + 1
            new_eval$Type[j] <- as.character(old_eval[n,1])
            new_eval$Accuracy[j] <- old_eval[n,k]
            new_eval$Cutoff[j] <- old_eval[n,k+1]
            new_eval$Sensitivity[j] <- old_eval[n,k+2]
            new_eval$specificity[j] <- old_eval[n,k+3]
          }
        }
        
        # if(input$SDM_MO_SDM_EMmodel) {
        if(F) {
          destfile <- file.path(PATH_MODEL_OUTPUT, SPECIES_NAME, "BIOMOD2", paste(as.name(paste(SPECIES_NAME, "_EM_eval.csv", sep = "")), sep = "", collapse = "--"))
          if (!file.exists(destfile))
            return
          
          old_EM_eval <- read.csv(destfile, fileEncoding = "CP949", encoding = "UTF-8")
          lc <- length(colnames(old_EM_eval))
          lr <- length(row.names(old_EM_eval))
          nc <- (lc - 1) / 4
          nr <- nc * lr
          
          new_EM_eval <- setNames(data.frame(matrix(ncol = 6, nrow = nr)), c("Model", "Type", "Accuracy", "Cutoff", "Sensitivity", "specificity")) 
          
          for (i in 1:nc) {
            k <- (2 + (i * 4)) - 4  
            ek <- i*lr
            sk <- ek - (lr - 1)  
            new_EM_eval$Model[sk:ek] <- sub(paste0(".*(", SPECIES_NAME, "_)"), "", sub("(.Testing.data).*", "", colnames(old_EM_eval[k])))
            
            
            n <- 0
            for (j in sk:ek) {
              n <- n + 1
              new_EM_eval$Type[j] <- as.character(old_EM_eval[n,1])
              new_EM_eval$Accuracy[j] <- old_EM_eval[n,k]
              new_EM_eval$Cutoff[j] <- old_EM_eval[n,k+1]
              new_EM_eval$Sensitivity[j] <- old_EM_eval[n,k+2]
              new_EM_eval$specificity[j] <- old_EM_eval[n,k+3]
            }
          }
        }
        
        if(exists("new_eval") && exists("new_EM_eval")) {
          all_eval <- rbind(new_eval, new_EM_eval)
        } else {
          all_eval <- new_eval
        }
        
        Eval_data <- all_eval
        for (i in 1:length(all_eval[,1])) {
          if (grepl("EM", Eval_data$Model[i])) {
            Eval_data$Projection[i] <- Eval_data$Model[i]
            Eval_data$Prediction[i] <- Eval_data$Model[i]
          } else if (grepl("MAXENT", Eval_data$Model[i])) {
            a1 <- sub("\\..*", "", Eval_data$Model[i])
            a234 <- sub(".*?\\.", "", Eval_data$Model[i])
            a2 <- sub("\\..*", "", a234)
            a34 <- sub(".*?\\.", "", a234)
            a3 <- sub("\\..*", "", a34)
            a4 <- sub(".*\\.", "", a34)
            Projection <- paste(a4, "_", a3, "_", a1, ".", a2, sep="")
            Prediction <- paste(a4, "_", a3, "_", a1, ".", a2, "_by", Eval_data$Type[i], sep="")
            Eval_data$Projection[i] <- Projection
            Eval_data$Prediction[i] <- Prediction
          } else{
            a1 <- sub("\\..*", "", Eval_data$Model[i])
            a23 <- sub(".*?\\.", "", Eval_data$Model[i])
            a2 <- sub("\\..*", "", a23)
            a3 <- sub(".*\\.", "", a23)
            Projection <- paste(a3, "_", a2, "_", a1, sep="")
            Prediction <- paste(a3, "_", a2, "_", a1, "_by", Eval_data$Type[i], sep="")
            Eval_data$Projection[i] <- Projection
            Eval_data$Prediction[i] <- Prediction
          }	  
        }
        
        write.csv(Eval_data, file = file.path(PATH_MODEL_OUTPUT, SPECIES_NAME, "BIOMOD2", paste(SPECIES_NAME, "_ALL_eval.csv", sep = "", collapse = "--")))
        
        ### End Creating species evaluation information
        
        
      } # End Speices loop s
      
      ##### End Modeling loop =====================================
      #####========================================================
      
      #####========================================================
      #####============ End Models Rinning ========================
      #####========================================================        
      
      
    })
    
    #런 생성 성공 시 알람창
    shinyalert(
      title = "",
      text = "성공적으로 생성되었습니다.",
      closeOnEsc = TRUE,
      closeOnClickOutside = TRUE,
      html = FALSE,
      type = "success",
      showConfirmButton = TRUE,
      showCancelButton = FALSE,
      confirmButtonText = "OK",
      confirmButtonCol = "#00AEFF",
      timer = 0,
      imageUrl = "",
      animation = TRUE
    )
    
    
  })
  
  observeEvent(input$DM_MO_Action, {
    withProgress(message = 'Runing Dispersal model.........', value = 2, {
      Sys.sleep(10.0)
    })
  })
  
  
  
  
  observeEvent(input$SS_IV_Action_vindex, {
    withProgress(message = 'Runing Invasive species expansion.........', value = 2, {
      Sys.sleep(10.0)
    })
  })
  
  observeEvent(input$IS_VA_Action_intro, {
    withProgress(message = 'Runing Invasive species introduction.........', value = 2, {
      Sys.sleep(10.0)
    })
  })
  
  observeEvent(input$IS_VA_Action_expan, {
    withProgress(message = 'Runing Invasive species expansion.........', value = 2, {
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
  
  
  
  
  output$radio_Table <- renderText({
    
      radioTable(tbl = head(Temp_G_FILE_speciesinfo_02[, c("ID", "INSTITUTE", "TYPE", "K_NAME", "n"), drop = F]),
                 inputId = "chooseSpecies",
                 label = "",
                 # choices = paste0("car", 1:nrow(Temp_G_FILE_speciesinfo_02)),
                 choices = paste0("species", 1:nrow(head(Temp_G_FILE_speciesinfo_02))),
                 table_label = "Select a Species",
                 pixie = . %>%
                   sprinkle(bg_pattern_by = "rows") %>%
                   sprinkle_table(pad = 7) 
                 # %>%
                 #   sprinkle_colnames('rownames(head(Temp_G_FILE_speciesinfo_02[,, drop = F]))' = "",
                 #                     control = "")
                 )
  })
  
  output$choice_radio_Table <- renderText(input$chooseSpecies)
  
  
  
  output$SP_Info <- DT::renderDataTable({
    Temp_G_FILE_speciesinfo_02[, c("ID", "INSTITUTE", "TYPE", "K_NAME", "n"), drop = F]
  }, server = TRUE)
  

  
  output$MR_Info <- renderText({
    
    # G_FILE_modelresult[, 	c('project',	'species',	'work',	'remark'), drop = F]
    
    
    radioTable( 
               tbl = G_FILE_modelresult[, 	c('PROJECT', 'CREATOR', 'WORK',	'REMARK'), drop = F],
               inputId = "ModelIndex",
               label = "",
               # choices = paste0("car", 1:nrow(Temp_G_FILE_speciesinfo_02)),
               choices = 1:nrow(G_FILE_modelresult),
               # table_label = "Select a Species",
               selected= 1,
               pixie = . %>%
                 sprinkle(bg_pattern_by = "rows") %>%
                 sprinkle_table(pad = 10),
               options(width = 500)
               # %>%
               #   sprinkle_colnames('rownames(head(Temp_G_FILE_speciesinfo_02[,, drop = F]))' = "",
               #                     control = "")
    )
    
    
    
  })
  
  output$MR_Result <- renderPlot({
    table <- G_FILE_modelresult
    # rs <- input$MR_Info_rows_selected
    rs <- input$ModelIndex
    
    rs <- as.numeric(rs)
    
    print(rs)
    
    #print(table$filename[max(rs)])
    #
    #print(file[max(rs)])
    #MR_Info_file <- read.csv(file.path(isolate(table$path[max(rs)]), isolate(table$filename[max(rs)])), header = T, sep = ",", stringsAsFactors = F , fileEncoding = "CP949", encoding = "UTF-8")
    #print(MR_Info_file)
    #print(paste(table$path[max(rs)], " ====== ", table$filename[max(rs)]))
    # plot(raster("C:/MOTIVE_projects/proj30/Species_Distribution/test1/세뿔투구꽃/BIOMOD2/PRED_KMA_RCP4.5_2010_세뿔투구꽃_PA1_Full_GLM_byROC.tif"))
    
    
    #print(index)
    # if(is.null(rs)){
    #    index <- 1
    # }else{
    #    index <- rs  
    # }
    
    index <- rs  
    path <- table$path[index]
    filename <- table$filename[index]
    
    print(path)
    print(filename)
    
    # path <- "C:/MOTIVE_projects/proj30/Species_Distribution/test1/세뿔투구꽃/BIOMOD2"
    # filename <- "PRED_KMA_RCP4.5_2010_세뿔투구꽃_PA1_Full_GLM_byROC.tif"
    
    
    # if(is.null(path) || path == "NA"){
    #   path <- table$path[1]
    # }
    # if(is.null(filename) || filename == "NA"){
    #   filename <- table$filename[1]
    # }
    
    print(paste(path,filename,sep="/",collapse = NULL))
    # plot(raster(paste(path,filename,sep="/",collapse = NULL)))
    plot(raster("C:/MOTIVE_projects/project_20191120/Species_Distribution/교란종_식물11종/가시박/BIOMOD2/PROJ_KMA_RCP4.5_2000_가시박_PA1_Full_GLM.tif"))
  })
  
  
  
  
  output$MR_Result0 <- renderPlot({
    plot(raster("C:/MOTIVE_projects/proj30/Species_Distribution/교란종_식물11종/가시박/BIOMOD2/GAIN_PRED_KMA_RCP4.5_2010_가시박_PA1_Full_GLM_byROC.tif"))
    })
  
  output$MR_Result1 <- renderPlot({
    plot(raster("C:/MOTIVE_projects/proj30/Species_Distribution/교란종_식물11종/가시박/BIOMOD2/GAIN_PRED_KMA_RCP4.5_2030_가시박_PA1_Full_GLM_byROC.tif"))
  })
  
  output$MR_Result2 <- renderPlot({
    plot(raster("C:/MOTIVE_projects/proj30/Species_Distribution/교란종_식물11종/가시박/BIOMOD2/GAIN_PRED_KMA_RCP4.5_2050_가시박_PA1_Full_GLM_byROC.tif"))
  })
  
  output$MR_Result3 <- renderPlot({
    plot(raster("C:/MOTIVE_projects/proj30/Species_Distribution/교란종_식물11종/가시박/BIOMOD2/GAIN_PRED_KMA_RCP4.5_2080_가시박_PA1_Full_GLM_byROC.tif"))
  })
  
  
  
  
  output$SP_Summary <- renderPrint({
    
    rs <- input$SP_Info_rows_selected  # G_FILE_specieslocation   # st_read("species.shp")
    
    if (length(rs) > 0) {
      species_info <- G_FILE_speciesinfo[rs, , drop = FALSE]
      summary(species_info$n)
    }
    
  })
  
  output$SP_Histogram <- renderPlot({
    
    rs <- input$SP_Info_rows_selected  # G_FILE_specieslocation   # st_read("species.shp")
    if (length(rs) > 0) {
      species_info <- G_FILE_speciesinfo[rs, , drop = FALSE]
      hist(species_info$n, # breaks = bins, 
           col="orange",
           border="brown",
           xlab = "Species Number",
           height = "50px",
           main = "Histogram")
    }
    
  })
  
  
  output$SP_Map <- renderLeaflet({
    rs <- input$SP_Info_rows_selected  # G_FILE_specieslocation   # st_read("species.shp")
    test_groups <<- NULL
    x <- NULL
    if (length(rs) == 0) {
      rs <- 46
    }
    
    if (length(rs)) {
      
      # print('rs')
      # print(rs)
      

      if( is.null(isolate(input$SP_Info_inst)) & is.null(isolate(input$SP_Info_type)) ) {
        # print('if( is.null(isolate(input$SP_Info_inst)) & is.null(isolate(input$SP_Info_type)) )')
        
        # x_index <- read.csv(file.path("/home/admin/R/Ecosystem_Data_191106/MOTIVE_Ecosystem/DATA/Species", "speciesname_final.csv"), header = T, sep = "," ,stringsAsFactors = F, fileEncoding = "CP949", encoding = "UTF-8")
        # x_location <- read.csv(file.path("/home/admin/R/Ecosystem_Data_191106/MOTIVE_Ecosystem/DATA/Species", "shin_specieslocation.csv"), header = T, sep = ",",stringsAsFactors = F, fileEncoding = "CP949", encoding = "UTF-8")
        # x_freq <- count(x_location, ID)
        # x_info <- inner_join(x_freq, x_index, by = "ID")
        # 
        # G_FILE_speciesindex_02 <<- x_index
        # G_FILE_specieslocation_02 <<- x_location
        # G_FILE_speciesfreq_02 <<- x_freq
        # G_FILE_speciesinfo_02 <<- x_info
        
        G_FILE_speciesinfo_02 <<- Temp_G_FILE_speciesinfo_02
      }

      
      # print('else --- if( is.null(isolate(input$SP_Info_inst)) & is.null(isolate(input$SP_Info_type)) )')
      
      # x4 <- inner_join(x1, x3, by = "ID")
      
      
      species_data <- inner_join(G_FILE_specieslocation_02, G_FILE_speciesinfo_02[rs, , drop = FALSE], by = "ID")
      
      
      species_all_data <- inner_join(G_FILE_specieslocation_02, Temp_G_FILE_speciesinfo_02, by = "ID")
      
      # print('species_data')
      # print(species_data)
      
      # print('species_all_data')
      # print(species_all_data)
      
      # 종별 색상 초기화
      # if(is_init_colors == F){
      #   init_colors(unique(species_all_data$ID))
      # }
      
      # 타입별 색상 초기화
      if(is_init_colors_type == F){
        init_colors_type_02(species_all_data)
      }
      
      # print('temp_colors_type')
      # print(temp_colors_type)
      
      # 종별 아이콘 초기화
      if(is_init_icons == F){
        init_icons(unique(species_all_data$K_NAME))
      }
      

      # 타입별 색상
      g_color <- customGetColor_Type_02(species_data)
      
      # 선택 시 랜덤 아이콘
      # s_icon <- sample(icon_List_Type, 1)
      # makeGroupLayer(species_data, s_icon, g_color)
      
      # 종별 아이콘
      k_name <- species_data$K_NAME
      s_icon <- customGetIcon(k_name)
      makeGroupLayer_Species(species_data, k_name)
      
      
      # 개별 색상 설정
      icons <- awesomeIcons(

        icon = s_icon,
        
        
        iconColor = 'black',
        library = 'glyphicon',
        
        # 종별 색상
        # markerColor = customGetColor(species_data)
        
        # 타입별 색상
        markerColor = g_color
      )

      
      # print('species_data$K_NAME')
      # print(species_data$K_NAME)
      # 
      # print('species_data$K_NAME')
      # print(droplevels(species_data$K_NAME))
      
      # x1 <- read.csv(file.path("/home/admin/R/Ecosystem_Data_191106/MOTIVE_Ecosystem/DATA/Species", "shin_specieslocation.csv"), header = T, sep = ",",stringsAsFactors = F)
      # x2 <- read.csv(file.path("/home/admin/R/Ecosystem_Data_191106/MOTIVE_Ecosystem/DATA/Species", "speciesname_final.csv"), header = T, sep = "," ,stringsAsFactors = F)
      # c <- count(x1, ID)
      # 
      # x3 <- inner_join(c, x2, by = "ID")
      # x4 <- inner_join(x1, x3, by = "ID")
      
      
      
      # 폰트 어썸 아이콘 설정
      icons_fa <- awesomeIcons(
        icon = 'amazon',
        iconColor = 'green',
        library = 'fa',
        markerColor = 'red'
      )
      
      # 이미지 설정
      icon_list <- iconList(
        makeIcon("ferry-18.png", NULL, 18, 18, className = 'icon01'),
        makeIcon("danger-24.png", NULL, 24, 24, className = 'icon02')
      )
      
      
      x <- leaflet(data = species_data) %>%
        addTiles(
          urlTemplate = "//{s}.tiles.mapbox.com/v3/jcheng.map-5ebohr46/{z}/{x}/{y}.png",
          attribution = 'Maps by <a href="http://www.mapbox.com/">Mapbox</a>'
        ) %>%
        
        # # png list marker 출력할 때
        # addMarkers(~Longitude, ~Latitude, icon = icon_list)  %>%
        
        # addAwesomeMarkers(~Longitude, ~Latitude, icon=icons_fa, label=~as.character(ID)) %>%
        
        # 범례 없이 출력
        # addAwesomeMarkers(~Longitude, ~Latitude, icon=icons, label=~as.character(ID)) %>%
        
        addAwesomeMarkers(~Longitude, ~Latitude, icon=icons, label=~as.character(ID), group= ~test_groups[factor(K_NAME)]) %>%
        # addAwesomeMarkers(~Longitude, ~Latitude, icon=icons, label=~as.character(ID), group= test_groups[species_data$K_NAME] ) %>%
        
        
        addLayersControl(
          
          
          overlayGroups = test_groups,
          # overlayGroups = ~test_groups[factor(K_NAME)],
          
          # overlayGroups = test_groups[species_data$K_NAME],
          options = layersControlOptions(collapsed = F)
        )  %>%
        
        setView(lng = 127.00, lat = 37.00, zoom = 6)
      
      
      return (x)
    }
  })
  
  observe({
    x <- input$SP_Info_rows_selected
    print('테이블 선택')
    print(x)
  })

  
  output$SP_LOC_Info <- DT::renderDataTable({
    
    rs <- input$SP_Info_rows_selected
    print('rs')
    print(rs)
    
    if (length(rs)) {
      R_LOC_SelectBox$SP_LOC_Info_Table <<- inner_join(G_FILE_specieslocation_02, G_FILE_speciesinfo_02[rs, c("ID", "INSTITUTE", "TYPE", "K_NAME", "n"), drop = FALSE], by = "ID")
      R_LOC_SelectBox$SP_LOC_Info_Table_K_NAME <<- unique(isolate(R_LOC_SelectBox$SP_LOC_Info_Table$K_NAME))
      print('R_LOC_SelectBox$SP_LOC_Info_Table_K_NAME <<- unique(SP_LOC_Info_Table$K_NAME)')
      print(isolate(R_LOC_SelectBox$SP_LOC_Info_Table_K_NAME))
      
    } else {
      R_LOC_SelectBox$SP_LOC_Info_Table <<- NULL
      return (NULL)
    }
    isolate(R_LOC_SelectBox$SP_LOC_Info_Table)
    
  }, server = TRUE)
  
  

  
  
  output$SP_LOC_Map <- renderLeaflet({
    rs <- input$SP_LOC_Info_rows_selected  # G_FILE_specieslocation   # st_read("species.shp")
    
    if (length(rs)) {
      
      species_all_data <- inner_join(G_FILE_specieslocation_02, Temp_G_FILE_speciesinfo_02, by = "ID")
      
      species_data <- isolate(R_LOC_SelectBox$SP_LOC_Info_Table[rs, ,drop = FALSE])
      
      print('species_data')
      print(species_data)
      
      if(is_init_colors_type == F & is_init_icons == F){
        
        # 타입별 색상 초기화
        init_icons(unique(species_all_data$K_NAME))
        
        # 종별 아이콘 초기화
        init_colors_type_02(species_all_data)
      }
      
      
      # 타입별 색상
      g_color <- customGetColor_Type_02(species_data)
      
      
      # 종별 아이콘
      k_name <- species_data$K_NAME
      s_icon <- customGetIcon(k_name)
      GroupLayer_Species_Individual <<- makeGroupLayer_Species_Individual(species_data, k_name)
      
      print('GroupLayer_Species_Individual')
      print(GroupLayer_Species_Individual)
      
      # 개별 색상 설정
      icons <- awesomeIcons(
        
        # 종별 아이콘
        icon = s_icon,
        
        iconColor = 'black',
        library = 'glyphicon',
        
        # 타입별 색상
        markerColor = g_color
      )
      
      
      
      leaflet(data = species_data) %>%
        
        addTiles(
          urlTemplate = "//{s}.tiles.mapbox.com/v3/jcheng.map-5ebohr46/{z}/{x}/{y}.png",
          attribution = 'Maps by <a href="http://www.mapbox.com/">Mapbox</a>'
        ) %>%
        
        # addMarkers(~Longitude, ~Latitude, popup = ~as.character(ID), label = ~as.character(ID)) %>%
        addAwesomeMarkers(~Longitude, ~Latitude, icon=icons, label=~as.character(ID), group= ~GroupLayer_Species_Individual[factor(K_NAME)]) %>%
        
        addLayersControl(
          overlayGroups = GroupLayer_Species_Individual,
          options = layersControlOptions(collapsed = F)
        )  %>%
        
        setView(lng = 127.00, lat = 37.00, zoom = 6)
      
    }
  })  
  
  
  
  
  output$LD_Summary <- renderPrint({
    
    # r <- raster(file.path(S251_path, "barrier11.tif"))
    r <- raster(file.path("C:/Projects/2019_DATA/4. forest fire, landslide/forest fire/S251", "barrier11.tif"))
    summary(r)
  })
  
  output$LD_Histogram <- renderPlot({
    r_asc <- read.asc(file.path(G$SE_Dir_Link, input$LD_Climate_model, input$LD_Climate_scenario, input$LD_Project_year, paste(input$LD_Variables, ".asc", sep = "")))
    x <- raster(r_asc)
    hist(x, # breaks = bins, 
         col="orange",
         border="brown",
         xlab = input$CD_Variables,
         main = "Histogram")
    
    # r_asc <- read.asc(file.path(G$SE_Dir_Climate, input$CD_Climate_model, input$CD_Climate_scenario, input$CD_Project_year, paste(input$CD_Variables, ".asc", sep = "")))
    # x <- raster(file.path(S251_path, "barrier11.tif"))
    # bins <- seq(which.min(x), which.max(x), length.out = input$bins + 1)

  })  
  
  output$LD_Histogram2 <- renderPlot({
    
    #    r_asc <- read.asc(file.path(G$SE_Dir_Climate, input$CD_Climate_model, input$CD_Climate_scenario, input$CD_Project_year, paste(input$CD_Variables, ".asc", sep = "")))
    x <- raster(file.path(S251_path, "barrier11.tif"))
    #    bins <- seq(which.min(x), which.max(x), length.out = input$bins + 1)
    
    hist(x, # breaks = bins, 
         col="orange",
         border="brown",
         xlab = input$CD_Variables,
         main = "Histogram")
    
  }) 
  
  output$LD_Map <- renderLeaflet({
    
    # r <- raster(file.path(S251_path, "barrier11.tif"))
    r_asc <- read.asc(file.path(G$SE_Dir_Link, input$LD_Climate_model, input$LD_Climate_scenario, input$LD_Project_year, paste(input$LD_Variables, ".asc", sep = "")))
    r <- raster(r_asc)
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
      
      setView(lng = 128.00, lat = 36.00, zoom = 7)
  })   
  
  
  
  output$CD_Summary <- renderPrint({
    file <- file.path(G$SE_Dir_Climate, input$CD_Climate_model, input$CD_Climate_scenario, input$CD_Project_year, paste(input$CD_Variables, ".tif", sep = ""))
    r <- raster(file)
    crs(r) <- CRS("+proj=longlat +datum=WGS84 +ellps=WGS84 +towgs84=0,0,0")
    summary(r)
  })
  
  output$CD_Histogram <- renderPlot({
    file <- file.path(G$SE_Dir_Climate, input$CD_Climate_model, input$CD_Climate_scenario, input$CD_Project_year, paste(input$CD_Variables, ".tif", sep = ""))
    x <- raster(file)
    crs(x) <- CRS("+proj=longlat +datum=WGS84 +ellps=WGS84 +towgs84=0,0,0")
    hist(x, # breaks = bins, 
         col="orange",
         border="brown",
         xlab = input$CD_Variables,
         main = "Histogram")
  })
  
  output$CD_Map <- renderLeaflet({

        
    #    file <- file.path(G$SE_Dir_Climate, input$CD_Climate_model, input$CD_Climate_scenario, input$CD_Project_year, paste(input$CD_Variables, ".asc", sep = ""))
    #    r_asc <- read.asc(file)
    #    r <- raster(r_asc)
    file <- file.path(G$SE_Dir_Climate, input$CD_Climate_model, input$CD_Climate_scenario, input$CD_Project_year, paste(input$CD_Variables, ".tif", sep = ""))
    r <- raster(file)
    crs(r) <- CRS("+proj=longlat +datum=WGS84 +ellps=WGS84 +towgs84=0,0,0")
    
    pal <- colorNumeric(c("#0C2C84", "#FFFFCC", "#41B6C4"), values(r),
                        na.color = "transparent")
    
    leaflet() %>%
      addTiles(
        urlTemplate = "//{s}.tiles.mapbox.com/v3/jcheng.map-5ebohr46/{z}/{x}/{y}.png",
        attribution = 'Maps by <a href="http://www.mapbox.com/">Mapbox</a>'
      ) %>%        
      
      addRasterImage(r, colors = pal, opacity = 0.8) %>%
      addLegend(pal = pal, values = values(r), title = "Legend")  %>%
      
      setView(lng = 128.00, lat = 36.00, zoom = 7)
  })
  
  
  output$CD_Map1 <- renderLeaflet({
    
    #    file <- file.path(G$SE_Dir_Climate, input$CD_Climate_model, input$CD_Climate_scenario, input$CD_Project_year, paste(input$CD_Variables, ".asc", sep = ""))
    #    r_asc <- read.asc(file)
    #    r <- raster(r_asc)
    file <- file.path(G$SE_Dir_Climate, input$CD_Climate_model, input$CD_Climate_scenario, input$CD_Project_year, paste(input$CD_Variables, ".tif", sep = ""))
    r <- raster(file)
    crs(r) <- CRS("+proj=longlat +datum=WGS84 +ellps=WGS84 +towgs84=0,0,0")
    
    pal <- colorNumeric(c("#0C2C84", "#FFFFCC", "#41B6C4"), values(r),
                        na.color = "transparent")
    
    leaflet() %>%
      addTiles(
        urlTemplate = "//{s}.tiles.mapbox.com/v3/jcheng.map-5ebohr46/{z}/{x}/{y}.png",
        attribution = 'Maps by <a href="http://www.mapbox.com/">Mapbox</a>'
      ) %>%        
      
      addRasterImage(r, colors = pal, opacity = 0.8) %>%
      addLegend(pal = pal, values = values(r), title = "Legend")  %>%
      
      setView(lng = 128.00, lat = 36.00, zoom = 7)
  })
  
  output$CD_Map2 <- renderLeaflet({
    
    #    file <- file.path(G$SE_Dir_Climate, input$CD_Climate_model, input$CD_Climate_scenario, input$CD_Project_year, paste(input$CD_Variables, ".asc", sep = ""))
    #    r_asc <- read.asc(file)
    #    r <- raster(r_asc)
    file <- file.path(G$SE_Dir_Climate, input$CD_Climate_model, input$CD_Climate_scenario, input$CD_Project_year, paste(input$CD_Variables, ".tif", sep = ""))
    r <- raster(file)
    crs(r) <- CRS("+proj=longlat +datum=WGS84 +ellps=WGS84 +towgs84=0,0,0")
    
    pal <- colorNumeric(c("#0C2C84", "#FFFFCC", "#41B6C4"), values(r),
                        na.color = "transparent")
    
    leaflet() %>%
      addTiles(
        urlTemplate = "//{s}.tiles.mapbox.com/v3/jcheng.map-5ebohr46/{z}/{x}/{y}.png",
        attribution = 'Maps by <a href="http://www.mapbox.com/">Mapbox</a>'
      ) %>%        
      
      addRasterImage(r, colors = pal, opacity = 0.8) %>%
      addLegend(pal = pal, values = values(r), title = "Legend")  %>%
      
      setView(lng = 128.00, lat = 36.00, zoom = 7)
  })
  
  output$CD_Map3 <- renderLeaflet({
    
    #    file <- file.path(G$SE_Dir_Climate, input$CD_Climate_model, input$CD_Climate_scenario, input$CD_Project_year, paste(input$CD_Variables, ".asc", sep = ""))
    #    r_asc <- read.asc(file)
    #    r <- raster(r_asc)
    file <- file.path(G$SE_Dir_Climate, input$CD_Climate_model, input$CD_Climate_scenario, input$CD_Project_year, paste(input$CD_Variables, ".tif", sep = ""))
    r <- raster(file)
    crs(r) <- CRS("+proj=longlat +datum=WGS84 +ellps=WGS84 +towgs84=0,0,0")
    
    pal <- colorNumeric(c("#0C2C84", "#FFFFCC", "#41B6C4"), values(r),
                        na.color = "transparent")
    
    leaflet() %>%
      addTiles(
        urlTemplate = "//{s}.tiles.mapbox.com/v3/jcheng.map-5ebohr46/{z}/{x}/{y}.png",
        attribution = 'Maps by <a href="http://www.mapbox.com/">Mapbox</a>'
      ) %>%        
      
      addRasterImage(r, colors = pal, opacity = 0.8) %>%
      addLegend(pal = pal, values = values(r), title = "Legend")  %>%
      
      setView(lng = 128.00, lat = 36.00, zoom = 7)
  })
  
  
  
  # output$SDM_SP_Info <- DT::renderDataTable(G_FILE_speciesinfo, server = TRUE)    
  output$SDM_SP_Info <- DT::renderDataTable({
    
    input$resetSpeciesInfo
    
    # G_FILE_speciesinfo          
    G_FILE_speciesinfo[, c("ID", "INSTITUTE", "TYPE"	, "K_NAME", "N_POINT"), drop = F]
    
  }, server = TRUE)
  
  
  # output$SDM_SP_Selection = renderPrint({
  #   s_id <- as.character(G_FILE_speciesinfo[input$SDM_SP_Info_rows_selected, , drop = FALSE]$ID)
  #   s_kname <- as.character(G_FILE_speciesinfo[input$SDM_SP_Info_rows_selected, , drop = FALSE]$K_NAME)
  #   if (length(s_id)) {
  #     cat('Speices ID: ')
  #     cat(s_id, sep = ', ')
  #     cat('\n')
  #     
  #     cat("Species Name: ")
  #     cat(s_kname, sep = ', ')
  #     cat('\n')
  #     
  #     cat('Climate Models: ')
  #     cat(input$SDM_MO_Climate_model, sep = ', ')
  #     cat('\n')
  #     
  #     cat("Climate Scenarios: ")
  #     cat(input$SDM_MO_Climate_scenario, sep = ', ')
  #     cat('\n')
  #     
  #     cat('Projecting Years: ')
  #     cat(input$SDM_MO_Protect_year, sep = ', ')
  #     
  # 
  #   }
  # })
  
  observeEvent(input$SDM_AO_Dir_Folder, {
    volumes <- c(main = file.path(G$SE_Dir_Project, "Species_Distribution"))
    shinyDirChoose(input, 'SDM_AO_Dir_Folder', roots = volumes) # , defaultPath = "/MOTIVE_projects", defaultRoot = G$SE_Dir_Project)
    G$SDM_AO_Dir_Folder <<- parseDirPath(volumes, input$SDM_AO_Dir_Folder)
    output$SDM_AO_Dir_Folder <- renderText({G$SDM_AO_Dir_Folder})
    G$DM_SDM_Dir_Folder <<- G$SDM_AO_Dir_Folder
    output$DM_SDM_Dir_Folder <- renderText({G$DM_SDM_Dir_Folder})
  })

  output$SDM_OU_Species0 <- renderUI({
    volumes <- paste(G$SE_Dir_Project, "Species_Distribution", sep="/")
    SDM_Name_Species_list0 <- list.dirs(path = volumes, full.names = FALSE, recursive = FALSE)
    SDM_Name_Species_selected0 <- SDM_Name_Species_list0[1]
    selectInput("SDM_OU_Species0", "Select Working Folder",
                choices = c(SDM_Name_Species_list0),
                selected = SDM_Name_Species_selected0
    )
    # G$SDM_AO_Dir_Folder <<- paste(volumes, SDM_Name_Species_selected0, sep="/")
  })
    
  output$SDM_OU_Species <- renderUI({
    selfile <- paste(G$SE_Dir_Project, "Species_Distribution", input$SDM_OU_Species0, sep="/")
    SDM_Name_Species_list <- list.dirs(path = selfile, full.names = FALSE, recursive = FALSE)
    # SDM_Name_Species_list <- list.dirs(path = G$SDM_AO_Dir_Folder, full.names = FALSE, recursive = FALSE)
    SDM_Name_Species_selected <- SDM_Name_Species_list[1]
    selectInput("SDM_OU_Species", "Select a species",
                choices = c(SDM_Name_Species_list),
                selected = SDM_Name_Species_selected
    )
  })
  
  output$SDM_OU_Projection_model <- renderUI({
    destfile <- file.path(G$SE_Dir_Project, "Species_Distribution", "test1", input$SDM_OU_Species, "BIOMOD2", paste(as.name(paste(input$SDM_OU_Species, "_ALL_eval.csv", sep = "")), sep = "", collapse = "--"))
    all_eval <- read.csv(destfile)
    G_FILE_species_evaluation <<- all_eval
    SDM_Name_Projection_Models_list <- as.character(G_FILE_species_evaluation$Projection)
    SDM_Name_Projection_Models_selected <- SDM_Name_Projection_Models_list[1]
    selectInput("SDM_OU_Projection_model", "Select Projection models",
                # 파일 불러오는 과정에서 GLM으로 되어 있어서 수정
                # choices = "PA1_Full_GAM"
                choices = "PA1_Full_GLM"
                
                
    )
  })
  
  output$SDM_OU_Prediction_model <- renderUI({
    destfile <- file.path(G$SE_Dir_Project, "Species_Distribution", "test1", input$SDM_OU_Species, "BIOMOD2", paste(as.name(paste(input$SDM_OU_Species, "_ALL_eval.csv", sep = "")), sep = "", collapse = "--"))
    all_eval <- read.csv(destfile)
    G_FILE_species_evaluation <<- all_eval
    SDM_Name_Prediction_Models_list <- as.character(G_FILE_species_evaluation$Prediction)
    SDM_Name_Prediction_Models_selected <- SDM_Name_Prediction_Models_list[1]
    selectInput("SDM_OU_Prediction_model", "Select Prediction models",
                choices = c(SDM_Name_Prediction_Models_list),
                selected = SDM_Name_Prediction_Models_selected
    )
  })
  
  
  output$SDM_OU_Validation <- DT::renderDataTable({
    
    print('renderDataTable')
    
    destfile <- file.path(G$SE_Dir_Project, "Species_Distribution", "test1", input$SDM_OU_Species, "BIOMOD2", paste(as.name(paste(isolate(input$SDM_OU_Species), "_ALL_eval.csv", sep = "")), sep = "", collapse = "--"))
    print('destfile <- file.path(G$SE_Dir_Project, "Species_Distribution", "test1", input$SDM_OU_Species, "BIOMOD2", paste(as.name(paste(input$SDM_OU_Species, "_ALL_eval.csv", sep = "")), sep = "", collapse = "--"))')
    print(destfile)
    all_eval <- read.csv(destfile)
    G_FILE_species_evaluation <<- all_eval
    # all_eval
    t(all_eval)
    
  })
  
  
  
  output$SDM_OU_Validation_BoxPlot <- renderPlot({
    
    rs <- input$SDM_OU_Validation_rows_selected  # G_FILE_specieslocation   # st_read("species.shp")
    if (length(rs)) {
      Eval_data <- G_FILE_species_evaluation[rs, , drop = FALSE]
      
      boxplot(Accuracy~Type,
              data=Eval_data,
              main="Boxplots by Type",
              xlab="Type",
              ylab="Value",
              varwidth = TRUE,
              col="orange",
              border="brown"
      )
      
    } else {
      print('NULL')
      NULL
    }
    
  })
  
  output$SDM_OU_Contribution <- DT::renderDataTable({
    
    destfile <- file.path(G$SE_Dir_Project, "Species_Distribution", "test1", input$SDM_OU_Species, "BIOMOD2", paste(as.name(paste(input$SDM_OU_Species, "_impot.csv", sep = "")), sep = "", collapse = "--"))
    
    if (!file.exists(destfile)) {
      return(NULL)
    }
    
    new_import <- read.csv(destfile)
    
    data <- data.frame(t(new_import[-1]))
    colnames(data) <- new_import[, 1]
    # To use the fmsb package, I have to add 2 lines to the dataframe: the max and min of each variable to show on the plot!
    data <- rbind(rep(1,length(colnames(data))) , rep(0,length(colnames(data))) , data)
    data[-c(1,2),]
    
  })
  
  output$SDM_OU_Contribution_Radarchart <- renderPlot({
    
    destfile <- file.path(G$SE_Dir_Project, "Species_Distribution", "test1", input$SDM_OU_Species, "BIOMOD2", paste(as.name(paste(input$SDM_OU_Species, "_impot.csv", sep = "")), sep = "", collapse = "--"))
    
    if (!file.exists(destfile)) {
      return(NULL)
    }
    
    new_import <- read.csv(destfile)
    
    data <- data.frame(t(new_import[-1]))
    colnames(data) <- new_import[, 1]
    # To use the fmsb package, I have to add 2 lines to the dataframe: the max and min of each variable to show on the plot!
    data <- rbind(rep(1,length(colnames(data))) , rep(0,length(colnames(data))) , data)
    data <- data[-c(1,2),]
    rs <- input$SDM_OU_Contribution_rows_selected  # G_FILE_specieslocation   # st_read("species.shp")
    if (length(rs) > 0) {
      data <- data[rs, , drop = FALSE]
      data <- rbind(rep(1,length(colnames(data))) , rep(0,length(colnames(data))) , data)
      radarchart(data)
    }
  })
  
  output$SDM_OU_Contribution_Radarchart22 <- renderPlot({
    
    destfile <- file.path(G$SE_Dir_Project, "Species_Distribution", "test1", input$SDM_OU_Species, "BIOMOD2", paste(as.name(paste(input$SDM_OU_Species, "_impot.csv", sep = "")), sep = "", collapse = "--"))
    
    if (!file.exists(destfile)) {
      return(NULL)
    }
    
    new_import <- read.csv(destfile)
    
    data <- data.frame(t(new_import[-1]))
    colnames(data) <- new_import[, 1]
    # To use the fmsb package, I have to add 2 lines to the dataframe: the max and min of each variable to show on the plot!
    data <- rbind(rep(1,length(colnames(data))) , rep(0,length(colnames(data))) , data)
    
    #    radarchart(data)
    
    # Set graphic colors
    library(RColorBrewer)
    coul <- brewer.pal(length(colnames(data)), "BuPu")
    colors_border <- coul
    colors_in <- alpha(coul,0.3)
    
    # If you remove the 2 first lines, the function compute the max and min of each variable with the available data:
    radarchart( data[-c(1,2),]  , axistype=1 , maxmin=F,
                #custom polygon
                pcol=colors_border , pfcol=colors_in , plwd=4 , plty=1,
                #custom the grid
                cglcol="grey", cglty=1, axislabcol="black", cglwd=0.8, 
                #custom labels
                vlcex=0.8 
    )
    
    # Add a legend
    legend(x=0.7, y=1, legend = rownames(data[-c(1,2),]), bty = "n", pch=20 , col=colors_in , text.col = "grey", cex=1.2, pt.cex=3)
  })
  
  
  output$SDM_OU_Probability_map <- renderLeaflet({
    
    dir_path <- file.path(G$SE_Dir_Project, "Species_Distribution", "test1", input$SDM_OU_Species, "BIOMOD2")
    Map <- paste("PROJ", "_", input$SDM_OU_Climate_model, "_", input$SDM_OU_Climate_scenario, "_", input$SDM_OU_Project_year, "_", input$SDM_OU_Species, "_", input$SDM_OU_Projection_model, ".tif", sep = "")
    r <- raster(file.path(dir_path, Map))
    
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
      
      setView(lng = 127.00, lat = 36.00, zoom = 6)
    
  })
  
  output$SDM_OU_PROJ_Summary <- renderPrint({
    
    dir_path <- file.path(G$SE_Dir_Project, "Species_Distribution", "test1", input$SDM_OU_Species, "BIOMOD2")
    Map <- paste("PROJ", "_", input$SDM_OU_Climate_model, "_", input$SDM_OU_Climate_scenario, "_", input$SDM_OU_Project_year, "_", input$SDM_OU_Species, "_", input$SDM_OU_Projection_model, ".tif", sep = "")
    r <- raster(file.path(dir_path, Map))
    summary(r)
    
  })
  
  output$SDM_OU_PROJ_Histogram <- renderPlot({
    
    dir_path <- file.path(G$SE_Dir_Project, "Species_Distribution", "test1", input$SDM_OU_Species, "BIOMOD2")
    
    Map <- paste("PROJ", "_", input$SDM_OU_Climate_model, "_", input$SDM_OU_Climate_scenario, "_", input$SDM_OU_Project_year, "_", input$SDM_OU_Species, "_", input$SDM_OU_Projection_model, ".tif", sep = "")
    x <- raster(file.path(dir_path, Map))
    
    hist(x, # breaks = bins, 
         col="orange",
         border="brown",
         xlab = "Projected Value",
         main = "Histogram")
    
    
  })
  
  
  output$SDM_OU_Predicted_map <- renderLeaflet({
    
    dir_path <- file.path(G$SE_Dir_Project, "Species_Distribution", "test1", input$SDM_OU_Species, "BIOMOD2")
    Map <- paste("PRED", "_", input$SDM_OU_Climate_model, "_", input$SDM_OU_Climate_scenario, "_", input$SDM_OU_Project_year, "_", input$SDM_OU_Species, "_", input$SDM_OU_Prediction_model, ".tif", sep = "")
    r <- raster(file.path(dir_path, Map))
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
  
  output$SDM_OU_PRED_Summary <- renderPrint({
    
    dir_path <- file.path(G$SE_Dir_Project, "Species_Distribution", "test1", input$SDM_OU_Species, "BIOMOD2")
    Map <- paste("PRED", "_", input$SDM_OU_Climate_model, "_", input$SDM_OU_Climate_scenario, "_", input$SDM_OU_Project_year, "_", input$SDM_OU_Species, "_", input$SDM_OU_Prediction_model, ".tif", sep = "")
    r <- raster(file.path(dir_path, Map))
    
    summary(r)
  })
  
  output$SDM_OU_PRED_Histogram <- renderPlot({
    
    dir_path <- file.path(G$SE_Dir_Project, "Species_Distribution", "test1", input$SDM_OU_Species, "BIOMOD2")
    Map <- paste("PRED", "_", input$SDM_OU_Climate_model, "_", input$SDM_OU_Climate_scenario, "_", input$SDM_OU_Project_year, "_", input$SDM_OU_Species, "_", input$SDM_OU_Prediction_model, ".tif", sep = "")
    x <- raster(file.path(dir_path, Map))
    
    hist(x, # breaks = bins, 
         col="orange",
         border="brown",
         xlab = "Predicted Value",
         main = "Histogram")
    
  })
  
  
  output$DM_OU_Summary <- renderPrint({
    
    r <- raster(file.path(sensitive_species_57, "S002b_HR8580.tif"))
    
    summary(r)
  })
  
  
  output$DM_OU_DIspersal_map <- renderLeaflet({
    
    r <- raster(file.path(sensitive_species_57, "S002b_HR8580.tif"))
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
      
      setView(lng = 128.00, lat = 36.00, zoom = 7)
  })
  
  output$SS_CA_Species <- renderUI({
    input$reset_SS_CA
    SS_Name_Species_list <- test1_WD_List_Dirs
    SS_Name_Species_selected <- SS_Name_Species_list[1]
    checkboxGroupInput("SS_CA_Species", "Select a species",
                       choices = c(SS_Name_Species_list),
                       selected = SS_Name_Species_selected
    )
  })
  
  output$SS_CA_SDM_model <- renderUI({
    destfile <- file.path(G$SE_Dir_Project, "Species_Distribution", "test1", input$SS_CA_Species[1], "BIOMOD2", paste(as.name(paste(input$SS_CA_Species, "_ALL_eval.csv", sep = "")), sep = "", collapse = "--"))
    all_eval <- read.csv(destfile)
    G_FILE_species_evaluation <<- all_eval
    SS_Name_Models_list <- as.character(G_FILE_species_evaluation$Prediction)
    SS_Name_Models_selected <- SS_Name_Models_list[1]
    checkboxGroupInput("SS_CA_SDM_model", "Select models",
                       choices = c(SS_Name_Models_list),
                       selected = SS_Name_Models_selected
    )
  })
  
  output$DM_MO_Species <- renderUI({
    DM_Name_Species_list <- test1_WD_List_Dirs
    DM_Name_Species_selected <- DM_Name_Species_list[1]
    selectInput("DM_MO_Species", "Select a species",
                choices = c(DM_Name_Species_list),
                selected = DM_Name_Species_selected
    )
  })
  
  output$DM_MO_SDM_model <- renderUI({
    destfile <- file.path(G$SE_Dir_Project, "Species_Distribution", "test1", input$DM_MO_Species[1], "BIOMOD2", paste(as.name(paste(input$DM_MO_Species, "_ALL_eval.csv", sep = "")), sep = "", collapse = "--"))
    all_eval <- read.csv(destfile)
    G_FILE_species_evaluation <<- all_eval
    DM_Name_Models_list <- as.character(G_FILE_species_evaluation$Prediction)
    DM_Name_Models_selected <- DM_Name_Models_list[1]
    checkboxGroupInput("DM_MO_SDM_model", "Select models",
                       choices = c(DM_Name_Models_list),
                       selected = DM_Name_Models_selected
    )
  })
  
  output$DM_OU_Species <- renderUI({
    DM_Name_Species_list <- test1_WD_List_Dirs
    DM_Name_Species_selected <- DM_Name_Species_list[1]
    checkboxGroupInput("DM_OU_Species", "Select a species",
                       choices = c(DM_Name_Species_list),
                       selected = DM_Name_Species_selected
    )
  })
  
  output$DM_OU_SDM_model <- renderUI({
    destfile <- file.path(G$SE_Dir_Project, "Species_Distribution", "test1", input$DM_OU_Species[1], "BIOMOD2", paste(as.name(paste(input$DM_OU_Species, "_ALL_eval.csv", sep = "")), sep = "", collapse = "--"))
    all_eval <- read.csv(destfile)
    G_FILE_species_evaluation <<- all_eval
    DM_Name_Models_list <- as.character(G_FILE_species_evaluation$Prediction)
    DM_Name_Models_selected <- DM_Name_Models_list[1]
    checkboxGroupInput("DM_OU_SDM_model", "Select models",
                       choices = c(DM_Name_Models_list),
                       selected = DM_Name_Models_selected
    )
  })
  
  output$DM_OU_UI_plot <- renderUI({
    # setting Climate change scenarios, Future time, Species and current environmental path
    slist <- input$DM_OU_Species
    dlist <- input$DM_OU_Climate_model  # c("KMA") # c("KMA", "KEI", "WORLDCLIM")
    clist <- input$DM_OU_Climate_scenario  # c("RCP4.5") # c("RCP4.5", "RCP8.5")
    mlist <- input$DM_OU_SDM_model # c("PA1_Full_GLM_byROC")
    ylist <- input$DM_OU_Project_year
    dtlist <- input$DM_OU_Dispersal_type
    
    n <- 0
    ls <- length(slist)
    ld <- length(dlist)
    lc <- length(clist)
    lm <- length(mlist)
    ly <- length(ylist)
    ldt <- length(dtlist)
    tl <- ls * ld * lc * lm * ly * ldt
    
    nc <- 2
    if (tl <  2) {
      nr <- round(tl / nc) + 1
    } else {
      nr <- round((tl + 0.1) / nc)
    }
    
    ws <- nc * 500
    hs <- nr * 500
    plotOutput("DM_AO_OU_plot", width = ws, height = hs)
  })
  
  output$DM_AO_OU_plot <- renderPlot({
    #####========================================================
    ##### Plot GAP output =========================================
    
    # setting Climate change scenarios, Future time, Species and current environmental path
    slist <- input$DM_OU_Species
    dlist <- input$DM_OU_Climate_model  # c("KMA") # c("KMA", "KEI", "WORLDCLIM")
    clist <- input$DM_OU_Climate_scenario  # c("RCP4.5") # c("RCP4.5", "RCP8.5")
    mlist <- input$DM_OU_SDM_model # c("PA1_Full_GLM_byROC")
    ylist <- input$DM_OU_Project_year
    dtlist <- input$DM_OU_Dispersal_type
    
    ls <- length(slist)
    ld <- length(dlist)
    lc <- length(clist)
    lm <- length(mlist)
    ly <- length(ylist)
    ldt <- length(dtlist)
    tl <- ls * ld * lc * lm * ly * ldt
    
    nc <- 2
    if (tl <  2) {
      nr <- round(tl / nc) + 1
    } else {
      nr <- round((tl + 0.1) / nc)
    }
    
    par(mfrow = c(nr,nc), cex.main = 1.2)
    
    for (s in slist) {
      for (dt in dtlist) {
        dir_path <- file.path(G$SE_Dir_Project, "Species_Distribution", "test1", s, dt)	 
        print('dir_path')
        print(dir_path)
        for (d in dlist) {
          for (c in clist) {
            for (m in mlist) {
              if (ly > 0) {
                if (ly == 1 && ylist[1] == "2000") {
                  Map1 <- paste("PRED", "_", d, "_", c, "_", ylist[1], "_", s, "_", m, ".tif", sep = "")
                  if (file.exists(file.path(dir_path, Map1))) {
                    R_Map1 <- raster(file.path(dir_path, Map1))
                    plot(R_Map1, main = Map1, style = "font-size: 24px;")
                  }
                } else if (ly > 1 && ylist[1] == "2000") {
                  Map1 <- paste("PRED", "_", d, "_", c, "_", ylist[1], "_", s, "_", m, ".tif", sep = "")
                  if (file.exists(file.path(dir_path, Map1))) {
                    R_Map1 <- raster(file.path(dir_path, Map1))
                    plot(R_Map1, main = Map1, style = "font-size: 24px;")
                  }
                  for (y in 2:ly) {
                    Map2 <- paste("PRED", "_", d, "_", c, "_", ylist[y], "_", s, "_", m, ".tif", sep = "")
                    if (file.exists(file.path(dir_path, Map2))) {
                      R_Map2 <- raster(file.path(dir_path, Map2))
                      plot(R_Map2, main = Map2, style = "font-size: 24px;")
                    }
                  }
                } else {
                  for (y in 1:ly) {
                    Map2 <- paste("PRED", "_", d, "_", c, "_", ylist[y], "_", s, "_", m, ".tif", sep = "")
                    if (file.exists(file.path(dir_path, Map2))) {
                      R_Map2 <- raster(file.path(dir_path, Map2))
                      plot(R_Map2, main = Map2, style = "font-size: 24px;")
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
    ##### End Plot GAP output =========================================
  })
  
  
  observeEvent(input$SS_CA_Action_change, {
    #####========================================================
    ##### GAP analyzing =========================================
    
    # setting Climate change scenarios, Future time, Species and current environmental path
    slist <- input$SS_CA_Species
    dlist <- input$SS_CA_Climate_model  # c("KMA") # c("KMA", "KEI", "WORLDCLIM")
    clist <- input$SS_CA_Climate_scenario  # c("RCP4.5") # c("RCP4.5", "RCP8.5")
    mlist <- input$SS_CA_SDM_model # c("PA1_Full_GLM_byROC")
    ylist <- input$SS_CA_Project_year
    #	dtlist <- input$SS_SP_Dispersal_type
    
    n <- 0
    ls <- length(slist)
    ld <- length(dlist)
    lc <- length(clist)
    lm <- length(mlist)
    ly <- length(ylist)
    tl <- ls * ld * lc * lm * ly
    
    withProgress(message = 'Runing GAP Analysis model.........', value = 0, {
      
      for (s in slist) {
        dir_path <- file.path(isolate(G$SE_Dir_Project), "Species_Distribution", "test1", s, "BIOMOD2")
        n <- n + 1
        for (d in dlist) {
          for (c in clist) {
            for (m in mlist) {
              if (ly > 1) {
                if (ylist[1] == "2000") {
                  Map1 <- paste("PRED", "_", d, "_", c, "_", ylist[1], "_", s, "_", m, ".tif", sep = "")
                  R_Map1 <- raster(file.path(dir_path, Map1))
                  for (y in 2:ly) {
                    incProgress(1/tl, detail = paste("Doing part", n, "/", ls, "(", s, ")", "_", d, "_", c, "_", m, "_", ylist[y]))
                    Map2 <- paste("PRED", "_", d, "_", c, "_", ylist[y], "_", s, "_", m, ".tif", sep = "")
                    R_Map2 <- raster(file.path(dir_path, Map2))
                    R_gap <- raster(R_Map1)
                    R_loss <- raster(R_Map1)
                    R_stay <- raster(R_Map1)
                    R_gain <- raster(R_Map1)
                    R_gap[R_Map1 == 0 & R_Map2 == 0] <- -2
                    R_gap[R_Map1 == 0 & R_Map2 == 1] <- 1
                    R_gap[R_Map1 == 1 & R_Map2 == 0] <- -1
                    R_gap[R_Map1 == 1 & R_Map2 == 1] <- 0
                    
                    R_gain[R_Map1 == 0 & R_Map2 == 0] <- 0
                    R_gain[R_Map1 == 0 & R_Map2 == 1] <- 1
                    R_gain[R_Map1 == 1 & R_Map2 == 0] <- 0
                    R_gain[R_Map1 == 1 & R_Map2 == 1] <- 0
                    
                    R_loss[R_Map1 == 0 & R_Map2 == 0] <- 0
                    R_loss[R_Map1 == 0 & R_Map2 == 1] <- 0
                    R_loss[R_Map1 == 1 & R_Map2 == 0] <- 1
                    R_loss[R_Map1 == 1 & R_Map2 == 1] <- 0
                    
                    R_stay[R_Map1 == 0 & R_Map2 == 0] <- 0
                    R_stay[R_Map1 == 0 & R_Map2 == 1] <- 0
                    R_stay[R_Map1 == 1 & R_Map2 == 0] <- 0
                    R_stay[R_Map1 == 1 & R_Map2 == 1] <- 1
                    
                    writeRaster(R_gap, file = file.path(dir_path, paste(as.name(paste("GAP_", "PRED", "_", d, "_", c, "_", ylist[y], "_", s, "_",m, ".tif", sep = "")), sep = "", collapse = "--")), format = "GTiff", overwrite = TRUE)
                    writeRaster(R_loss, file = file.path(dir_path, paste(as.name(paste("LOSS_", "PRED", "_", d, "_", c, "_", ylist[y], "_", s, "_",m, ".tif", sep = "")), sep = "", collapse = "--")), format = "GTiff", overwrite = TRUE)
                    writeRaster(R_stay, file = file.path(dir_path, paste(as.name(paste("STAY_", "PRED", "_", d, "_", c, "_", ylist[y], "_", s, "_",m, ".tif", sep = "")), sep = "", collapse = "--")), format = "GTiff", overwrite = TRUE)
                    writeRaster(R_gain, file = file.path(dir_path, paste(as.name(paste("GAIN_", "PRED", "_", d, "_", c, "_", ylist[y], "_", s, "_",m, ".tif", sep = "")), sep = "", collapse = "--")), format = "GTiff", overwrite = TRUE)
                  }
                }
              }
            }
          }
        }
      }
    })
    ##### End GAP analyzing =========================================      
  })
  
  observeEvent(input$SS_CA_Action_Vindex, {
    #####========================================================
    ##### GAP analyzing =========================================
    
    # setting Climate change scenarios, Future time, Species and current environmental path
    slist <- input$SS_CA_Species
    dlist <- input$SS_CA_Climate_model  # c("KMA") # c("KMA", "KEI", "WORLDCLIM")
    clist <- input$SS_CA_Climate_scenario  # c("RCP4.5") # c("RCP4.5", "RCP8.5")
    mlist <- input$SS_CA_SDM_model # c("PA1_Full_GLM_byROC")
    ylist <- input$SS_CA_Project_year
    #	dtlist <- input$SS_SP_Dispersal_type
    
    n <- 0
    ls <- length(slist)
    ld <- length(dlist)
    lc <- length(clist)
    lm <- length(mlist)
    ly <- length(ylist)
    tl <- ls * ld * lc * lm * ly
    
    col_list <- c("Species", 
                  "Climate_Model", 
                  "Climate_Scenario", 
                  "Model", 
                  "Year", 
                  "Area", 
                  "Area_Loss", 
                  "Area_Stay", 
                  "Area_Gain", 
                  "Area_Ratio", 
                  "Area_Loss_Ratio", 
                  "Area_Stay_Ratio", 
                  "Area_Gain_Ratio",
                  "Area_Gain_Ratio_Reverse",
                  "Area_Gain_Ratio_Outside",
                  "Area_Gain_Ratio_Outside_Reverse",
                  "Vulnerability_Area_Loss_Ratio", 
                  "Vulnerability_Area_LossIN_GainOUT_Ratio")
    
    withProgress(message = 'Runing GAP Analysis model.........', value = 0, {
      
      n_tl <- 0
      for (s in slist) {
        dir_path <- file.path(isolate(G$SE_Dir_Project), "Species_Distribution", "test1", s, "BIOMOD2")
        Tab_gap <- setNames(data.frame(matrix(ncol = 18, nrow = tl)), col_list)
        n <- n + 1
        for (d in dlist) {
          for (c in clist) {
            for (m in mlist) {
              if (ly > 0) {
                if (ly == 1 & ylist[1] == "2000") {
                  n_tl <- n_tl + 1
                  Map1 <- paste("PRED", "_", d, "_", c, "_", ylist[1], "_", s, "_", m, ".tif", sep = "")
                  R_Map1 <- raster(file.path(dir_path, Map1))
                  
                  T_Area0 <- freq(R_Map1, value = 0)
                  T_Area1 <- freq(R_Map1, value = 1)
                  T_Area <- T_Area0 + T_Area1
                  
                  Tab_gap$Species[n_tl] <- s
                  Tab_gap$Climate_Model[n_tl] <- d
                  Tab_gap$Climate_Scenario[n_tl] <- c
                  Tab_gap$Model[n_tl] <- m
                  Tab_gap$Year[n_tl] <- ylist[1]
                  Tab_gap$Area[n_tl] <- freq(R_Map1, value = 1)
                  Tab_gap$Area_Loss[n_tl] <- 0
                  Tab_gap$Area_Stay[n_tl] <- Tab_gap$Area[n_tl]
                  Tab_gap$Area_Gain[n_tl] <- 0
                  Tab_gap$Area_Ratio[n_tl] <- 1
                  Tab_gap$Area_Loss_Ratio[n_tl] <- (Tab_gap$Area_Loss[n_tl] / Tab_gap$Area[n_tl]) * 100
                  Tab_gap$Area_Stay_Ratio[n_tl] <- (Tab_gap$Area_Stay[n_tl] / Tab_gap$Area[n_tl]) * 100
                  Tab_gap$Area_Gain_Ratio[n_tl] <- (Tab_gap$Area_Gain[n_tl] / Tab_gap$Area[n_tl]) * 100
                  Tab_gap$Area_Gain_Ratio_Reverse[n_tl] <- Tab_gap$Area_Gain_Ratio[n_tl] * -1
                  Tab_gap$Area_Gain_Ratio_Outside[n_tl] <- (Tab_gap$Area_Gain[n_tl] / (T_Area - Tab_gap$Area[n_tl])) * 100
                  Tab_gap$Area_Gain_Ratio_Outside_Reverse[n_tl] <- Tab_gap$Area_Gain_Ratio_Outside[n_tl] * -1
                  Tab_gap$Vulnerability_Area_Loss_Ratio[n_tl] <- 1 - Tab_gap$Area_Ratio[n_tl]
                  Tab_gap$Vulnerability_Area_LossIN_GainOUT_Ratio[n_tl] <- (Tab_gap$Area_Loss_Ratio[n_tl] / 100) - (Tab_gap$Area_Gain_Ratio_Outside[n_tl] / 100)
                } else if (ly > 1 & ylist[1] == "2000") {
                  n_tl <- n_tl + 1
                  Map1 <- paste("PRED", "_", d, "_", c, "_", ylist[1], "_", s, "_", m, ".tif", sep = "")
                  R_Map1 <- raster(file.path(dir_path, Map1))
                  
                  T_Area0 <- freq(R_Map1, value = 0)
                  T_Area1 <- freq(R_Map1, value = 1)
                  T_Area <- T_Area0 + T_Area1
                  
                  Tab_gap$Species[n_tl] <- s
                  Tab_gap$Climate_Model[n_tl] <- d
                  Tab_gap$Climate_Scenario[n_tl] <- c
                  Tab_gap$Model[n_tl] <- m
                  Tab_gap$Year[n_tl] <- ylist[1]
                  Tab_gap$Area[n_tl] <- freq(R_Map1, value = 1)
                  Tab_gap$Area_Loss[n_tl] <- 0
                  Tab_gap$Area_Stay[n_tl] <- Tab_gap$Area[n_tl]
                  Tab_gap$Area_Gain[n_tl] <- 0
                  Tab_gap$Area_Ratio[n_tl] <- 1
                  Tab_gap$Area_Loss_Ratio[n_tl] <- (Tab_gap$Area_Loss[n_tl] / Tab_gap$Area[n_tl]) * 100
                  Tab_gap$Area_Stay_Ratio[n_tl] <- (Tab_gap$Area_Stay[n_tl] / Tab_gap$Area[n_tl]) * 100
                  Tab_gap$Area_Gain_Ratio[n_tl] <- (Tab_gap$Area_Gain[n_tl] / Tab_gap$Area[n_tl]) * 100
                  Tab_gap$Area_Gain_Ratio_Reverse[n_tl] <- Tab_gap$Area_Gain_Ratio[n_tl] * -1
                  Tab_gap$Area_Gain_Ratio_Outside[n_tl] <- (Tab_gap$Area_Gain[n_tl] / (T_Area - Tab_gap$Area[n_tl])) * 100
                  Tab_gap$Area_Gain_Ratio_Outside_Reverse[n_tl] <- Tab_gap$Area_Gain_Ratio_Outside[n_tl] * -1
                  Tab_gap$Vulnerability_Area_Loss_Ratio[n_tl] <- 1 - Tab_gap$Area_Ratio[n_tl]
                  Tab_gap$Vulnerability_Area_LossIN_GainOUT_Ratio[n_tl] <- (Tab_gap$Area_Loss_Ratio[n_tl] / 100) - (Tab_gap$Area_Gain_Ratio_Outside[n_tl] / 100)   
                  for (y in 2:ly) {
                    incProgress(1/tl, detail = paste("Doing part", n, "/", ls, "(", s, ")", "_", d, "_", c, "_", m, "_", y))
                    n_tl <- n_tl + 1
                    Map2 <- paste("GAP_", "PRED", "_", d, "_", c, "_", ylist[y], "_", s, "_", m, ".tif", sep = "")
                    R_gap <- raster(file.path(dir_path, Map2))
                    
                    T_Area0 <- freq(R_gap, value = 0)
                    T_Area1 <- freq(R_gap, value = 1)
                    T_Area2 <- freq(R_gap, value = -1)
                    T_Area3 <- freq(R_gap, value = -2)
                    T_Area <- T_Area0 + T_Area1 + T_Area2 + T_Area3
                    Map0_Area0 <- freq(R_gap, value = 0)
                    Map0_Area1 <- freq(R_gap, value = -1)
                    Map0_Area <- Map0_Area0 + Map0_Area1
                    Map_Area0 <- freq(R_gap, value = 0)
                    Map_Area1 <- freq(R_gap, value = 1)
                    Map_Area <- Map_Area0 + Map_Area1
                    
                    Tab_gap$Species[n_tl] <- s
                    Tab_gap$Climate_Model[n_tl] <- d
                    Tab_gap$Climate_Scenario[n_tl] <- c
                    Tab_gap$Model[n_tl] <- m
                    Tab_gap$Year[n_tl] <- ylist[y]
                    Tab_gap$Area[n_tl] <- Map_Area
                    Tab_gap$Area_Loss[n_tl] <- T_Area2
                    Tab_gap$Area_Stay[n_tl] <- T_Area0
                    Tab_gap$Area_Gain[n_tl] <- T_Area1
                    Tab_gap$Area_Ratio[n_tl] <- Map_Area / Map0_Area
                    Tab_gap$Area_Loss_Ratio[n_tl] <- (Tab_gap$Area_Loss[n_tl] / Map0_Area) * 100
                    Tab_gap$Area_Stay_Ratio[n_tl] <- (Tab_gap$Area_Stay[n_tl] / Map0_Area) * 100
                    Tab_gap$Area_Gain_Ratio[n_tl] <- (Tab_gap$Area_Gain[n_tl] / Map0_Area) * 100
                    Tab_gap$Area_Gain_Ratio_Reverse[n_tl] <- Tab_gap$Area_Gain_Ratio[n_tl] * -1
                    Tab_gap$Area_Gain_Ratio_Outside[n_tl] <- (Tab_gap$Area_Gain[n_tl] / (T_Area - Tab_gap$Area[n_tl])) * 100
                    Tab_gap$Area_Gain_Ratio_Outside_Reverse[n_tl] <- Tab_gap$Area_Gain_Ratio_Outside[n_tl] * -1
                    Tab_gap$Vulnerability_Area_Loss_Ratio[n_tl] <- 1 - Tab_gap$Area_Ratio[n_tl]
                    Tab_gap$Vulnerability_Area_LossIN_GainOUT_Ratio[n_tl] <- (Tab_gap$Area_Loss_Ratio[n_tl] / 100) - (Tab_gap$Area_Gain_Ratio_Outside[n_tl] / 100)
                  }
                } else {
                  for (y in 1:ly) {
                    incProgress(1/tl, detail = paste("Doing part", n, "/", ls, "(", s, ")", "_", d, "_", c, "_", m, "_", y))
                    n_tl <- n_tl + 1
                    Map2 <- paste("GAP_", "PRED", "_", d, "_", c, "_", ylist[y], "_", s, "_", m, ".tif", sep = "")
                    R_gap <- raster(file.path(dir_path, Map2))
                    
                    T_Area0 <- freq(R_gap, value = 0)
                    T_Area1 <- freq(R_gap, value = 1)
                    T_Area2 <- freq(R_gap, value = -1)
                    T_Area3 <- freq(R_gap, value = -2)
                    T_Area <- T_Area0 + T_Area1 + T_Area2 + T_Area3
                    Map0_Area0 <- freq(R_gap, value = 0)
                    Map0_Area1 <- freq(R_gap, value = -1)
                    Map0_Area <- Map0_Area0 + Map0_Area1
                    Map_Area0 <- freq(R_gap, value = 0)
                    Map_Area1 <- freq(R_gap, value = 1)
                    Map_Area <- Map_Area0 + Map_Area1
                    
                    Tab_gap$Species[n_tl] <- s
                    Tab_gap$Climate_Model[n_tl] <- d
                    Tab_gap$Climate_Scenario[n_tl] <- c
                    Tab_gap$Model[n_tl] <- m
                    Tab_gap$Year[n_tl] <- ylist[y]
                    Tab_gap$Area[n_tl] <- Map_Area
                    Tab_gap$Area_Loss[n_tl] <- T_Area2
                    Tab_gap$Area_Stay[n_tl] <- T_Area0
                    Tab_gap$Area_Gain[n_tl] <- T_Area1
                    Tab_gap$Area_Ratio[n_tl] <- Map_Area / Map0_Area
                    Tab_gap$Area_Loss_Ratio[n_tl] <- (Tab_gap$Area_Loss[n_tl] / Map0_Area) * 100
                    Tab_gap$Area_Stay_Ratio[n_tl] <- (Tab_gap$Area_Stay[n_tl] / Map0_Area) * 100
                    Tab_gap$Area_Gain_Ratio[n_tl] <- (Tab_gap$Area_Gain[n_tl] / Map0_Area) * 100
                    Tab_gap$Area_Gain_Ratio_Reverse[n_tl] <- Tab_gap$Area_Gain_Ratio[n_tl] * -1
                    Tab_gap$Area_Gain_Ratio_Outside[n_tl] <- (Tab_gap$Area_Gain[n_tl] / (T_Area - Tab_gap$Area[n_tl])) * 100
                    Tab_gap$Area_Gain_Ratio_Outside_Reverse[n_tl] <- Tab_gap$Area_Gain_Ratio_Outside[n_tl] * -1
                    Tab_gap$Vulnerability_Area_Loss_Ratio[n_tl] <- 1 - Tab_gap$Area_Ratio[n_tl]
                    Tab_gap$Vulnerability_Area_LossIN_GainOUT_Ratio[n_tl] <- (Tab_gap$Area_Loss_Ratio[n_tl] / 100) - (Tab_gap$Area_Gain_Ratio_Outside[n_tl] / 100)
                  } 
                }
              }
            }
          }
        }
        write.csv(Tab_gap, file = file.path(dir_path, paste(s, "_VINDEX.csv", sep = "", collapse = "--")))
      }   
    })
    ##### End GAP analyzing =========================================    
  })
  
  output$SS_AO_Species <- renderUI({
    input$reset_SS_AO
    SS_Name_Species_list <- test1_WD_List_Dirs
    SS_Name_Species_selected <- SS_Name_Species_list[1]
    checkboxGroupInput("SS_AO_Species", "Select a species",
                       choices = c(SS_Name_Species_list),
                       selected = SS_Name_Species_selected
    )
  })
  
  output$SS_AO_SDM_model <- renderUI({
    input$reset_SS_AO
    destfile <- file.path(G$SE_Dir_Project, "Species_Distribution", "test1", input$SS_AO_Species, "BIOMOD2", paste(as.name(paste(input$SS_AO_Species, "_ALL_eval.csv", sep = "")), sep = "", collapse = "--"))
    all_eval <- read.csv(destfile)
    G_FILE_species_evaluation <<- all_eval
    SS_Name_Models_list <- as.character(G_FILE_species_evaluation$Prediction)
    SS_Name_Models_selected <- SS_Name_Models_list[1]
    checkboxGroupInput("SS_AO_SDM_model", "Select models",
                       choices = c(SS_Name_Models_list),
                       selected = SS_Name_Models_selected
    )
  })
  
  output$SS_AO_UI_plot <- renderUI({
    # setting Climate change scenarios, Future time, Species and current environmental path
    slist <- input$SS_AO_Species
    dlist <- input$SS_AO_Climate_model  # c("KMA") # c("KMA", "KEI", "WORLDCLIM")
    clist <- input$SS_AO_Climate_scenario  # c("RCP4.5") # c("RCP4.5", "RCP8.5")
    mlist <- input$SS_AO_SDM_model # c("PA1_Full_GLM_byROC")
    ylist <- input$SS_AO_Project_year
    #	dtlist <- input$SS_AO_Dispersal_type
    
    n <- 0
    ls <- length(slist)
    ld <- length(dlist)
    lc <- length(clist)
    lm <- length(mlist)
    ly <- length(ylist)		
    tl <- ls * ld * lc * lm * ly
    
    nc <- 2
    if (tl <  2) {
      nr <- round(tl / nc) + 1
    } else {
      nr <- round((tl + 0.1) / nc)
    }
    
    ws <- nc * 500
    hs <- nr * 500
    plotOutput("SS_AO_OU_plot", width = ws, height = hs)
  })
  
  output$SS_AO_OU_plot <- renderPlot({
    #####========================================================
    ##### Plot GAP output =========================================
    
    # setting Climate change scenarios, Future time, Species and current environmental path
    slist <- input$SS_AO_Species
    dlist <- input$SS_AO_Climate_model  # c("KMA") # c("KMA", "KEI", "WORLDCLIM")
    clist <- input$SS_AO_Climate_scenario  # c("RCP4.5") # c("RCP4.5", "RCP8.5")
    mlist <- input$SS_AO_SDM_model # c("PA1_Full_GLM_byROC")
    ylist <- input$SS_AO_Project_year
    #	dtlist <- input$SS_AO_Dispersal_type
    
    ls <- length(slist)
    ld <- length(dlist)
    lc <- length(clist)
    lm <- length(mlist)
    ly <- length(ylist)
    tl <- ls * ld * lc * lm * ly
    
    nc <- 2
    if (tl <  2) {
      nr <- round(tl / nc) + 1
    } else {
      nr <- round((tl + 0.1) / nc)
    }
    
    par(mfrow = c(nr,nc), cex.main = 1.2)
    
    for (s in slist) {
      dir_path <- file.path(isolate(G$SE_Dir_Project), "Species_Distribution", "test1", s, "BIOMOD2")
      for (d in dlist) {
        for (c in clist) {
          for (m in mlist) {
            if (ly > 0) {
              if (ly == 1 && ylist[1] == "2000") {
                Map1 <- paste("PRED", "_", d, "_", c, "_", ylist[1], "_", s, "_", m, ".tif", sep = "")
                R_Map1 <- raster(file.path(dir_path, Map1))
                plot(R_Map1, main = Map1)
              } else if (ly > 1 && ylist[1] == "2000") {
                Map1 <- paste("PRED", "_", d, "_", c, "_", ylist[1], "_", s, "_", m, ".tif", sep = "")
                R_Map1 <- raster(file.path(dir_path, Map1))
                plot(R_Map1, main = Map1)
                for (y in 2:ly) {
                  Map2 <- paste("GAP_", "PRED", "_", d, "_", c, "_", ylist[y], "_", s, "_", m, ".tif", sep = "")
                  R_Map2 <- raster(file.path(dir_path, Map2))
                  plot(R_Map2, main = Map2)
                }
              } else {
                for (y in 1:ly) {
                  Map2 <- paste("GAP_", "PRED", "_", d, "_", c, "_", ylist[y], "_", s, "_", m, ".tif", sep = "")
                  R_Map2 <- raster(file.path(dir_path, Map2))
                  plot(R_Map2, main = Map2)
                }
              }
            }
          }
        }
      }
    }
    ##### End Plot GAP output =========================================
  })
  
  output$SS_AO_IV_Table <- DT::renderDataTable({
    destfile <- file.path(G$SE_Dir_Project, "Species_Distribution", "test1", input$SS_AO_Species, "BIOMOD2", paste(as.name(paste(input$SS_AO_Species, "_VINDEX.csv", sep = "")), sep = "", collapse = "--"))
    vindex <- read.csv(destfile)
    G_FILE_species_vindex <<- vindex
    vindex
  })
  
  output$SS_AO_IV_3DPlot <- renderPlot({
    rs <- input$SS_AO_IV_Table_rows_selected  # G_FILE_specieslocation   # st_read("species.shp")
    if (length(rs)) {
      vindex <- G_FILE_species_vindex[rs, , drop = FALSE]
      plot_ly(x = vindex$Area_Loss_Ratio, y = vindex$Area_Gain_Ratio, z = vindex$Area_Stay_Ratio, type = "scatter3d", mode = "markers", color = as.character(vindex$Year))
    }   
  })
  
  output$SS_AO_IV_UI_plot1 <- renderUI({
    selectInput("SS_AO_IV_UI_plot1", "Select a group",
                choices = c(SS_Name_Group1_list),
                selected = SS_Name_Group1_selected
    )
  })
  
  output$SS_AO_IV_Plot1 <- renderPlot({
    rs <- input$SS_AO_IV_Table_rows_selected  # G_FILE_specieslocation   # st_read("species.shp")
    if (length(rs)) {
      vindex <- G_FILE_species_vindex[rs, , drop = FALSE]
      vindex$Year <- as.character(vindex$Year)
      
      Group <- vindex[, input$SS_AO_IV_UI_plot1]
      ggplot(vindex, aes(x = Area_Loss_Ratio, y = Area_Gain_Ratio_Reverse, color = Group)) +
        geom_point(size = 6) +
        labs(title = "Vulnerability (Area Loss Ratio)", x = "Loss", y = "Gain") +
        geom_text(aes(label = Vulnerability_Area_Loss_Ratio), size = 3, hjust = 0.5, vjust = 3) + #, position =     "stack") +
        # horizontal
        geom_hline(yintercept = -50, color="orange", size=1) + 
        # vertical
        geom_vline(xintercept = 50, color="orange", size=1) +
        # Add arrow
        annotate("segment", x = 0, xend = 100, y = -100, yend = 0, colour = "purple", size = 2, alpha = 0.6, arrow = arrow())
    }   
  })
  
  output$SS_AO_IV_Plot2 <- renderPlot({
    rs <- input$SS_AO_IV_Table_rows_selected  # G_FILE_specieslocation   # st_read("species.shp")
    if (length(rs)) {
      vindex <- G_FILE_species_vindex[rs, , drop = FALSE]
      vindex$Year <- as.character(vindex$Year)
      
      Group <- vindex[, input$SS_AO_IV_UI_plot1]
      ggplot(vindex, aes(x = Area_Loss_Ratio, y = Area_Gain_Ratio_Outside_Reverse, color = Group)) +
        geom_point(size = 6) +
        labs(title = "Vulnerability (Area LossIN GainOUT Ratio)", x = "Loss", y = "Gain") +
        geom_text(aes(label = Vulnerability_Area_LossIN_GainOUT_Ratio), size = 3, hjust = 0.5, vjust = 3) + #, position =     "stack") +
        # horizontal
        geom_hline(yintercept = -50, color="orange", size=1) + 
        # vertical
        geom_vline(xintercept = 50, color="orange", size=1) +
        # Add arrow
        annotate("segment", x = 0, xend = 100, y = -100, yend = 0, colour = "purple", size = 2, alpha = 0.6, arrow = arrow())
    }
  })
  
  output$SS_AO_IV_UI_plot2 <- renderUI({
    selectInput("SS_AO_IV_UI_plot2", "Select a group",
                choices = c(SS_Name_Group2_list),
                selected = SS_Name_Group2_selected
    )
  })
  
  output$SS_AO_IV_Plot11 <- renderPlot({
    rs <- input$SS_AO_IV_Table_rows_selected  # G_FILE_specieslocation   # st_read("species.shp")
    if (length(rs)) {
      vindex <- G_FILE_species_vindex[rs, , drop = FALSE]
      
      Group <- vindex[, input$SS_AO_IV_UI_plot2]
      vindex %>%
        tail(10) %>%
        ggplot(aes(x = Year, y = Vulnerability_Area_Loss_Ratio)) +
        geom_line(aes(color = Group, linetype = Group)) +
        geom_point(shape = 21, color = "black", fill = "#69b3a2", size=6) +
        theme_ipsum() +
        labs(title = "Vulnerability (Area Loss Ratio)", x = "Year", y = "Vulnerability")
    }
  })
  
  output$SS_AO_IV_Plot21 <- renderPlot({
    rs <- input$SS_AO_IV_Table_rows_selected  # G_FILE_specieslocation   # st_read("species.shp")
    if (length(rs)) {
      vindex <- G_FILE_species_vindex[rs, , drop = FALSE]
      
      Group <- vindex[, input$SS_AO_IV_UI_plot2]
      vindex %>%
        tail(10) %>%
        ggplot(aes(x = Year, y = Vulnerability_Area_LossIN_GainOUT_Ratio)) +
        geom_line(aes(color = Group, linetype = Group)) +
        geom_point(shape = 21, color = "black", fill = "#69b3a2", size=6) +
        theme_ipsum() +
        labs(title = "Vulnerability (Area Loss Ratio)", x = "Year", y = "Vulnerability")
    }
  })
  
  output$SS_AO_VP_Table <- DT::renderDataTable({
    destfile <- file.path(G$SE_Dir_Project, "Species_Distribution", 'test1', input$SS_AO_Species, "BIOMOD2", paste(as.name(paste(input$SS_AO_Species, "_VINDEX.csv", sep = "")), sep = "", collapse = "--"))
    vindex <- read.csv(destfile)
    G_FILE_species_vindex <<- vindex
    vindex
  })
  
  output$SS_AO_VP_UI_plot1 <- renderUI({
    selectInput("SS_AO_VP_UI_plot1", "Select a group",
                choices = c(SS_Name_Group1_list),
                selected = SS_Name_Group1_selected
    )
  })
  
  output$SS_AO_VP_Plot1 <- renderPlot({
    rs <- input$SS_AO_VP_Table_rows_selected  # G_FILE_specieslocation   # st_read("species.shp")
    if (length(rs)) {
      vindex <- G_FILE_species_vindex[rs, , drop = FALSE]
      vindex$Year <- as.character(vindex$Year)
      
      Group <- vindex[, input$SS_AO_VP_UI_plot1]
      ggplot(vindex, aes(x = Area_Loss_Ratio, y = Area_Gain_Ratio_Reverse, color = Group)) +
        geom_point(size = 6) +
        labs(title = "Vulnerability (Area Loss Ratio)", x = "Loss", y = "Gain") +
        geom_text(aes(label = Vulnerability_Area_Loss_Ratio), size = 3, hjust = 0.5, vjust = 3) + #, position =     "stack") +
        # horizontal
        geom_hline(yintercept = -50, color="orange", size=1) + 
        # vertical
        geom_vline(xintercept = 50, color="orange", size=1) +
        # Add arrow
        annotate("segment", x = 0, xend = 100, y = -100, yend = 0, colour = "purple", size = 2, alpha = 0.6, arrow = arrow())
    }   
  })
  
  output$SS_AO_VP_Plot2 <- renderPlot({
    rs <- input$SS_AO_VP_Table_rows_selected  # G_FILE_specieslocation   # st_read("species.shp")
    if (length(rs)) {
      vindex <- G_FILE_species_vindex[rs, , drop = FALSE]
      vindex$Year <- as.character(vindex$Year)
      
      Group <- vindex[, input$SS_AO_VP_UI_plot1]
      ggplot(vindex, aes(x = Area_Loss_Ratio, y = Area_Gain_Ratio_Outside_Reverse, color = Group)) +
        geom_point(size = 6) +
        labs(title = "Vulnerability (Area LossIN GainOUT Ratio)", x = "Loss", y = "Gain") +
        geom_text(aes(label = Vulnerability_Area_LossIN_GainOUT_Ratio), size = 3, hjust = 0.5, vjust = 3) + #, position =     "stack") +
        # horizontal
        geom_hline(yintercept = -50, color="orange", size=1) + 
        # vertical
        geom_vline(xintercept = 50, color="orange", size=1) +
        # Add arrow
        annotate("segment", x = 0, xend = 100, y = -100, yend = 0, colour = "purple", size = 2, alpha = 0.6, arrow = arrow())
    }
  })
  
  output$SS_AO_VP_UI_plot2 <- renderUI({
    selectInput("SS_AO_VP_UI_plot2", "Select a group",
                choices = c(SS_Name_Group2_list),
                selected = SS_Name_Group2_selected
    )
  })
  
  output$SS_AO_VP_Plot11 <- renderPlot({
    rs <- input$SS_AO_VP_Table_rows_selected  # G_FILE_specieslocation   # st_read("species.shp")
    if (length(rs)) {
      vindex <- G_FILE_species_vindex[rs, , drop = FALSE]
      
      Group <- vindex[, input$SS_AO_VP_UI_plot2]
      vindex %>%
        tail(10) %>%
        ggplot(aes(x = Year, y = Vulnerability_Area_Loss_Ratio)) +
        geom_line(aes(color = Group, linetype = Group)) +
        geom_point(shape = 21, color = "black", fill = "#69b3a2", size=6) +
        theme_ipsum() +
        labs(title = "Vulnerability (Area Loss Ratio)", x = "Year", y = "Vulnerability")
    }
  })
  
  output$SS_AO_VP_Plot21 <- renderPlot({
    rs <- input$SS_AO_VP_Table_rows_selected  # G_FILE_specieslocation   # st_read("species.shp")
    if (length(rs)) {
      vindex <- G_FILE_species_vindex[rs, , drop = FALSE]
      
      Group <- vindex[, input$SS_AO_VP_UI_plot2]
      vindex %>%
        tail(10) %>%
        ggplot(aes(x = Year, y = Vulnerability_Area_LossIN_GainOUT_Ratio)) +
        geom_line(aes(color = Group, linetype = Group)) +
        geom_point(shape = 21, color = "black", fill = "#69b3a2", size=6) +
        theme_ipsum() +
        labs(title = "Vulnerability (Area Loss Ratio)", x = "Year", y = "Vulnerability")
    }
  })
  
  output$SS_SP_Change <- renderPlot({
    dataset <- read.csv(file.path(G_2019_DATA_graph, "VI_2.csv"))
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
  
  output$IS_CA_Species <- renderUI({
    input$reset_IS_CA
    IS_Name_Species_list <- test1_WD_List_Dirs
    IS_Name_Species_selected <- IS_Name_Species_list[1]
    checkboxGroupInput("IS_CA_Species", "Select a species",
                       choices = c(IS_Name_Species_list),
                       selected = IS_Name_Species_selected
    )
  })
  
  output$IS_CA_SDM_model <- renderUI({
    input$reset_IS_CA
    destfile <- file.path(G$SE_Dir_Project, "Species_Distribution", "test1", input$IS_CA_Species[1], "BIOMOD2", paste(as.name(paste(input$IS_CA_Species, "_ALL_eval.csv", sep = "")), sep = "", collapse = "--"))
    all_eval <- read.csv(destfile)
    G_FILE_species_evaluation <<- all_eval
    IS_Name_Models_list <- as.character(G_FILE_species_evaluation$Prediction)
    IS_Name_Models_selected <- IS_Name_Models_list[1]
    checkboxGroupInput("IS_CA_SDM_model", "Select models",
                       choices = c(IS_Name_Models_list),
                       selected = IS_Name_Models_selected
    )
  })
  
  observeEvent(input$IS_VA_Dir_Folder, {
    volumes <- c(main = isolate(G$SE_Dir_Project))
    shinyDirChoose(input, 'IS_VA_Dir_Folder', roots = volumes) # , defaultPath = "/MOTIVE_projects", defaultRoot = G$SE_Dir_Project)
    G$IS_VA_Dir_Folder <<- parseDirPath(volumes, input$IS_VA_Dir_Folder)
    output$IS_VA_Dir_Folder <- renderText({G$IS_VA_Dir_Folder})
  })
  
  observeEvent(input$IS_VA_Action_Analysis, {
    # setting Climate change scenarios, Future time, Species and current environmental path
    dlist <- input$IS_CA_Climate_model  # c("KMA") # c("KMA", "KEI", "WORLDCLIM")
    clist <- input$IS_CA_Climate_scenario  # c("RCP4.5") # c("RCP4.5", "RCP8.5")
    #	dtlist <- input$IS_CA_Dispersal_type
    mlist <- input$IS_CA_SDM_model # c("PA1_Full_GLM_byROC")
    ylist <- input$IS_CA_Project_year
    slist <- input$IS_CA_Species
    
    n <- 0
    ls <- length(slist)
    ld <- length(dlist)
    lc <- length(clist)
    lm <- length(mlist)
    ly <- length(ylist)
    
    tl <- ld * lc * lm
    
    sr_list <- ""
    loss_list <- ""
    stay_list <- ""
    gain_list <- ""
    
    withProgress(message = 'Runing Invasive Species Impact and Vulnerability Analysis.........', value = 0, {
      
      for (d in dlist) {
        for (c in clist) {
          for (m in mlist) {
            for (y in ylist) {
              if (length(ylist) > 1 && ylist[1] == "2000") {
                if(y == ylist[1]) {
                  incProgress(1/tl, detail = paste("Doing part", d, "_", c, "_", m, "_", y))
                  for (s in slist) {
                    dir_path <- file.path(isolate(G$SE_Dir_Project), "Species_Distribution", "test1", s, "BIOMOD2")
                    img <- file.path(dir_path, paste("PRED", "_", d, "_", c, "_", y, "_", s, "_", m, ".tif", sep = ""))
                    sr_list <- c(sr_list, img)
                  }
                  save_path <- isolate(G$IS_VA_Dir_Folder)
                  sr_list <- grep("PRED", sr_list, value = TRUE)
                  sr_stack <- stack(sr_list)
                  sr_raster <- overlay(sr_stack, fun=sum)
                  sr_raster1 <- sr_raster
                  writeRaster(sr_raster, file = file.path(save_path, paste(as.name(paste("IS_SR_", d, "_", c, "_", m, "_", y, ".tif", sep = "")), sep = "", collapse = "--")), format = "GTiff", overwrite = TRUE)
                  vi1_raster <- sr_raster
                  vi1_raster[] <- 0
                  vi2_raster <- sr_raster
                  vi2_raster[] <- 0
                  vi3_raster <- sr_raster
                  vi3_raster[] <- 0
                  writeRaster(vi1_raster, file = file.path(save_path, paste(as.name(paste("IS_VI1_", d, "_", c, "_", m, "_", y, ".tif", sep = "")), sep = "", collapse = "--")), format = "GTiff", overwrite = TRUE)
                  writeRaster(vi2_raster, file = file.path(save_path, paste(as.name(paste("IS_VI2_", d, "_", c, "_", m, "_", y, ".tif", sep = "")), sep = "", collapse = "--")), format = "GTiff", overwrite = TRUE)
                  writeRaster(vi3_raster, file = file.path(save_path, paste(as.name(paste("IS_VI3_", d, "_", c, "_", m, "_", y, ".tif", sep = "")), sep = "", collapse = "--")), format = "GTiff", overwrite = TRUE)
                  sr_list <- ""
                  loss_list <- ""
                  stay_list <- ""
                  gain_list <- ""
                } else {					  
                  for (s in slist) {
                    dir_path <- file.path(isolate(G$SE_Dir_Project), "Species_Distribution", "test1", s, "BIOMOD2")
                    img <- file.path(dir_path, paste("PRED", "_", d, "_", c, "_", y, "_", s, "_", m, ".tif", sep = ""))
                    sr_list <- c(sr_list, img)
                    img <- file.path(dir_path, paste("LOSS_", "PRED", "_", d, "_", c, "_", y, "_", s, "_", m, ".tif", sep = ""))
                    loss_list <- c(loss_list, img)
                    img <- file.path(dir_path, paste("STAY_", "PRED", "_", d, "_", c, "_", y, "_", s, "_", m, ".tif", sep = ""))
                    stay_list <- c(stay_list, img)
                    img <- file.path(dir_path, paste("GAIN_", "PRED", "_", d, "_", c, "_", y, "_", s, "_", m, ".tif", sep = ""))
                    gain_list <- c(gain_list, img)
                  }
                  save_path <- isolate(G$IS_VA_Dir_Folder)
                  sr_list <- grep("PRED", sr_list, value = TRUE)
                  sr_stack <- stack(sr_list)
                  sr_raster <- overlay(sr_stack, fun=sum)
                  sr_raster2 <- sr_raster
                  losssr_raster <- sr_raster2 - sr_raster1
                  writeRaster(sr_raster, file = file.path(save_path, paste(as.name(paste("IS_SR_", d, "_", c, "_", m, "_", y, ".tif", sep = "")), sep = "", collapse = "--")), format = "GTiff", overwrite = TRUE)
                  writeRaster(losssr_raster, file = file.path(save_path, paste(as.name(paste("IS_VI1_", d, "_", c, "_", m, "_", y, ".tif", sep = "")), sep = "", collapse = "--")), format = "GTiff", overwrite = TRUE)
                  
                  loss_list <- grep("LOSS", loss_list, value = TRUE)
                  loss_stack <- stack(loss_list)
                  loss_raster <- overlay(loss_stack, fun=sum)
                  writeRaster(loss_raster, file = file.path(save_path, paste(as.name(paste("IS_LOSS_", d, "_", c, "_", m, "_", y, ".tif", sep = "")), sep = "", collapse = "--")), format = "GTiff", overwrite = TRUE)
                  
                  stay_list <- grep("STAY", stay_list, value = TRUE)
                  stay_stack <- stack(stay_list)
                  stay_raster <- overlay(stay_stack, fun=sum)
                  writeRaster(stay_raster, file = file.path(save_path, paste(as.name(paste("IS_STAY_", d, "_", c, "_", m, "_", y, ".tif", sep = "")), sep = "", collapse = "--")), format = "GTiff", overwrite = TRUE)
                  
                  gain_list <- grep("GAIN", gain_list, value = TRUE)
                  gain_stack <- stack(gain_list)
                  gain_raster <- overlay(gain_stack, fun=sum)
                  writeRaster(gain_raster, file = file.path(save_path, paste(as.name(paste("IS_GAIN_", d, "_", c, "_", m, "_", y, ".tif", sep = "")), sep = "", collapse = "--")), format = "GTiff", overwrite = TRUE)
                  
                  vi2_raster <- sr_raster
                  vi2_raster <- loss_raster / sr_raster1
                  writeRaster(vi2_raster, file = file.path(save_path, paste(as.name(paste("IS_VI2_", d, "_", c, "_", m, "_", y, ".tif", sep = "")), sep = "", collapse = "--")), format = "GTiff", overwrite = TRUE)
                  vi3_raster <- sr_raster
                  vi3_raster <- (1 - (loss_raster / sr_raster1)) + (gain_raster / (length(slist) - sr_raster1))
                  writeRaster(vi3_raster, file = file.path(save_path, paste(as.name(paste("IS_VI3_", d, "_", c, "_", m, "_", y, ".tif", sep = "")), sep = "", collapse = "--")), format = "GTiff", overwrite = TRUE)
                  
                  sr_list <- ""
                  loss_list <- ""
                  stay_list <- ""
                  gain_list <- ""
                }				    
              } 
            }
          }
        }
      }
    })
  })
  
  observeEvent(input$IS_VA_Action_Admin, {
    # setting Climate change scenarios, Future time, Species and current environmental path
    alist <- input$IS_VA_Admin
    dlist <- input$IS_CA_Climate_model  # c("KMA") # c("KMA", "KEI", "WORLDCLIM")
    clist <- input$IS_CA_Climate_scenario  # c("RCP4.5") # c("RCP4.5", "RCP8.5")
    #	dtlist <- input$IS_CA_Dispersal_type
    mlist <- input$IS_CA_SDM_model # c("PA1_Full_GLM_byROC")
    ylist <- input$IS_CA_Project_year
    slist <- input$IS_CA_Species
    vlist <- c("IS_SR", "IS_LOSS", "IS_STAY", "IS_GAIN", "IS_VI1", "IS_VI2", "IS_VI3") # c("IS_SR") # 
    
    n <- 0
    la <- length(alist)
    ls <- length(slist)
    ld <- length(dlist)
    lc <- length(clist)
    lm <- length(mlist)
    ly <- length(ylist)
    lv <- length(vlist)
    
    tl <- la * ld * lc * lm * ly * lv
    
    withProgress(message = paste("Grouping by ", input$IS_VA_Admin), value = 0, {
      
      dir_path <- isolate(G$IS_VA_Dir_Folder)
      
      for (a in alist) {
        poly <- readShapePoly(file.path(isolate(G$SE_Dir_Admin), paste(a, ".shp", sep = "")))
        df <- read.dbf(file.path(isolate(G$SE_Dir_Admin), paste(a, ".dbf", sep = "")))
        
        for (d in dlist) {
          for (c in clist) {
            for (m in mlist) {
              for (y in ylist) {
                if (length(ylist) > 1 && ylist[1] == "2000") {
                  if(y == ylist[1]) {
                    incProgress(1/tl, detail = paste("Doing part", d, "_", c, "_", m, "_", y, "_", vlist[1]))
                    img <- file.path(dir_path, paste(vlist[1], "_",  d, "_", c, "_", m, "_", y, ".tif", sep = ""))
                    r <- raster(img)
                    df1 <- extract(r, poly, fun = max, na.rm = FALSE, df = TRUE)
                    #write to a data frame
                    df1 <- data.frame(df1)
                    df1[is.na(df1)] <- 0
                    df <- cbind(df, df1[-1])
                  } else {
                    for (v in vlist) {
                      incProgress(1/tl, detail = paste("Doing part", d, "_", c, "_", m, "_", y, "_", v))
                      img <- file.path(dir_path, paste(v, "_",  d, "_", c, "_", m, "_", y, ".tif", sep = ""))
                      r <- raster(img)
                      df1 <- extract(r, poly, fun = max, na.rm = FALSE, df=TRUE)
                      #write to a data frame
                      df1 <- data.frame(df1[-1])
                      df1[is.na(df1)] <- 0
                      df <- cbind(df, df1)
                    }
                  }
                } 
              }
            }
          }
        }
        
        #write to a CSV file
        write.csv(df, file = file.path(dir_path, paste("IS_", a, ".csv", sep="")))
        write.dbf(df, file.path(isolate(G$SE_Dir_Admin), paste("O_", a, ".dbf", sep = "")))
      }
      
    })
  })
  
  output$IS_AO_Species <- renderUI({
    IS_Name_Species_list <- list.dirs(path = file.path(G$SE_Dir_Project, "Species_Distribution", 'test1'), full.names = FALSE, recursive = FALSE)
    IS_Name_Species_selected <- IS_Name_Species_list[1]
    selectInput("IS_AO_Species", "Select a species",
                choices = c(IS_Name_Species_list),
                selected = IS_Name_Species_selected
    )
  })
  
  observeEvent(input$IS_AO_Dir_Folder, {
    # volumes <- c(main = isolate(G$SE_Dir_Project))
    volumes <- getVolumes()
    shinyDirChoose(input, 'IS_AO_Dir_Folder', roots = volumes) # , defaultPath = "/MOTIVE_projects", defaultRoot = G$SE_Dir_Project)
    G$IS_AO_Dir_Folder <<- parseDirPath(volumes, input$IS_AO_Dir_Folder)
    output$IS_AO_Dir_Folder <- renderText({G$IS_AO_Dir_Folder})
  })
  
  output$IS_AO_SDM_model <- renderUI({
# <<<<<<< HEAD
    destfile <- file.path(G$SE_Dir_Project, "Species_Distribution", "test1", input$IS_AO_Species[1], "BIOMOD2", paste(as.name(paste(input$IS_AO_Species, "_ALL_eval.csv", sep = "")), sep = "", collapse = "--"))
# =======
#     validate(
#       need(input$data !="", "Please Select Data Folder...")
#     )
#     destfile <- file.path(G$SE_Dir_Project, "Species_Distribution", input$IS_CA_Species[1], "BIOMOD2", paste(as.name(paste(input$IS_CA_Species, "_ALL_eval.csv", sep = "")), sep = "", collapse = "--"))
# >>>>>>> lx02jd2
    all_eval <- read.csv(destfile)
    G_FILE_species_evaluation <<- all_eval
    IS_Name_Models_list <- as.character(G_FILE_species_evaluation$Prediction)
    IS_Name_Models_selected <- IS_Name_Models_list[1]
    radioButtons("IS_AO_SDM_model", "Select models",
                 choices = c(IS_Name_Models_list),
                 selected = IS_Name_Models_selected
    )
  })
  
  output$IS_AO_SD_Map <- renderLeaflet({
# <<<<<<< HEAD
    dir_path <- file.path(G$SE_Dir_Project, "Species_Distribution", "test1", input$IS_AO_Species, "BIOMOD2")
# =======
#     validate(
#       need(input$data !="", "Please Select Data Folder...")
#     )
#     dir_path <- file.path(G$SE_Dir_Project, "Species_Distribution", input$IS_AO_Species, "BIOMOD2")
# >>>>>>> lx02jd2
    Map <- paste("PRED", "_", input$IS_AO_Climate_model, "_", input$IS_AO_Climate_scenario, "_", input$IS_AO_Project_year, "_", input$IS_AO_Species, "_", input$IS_AO_SDM_model, ".tif", sep = "")
    r <- raster(file.path(dir_path, Map))
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
      setView(lng = 127.00, lat = 36.00, zoom = 7)
  })  
  
  output$IS_AO_SD_Summary <- renderPrint({
    dir_path <- file.path(G$SE_Dir_Project, "Species_Distribution", "test1", input$IS_AO_Species, "BIOMOD2")
    Map <- paste("PRED", "_", input$IS_AO_Climate_model, "_", input$IS_AO_Climate_scenario, "_", input$IS_AO_Project_year, "_", input$IS_AO_Species, "_", input$IS_AO_SDM_model, ".tif", sep = "")
    r <- raster(file.path(dir_path, Map))
    summary(r)
  })
  
  output$IS_AO_SD_Histogram <- renderPlot({
    dir_path <- file.path(G$SE_Dir_Project, "Species_Distribution", "test1", input$IS_AO_Species, "BIOMOD2")
    Map <- paste("PRED", "_", input$IS_AO_Climate_model, "_", input$IS_AO_Climate_scenario, "_", input$IS_AO_Project_year, "_", input$IS_AO_Species, "_", input$IS_AO_SDM_model, ".tif", sep = "")
    x <- raster(file.path(dir_path, Map))
    
    hist(x, # breaks = bins, 
         col="orange",
         border="brown",
         xlab = "Predicted Value",
         main = "Histogram")
  })
  
  
  output$IS_AO_UI_plot1 <- renderUI({
    
    # setting Climate change scenarios, Future time, Species and current environmental path
    #    slist <- input$IS_AO_Species
    olist <- input$IS_AO_Output_option1
    dlist <- input$IS_AO_Climate_model  # c("KMA") # c("KMA", "KEI", "WORLDCLIM")
    clist <- input$IS_AO_Climate_scenario  # c("RCP4.5") # c("RCP4.5", "RCP8.5")
    mlist <- input$IS_AO_SDM_model # c("PA1_Full_GLM_byROC")
    ylist <- input$IS_AO_Project_year
    #	dtlist <- input$SS_AO_Dispersal_type
    
    #    ls <- length(slist)
    lo <- length(olist)
    ld <- length(dlist)
    lc <- length(clist)
    lm <- length(mlist)
    ly <- length(ylist)
    
    tl <- lo * ld * lc * lm * ly
    nc <- 2
    if (tl <  2) {
      nr <- round(tl / nc) + 1
    } else {
      nr <- round((tl + 0.1) / nc)
    }
    
    ws <- nc * 500
    hs <- nr * 500
    
    plotOutput("IS_AO_UI_plot1", width = ws, height = hs)
    
  })
  
  output$IS_AO_UI_plot1 <- renderPlot({
    # setting Climate change scenarios, Future time, Species and current environmental path
    #    slist <- input$IS_AO_Species
    olist <- input$IS_AO_Output_option1
    dlist <- input$IS_AO_Climate_model  # c("KMA") # c("KMA", "KEI", "WORLDCLIM")
    clist <- input$IS_AO_Climate_scenario  # c("RCP4.5") # c("RCP4.5", "RCP8.5")
    mlist <- input$IS_AO_SDM_model # c("PA1_Full_GLM_byROC")
    ylist <- input$IS_AO_Project_year
    #	dtlist <- input$SS_AO_Dispersal_type
    
    #    ls <- length(slist)
    lo <- length(olist)
    ld <- length(dlist)
    lc <- length(clist)
    lm <- length(mlist)
    ly <- length(ylist)
    
    tl <- lo * ld * lc * lm * ly
    nc <- 2
    if (tl <  2) {
      nr <- round(tl / nc) + 1
    } else {
      nr <- round((tl + 0.1) / nc)
    }
    
    par(mfrow = c(nr,nc), cex.main = 1.2)
    dir_path <- file.path(isolate(G$IS_AO_Dir_Folder))
    # dir_path <- "C:/MOTIVE_projects/proj1/Invasive_Species/test3"
    dir_path <- G_dir_path
    #		dir_path <- file.path(G$IS_AO_Dir_Folder)
    for (o in olist) {
      for (d in dlist) {
        for (c in clist) {
          for (m in mlist) {
            for (y in ylist) {
              if (ly > 0) {
                Map1 <- paste(o, "_", d, "_", c, "_", m, "_", y, ".tif", sep = "")
                R_Map1 <- raster(file.path(dir_path, Map1))
                plot(R_Map1, main = Map1)
              }
            }
          }
        }
      }
    }
  })
  
  output$IS_AO_UI_plot2 <- renderPlot({
    # setting Climate change scenarios, Future time, Species and current environmental path
    #    slist <- input$IS_AO_Species
    olist <- input$IS_AO_Output_option2
    dlist <- input$IS_AO_Climate_model  # c("KMA") # c("KMA", "KEI", "WORLDCLIM")
    clist <- input$IS_AO_Climate_scenario  # c("RCP4.5") # c("RCP4.5", "RCP8.5")
    mlist <- input$IS_AO_SDM_model # c("PA1_Full_GLM_byROC")
    ylist <- input$IS_AO_Project_year
    #	dtlist <- input$SS_AO_Dispersal_type
    
    #    ls <- length(slist)
    lo <- length(olist)
    ld <- length(dlist)
    lc <- length(clist)
    lm <- length(mlist)
    ly <- length(ylist)
    
    tl <- lo * ld * lc * lm * ly
    nc <- 2
    if (tl <  2) {
      nr <- round(tl / nc) + 1
    } else {
      nr <- round((tl + 0.1) / nc)
    }
    
    par(mfrow = c(nr,nc), cex.main = 1.2)
    
    for (o in olist) {
      for (d in dlist) {
        for (c in clist) {
          for (m in mlist) {
            for (y in ylist) {
              if (ly > 0) {
                Map1 <- paste(o, "_", d, "_", c, "_", m, "_", y, ".tif", sep = "")
                #								R_Map1 <- raster(file.path(isolate(G$IS_AO_Dir_Folder), Map1))
                R_Map1 <- raster(file.path(G$IS_AO_Dir_Folder, Map1))
                plot(R_Map1, main = Map1)
              }
            }
          }
        }
      }
    }
  })
  
  output$IS_AO_SR_Map <- renderLeaflet({
    
    # setting Climate change scenarios, Future time, Species and current environmental path
    #    slist <- input$IS_AO_Species
    olist <- c("IS_SR")  # input$IS_AO_Output_option1
    dlist <- input$IS_AO_Climate_model  # c("KMA") # c("KMA", "KEI", "WORLDCLIM")
    clist <- input$IS_AO_Climate_scenario  # c("RCP4.5") # c("RCP4.5", "RCP8.5")
    mlist <- input$IS_AO_SDM_model # c("PA1_Full_GLM_byROC")
    ylist <- input$IS_AO_Project_year
    #	dtlist <- input$SS_AO_Dispersal_type
    
    #    ls <- length(slist)
    lo <- length(olist)
    ld <- length(dlist)
    lc <- length(clist)
    lm <- length(mlist)
    ly <- length(ylist)
    
    tl <- lo * ld * lc * lm * ly
    nc <- 2
    if (tl <  2) {
      nr <- round(tl / nc) + 1
    } else {
      nr <- round((tl + 0.1) / nc)
    }
    
    #    par(mfrow = c(nr,nc), cex.main = 1.2)
    
    for (o in olist) {
      for (d in dlist) {
        for (c in clist) {
          for (m in mlist) {
            for (y in ylist) {
              if (ly > 0) {
                Map1 <- paste(o, "_", d, "_", c, "_", m, "_", y, ".tif", sep = "")
                #                R_Map1 <- raster(file.path(isolate(G$IS_AO_Dir_Folder), Map1))
                # r <- raster(file.path(isolate(G$IS_AO_Dir_Folder), Map1))
                r <- raster(file.path(test3_Invasive_Dir, Map1))
                #                plot(R_Map1, main = Map1)
              }
            }
          }
        }
      }
    }
    
    crs(r) <- CRS("+proj=longlat +datum=WGS84 +ellps=WGS84 +towgs84=0,0,0")
    
    pal <- colorNumeric(c("#0C2C84", "#FFFFCC", "#41B6C4"), values(r),
                        na.color = "transparent")
    
    leaflet() %>%
      addTiles(
        urlTemplate = "//{s}.tiles.mapbox.com/v3/jcheng.map-5ebohr46/{z}/{x}/{y}.png",
        attribution = 'Maps by <a href="http://www.mapbox.com/">Mapbox</a>'
      ) %>%        
      
      addRasterImage(r, colors = pal, opacity = 0.8) %>%
      addLegend(pal = pal, values = values(r), title = "Legend", position = "bottomright")  %>%
      
      setView(lng = 128.00, lat = 36.00, zoom = 7)
  })
  
  output$IS_AO_SR_SIDO_Map <- renderLeaflet({
    
    poly <- readOGR(file.path(isolate(G$IS_AO_Dir_Folder), paste("SD", ".shp", sep = "")))
    x <- read.csv(file.path(isolate(G$IS_AO_Dir_Folder), paste("IS_SD", ".csv", sep = "")))
    names(poly) <- c(names(x)[-1])
    X_NAME <- names(poly[5])
    V_NAME <- paste("IS_SR_", input$IS_AO_Climate_model, "_", input$IS_AO_Climate_scenario, "_", input$IS_AO_SDM_model, "_", input$IS_AO_Project_year, sep = "")
    
    bins <- c(0, 1, 2, 3, 4, 5, Inf)
    pal <- colorBin("YlOrRd", domain = poly[[V_NAME]], bins = bins)
    
    labels <- sprintf(
      "<strong>%s</strong><br/>%g Species", # people / mi<sup>2</sup>",
      poly[[X_NAME]], poly[[V_NAME]]
    ) %>% lapply(htmltools::HTML)
    
    leaflet(poly) %>%
      setView(lng = 128.00, lat = 36.00, zoom = 7) %>%
      addProviderTiles("MapBox", options = providerTileOptions(
        id = "mapbox.light",
        accessToken = Sys.getenv('MAPBOX_ACCESS_TOKEN'))) %>%
      addTiles(
        urlTemplate = "//{s}.tiles.mapbox.com/v3/jcheng.map-5ebohr46/{z}/{x}/{y}.png",
        attribution = 'Maps by <a href="http://www.mapbox.com/">Mapbox</a>'
      ) %>%   
      addPolygons(
        fillColor = ~pal(poly[[V_NAME]]),
        weight = 2,
        opacity = 1,
        color = "grey",
        dashArray = "3",
        fillOpacity = 0.7,
        highlight = highlightOptions(
          weight = 5,
          color = "#666",
          dashArray = "",
          fillOpacity = 0.7,
          bringToFront = TRUE),
        label = labels,
        labelOptions = labelOptions(
          style = list("font-weight" = "normal", padding = "3px 8px"),
          textsize = "15px",
          direction = "auto")) %>%
      addLegend(pal = pal, values = ~poly[[V_NAME]], opacity = 0.7, title = NULL,
                position = "bottomright")
  })
  
  # output$IS_AO_SR_SIDO_Map <- renderLeaflet({
  #   
  #   poly <- readOGR(file.path(isolate(G$SE_Dir_Admin), paste("O_SD", ".shp", sep = "")))
  #   x <- read.csv(file.path(isolate(G$IS_AO_Dir_Folder), paste("IS_SD", ".csv", sep = "")))
  #   # x <- test3_Invasive_F("IS_SD")
  #   names(poly) <- c(names(x))
  #   X_NAME <- names(poly[5])
  #   V_NAME <- paste("IS_SR_", input$IS_AO_Climate_model, "_", input$IS_AO_Climate_scenario, "_", input$IS_AO_SDM_model, "_", input$IS_AO_Project_year, sep = "")
  #   
  #   bins <- c(0, 1, 2, 3, 4, 5, Inf)
  #   pal <- colorBin("YlOrRd", domain = poly[[V_NAME]], bins = bins)
  #   
  #   labels <- sprintf(
  #     "<strong>%s</strong><br/>%g people / mi<sup>2</sup>",
  #     poly[[X_NAME]], poly[[V_NAME]]
  #   ) %>% lapply(htmltools::HTML)
  #   
  #   leaflet(poly) %>%
  #     setView(lng = 128.00, lat = 36.00, zoom = 7) %>%
  #     addProviderTiles("MapBox", options = providerTileOptions(
  #       id = "mapbox.light",
  #       accessToken = Sys.getenv('MAPBOX_ACCESS_TOKEN'))) %>%
  #     addTiles(
  #       urlTemplate = "//{s}.tiles.mapbox.com/v3/jcheng.map-5ebohr46/{z}/{x}/{y}.png",
  #       attribution = 'Maps by <a href="http://www.mapbox.com/">Mapbox</a>'
  #     ) %>%   
  #     addPolygons(
  #       fillColor = ~pal(poly[[V_NAME]]),
  #       weight = 2,
  #       opacity = 1,
  #       color = "grey",
  #       dashArray = "3",
  #       fillOpacity = 0.7,
  #       highlight = highlightOptions(
  #         weight = 5,
  #         color = "#666",
  #         dashArray = "",
  #         fillOpacity = 0.7,
  #         bringToFront = TRUE),
  #       label = labels,
  #       labelOptions = labelOptions(
  #         style = list("font-weight" = "normal", padding = "3px 8px"),
  #         textsize = "15px",
  #         direction = "auto")) %>%
  #     addLegend(pal = pal, values = ~poly[[V_NAME]], opacity = 0.7, title = NULL,
  #               position = "bottomright")
  # })
  
  output$IS_AO_SR_SIDO_Stat <- renderPlot({
    
    df <- read.csv(file.path(isolate(G$IS_AO_Dir_Folder), paste("IS_SD", ".csv", sep = "")))
    # df <- test3_Invasive_F("IS_SD")
    X_NAME <- names(df[5])
    V_NAME <- paste("IS_SR_", input$IS_AO_Climate_model, "_", input$IS_AO_Climate_scenario, "_", input$IS_AO_SDM_model, "_", input$IS_AO_Project_year, sep="")
    
    
    #		df2 <- data.frame(시도 = rep(c("서울", "경기도"), each=3),
    #							연도 = rep(c("Current", "2030", "2050"),2),
    #							외래종 = c(6.8, 15, 33, 4.2, 10, 29.5))
    #		head(df2)
    
    ggplot(data=df, aes(x=df[[X_NAME]], y=df[[V_NAME]])) + #, fill=df[[X_NAME]])) +
      geom_bar(stat="identity", position=position_dodge()) +
      geom_text(aes(label=df[[V_NAME]]), vjust=1.6, color="white",
                position = position_dodge(0.9), size=3.5) +
      scale_fill_brewer(palette="Paired") +
      theme_minimal() +
      coord_flip() +
      labs(title = "시도 외래종 분포") + labs(x = "시도") + labs(y = "외래종수")
    
    # ggplot(data=df, aes(x=df[[X_NAME]], y=df[[V_NAME]])) + #, fill=df[[X_NAME]])) +
    #   geom_bar(stat="identity", position=position_dodge()) +
    #   geom_text(aes(label=df[[V_NAME]]), vjust=1.6, color="white",
    #             position = position_dodge(0.9), size=3.5) +
    #   scale_fill_brewer(palette="Paired") +
    #   theme_minimal() +
    #   coord_flip()
  })
  #	geom_text(aes(label = Vulnerability_Area_Loss_Ratio), size = 3, hjust = 0.5, vjust = 3) + 
  
  output$IS_AO_SR_SGG_Map <- renderLeaflet({
    poly <- readOGR(file.path(isolate(G$SE_Dir_GIS), paste("O_SGG", ".shp", sep = "")))
    x <- read.csv(file.path(isolate(G$IS_AO_Dir_Folder), paste("IS_SGG", ".csv", sep = "")))
    names(poly) <- c(names(x[-1]))
    X_NAME <- names(poly[2])
    V_NAME <- paste("IS_SR_", input$IS_AO_Climate_model, "_", input$IS_AO_Climate_scenario, "_", input$IS_AO_SDM_model, "_", input$IS_AO_Project_year, sep = "")
    
    #	  bins <- c(0, 1, 2, 3, 4, 5, Inf)
    pal <- colorBin("YlOrRd", domain = poly[[V_NAME]], bins = 7)
    
    labels <- sprintf(
      "<strong>%s</strong><br/>%g people / mi<sup>2</sup>",
      poly[[X_NAME]], poly[[V_NAME]]
    ) %>% lapply(htmltools::HTML)
    
    leaflet(poly) %>%
      setView(lng = 128.00, lat = 36.00, zoom = 7) %>%
      addProviderTiles("MapBox", options = providerTileOptions(
        id = "mapbox.light",
        accessToken = Sys.getenv('MAPBOX_ACCESS_TOKEN'))) %>%
      addTiles(
        urlTemplate = "//{s}.tiles.mapbox.com/v3/jcheng.map-5ebohr46/{z}/{x}/{y}.png",
        attribution = 'Maps by <a href="http://www.mapbox.com/">Mapbox</a>'
      ) %>%   
      addPolygons(
        fillColor = ~pal(poly[[V_NAME]]),
        weight = 2,
        opacity = 1,
        color = "grey",
        dashArray = "3",
        fillOpacity = 0.7,
        highlight = highlightOptions(
          weight = 5,
          color = "#666",
          dashArray = "",
          fillOpacity = 0.7,
          bringToFront = TRUE),
        label = labels,
        labelOptions = labelOptions(
          style = list("font-weight" = "normal", padding = "3px 8px"),
          textsize = "15px",
          direction = "auto")) %>%
      addLegend(pal = pal, values = ~poly[[V_NAME]], opacity = 0.7, title = NULL,
                position = "bottomright")
  })
  
  # output$IS_AO_SR_SGG_Map <- renderLeaflet({
  #   poly <- readOGR(file.path(isolate(G$SE_Dir_Admin), paste("O_SGG", ".shp", sep = "")))
  #   x <- read.csv(file.path(isolate(G$IS_AO_Dir_Folder), paste("IS_SGG", ".csv", sep = "")))
  #   # x <- read.csv(file.path("C:\\MOTIVE_projects\\proj1\\Invasive_Species\\test3", paste("IS_SGG", ".csv", sep = "")))
  #   # x <- test3_Invasive_F("IS_SGG");
  #   
  #   names(poly) <- c(names(x[-1]))
  #   X_NAME <- names(poly[2])
  #   V_NAME <- paste("IS_SR_", input$IS_AO_Climate_model, "_", input$IS_AO_Climate_scenario, "_", input$IS_AO_SDM_model, "_", input$IS_AO_Project_year, sep = "")
  #   
  #   #	  bins <- c(0, 1, 2, 3, 4, 5, Inf)
  #   pal <- colorBin("YlOrRd", domain = poly[[V_NAME]], bins = 7)
  #   
  #   labels <- sprintf(
  #     "<strong>%s</strong><br/>%g people / mi<sup>2</sup>",
  #     poly[[X_NAME]], poly[[V_NAME]]
  #   ) %>% lapply(htmltools::HTML)
  #   
  #   leaflet(poly) %>%
  #     setView(lng = 128.00, lat = 36.00, zoom = 7) %>%
  #     addProviderTiles("MapBox", options = providerTileOptions(
  #       id = "mapbox.light",
  #       accessToken = Sys.getenv('MAPBOX_ACCESS_TOKEN'))) %>%
  #     addTiles(
  #       urlTemplate = "//{s}.tiles.mapbox.com/v3/jcheng.map-5ebohr46/{z}/{x}/{y}.png",
  #       attribution = 'Maps by <a href="http://www.mapbox.com/">Mapbox</a>'
  #     ) %>%   
  #     addPolygons(
  #       fillColor = ~pal(poly[[V_NAME]]),
  #       weight = 2,
  #       opacity = 1,
  #       color = "grey",
  #       dashArray = "3",
  #       fillOpacity = 0.7,
  #       highlight = highlightOptions(
  #         weight = 5,
  #         color = "#666",
  #         dashArray = "",
  #         fillOpacity = 0.7,
  #         bringToFront = TRUE),
  #       label = labels,
  #       labelOptions = labelOptions(
  #         style = list("font-weight" = "normal", padding = "3px 8px"),
  #         textsize = "15px",
  #         direction = "auto")) %>%
  #     addLegend(pal = pal, values = ~poly[[V_NAME]], opacity = 0.7, title = NULL,
  #               position = "bottomright")
  # })
  
  output$IS_AO_SR_SGG_Stat <- renderPlot({
    
    #	  df <- read.csv(file.path(isolate(G$IS_AO_Dir_Folder), paste("IS_", input$IS_VA_Admin, ".csv", sep = "")))
    df <- read.dbf(file.path(isolate(G$SE_Dir_Admin), paste("O_SGG", ".dbf", sep = "")))
    df[df[, 2] == "gun",]
    # x <- read.csv(file.path(isolate(G$IS_AO_Dir_Folder), paste("IS_SGG", ".csv", sep = "")))
    x <- test3_Invasive_F("IS_SGG")
    names(df) <- c(names(x[-1]))
    X_NAME <- names(df[2])
    V_NAME <- paste("IS_SR_", input$IS_AO_Climate_model, "_", input$IS_AO_Climate_scenario, "_", input$IS_AO_SDM_model, "_", input$IS_AO_Project_year, sep="")
    
    
    #		df2 <- data.frame(시도 = rep(c("서울", "경기도"), each=3),
    #							연도 = rep(c("Current", "2030", "2050"),2),
    #							외래종 = c(6.8, 15, 33, 4.2, 10, 29.5))
    #		head(df2)
    
    ggplot(data=df, aes(x=df[[X_NAME]], y=df[[V_NAME]])) + #, fill=df[[X_NAME]])) +
      geom_bar(stat="identity", position=position_dodge()) +
      geom_text(aes(label=df[[V_NAME]]), vjust=1.6, color="white",
                position = position_dodge(0.9), size=3.5) +
      scale_fill_brewer(palette="Paired") +
      theme_minimal() +
      coord_flip()
  })
  
  output$IS_AO_SI_Map <- renderLeaflet({
    
    # setting Climate change scenarios, Future time, Species and current environmental path
    #    slist <- input$IS_AO_Species
    olist <- c("IS_GAIN")  # input$IS_AO_Output_option1
    dlist <- input$IS_AO_Climate_model  # c("KMA") # c("KMA", "KEI", "WORLDCLIM")
    clist <- input$IS_AO_Climate_scenario  # c("RCP4.5") # c("RCP4.5", "RCP8.5")
    mlist <- input$IS_AO_SDM_model # c("PA1_Full_GLM_byROC")
    ylist <- input$IS_AO_Project_year
    #	dtlist <- input$SS_AO_Dispersal_type
    
    #    ls <- length(slist)
    lo <- length(olist)
    ld <- length(dlist)
    lc <- length(clist)
    lm <- length(mlist)
    ly <- length(ylist)
    
    tl <- lo * ld * lc * lm * ly
    nc <- 2
    if (tl <  2) {
      nr <- round(tl / nc) + 1
    } else {
      nr <- round((tl + 0.1) / nc)
    }
    
    #    par(mfrow = c(nr,nc), cex.main = 1.2)
    
    for (o in olist) {
      for (d in dlist) {
        for (c in clist) {
          for (m in mlist) {
            for (y in ylist) {
              if (ly > 0) {
                Map1 <- paste(o, "_", d, "_", c, "_", m, "_", y, ".tif", sep = "")
                #                R_Map1 <- raster(file.path(isolate(G$IS_AO_Dir_Folder), Map1))
                r <- raster(file.path(isolate(G$IS_AO_Dir_Folder), Map1))
                #                plot(R_Map1, main = Map1)
              }
            }
          }
        }
      }
    }
    
    crs(r) <- CRS("+proj=longlat +datum=WGS84 +ellps=WGS84 +towgs84=0,0,0")
    
    pal <- colorNumeric(c("#0C2C84", "#FFFFCC", "#41B6C4"), values(r),
                        na.color = "transparent")
    
    leaflet() %>%
      addTiles(
        urlTemplate = "//{s}.tiles.mapbox.com/v3/jcheng.map-5ebohr46/{z}/{x}/{y}.png",
        attribution = 'Maps by <a href="http://www.mapbox.com/">Mapbox</a>'
      ) %>%        
      
      addRasterImage(r, colors = pal, opacity = 0.8) %>%
      addLegend(pal = pal, values = values(r), title = "Legend")  %>%
      
      setView(lng = 128.00, lat = 36.00, zoom = 7)
  })
  
  
  output$IS_AO_SI_SIDO_Map <- renderLeaflet({
    
    poly <- readOGR(file.path(isolate(G$SE_Dir_Admin), paste("O_SD", ".shp", sep = "")))
    # x <- read.csv(file.path(isolate(G$IS_AO_Dir_Folder), paste("IS_SD", ".csv", sep = "")))
    x <- test3_Invasive_F("IS_SD")
    names(poly) <- c(names(x))
    X_NAME <- names(poly[5])
    V_NAME <- paste("IS_GAIN_", input$IS_AO_Climate_model, "_", input$IS_AO_Climate_scenario, "_", input$IS_AO_SDM_model, "_", input$IS_AO_Project_year, sep = "")
    
    bins <- c(0, 1, 2, 3, 4, 5, Inf)
    pal <- colorBin("YlOrRd", domain = poly[[V_NAME]], bins = bins)
    
    labels <- sprintf(
      "<strong>%s</strong><br/>%g people / mi<sup>2</sup>",
      poly[[X_NAME]], poly[[V_NAME]]
    ) %>% lapply(htmltools::HTML)
    
    leaflet(poly) %>%
      setView(lng = 128.00, lat = 36.00, zoom = 7) %>%
      addProviderTiles("MapBox", options = providerTileOptions(
        id = "mapbox.light",
        accessToken = Sys.getenv('MAPBOX_ACCESS_TOKEN'))) %>%
      addTiles(
        urlTemplate = "//{s}.tiles.mapbox.com/v3/jcheng.map-5ebohr46/{z}/{x}/{y}.png",
        attribution = 'Maps by <a href="http://www.mapbox.com/">Mapbox</a>'
      ) %>%   
      addPolygons(
        fillColor = ~pal(poly[[V_NAME]]),
        weight = 2,
        opacity = 1,
        color = "grey",
        dashArray = "3",
        fillOpacity = 0.7,
        highlight = highlightOptions(
          weight = 5,
          color = "#666",
          dashArray = "",
          fillOpacity = 0.7,
          bringToFront = TRUE),
        label = labels,
        labelOptions = labelOptions(
          style = list("font-weight" = "normal", padding = "3px 8px"),
          textsize = "15px",
          direction = "auto")) %>%
      addLegend(pal = pal, values = ~poly[[V_NAME]], opacity = 0.7, title = NULL,
                position = "bottomright")
  })
  
  output$IS_AO_SI_SIDO_Stat <- renderPlot({
    
    # df <- read.csv(file.path(isolate(G$IS_AO_Dir_Folder), paste("IS_SD", ".csv", sep = "")))
    df <- test3_Invasive_F("IS_SD")
    X_NAME <- names(df[5])
    V_NAME <- paste("IS_GAIN_", input$IS_AO_Climate_model, "_", input$IS_AO_Climate_scenario, "_", input$IS_AO_SDM_model, "_", input$IS_AO_Project_year, sep="")
    
    
    #		df2 <- data.frame(시도 = rep(c("서울", "경기도"), each=3),
    #							연도 = rep(c("Current", "2030", "2050"),2),
    #							외래종 = c(6.8, 15, 33, 4.2, 10, 29.5))
    #		head(df2)
    
    ggplot(data=df, aes(x=df[[X_NAME]], y=df[[V_NAME]])) + #, fill=df[[X_NAME]])) +
      geom_bar(stat="identity", position=position_dodge()) +
      geom_text(aes(label=df[[V_NAME]]), vjust=1.6, color="white",
                position = position_dodge(0.9), size=3.5) +
      scale_fill_brewer(palette="Paired") +
      theme_minimal()
  })
  #	geom_text(aes(label = Vulnerability_Area_Loss_Ratio), size = 3, hjust = 0.5, vjust = 3) + 
  
  output$IS_AO_SI_SGG_Map <- renderLeaflet({
    poly <- readOGR(file.path(isolate(G$SE_Dir_Admin), paste("O_SGG", ".shp", sep = "")))
    # x <- read.csv(file.path(isolate(G$IS_AO_Dir_Folder), paste("IS_SGG", ".csv", sep = "")))
    x <- test3_Invasive_F("IS_SGG")
    names(poly) <- c(names(x[-1]))
    X_NAME <- names(poly[2])
    V_NAME <- paste("IS_GAIN_", input$IS_AO_Climate_model, "_", input$IS_AO_Climate_scenario, "_", input$IS_AO_SDM_model, "_", input$IS_AO_Project_year, sep = "")
    
    #	  bins <- c(0, 1, 2, 3, 4, 5, Inf)
    pal <- colorBin("YlOrRd", domain = poly[[V_NAME]], bins = 7)
    
    labels <- sprintf(
      "<strong>%s</strong><br/>%g people / mi<sup>2</sup>",
      poly[[X_NAME]], poly[[V_NAME]]
    ) %>% lapply(htmltools::HTML)
    
    leaflet(poly) %>%
      setView(lng = 128.00, lat = 36.00, zoom = 7) %>%
      addProviderTiles("MapBox", options = providerTileOptions(
        id = "mapbox.light",
        accessToken = Sys.getenv('MAPBOX_ACCESS_TOKEN'))) %>%
      addTiles(
        urlTemplate = "//{s}.tiles.mapbox.com/v3/jcheng.map-5ebohr46/{z}/{x}/{y}.png",
        attribution = 'Maps by <a href="http://www.mapbox.com/">Mapbox</a>'
      ) %>%   
      addPolygons(
        fillColor = ~pal(poly[[V_NAME]]),
        weight = 2,
        opacity = 1,
        color = "grey",
        dashArray = "3",
        fillOpacity = 0.7,
        highlight = highlightOptions(
          weight = 5,
          color = "#666",
          dashArray = "",
          fillOpacity = 0.7,
          bringToFront = TRUE),
        label = labels,
        labelOptions = labelOptions(
          style = list("font-weight" = "normal", padding = "3px 8px"),
          textsize = "15px",
          direction = "auto")) %>%
      addLegend(pal = pal, values = ~poly[[V_NAME]], opacity = 0.7, title = NULL,
                position = "bottomright")
  })
  
  output$IS_AO_SI_SGG_Stat <- renderPlot({
    
    #	  df <- read.csv(file.path(isolate(G$IS_AO_Dir_Folder), paste("IS_", input$IS_VA_Admin, ".csv", sep = "")))
    df <- read.dbf(file.path(isolate(G$SE_Dir_Admin), paste("O_SGG", ".dbf", sep = "")))
    df[df[, 2] == "gun",]
    # x <- read.csv(file.path(isolate(G$IS_AO_Dir_Folder), paste("IS_SGG", ".csv", sep = "")))
    x <- test3_Invasive_F("IS_SGG")
    names(df) <- c(names(x[-1]))
    X_NAME <- names(df[2])
    V_NAME <- paste("SI_GAIN_", input$IS_AO_Climate_model, "_", input$IS_AO_Climate_scenario, "_", input$IS_AO_SDM_model, "_", input$IS_AO_Project_year, sep="")
    
    
    #		df2 <- data.frame(시도 = rep(c("서울", "경기도"), each=3),
    #							연도 = rep(c("Current", "2030", "2050"),2),
    #							외래종 = c(6.8, 15, 33, 4.2, 10, 29.5))
    #		head(df2)
    
    ggplot(data=df, aes(x=df[[X_NAME]], y=df[[V_NAME]])) + #, fill=df[[X_NAME]])) +
      geom_bar(stat="identity", position=position_dodge()) +
      geom_text(aes(label=df[[V_NAME]]), vjust=1.6, color="white",
                position = position_dodge(0.9), size=3.5) +
      scale_fill_brewer(palette="Paired") +
      theme_minimal()
  })
  
  output$VH_CA_Species <- renderUI({
    input$reset_VH_CA
    VH_Name_Species_lVHt <- test1_WD_List_Dirs
    VH_Name_Species_selected <- VH_Name_Species_lVHt[1]
    checkboxGroupInput("VH_CA_Species", "Select a species",
                       choices = c(VH_Name_Species_lVHt),
                       selected = VH_Name_Species_selected
    )
  })
  
  output$VH_CA_SDM_model <- renderUI({
    destfile <- file.path(G$SE_Dir_Project, "Species_Distribution", "test1", input$VH_CA_Species, "BIOMOD2", paste(as.name(paste(input$VH_CA_Species, "_ALL_eval.csv", sep = "")), sep = "", collapse = "--"))
    all_eval <- read.csv(destfile)
    G_FILE_species_evaluation <<- all_eval
    VH_Name_Models_lVHt <- as.character(G_FILE_species_evaluation$Prediction)
    VH_Name_Models_selected <- VH_Name_Models_lVHt[1]
    checkboxGroupInput("VH_CA_SDM_model", "Select models",
                       choices = c(VH_Name_Models_lVHt),
                       selected = VH_Name_Models_selected
    )
  })
  
  output$VH_AO_Species <- renderUI({
    input$reset_VH_AO
    VH_Name_Species_lVHt <- test1_WD_List_Dirs
    VH_Name_Species_selected <- VH_Name_Species_lVHt[1]
    checkboxGroupInput("VH_AO_Species", "Select a species",
                       choices = c(VH_Name_Species_lVHt),
                       selected = VH_Name_Species_selected
    )
  })
  
  observeEvent(input$VH_AO_Dir_Folder, {
    volumes <- c(main = isolate(G$SE_Dir_Project))
    shinyDirChoose(input, 'VH_AO_Dir_Folder', roots = volumes) # , defaultPath = "/MOTIVE_projects", defaultRoot = G$SE_Dir_Project)
    G$VH_AO_Dir_Folder <<- parseDirPath(volumes, input$VH_AO_Dir_Folder)
    output$VH_AO_Dir_Folder <- renderText({G$VH_AO_Dir_Folder})
  })
  
  output$VH_AO_SDM_model <- renderUI({
    input$reset_VH_AO
    destfile <- file.path(G$SE_Dir_Project, "Species_Distribution", "test1", input$VH_AO_Species, "BIOMOD2", paste(as.name(paste(input$VH_AO_Species, "_ALL_eval.csv", sep = "")), sep = "", collapse = "--"))
    all_eval <- read.csv(destfile)
    G_FILE_species_evaluation <<- all_eval
    VH_Name_Models_lVHt <- as.character(G_FILE_species_evaluation$Prediction)
    VH_Name_Models_selected <- VH_Name_Models_lVHt[1]
    radioButtons("VH_AO_SDM_model", "Select models",
                 choices = c(VH_Name_Models_lVHt),
                 selected = VH_Name_Models_selected
    )
  })
  
  
  
  
  output$VH_OU_SR_Habitat_Stat <- renderPlot({
    df2 <- data.frame(서식지 = rep(c("백두대간", "지리산국립공원"), each=3),
                         연도 = rep(c("Current", "2030", "2050"),2),
                         종수 = c(6.8, 15, 33, 4.2, 10, 29.5))
    head(df2)
    
    ggplot(data=df2, aes(x=연도, y=종수, fill=서식지)) +
      geom_bar(stat="identity", position=position_dodge())+
      geom_text(aes(label=종수), vjust=1.6, color="white",
                position = position_dodge(0.9), size=3.5)+
      scale_fill_brewer(palette="Paired")+
      theme_minimal()
  })
  
  output$VH_AO_SR_Map <- renderLeaflet({
    
    # setting Climate change scenarios, Future time, Species and current environmental path
    #    slist <- input$IS_AO_Species
    olist <- c("IS_SR")  # input$IS_AO_Output_option1
    dlist <- input$VH_AO_Climate_model  # c("KMA") # c("KMA", "KEI", "WORLDCLIM")
    clist <- input$VH_AO_Climate_scenario  # c("RCP4.5") # c("RCP4.5", "RCP8.5")
    mlist <- input$VH_AO_SDM_model # c("PA1_Full_GLM_byROC")
    ylist <- input$VH_AO_Project_year
    #	dtlist <- input$SS_AO_Dispersal_type
    
    #    ls <- length(slist)
    lo <- length(olist)
    ld <- length(dlist)
    lc <- length(clist)
    lm <- length(mlist)
    ly <- length(ylist)
    
    tl <- lo * ld * lc * lm * ly
    nc <- 2
    if (tl <  2) {
      nr <- round(tl / nc) + 1
    } else {
      nr <- round((tl + 0.1) / nc)
    }
    
    #    par(mfrow = c(nr,nc), cex.main = 1.2)
    
    for (o in olist) {
      for (d in dlist) {
        for (c in clist) {
          for (m in mlist) {
            for (y in ylist) {
              if (ly > 0) {
                Map1 <- paste(o, "_", d, "_", c, "_", m, "_", y, ".tif", sep = "")
                #                R_Map1 <- raster(file.path(isolate(G$IS_AO_Dir_Folder), Map1))
                r <- raster(file.path(isolate(G$VH_AO_Dir_Folder), Map1))
                #                plot(R_Map1, main = Map1)
              }
            }
          }
        }
      }
    }
    
    crs(r) <- CRS("+proj=longlat +datum=WGS84 +ellps=WGS84 +towgs84=0,0,0")
    
    pal <- colorNumeric(c("#0C2C84", "#FFFFCC", "#41B6C4"), values(r),
                        na.color = "transparent")
    
    leaflet() %>%
      addTiles(
        urlTemplate = "//{s}.tiles.mapbox.com/v3/jcheng.map-5ebohr46/{z}/{x}/{y}.png",
        attribution = 'Maps by <a href="http://www.mapbox.com/">Mapbox</a>'
      ) %>%        
      
      addRasterImage(r, colors = pal, opacity = 0.8) %>%
      addLegend(pal = pal, values = values(r), title = "Legend")  %>%
      
      setView(lng = 128.00, lat = 36.00, zoom = 7)
  })
  
  output$VH_AO_SL_Map <- renderLeaflet({
    
    # setting Climate change scenarios, Future time, Species and current environmental path
    #    slist <- input$IS_AO_Species
    olist <- c("IS_LOSS")  # input$IS_AO_Output_option1
    dlist <- input$VH_AO_Climate_model  # c("KMA") # c("KMA", "KEI", "WORLDCLIM")
    clist <- input$VH_AO_Climate_scenario  # c("RCP4.5") # c("RCP4.5", "RCP8.5")
    mlist <- input$VH_AO_SDM_model # c("PA1_Full_GLM_byROC")
    ylist <- input$VH_AO_Project_year
    #	dtlist <- input$SS_AO_Dispersal_type
    
    #    ls <- length(slist)
    lo <- length(olist)
    ld <- length(dlist)
    lc <- length(clist)
    lm <- length(mlist)
    ly <- length(ylist)
    
    tl <- lo * ld * lc * lm * ly
    nc <- 2
    if (tl <  2) {
      nr <- round(tl / nc) + 1
    } else {
      nr <- round((tl + 0.1) / nc)
    }
    
    #    par(mfrow = c(nr,nc), cex.main = 1.2)
    
    for (o in olist) {
      for (d in dlist) {
        for (c in clist) {
          for (m in mlist) {
            for (y in ylist) {
              if (ly > 0) {
                Map1 <- paste(o, "_", d, "_", c, "_", m, "_", y, ".tif", sep = "")
                #                R_Map1 <- raster(file.path(isolate(G$IS_AO_Dir_Folder), Map1))
                r <- raster(file.path(isolate(G$VH_AO_Dir_Folder), Map1))
                #                plot(R_Map1, main = Map1)
              }
            }
          }
        }
      }
    }
    
    crs(r) <- CRS("+proj=longlat +datum=WGS84 +ellps=WGS84 +towgs84=0,0,0")
    
    pal <- colorNumeric(c("#0C2C84", "#FFFFCC", "#41B6C4"), values(r),
                        na.color = "transparent")
    
    leaflet() %>%
      addTiles(
        urlTemplate = "//{s}.tiles.mapbox.com/v3/jcheng.map-5ebohr46/{z}/{x}/{y}.png",
        attribution = 'Maps by <a href="http://www.mapbox.com/">Mapbox</a>'
      ) %>%        
      
      addRasterImage(r, colors = pal, opacity = 0.8) %>%
      addLegend(pal = pal, values = values(r), title = "Legend")  %>%
      
      setView(lng = 128.00, lat = 36.00, zoom = 7)
  })
  
  output$VH_AO_SS_Map <- renderLeaflet({
    
    # setting Climate change scenarios, Future time, Species and current environmental path
    #    slist <- input$IS_AO_Species
    olist <- c("IS_STAY")  # input$IS_AO_Output_option1
    dlist <- input$VH_AO_Climate_model  # c("KMA") # c("KMA", "KEI", "WORLDCLIM")
    clist <- input$VH_AO_Climate_scenario  # c("RCP4.5") # c("RCP4.5", "RCP8.5")
    mlist <- input$VH_AO_SDM_model # c("PA1_Full_GLM_byROC")
    ylist <- input$VH_AO_Project_year
    #	dtlist <- input$SS_AO_Dispersal_type
    
    #    ls <- length(slist)
    lo <- length(olist)
    ld <- length(dlist)
    lc <- length(clist)
    lm <- length(mlist)
    ly <- length(ylist)
    
    tl <- lo * ld * lc * lm * ly
    nc <- 2
    if (tl <  2) {
      nr <- round(tl / nc) + 1
    } else {
      nr <- round((tl + 0.1) / nc)
    }
    
    #    par(mfrow = c(nr,nc), cex.main = 1.2)
    
    for (o in olist) {
      for (d in dlist) {
        for (c in clist) {
          for (m in mlist) {
            for (y in ylist) {
              if (ly > 0) {
                Map1 <- paste(o, "_", d, "_", c, "_", m, "_", y, ".tif", sep = "")
                #                R_Map1 <- raster(file.path(isolate(G$IS_AO_Dir_Folder), Map1))
                r <- raster(file.path(isolate(G$VH_AO_Dir_Folder), Map1))
                #                plot(R_Map1, main = Map1)
              }
            }
          }
        }
      }
    }
    
    crs(r) <- CRS("+proj=longlat +datum=WGS84 +ellps=WGS84 +towgs84=0,0,0")
    
    pal <- colorNumeric(c("#0C2C84", "#FFFFCC", "#41B6C4"), values(r),
                        na.color = "transparent")
    
    leaflet() %>%
      addTiles(
        urlTemplate = "//{s}.tiles.mapbox.com/v3/jcheng.map-5ebohr46/{z}/{x}/{y}.png",
        attribution = 'Maps by <a href="http://www.mapbox.com/">Mapbox</a>'
      ) %>%        
      
      addRasterImage(r, colors = pal, opacity = 0.8) %>%
      addLegend(pal = pal, values = values(r), title = "Legend")  %>%
      
      setView(lng = 128.00, lat = 36.00, zoom = 7)
  })
  
  output$VH_AO_SI_Map <- renderLeaflet({
    
    # setting Climate change scenarios, Future time, Species and current environmental path
    #    slist <- input$IS_AO_Species
    olist <- c("IS_GAIN")  # input$IS_AO_Output_option1
    dlist <- input$VH_AO_Climate_model  # c("KMA") # c("KMA", "KEI", "WORLDCLIM")
    clist <- input$VH_AO_Climate_scenario  # c("RCP4.5") # c("RCP4.5", "RCP8.5")
    mlist <- input$VH_AO_SDM_model # c("PA1_Full_GLM_byROC")
    ylist <- input$VH_AO_Project_year
    #	dtlist <- input$SS_AO_Dispersal_type
    
    #    ls <- length(slist)
    lo <- length(olist)
    ld <- length(dlist)
    lc <- length(clist)
    lm <- length(mlist)
    ly <- length(ylist)
    
    tl <- lo * ld * lc * lm * ly
    nc <- 2
    if (tl <  2) {
      nr <- round(tl / nc) + 1
    } else {
      nr <- round((tl + 0.1) / nc)
    }
    
    #    par(mfrow = c(nr,nc), cex.main = 1.2)
    
    for (o in olist) {
      for (d in dlist) {
        for (c in clist) {
          for (m in mlist) {
            for (y in ylist) {
              if (ly > 0) {
                Map1 <- paste(o, "_", d, "_", c, "_", m, "_", y, ".tif", sep = "")
                #                R_Map1 <- raster(file.path(isolate(G$IS_AO_Dir_Folder), Map1))
                r <- raster(file.path(isolate(G$VH_AO_Dir_Folder), Map1))
                #                plot(R_Map1, main = Map1)
              }
            }
          }
        }
      }
    }
    
    crs(r) <- CRS("+proj=longlat +datum=WGS84 +ellps=WGS84 +towgs84=0,0,0")
    
    pal <- colorNumeric(c("#0C2C84", "#FFFFCC", "#41B6C4"), values(r),
                        na.color = "transparent")
    
    leaflet() %>%
      addTiles(
        urlTemplate = "//{s}.tiles.mapbox.com/v3/jcheng.map-5ebohr46/{z}/{x}/{y}.png",
        attribution = 'Maps by <a href="http://www.mapbox.com/">Mapbox</a>'
      ) %>%        
      
      addRasterImage(r, colors = pal, opacity = 0.8) %>%
      addLegend(pal = pal, values = values(r), title = "Legend")  %>%
      
      setView(lng = 128.00, lat = 36.00, zoom = 7)
  })
  
  output$VH_AO_VI1_Map <- renderLeaflet({
    
    # setting Climate change scenarios, Future time, Species and current environmental path
    #    slist <- input$IS_AO_Species
    olist <- c("IS_VI1")  # input$IS_AO_Output_option1
    dlist <- input$VH_AO_Climate_model  # c("KMA") # c("KMA", "KEI", "WORLDCLIM")
    clist <- input$VH_AO_Climate_scenario  # c("RCP4.5") # c("RCP4.5", "RCP8.5")
    mlist <- input$VH_AO_SDM_model # c("PA1_Full_GLM_byROC")
    ylist <- input$VH_AO_Project_year
    #	dtlist <- input$SS_AO_Dispersal_type
    
    #    ls <- length(slist)
    lo <- length(olist)
    ld <- length(dlist)
    lc <- length(clist)
    lm <- length(mlist)
    ly <- length(ylist)
    
    tl <- lo * ld * lc * lm * ly
    nc <- 2
    if (tl <  2) {
      nr <- round(tl / nc) + 1
    } else {
      nr <- round((tl + 0.1) / nc)
    }
    
    #    par(mfrow = c(nr,nc), cex.main = 1.2)
    
    for (o in olist) {
      for (d in dlist) {
        for (c in clist) {
          for (m in mlist) {
            for (y in ylist) {
              if (ly > 0) {
                Map1 <- paste(o, "_", d, "_", c, "_", m, "_", y, ".tif", sep = "")
                #                R_Map1 <- raster(file.path(isolate(G$IS_AO_Dir_Folder), Map1))
                r <- raster(file.path(isolate(G$VH_AO_Dir_Folder), Map1))
                #                plot(R_Map1, main = Map1)
              }
            }
          }
        }
      }
    }
    
    crs(r) <- CRS("+proj=longlat +datum=WGS84 +ellps=WGS84 +towgs84=0,0,0")
    
    pal <- colorNumeric(c("#0C2C84", "#FFFFCC", "#41B6C4"), values(r),
                        na.color = "transparent")
    
    leaflet() %>%
      addTiles(
        urlTemplate = "//{s}.tiles.mapbox.com/v3/jcheng.map-5ebohr46/{z}/{x}/{y}.png",
        attribution = 'Maps by <a href="http://www.mapbox.com/">Mapbox</a>'
      ) %>%        
      
      addRasterImage(r, colors = pal, opacity = 0.8) %>%
      addLegend(pal = pal, values = values(r), title = "Legend")  %>%
      
      setView(lng = 128.00, lat = 36.00, zoom = 7)
  })
  
  output$VH_AO_VI2_Map <- renderLeaflet({
    
    # setting Climate change scenarios, Future time, Species and current environmental path
    #    slist <- input$IS_AO_Species
    olist <- c("IS_VI2")  # input$IS_AO_Output_option1
    dlist <- input$VH_AO_Climate_model  # c("KMA") # c("KMA", "KEI", "WORLDCLIM")
    clist <- input$VH_AO_Climate_scenario  # c("RCP4.5") # c("RCP4.5", "RCP8.5")
    mlist <- input$VH_AO_SDM_model # c("PA1_Full_GLM_byROC")
    ylist <- input$VH_AO_Project_year
    #	dtlist <- input$SS_AO_Dispersal_type
    
    #    ls <- length(slist)
    lo <- length(olist)
    ld <- length(dlist)
    lc <- length(clist)
    lm <- length(mlist)
    ly <- length(ylist)
    
    tl <- lo * ld * lc * lm * ly
    nc <- 2
    if (tl <  2) {
      nr <- round(tl / nc) + 1
    } else {
      nr <- round((tl + 0.1) / nc)
    }
    
    #    par(mfrow = c(nr,nc), cex.main = 1.2)
    
    for (o in olist) {
      for (d in dlist) {
        for (c in clist) {
          for (m in mlist) {
            for (y in ylist) {
              if (ly > 0) {
                Map1 <- paste(o, "_", d, "_", c, "_", m, "_", y, ".tif", sep = "")
                #                R_Map1 <- raster(file.path(isolate(G$IS_AO_Dir_Folder), Map1))
                r <- raster(file.path(isolate(G$VH_AO_Dir_Folder), Map1))
                #                plot(R_Map1, main = Map1)
              }
            }
          }
        }
      }
    }
    
    crs(r) <- CRS("+proj=longlat +datum=WGS84 +ellps=WGS84 +towgs84=0,0,0")
    
    pal <- colorNumeric(c("#0C2C84", "#FFFFCC", "#41B6C4"), values(r),
                        na.color = "transparent")
    
    leaflet() %>%
      addTiles(
        urlTemplate = "//{s}.tiles.mapbox.com/v3/jcheng.map-5ebohr46/{z}/{x}/{y}.png",
        attribution = 'Maps by <a href="http://www.mapbox.com/">Mapbox</a>'
      ) %>%        
      
      addRasterImage(r, colors = pal, opacity = 0.8) %>%
      addLegend(pal = pal, values = values(r), title = "Legend")  %>%
      
      setView(lng = 128.00, lat = 36.00, zoom = 7)
  })
  
  output$VH_AO_VI3_Map <- renderLeaflet({
    
    # setting Climate change scenarios, Future time, Species and current environmental path
    #    slist <- input$IS_AO_Species
    olist <- c("IS_VI3")  # input$IS_AO_Output_option1
    dlist <- input$VH_AO_Climate_model  # c("KMA") # c("KMA", "KEI", "WORLDCLIM")
    clist <- input$VH_AO_Climate_scenario  # c("RCP4.5") # c("RCP4.5", "RCP8.5")
    mlist <- input$VH_AO_SDM_model # c("PA1_Full_GLM_byROC")
    ylist <- input$VH_AO_Project_year
    #	dtlist <- input$SS_AO_Dispersal_type
    
    #    ls <- length(slist)
    lo <- length(olist)
    ld <- length(dlist)
    lc <- length(clist)
    lm <- length(mlist)
    ly <- length(ylist)
    
    tl <- lo * ld * lc * lm * ly
    nc <- 2
    if (tl <  2) {
      nr <- round(tl / nc) + 1
    } else {
      nr <- round((tl + 0.1) / nc)
    }
    
    #    par(mfrow = c(nr,nc), cex.main = 1.2)
    
    for (o in olist) {
      for (d in dlist) {
        for (c in clist) {
          for (m in mlist) {
            for (y in ylist) {
              if (ly > 0) {
                Map1 <- paste(o, "_", d, "_", c, "_", m, "_", y, ".tif", sep = "")
                #                R_Map1 <- raster(file.path(isolate(G$IS_AO_Dir_Folder), Map1))
                r <- raster(file.path(isolate(G$VH_AO_Dir_Folder), Map1))
                #                plot(R_Map1, main = Map1)
              }
            }
          }
        }
      }
    }
    
    crs(r) <- CRS("+proj=longlat +datum=WGS84 +ellps=WGS84 +towgs84=0,0,0")
    
    pal <- colorNumeric(c("#0C2C84", "#FFFFCC", "#41B6C4"), values(r),
                        na.color = "transparent")
    
    leaflet() %>%
      addTiles(
        urlTemplate = "//{s}.tiles.mapbox.com/v3/jcheng.map-5ebohr46/{z}/{x}/{y}.png",
        attribution = 'Maps by <a href="http://www.mapbox.com/">Mapbox</a>'
      ) %>%        
      
      addRasterImage(r, colors = pal, opacity = 0.8) %>%
      addLegend(pal = pal, values = values(r), title = "Legend")  %>%
      
      setView(lng = 128.00, lat = 36.00, zoom = 7)
  })
  
  ###########################
  #### START 이미지 변환 ####
  ###########################
  observeEvent(input$CV_TIF_Folder, {
    volumes <- c(main = isolate(G$SE_Dir_Project))
    shinyDirChoose(input, 'CV_TIF_Folder', roots = volumes) # , defaultPath = "/MOTIVE_projects", defaultRoot = G$SE_Dir_Project)
    G$CV_TIF_Folder <<- parseDirPath(volumes, input$CV_TIF_Folder)
    output$CV_TIF_Folder <- renderText({G$CV_TIF_Folder})
  })
  
  ## 변환할 TIFF 폴더 선택
  output$CV_TIF_Time <- renderUI({
    # validate(
    #   need(input$data !="", "Please Select Data Folder...")
    # )
    setwd(G$CV_TIF_Folder)
    rlist=list.files(getwd(), pattern="tif$", full.names=FALSE)
    G$tl <- length(rlist)
    estTime <- G$tl * 8 / 60
    helpText("변환된 PNG 파일은 output 폴더(create & overwrite)에 저장됨")
    sprintf("예상소요시간: %3.2f분 (%d개 x 8초/개)", estTime, G$tl)
  })
  
  ## TIFF --> PNG 변환 (폴더내 파일 전체)
  observeEvent(input$CV_TIF_run, {
    withProgress(message = 'Converting TIF --> PNG ... ... ...', value = 0, {
      # setwd(G$CV_TIF_Folder)
      # setwd(choose.dir(getwd(), "TIFF --> PNG 폴더 선택"))
      subDir <- "output"
      if (!(file.exists(subDir))) { dir.create(file.path(getwd(),subDir)) }
      rlist=list.files(getwd(), pattern="tif$", full.names=FALSE)
      tl <- length(rlist)
      print(tl)
      n <- 0
      
      ## 이미지내에 삽입되는 Text(파일명) Style 설정
      tag.map.title <- tags$style(HTML("
        .leaflet-control.map-title {
          transform: translate(0%,-100%);
          position: relative !important;
          left: 5%;
          text-align: left;
          padding-left: 5px; 
          padding-right: 5px; 
          background: rgba(220,220,220,0.75);
          font-weight: bold;
          font-size: 16px;
        }
      "))
      
      p <- progress_estimated(tl, min_time = 3)
      time0 <- Sys.time()
      print(Sys.time())
      for(i in rlist) {
        n <- n + 1
        headStr <- str_sub(i,end=-5)
        convertedIMG <- paste0(G$CV_TIF_Folder,"/",subDir,"/",headStr,".jpg")
        print(convertedIMG)
        r <- raster(i)
        crs(r) <- CRS("+proj=longlat +datum=WGS84 +ellps=WGS84 +towgs84=0,0,0")
        pal <- colorNumeric(c("#0C2C84", "#FFFFCC", "#41B6C4"), values(r), na.color = "transparent")
        title <- tags$div(tag.map.title, HTML(headStr))
        m <- leaflet() %>%
          addTiles(
            urlTemplate = "//{s}.tiles.mapbox.com/v3/jcheng.map-5ebohr46/{z}/{x}/{y}.png",
            attribution = 'Maps by <a href="http://www.mapbox.com/">Mapbox</a>') %>%
          addRasterImage(r, colors = pal, opacity = 0.8) %>%
          addLegend(pal = pal, values = values(r), title = "Legend") %>%
          addControl(title, position = "bottomleft", className="map-title") %>%
          setView(lng = 128.00, lat = 36.00, zoom = 7)
        
        ## Mapshot Method
        # mapshot(m, file = convertedIMG) # 경로/파일명 한글이슈 있음!!
        
        ## Weshot Method
        saveWidget(m, "temp.html", selfcontained = T)
        webshot("temp.html", file = convertedIMG, cliprect = "viewport")
        webshot
        
        G$timeNow <- Sys.time()
        print(Sys.time())
        integer()
        G$timeDiff <- round(difftime(G$timeNow,time0,units="secs"), 1)
        print(G$timeDiff)
        minDiff <- round(G$timeDiff / 60, 1)
        G$timeAvg <- round(G$timeDiff / n, 1)
        G$timeEst <- round(G$timeAvg * tl, 1)
        minEst <- round(G$timeEst / 60, 1)
        G$timeRem <- G$timeEst - G$timeDiff
        minRem <- round(G$timeRem / 60, 1)
        incProgress(1/tl, detail=paste0("[",n,"/",tl,"] ",
                                        "경과:",G$timeDiff,"s(",minDiff,"m) ",
                                        "평균:",G$timeAvg,"s ",
                                        "총예상:",G$timeEst,"s(",minEst,"m) ",
                                        "잔여:",G$timeRem,"s(",minRem,"m)"
        ))
      }
      
    })
  })
  #########################
  #### END 이미지 변환 ####
  #########################
  
  ## 통합 리포트
  # output$RP_Value_CM <- renderValueBox({
  #   valueBox(input$DM_OU_Climate_model, "Climate Models",
  #            icon = icon("credit-card"), color = "blue", width = 3
  #   )
  # })
  
  output$RP_Value_CM <- renderValueBox({
    valueBox("KMA", "Climate Models",
             icon = icon("credit-card"), color = "blue", width = 3
    )
  })
  
  output$RP_Value_CS <- renderValueBox({
    valueBox("RCP4.5", "Climate Scenarios",
             icon = icon("list"), color = "purple", width = 3
    )
  })  
  
  output$RP_Value_YR <- renderValueBox({
    valueBox("2000~2080", "Projecting Years",
             icon = icon("thumbs-up"), color = "yellow", width = 3
    )
  })  

  ## 연도별 리포트
  output$RP_Value_GN <- renderValueBox({
    valueBox(input$RP_Type1, "Map Type", 
             icon = icon("list"), color = "blue", width = 3
    )
  })
  
  output$RP_Value_ST <- renderValueBox({
    valueBox(input$RP_Type2, "Map Type", 
             icon = icon("list"), color = "purple", width = 3
    )
  })  
  
  output$RP_Value_LS <- renderValueBox({
    valueBox(input$RP_Type3, "Map Type",
             icon = icon("list"), color = "yellow", width = 3
    )
  })  
  
  output$MAP_2020 <- renderUI({
    box(
      title = "[2020]", width = NULL, solidHeader = F, status = "success", collapsible = T,
      column(4, class = "text-center",
             tags$img(src = "test.jpg", width = ww, height = hh)
      ),
      column(4, class = "text-center",
             tags$img(src = "test.jpg", width = ww, height = hh)
      ),
      column(4, class = "text-center",
             tags$img(src = "test.jpg", width = ww, height = hh)
      )
    )
  })
  
  output$MAP_2050 <- renderUI({
    box(
      title = "[2050]", width = NULL, solidHeader = F, status = "success", collapsible = T,
      column(4, class = "text-center",
             tags$img(src = "test.jpg", width = ww, height = hh)
      ),
      column(4, class = "text-center",
             tags$img(src = "test.jpg", width = ww, height = hh)
      ),
      column(4, class = "text-center",
             tags$img(src = "test.jpg", width = ww, height = hh)
      )
    )
  })

  output$MAP_2080 <- renderUI({
    box(
      title = "[2080]", width = NULL, solidHeader = F, status = "success", collapsible = T,
      column(4, class = "text-center",
             tags$img(src = "test.jpg", width = ww, height = hh)
      ),
      column(4, class = "text-center",
             tags$img(src = "test.jpg", width = ww, height = hh)
      ),
      column(4, class = "text-center",
             tags$img(src = "test.jpg", width = ww, height = hh)
      )
    )
  })
  ############################
  
  ## 취약성 2030
  output$VH_45_30_01 <- renderPlot({
    ggplot(mtcars, aes(wt, mpg)) + geom_point()
  })
  
  output$VH_45_30_05 <- renderPlot({
    ggplot(mtcars, aes(wt, mpg)) + geom_point()
  })
  
  output$VH_45_30_10 <- renderPlot({
    ggplot(mtcars, aes(wt, mpg)) + geom_point()
  })
  
  output$VH_45_30_UN <- renderPlot({
    ggplot(mtcars, aes(wt, mpg)) + geom_point()
  })
  
  ## 취약성 2050
  output$VH_45_50_01 <- renderPlot({
    ggplot(mtcars, aes(wt, mpg)) + geom_point()
  })
  
  output$VH_45_50_05 <- renderPlot({
    ggplot(mtcars, aes(wt, mpg)) + geom_point()
  })
  
  output$VH_45_50_10 <- renderPlot({
    ggplot(mtcars, aes(wt, mpg)) + geom_point()
  })
  
  output$VH_45_50_UN <- renderPlot({
    ggplot(mtcars, aes(wt, mpg)) + geom_point()
  })
  
  ## 취약성 2080
  output$VH_45_80_01 <- renderPlot({
    ggplot(mtcars, aes(wt, mpg)) + geom_point()
  })
  
  output$VH_45_80_05 <- renderPlot({
    ggplot(mtcars, aes(wt, mpg)) + geom_point()
  })
  
  output$VH_45_80_10 <- renderPlot({
    ggplot(mtcars, aes(wt, mpg)) + geom_point()
  })
  
  output$VH_45_80_UN <- renderPlot({
    ggplot(mtcars, aes(wt, mpg)) + geom_point()
  })
  
  ######################
  output$SHOW_Map1 <- renderUI({
    # fluidRow(
      box(
        title = "[민감종 변화 (GAIN / STAY / LOSS)]", width = NULL, solidHeader = TRUE, status = "success", collapsible = T,
        column(4, class = "text-center",
               print("<GAIN>"),
               tags$img(src = "test.jpg", width = ww, height = hh)
        ),
        column(4, class = "text-center",
               print("<STAY>"),
               tags$img(src = "test.jpg", width = ww, height = hh)
        ),
        column(4, class = "text-center",
               print("<LOSS>"),
               tags$img(src = "test.jpg", width = ww, height = hh)
        )
      )
    # )
  })
    
  output$SHOW_Map2 <- renderPlot({
  fluidRow(
    # box(
    #   title = "[KMA - RCP8.5]", width = NULL, solidHeader = TRUE, status = "success", collapsible = T,
      column(4, class = "text-center",
             ggplot(mtcars, aes(wt, mpg)) +
               geom_point()
      ),
      column(4, class = "text-center",
             ggplot(mtcars, aes(wt, mpg)) +
               geom_point()
      ),
      column(4, class = "text-center",
             ggplot(mtcars, aes(wt, mpg)) +
               geom_point()
      )
    # )
  )
  })
  
  output$SHOW_Map3 <- renderPlot({
    # box(
    #   title = "[KMA - RCP8.5]", width = NULL, solidHeader = TRUE, status = "success", collapsible = T,
    ggplot(mtcars, aes(wt, mpg)) + geom_point()
    # )
  })
  
  output$SHOW_Map4 <- renderPlot({
    # box(
    #   title = "[KMA - RCP8.5]", width = NULL, solidHeader = TRUE, status = "success", collapsible = T,
    ggplot(mtcars, aes(wt, mpg)) + geom_point()
    # )
  })
  
  output$SHOW_Map31 <- renderPlot({
    # Render a barplot
    barplot(WorldPhones[,input$region]*1000, 
            main=input$region,
            ylab="Number of Telephones",
            xlab="Year")
  })
  
  output$SHOW_Map4 <- renderPlot({
    dist <- input$dist
    n <- input$n
    
    hist(d(),
         main = paste("r", dist, "(", n, ")", sep = ""),
         col = "#75AADB", border = "white")
  })
  
  output$SHOW_MapX <- renderUI({
    # fluidRow(
    box(
      title = "[KEI - RCP8.5]", width = NULL, solidHeader = TRUE, status = "warning", collapsible = T,
      column(4, class = "text-center",
             print("<2020>"),
               ggplot(mtcars, aes(wt, mpg)) +
                 geom_point()
      ),
      column(4, class = "text-center",
             print("<2050>"),
             tags$img(src = "test.jpg", width = ww, height = hh)
      ),
      column(4, class = "text-center",
             print("<2080>"),
             tags$img(src = "test.jpg", width = ww, height = hh)
      )
    )
  # )
  })
 
  output$RP_SS_AO_IV_Table <- DT::renderDataTable({
    # destfile <- file.path(G$SE_Dir_Project, "Species_Distribution", input$SS_AO_Species, "BIOMOD2", paste(as.name(paste(input$SS_AO_Species, "_VINDEX.csv", sep = "")), sep = "", collapse = "--"))
    vindex <- read.csv("test_VINDEX.csv")
    vindex
  })
  
  output$RP_SS_AO_IV_Plot <- renderPlot({
    vindex <- read.csv("test_VINDEX.csv")
    gplot <- ggplot(vindex, aes(x=Year, y=Area, color=Model))+
      geom_point()+
      facet_wrap(~ Climate_Scenario)+
      labs(title = 'SPECIES',
           x = 'Year of observation',
           y = 'Number of species') +
      theme(text=element_text(size=26, family="Arial")) +
      theme_bw()
    gplot
    # ggsave("name_of_file.png", gplot, width=5, height=2)
  })
  
  output$RP_SS_AO_IV_Plot2 <- renderPlot({
    vindex <- read.csv("test_VINDEX.csv")
    gplot <- ggplot(vindex, aes(x=Year, y=Area_Ratio, color=Model))+
      geom_line()+
      facet_wrap(~ Climate_Scenario)+
      labs(title = 'AREA RATIO')+
      theme_bw()+
      theme(panel.grid.major.x = element_blank(), 
            panel.grid.minor.x = element_blank(),
            panel.grid.major.y = element_blank(),
            panel.grid.minor.y = element_blank())
    gplot
  })
  
  output$RP_SS_AO_IV_Plot3 <- renderPlot({
    vindex <- read.csv("test_VINDEX.csv")
    gplot <- ggplot(vindex, aes(x=Year, y=Area, color=Model))+
      geom_bar(stat="identity")+
      facet_wrap(~ Climate_Scenario)+
      labs(title = 'SPECIES',
           x = 'Year of observation',
           y = 'Number of species') +
      theme(text=element_text(size=26, family="Arial")) +
      theme_bw()
    gplot
    # ggsave("name_of_file.png", gplot, width=5, height=2)
  })
  
  observeEvent(input$myFile, {
    inFile <- input$myFile
    if (is.null(inFile))
      return()
    
    b64 <- base64enc::dataURI(file = inFile$datapath, mime = "image/png")
    insertUI(
      selector = "#image-container",
      where = "afterBegin",
      ui = img(src = b64, width = 400, height = 300)
    )
  })
  
  output$image1 <- renderImage({
    # im <- "C:/MOTIVE_projects/proj30/img/test.jpg"
    im <- load.image("C:/MOTIVE_projects/proj30/img/test.jpg")
    plot(im)
    # plot("C:/MOTIVE_projects/proj30/img/yy.jpg")
    # rasterImage(im,100,300,150,350)
  })

  output$imgOut <- renderImage({
    # im <- "C:/MOTIVE_projects/proj30/img/test.jpg"
    # im <- "./images/car.jpg"
    # im <- load.image("C:/MOTIVE_projects/proj30/img/test.jpg")
    # plot(im)
    # img(src = im, height = 240, width = 300)
    list(src = "./images/car.jpg", height = 240, width = 300)
  })

  output$plot1 <- renderImage({
    # A temp file to save the output. It will be deleted after renderImage
    # sends it, because deleteFile=TRUE.
    outfile <- tempfile(fileext='.png')

    # Generate a png
    png(outfile, width=400, height=400)
    hist(rnorm(input$n))
    dev.off()

    # Return a list
    list(src = outfile,
         alt = "This is alternate text")
  }, deleteFile = TRUE)
  
})

