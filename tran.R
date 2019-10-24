tabsetPanel(
  tabPanel(TR$OV_Name,
           
           hr(),
           mainPanel(
             img(src="eco01.png"),
             hr(),
             img(src="eco02.png"),
             br(),br()
           )
  ),    
  
  
  tabPanel(TR$SP_Name, icon = icon("folder-open"),
           tabsetPanel(
             tabPanel(TR$SP_Name_Info,
                      tags$head(
                        # Include our custom CSS
                        includeCSS("styles.css"),
                        includeScript("gomap.js")
                      ),
                      tags$hr(),
                      bsCollapse(
                        bsCollapsePanel("Summary & Histogram",
                                        style = ST_Name,
                                        fluidRow(
                                          column(3,verbatimTextOutput("SP_Summary")),
                                          column(4,plotOutput("SP_Histogram"))
                                        ) 
                        )
                      ),
                      
                      fluidRow(
                        
                        column(4, 
                               actionButton('reset_SP_Info',label = "Reset", style = "float: right; margin-bottom: 15px;"), br(),
                               DT::dataTableOutput("SP_Info")
                        ),
                        column(1, uiOutput("Species_Link")),
                        column(6, leafletOutput("SP_Map", width = "600", height = "600") %>% withSpinner(), 
                               uiOutput('SP_Map_Reset_UI')
                               
                        )
                      )
                      
             ),
             tabPanel("Species Location",
                      tags$head(
                        # Include our custom CSS
                        includeCSS("styles.css"),
                        includeScript("gomap.js")
                      ),
                      tags$hr(),
                      column(6, 
                             actionButton('reset_SP_Loc',label = "Reset", style = "float: right; margin-bottom: 15px;"),
                             DT::dataTableOutput("SP_LOC_Info")
                      ),
                      column(6, leafletOutput("SP_LOC_Map", width = "600", height = "600")  %>% withSpinner(),
                             uiOutput('SP_LOC_Map_Reset_UI')
                      )
             )
           )
  ),  
  
  
  
  tabPanel(TR$LD_Name, fluid = TRUE, icon = icon("folder-open"),
           tags$hr(),
           sidebarLayout(
             sidebarPanel(width = 3, Fluid = TRUE,
                          
                          
                          
                          selectInput("LD_Type", TR$LD_Name_Variables,
                                      choices = TR$LD_Name_Variables_list,
                                      selected = TR$LD_Name_Variables_selected
                          ),
                          
                          fluidRow(
                            
                            # actionButton('LD_Value_TY',label = "Type", style = ST_Name)
                            
                            # box(status = "primary", solidHeader = T,
                            #     title = "LD Type", width = 50, height = 45, collapsible = F, collapsed = T
                            # )
                            
                            # valueBoxOutput("LD_Value_TY")
                          ),
                          
                          # Input: Checkbox if file has header ----
                          radioButtons("LD_Climate_model", TR$LD_Name_Models,
                                       choices = TR$LD_Name_Models_list,
                                       selected = TR$LD_Name_Models_selected
                          ),
                          
                          # Input: Checkbox if file has header ----
                          radioButtons("LD_Climate_scenario", TR$LD_Name_Scenarios,
                                       choices = TR$LD_Name_Scenarios_list,
                                       selected = TR$LD_Name_Scenarios_selected
                          ),
                          
                          
                          sliderInput("LD_Project_year", label = TR$LD_Name_Year, min = 2000,
                                      max = 2080, value = 2000, step = 10, sep = "",
                                      animate = animationOptions(interval = 3000))
                          
                          
             ),
             
             # Main panel for displaying outputs ----
             mainPanel(
               bsCollapsePanel("Summary & Histogram",
                               style = ST_Name,
                               fluidRow(
                                 column(4,verbatimTextOutput("LD_Summary")),
                                 column(6,plotOutput("LD_Histogram"))
                               ) 
               ),
               
               tags$head(
                 # Include our custom CSS
                 includeCSS("styles.css"),
                 includeScript("gomap.js")
               ),
               
               fluidRow(
                 valueBoxOutput("LD_Value_CM"),
                 valueBoxOutput("LD_Value_CS"),
                 valueBoxOutput("LD_Value_YR")
               ),
               leafletOutput("LD_Map", width = "800", height = "650")  %>% withSpinner(),
               actionButton("Reset_LD_Map", label = "Reset")
             )
           )
  ),  
  
  tabPanel(TR$CD_Name, fluid = TRUE, icon = icon("folder-open"),
           tags$hr(),
           sidebarLayout(
             sidebarPanel(width = 3, Fluid = TRUE,
                          selectInput("CD_Variables", TR$CD_Name_Variables,
                                      choices = TR$CD_Name_Variables_list,
                                      selected = TR$CD_Name_Variables_selected
                          ),
                          
                          # Input: Checkbox if file has header ----
                          radioButtons("CD_Climate_model", TR$CD_Name_Models,
                                       choices = TR$CD_Name_Models_list,
                                       selected = TR$CD_Name_Models_selected
                          ),
                          
                          # Input: Checkbox if file has header ----
                          radioButtons("CD_Climate_scenario", TR$CD_Name_Scenarios,
                                       choices = TR$CD_Name_Scenarios_list,
                                       selected = TR$CD_Name_Scenarios_selected
                          ),
                          
                          
                          sliderInput("CD_Project_year", label = TR$CD_Name_Year, min = 2000,
                                      max = 2080, value = 2000, step = 10, sep = "",
                                      animate = animationOptions(interval = 3000))
             ),
             
             # Main panel for displaying outputs ----
             mainPanel(
               
               bsCollapse(
                 bsCollapsePanel("Summary & Histogram",
                                 style = ST_Name,
                                 fluidRow(
                                   column(4,verbatimTextOutput("CD_Summary")),
                                   column(6,plotOutput("LD_Histogram2"))
                                 ) 
                 )
               ),
               fluidRow(
                 valueBoxOutput("CD_Value_CM"),
                 valueBoxOutput("CD_Value_CS"),
                 valueBoxOutput("CD_Value_YR")
               ),
               # tags$head(
               #   # Include our custom CSS
               #   includeCSS("styles.css"),
               #   includeScript("gomap.js")
               # ),
               leafletOutput("CD_Map", width = "800", height = "650") %>% withSpinner(),
               actionButton("Reset_CD_Map", label = "Reset")
               
             )
           )
           
  ),  
  
  
  
  tabPanel(TR$SDM_Name, icon = icon("pie-chart"),
           tabsetPanel(
             tabPanel(TR$SDM_Name_Model,
                      
                      fluidRow(
                        tags$hr(),
                        uiOutput("SDM_Sel_Box"),
                        column(4, 
                               actionButton('resetSpeciesInfo',label = "Reset", style = ST_Name),
                               tags$style(type='text/css', "button#resetSpeciesInfo {margin-left: 90%;}"),
                               br(),br(),
                               DT::dataTableOutput("SDM_SP_Info")
                        ),
                        column(4,
                               
                               
                               uiOutput('SDM_MO_Condition_CheckBoxGroup')
                        ),
                        column(4,
                               useShinyalert(),  # Set up shinyalert
                               actionButton("SDM_MO_SDM_run", label = TR$SDM_Name_models_run)
                        )
                        
                      )
             ),
             
             
             tabPanel(TR$SDM_Name_Model_Out, fluid = TRUE,
                      tags$hr(),
                      sidebarLayout(
                        sidebarPanel(width = 3, Fluid = TRUE,
                                     
                                     uiOutput("SDM_OU_Species"),
                                     # tags$hr(),
                                     
                                     uiOutput("SDM_OU_Projection_model"),
                                     # tags$hr(),
                                     
                                     uiOutput("SDM_OU_Prediction_model"),
                                     # tags$hr(),
                                     
                                     # Input: Checkbox if file has header ----
                                     radioButtons("SDM_OU_Climate_model", TR$SDM_Name_CD_Models_out,
                                                  choices = c(TR$SDM_Name_CD_Models_out_list),
                                                  selected = TR$SDM_Name_CD_Models_out_selected
                                     ),
                                     
                                     # Input: Checkbox if file has header ----
                                     radioButtons("SDM_OU_Climate_scenario", TR$SDM_Name_CD_Scenarios_out,
                                                  choices = c(TR$SDM_Name_CD_Scenarios_out_list),
                                                  selected = TR$SDM_Name_CD_Scenarios_out_selected
                                     ),
                                     
                                     
                                     sliderInput("SDM_OU_Project_year", label = TR$SDM_Name_CD_Year_out, min = 2000,
                                                 max = 2080, value = 2000, step = 10, sep = "",
                                                 animate = animationOptions(interval = 10000))
                        ),
                        
                        
                        
                        # Main panel for displaying outputs ----
                        mainPanel(
                          tabsetPanel(
                            
                            
                            tabPanel("Validation & Contribution",
                                     
                                     # hr(),
                                     
                                     fluidRow(
                                       hr(),
                                       column(6, DT::dataTableOutput("SDM_OU_Validation")
                                              
                                       ),
                                       column(6, DT::dataTableOutput("SDM_OU_Contribution"),
                                              plotOutput("SDM_OU_Contribution_Radarchart")
                                       )
                                     )
                                     
                                     
                            ),
                            
                            tabPanel("Map", 
                                     tags$head(
                                       # Include our custom CSS
                                       includeCSS("styles.css"),
                                       includeScript("gomap.js")
                                     ),
                                     tags$hr(),
                                     fluidRow(
                                       valueBoxOutput("Value_CM"),
                                       valueBoxOutput("Value_CS"),
                                       valueBoxOutput("Value_YR")
                                       
                                     ),
                                     fluidRow(class = "text-center",
                                              column(6, 
                                                     # tags$h3("<Probability Map>", style = "text-align: center;"),
                                                     box(status = "success",
                                                         title = "PROBABILITY MAP", width = 20, height = 45, collapsible = T, collapsed = T
                                                     ),
                                                     
                                                     leafletOutput("SDM_OU_Probability_map") %>% withSpinner(),
                                                     br(),
                                                     actionButton("Reset_Probability_View", label = "Reset"),
                                                     tags$hr(),
                                                     column(12, verbatimTextOutput("SDM_OU_PROJ_Summary")),
                                                     column(12, plotOutput("SDM_OU_PROJ_Histogram"))
                                              ),
                                              
                                              column(6, 
                                                     # tags$h3("<Predicted Map>", style = "text-align: center;"),
                                                     box(status = "success",
                                                         title = "PREDICTED MAP", width = 20, height = 45, collapsible = T, collapsed = T
                                                     ),
                                                     # tags$h3("<Predicted Map>"),
                                                     
                                                     # leafletOutput("SDM_OU_Predicted_map", width = "800", height = "600"),
                                                     leafletOutput("SDM_OU_Predicted_map") %>% withSpinner(),
                                                     br(),
                                                     actionButton("Reset_Predicted_View", label = "Reset"),
                                                     tags$hr(),
                                                     column(12, verbatimTextOutput("SDM_OU_PRED_Summary")),
                                                     column(12, plotOutput("SDM_OU_PRED_Histogram"))
                                              )
                                     )
                                     
                            )
                            
                          )
                        )
                      )
             )
           )
  ),  
  
  
  tabPanel(TR$DM_Name, icon = icon("pie-chart"),
           tabsetPanel(
             tabPanel(TR$DM_Name_Model, fluid = TRUE,
                      tags$hr(),
                      fluidRow(
                        column(2,
                               
                               valueBox("구상나무", "선택종명",
                                        icon = icon("tree"), color = "green", width = 12
                               )
                        ),
                        
                        column(10,
                               uiOutput("DM_Sel_Box")
                        )
                      ),
                      tags$hr(),
                      fluidRow(
                        
                        
                        # Sidebar panel for inputs ----
                        sidebarPanel(width = 2,
                                     
                                     uiOutput("DM_MO_Col_Box_01")
                                     
                                     
                        ),
                        
                        sidebarPanel(width = 2,
                                     
                                     uiOutput("DM_MO_Col_Box_02")
                                     
                                     
                        ),
                        
                        column( 3,
                                fluidRow( sidebarPanel(width = 12, Fluid = TRUE, 
                                                       uiOutput("DM_MO_Col_Box_03") 
                                )
                                ),
                                
                                fluidRow( 
                                  sidebarPanel(width = 12, Fluid = TRUE, 
                                               div( actionButton('reset_DM_MO',label = "Reset"), style = "margin: 0 60% 0 40%;" ) 
                                  )
                                )
                                
                                
                        ),
                        
                        
                        
                        sidebarPanel(width = 3, Fluid = TRUE,
                                     tags$hr(),  
                                     # infoBox("Model Run", "RUN", icon = icon("angle-double-right"), width = 2),
                                     actionButton("DM_MO_Action", label = "Run"),
                                     tags$hr()
                        )
                        
                      )
                      
             ),
             
             
             tabPanel(TR$DM_Name_Model_Out, fluid = TRUE,
                      tags$hr(),
                      sidebarLayout(
                        sidebarPanel(width = 3, Fluid = TRUE,
                                     
                                     selectInput("DM-OU_Species", "Select a species",
                                                 choices = c("구상나무" = "option1",
                                                             "가문비나무 " = "option2"),
                                                 selected = "option1"
                                     ),
                                     tags$hr(),
                                     
                                     
                                     selectInput("DM-OU_Dispersal_type", "Dispersal Types",
                                                 choices = c("No Dispersal" = "ND",
                                                             "SDD" = "SDD",
                                                             "MDD" = "MDD",
                                                             "LDD" = "LDD",
                                                             "Unlimited Dispersal" = "UD"),
                                                 selected = "LDD"
                                     ),
                                     
                                     selectInput("DM-OU_SDM_model", "Model Types",
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
                                     radioButtons("DM_OU_Climate_model", "Climate Models",
                                                  choices = c("KMA" = "KMA",
                                                              "KEI" = "KEI"),
                                                  selected = "KMA"
                                     ),
                                     
                                     # Input: Checkbox if file has header ----
                                     radioButtons("DM_OU_Climate_scenario", "Climate Scenarios",
                                                  choices = c("RCP 4.5" = "rcp4.5",
                                                              "RCP 8.5" = "rcp8.5"),
                                                  selected = "rcp4.5"
                                     ),
                                     
                                     
                                     
                                     
                                     sliderInput("DM_OU_Project_year", label = "Projection Year", min = 2000,
                                                 max = 2080, value = 2000, step = 10, sep = "",
                                                 animate = animationOptions(interval = 3000))
                        ),
                        
                        # Main panel for displaying outputs ----
                        mainPanel(
                          bsCollapse(
                            bsCollapsePanel("Summary",
                                            verbatimTextOutput("DM_OU_Summary"), style = ST_Name)
                          ),
                          fluidRow(
                            valueBoxOutput("DM_Value_CM"),
                            valueBoxOutput("DM_Value_CS"),
                            valueBoxOutput("DM_Value_YR")
                          ),
                          leafletOutput("DM_OU_DIspersal_map", width = "800", height = "650") %>% withSpinner(),
                          actionButton("Reset_DM_OU_DIspersal_map", label = "Reset")
                          
                          
                        )
                      )
             )
           )
  ), 
  
  
  tabPanel(TR$SS_Name, icon = icon("table"),
           tabsetPanel(
             tabPanel(TR$SS_Name_Analysis, fluid = TRUE,
                      
                      uiOutput("SS_Analy_Box"),
                      
                      tags$hr(),
                      fluidRow(
                        sidebarPanel(width = 2, Fluid = TRUE,
                                     uiOutput("SS_CA_Species"),
                                     
                                     uiOutput("SS_CA_Types")
                                     
                                     
                        ),
                        sidebarPanel(width = 2, Fluid = TRUE,             
                                     
                                     
                                     uiOutput("SS_CA_Col_Box_02")
                                     
                                     
                        ),
                        sidebarPanel(width = 2,
                                     uiOutput("SS_CA_SDM_model"),
                                     br(),
                                     actionButton('reset_SS_CA', label = "Reset")
                        ),
                        sidebarPanel(width = 1,
                                     cat("Hello"),
                                     # print("=====>"),
                                     tags$br(),
                                     tags$br()
                        ),
                        sidebarPanel(width = 3,
                                     actionButton("SS_CA_Action_change", label = "Analayzing the change of Species Distribution"),
                                     tags$br(),
                                     tags$br(),
                                     actionButton("SS_CA_Action_Vindex", label = "Calculating the Climate Vulnerability Index of Species")
                        )
                      )
             ),
             
             
             tabPanel(TR$SS_Name_Out, fluid = TRUE,
                      tags$hr(),
                      sidebarLayout(
                        sidebarPanel(width = 3, Fluid = TRUE,
                                     
                                     uiOutput("SS_AO_Species"),
                                     tags$hr(),
                                     
                                     uiOutput("SS_AO_SDM_model"),
                                     
                                     uiOutput("SS_AO_DT_CM_CS_PY"),
                                     hr(),
                                     actionButton('reset_SS_AO', label = "Reset")
                        ),
                        
                        # Main panel for displaying outputs ----
                        mainPanel(
                          tabsetPanel(
                            tabPanel("Species Distribution Change Plot",
                                     tags$hr(),
                                     uiOutput("SS_AO_UI_plot")
                            ),
                            tabPanel("Vulnerability Pattern", 
                                     tags$hr(),
                                     fluidRow(
                                       column(6, 
                                              DT::dataTableOutput("SS_AO_IV_Table")
                                       )
                                     ),
                                     fluidRow(
                                       tags$hr(),
                                       uiOutput("SS_AO_IV_UI_plot1"),
                                       tags$hr(),
                                       column(6, plotOutput("SS_AO_IV_Plot1")),
                                       column(6, plotOutput("SS_AO_IV_Plot2"))
                                     ),
                                     fluidRow(
                                       tags$hr(),
                                       uiOutput("SS_AO_IV_UI_plot2"),
                                       tags$hr(),
                                       column(6, plotOutput("SS_AO_IV_Plot11")),
                                       column(6, plotOutput("SS_AO_IV_Plot21"))
                                     )
                            ),
                            tabPanel("Vulnerable Priority", 
                                     tags$hr(),
                                     fluidRow(
                                       column(6, 
                                              DT::dataTableOutput("SS_AO_VP_Table")
                                       )
                                     ),
                                     fluidRow(
                                       tags$hr(),
                                       plotOutput("SS_AO_VP_Priority",width = "100%", height = "600px"))
                            )
                          )
                        )
                      )
             )
           )
  ),      
  
  tabPanel(TR$IS_Name, icon = icon("table"),
           tabsetPanel(
             tabPanel(TR$IS_Name_Anlayis, fluid = TRUE,
                      tags$hr(),
                      fluidRow(
                        sidebarPanel(width = 3, Fluid = TRUE,
                                     uiOutput("IS_CA_Species")
                        ),
                        
                        sidebarPanel(width = 3, Fluid = TRUE,   
                                     
                                     
                                     uiOutput("IS_CA_Col_Box_02")
                                     
                                     
                                     
                        ),
                        sidebarPanel(width = 4,
                                     uiOutput("IS_CA_SDM_model"),
                                     tags$hr(),
                                     
                                     uiOutput("IS_CA_Admin"),
                                     
                                     tags$hr(),
                                     actionButton('reset_IS_CA', label = "Reset"),
                                     tags$hr(),
                                     shinyDirButton("IS_VA_Dir_Folder", "Invasive Assessment Output Folder", "Invasive Assessment Output Folder"),
                                     
                                     verbatimTextOutput("IS_VA_Dir_Folder", placeholder = TRUE),
                                     actionButton("IS_VA_Action_Analysis", label = TR$IS_Name_Action),
                                     tags$hr(),
                                     br(),
                                     checkboxGroupInput("IS_VA_Admin", TR$IS_Name_Admin,
                                                        choices = c(TR$IS_Name_Admin_list),
                                                        selected = TR$IS_Name_Admin_selected
                                     ),
                                     actionButton("IS_VA_Action_Admin", label = TR$IS_Name_Action_Admin)
                        )
                      )
             ),
             
             tabPanel(TR$IS_Name_Out, fluid = TRUE,
                      tags$hr(),
                      sidebarLayout(
                        sidebarPanel(width = 3, Fluid = TRUE,
                                     shinyDirButton("IS_AO_Dir_Folder", "Invasive Assessment Output Folder", "Invasive Assessment Output Folder"),
                                     verbatimTextOutput("IS_AO_Dir_Folder", placeholder = TRUE),
                                     tags$hr(),
                                     #uiOutput("IS_AO_Species"),
                                     uiOutput("IS_AO_Species"),
                                     tags$hr(),
                                     
                                     
                                     
                                     uiOutput("IS_AO_SDM_model"),
                                     
                                     radioButtons("IS_AO_Dispersal_type", TR$IS_Name_DM_Models,
                                                  choices = c(TR$IS_Name_DM_Models_list),
                                                  selected = TR$IS_Name_DM_Models_selected
                                     ),
                                     
                                     # Input: Checkbox if file has header ----
                                     radioButtons("IS_AO_Climate_model", TR$IS_Name_CD_Models,
                                                  choices = c(TR$IS_Name_CD_Models_list),
                                                  selected = TR$IS_Name_CD_Models_selected
                                     ),
                                     
                                     # Input: Checkbox if file has header ----
                                     radioButtons("IS_AO_Climate_scenario", TR$IS_Name_CD_Scenarios,
                                                  choices = c(TR$IS_Name_CD_Scenarios_list),
                                                  selected = TR$IS_Name_CD_Scenarios_selected
                                     ),
                                     
                                     # Input: Checkbox if file has header ----
                                     radioButtons("IS_AO_Project_year", TR$IS_Name_CD_Year,
                                                  choices = c(TR$IS_Name_CD_Year_list),
                                                  selected = TR$IS_Name_CD_Year_selected
                                     )
                        ),
                        
                        # Main panel for displaying outputs ----
                        mainPanel(
                          tabsetPanel(
                            tabPanel(TR$IS_Name_Out_Species, 
                                     tags$head(
                                       # Include our custom CSS
                                       includeCSS("styles.css"),
                                       includeScript("gomap.js")
                                     ),
                                     tags$hr(),
                                     
                                     column(6, leafletOutput("IS_AO_Map1", width = "800", height = "650") %>% withSpinner(),
                                            actionButton("Reset_IS_AO_Map1", label = "Reset") )),
                            tabPanel("Vulnerability Map", 
                                     tags$head(
                                       # Include our custom CSS
                                       includeCSS("styles.css"),
                                       includeScript("gomap.js")
                                     ),
                                     tags$hr(),
                                     column(6, leafletOutput("IS_AO_Map2", width = "800", height = "650") %>% withSpinner(),
                                            actionButton("Reset_IS_AO_Map2", label = "Reset") )),
                            #                               tabPanel("Assessment Plot",
                            #                                        tags$hr(),
                            #                                        uiOutput("IS_AO_UI_plot1")
                            #                              ),
                            #                               tabPanel("Vulnerability Plot",
                            #                                        tags$hr(),
                            #                                        uiOutput("IS_AO_UI_plot2")
                            #                               ),
                            tabPanel("Invasive species Expansion",
                                     
                                     tabsetPanel(
                                       tabPanel(TR$IS_Name_Out_Map,
                                                tags$head(
                                                  # Include our custom CSS
                                                  includeCSS("styles.css"),
                                                  includeScript("gomap.js")
                                                ),
                                                
                                                leafletOutput("IS_OU_EX_Map", width = "800", height = "600") %>% withSpinner(),
                                                actionButton("Reset_IS_OU_EX_Map", label = "Reset") ),
                                       tabPanel("SIDO",
                                                
                                                tabsetPanel(
                                                  tabPanel(TR$IS_Name_Out_Map, 
                                                           tags$head(
                                                             # Include our custom CSS
                                                             includeCSS("styles.css"),
                                                             includeScript("gomap.js")
                                                           ),
                                                           
                                                           leafletOutput("IS_OU_EX_SIDO_Map", width = "800", height = "600") %>% withSpinner(),
                                                           actionButton("Reset_IS_OU_EX_SIDO_Map", label = "Reset") ),
                                                  tabPanel("Statistics", plotOutput("IS_OU_EX_SIDO_Stat"))
                                                  
                                                )
                                       ),
                                       tabPanel(TR$IS_Name_Out_SGG,
                                                tabsetPanel(
                                                  tabPanel(TR$IS_Name_Out_Map, 
                                                           tags$head(
                                                             # Include our custom CSS
                                                             includeCSS("styles.css"),
                                                             includeScript("gomap.js")
                                                           ),
                                                           
                                                           leafletOutput("IS_OU_EX_SIGUNGU_Map", width = "800", height = "600") %>% withSpinner(),
                                                           actionButton("Reset_IS_OU_EX_SIGUNGU_Map", label = "Reset") ),
                                                  tabPanel("Statistics", verbatimTextOutput("IS_OU_EX_SIGUNGU_Stat"))
                                                  
                                                )
                                       )
                                     )
                                     
                            ),
                            tabPanel("Invasive species Introduction",
                                     tabsetPanel(
                                       tabPanel("Map",
                                                tags$head(
                                                  # Include our custom CSS
                                                  includeCSS("styles.css"),
                                                  includeScript("gomap.js")
                                                ),
                                                leafletOutput("IS_OU_SI_Map", width = "800", height = "600") %>% withSpinner(),
                                                actionButton("Reset_IS_OU_SI_Map", label = "Reset") ),
                                       tabPanel("SIDO",
                                                tabsetPanel(
                                                  tabPanel("Map", 
                                                           tags$head(
                                                             # Include our custom CSS
                                                             includeCSS("styles.css"),
                                                             includeScript("gomap.js")
                                                           ),
                                                           leafletOutput("IS_OU_SI_SIDO_Map", width = "800", height = "600") %>% withSpinner(),
                                                           actionButton("Reset_IS_OU_SI_SIDO_Map", label = "Reset") ),
                                                  tabPanel("Statistics", verbatimTextOutput("IS_OU_SI_SIDO_Stat"))
                                                )
                                       ),
                                       
                                       tabPanel("SIGUNGU",
                                                tabsetPanel(
                                                  tabPanel("Map", 
                                                           tags$head(
                                                             # Include our custom CSS
                                                             includeCSS("styles.css"),
                                                             includeScript("gomap.js")
                                                           ),
                                                           leafletOutput("IS_OU_SI_SIGUNGU_Map", width = "800", height = "600") %>% withSpinner(),
                                                           actionButton("Reset_IS_OU_SI_SIGUNGU_Map", label = "Reset") ),
                                                  tabPanel("Statistics", verbatimTextOutput("IS_OU_SI_SIGUNGU_Stat"))
                                                )
                                                
                                       ))
                                     
                                     
                            )
                          )
                        )
                      )
             )
           )    
  ),     
  
  tabPanel(TR$VH_Name, icon = icon("table"),
           tabsetPanel(
             tabPanel(TR$VH_Name_Analysis, fluid = TRUE,
                      tags$hr(),
                      fluidRow(
                        sidebarPanel(width = 3, Fluid = TRUE,
                                     uiOutput("VH_CA_Species")
                        ),
                        sidebarPanel(width = 3, Fluid = TRUE,             
                                     uiOutput("VH_CA_Col_Box_02")
                                     
                        ),
                        sidebarPanel(width = 3,
                                     uiOutput("VH_CA_SDM_model"),
                                     tags$hr(),
                                     
                                     uiOutput("VH_CA_Habitat_Weighting"),
                                     tags$hr(),  
                                     
                                     actionButton('reset_VH_CA', label = "Reset"),
                                     tags$hr(),             
                                     
                                     actionButton("VH_VA_Action_SR", label = "Species Richness"),
                                     br(),
                                     actionButton("VH_VA_Action_SRL", label = "Species Richness Loss"),
                                     tags$hr(),
                                     actionButton("VH_VA_Action_SSA", label = "Species Stay Area"),
                                     br(),
                                     actionButton("VH_VA_Action_SLA", label = "Species Loss Area"),
                                     br(),
                                     actionButton("VH_VA_Action_SIA", label = "Species Introduction Area")
                                     
                        )
                      )
                      
             ), 
             
             tabPanel(TR$VH_Name_Out, fluid = TRUE,
                      tags$hr(),
                      sidebarLayout(
                        sidebarPanel(width = 3, Fluid = TRUE,
                                     
                                     uiOutput("VH_AO_Species"),
                                     tags$hr(),
                                     
                                     uiOutput("VH_AO_SDM_model"),
                                     
                                     uiOutput("VH_AO_DT_CM_CS_PY"),
                                     hr(),
                                     actionButton('reset_VH_AO', label = "Reset")
                                     
                        ),
                        
                        # Main panel for displaying outputs ----
                        mainPanel(
                          tabsetPanel(
                            tabPanel("Species Richness",
                                     tabsetPanel(
                                       tabPanel("Map", 
                                                tags$head(
                                                  # Include our custom CSS
                                                  includeCSS("styles.css"),
                                                  includeScript("gomap.js")
                                                ),
                                                leafletOutput("VH_OU_SR_Map", width = "800", height = "600") %>% withSpinner(),
                                                actionButton("Reset_VH_OU_SR_Map", label = "Reset") ),
                                       tabPanel("Habitat Type",
                                                tabsetPanel(
                                                  tabPanel("Map", 
                                                           tags$head(
                                                             # Include our custom CSS
                                                             includeCSS("styles.css"),
                                                             includeScript("gomap.js")
                                                           ),
                                                           leafletOutput("VH_OU_SR_Habitat_Map", width = "800", height = "600") %>% withSpinner(),
                                                           actionButton("Reset_VH_OU_SR_Habitat_Map", label = "Reset") ),
                                                  tabPanel("Statistics", plotOutput("VH_OU_SR_Habitat_Stat"))
                                                )
                                       )
                                     )
                            ),
                            tabPanel("Species Richness Loss",
                                     tabsetPanel(
                                       tabPanel("Map", 
                                                tags$head(
                                                  # Include our custom CSS
                                                  includeCSS("styles.css"),
                                                  includeScript("gomap.js")
                                                ),
                                                leafletOutput("VH_OU_SRL_Map", width = "800", height = "600") %>% withSpinner(),
                                                actionButton("Reset_VH_OU_SRL_Map", label = "Reset") ),
                                       tabPanel("Habitat Type",
                                                tabsetPanel(
                                                  tabPanel("Map", 
                                                           tags$head(
                                                             # Include our custom CSS
                                                             includeCSS("styles.css"),
                                                             includeScript("gomap.js")
                                                           ),
                                                           leafletOutput("VH_OU_SRL_Habitat_Map", width = "800", height = "600") %>% withSpinner(),
                                                           actionButton("Reset_VH_OU_SRL_Habitat_Map", label = "Reset") ),
                                                  tabPanel("Statistics", verbatimTextOutput("VH_OU_SRL_Habitat_Stat"))
                                                )
                                       )
                                     )
                            ),
                            tabPanel("Species Loss",
                                     tabsetPanel(
                                       tabPanel("Map", 
                                                tags$head(
                                                  # Include our custom CSS
                                                  includeCSS("styles.css"),
                                                  includeScript("gomap.js")
                                                ),
                                                leafletOutput("VH_OU_SL_Map", width = "800", height = "600") %>% withSpinner(),
                                                actionButton("Reset_VH_OU_SL_Map", label = "Reset") ),
                                       tabPanel("Habitat Type",
                                                tabsetPanel(
                                                  tabPanel("Map", 
                                                           tags$head(
                                                             # Include our custom CSS
                                                             includeCSS("styles.css"),
                                                             includeScript("gomap.js")
                                                           ),
                                                           leafletOutput("VH_OU_SL_Habitat_Map", width = "800", height = "600") %>% withSpinner(),
                                                           actionButton("Reset_VH_OU_SL_Habitat_Map", label = "Reset") ),
                                                  tabPanel("Statistics", verbatimTextOutput("VH_OU_SL_Habitat_Stat"))
                                                )
                                       )
                                     )
                            ),
                            tabPanel("Species Stay",
                                     tabsetPanel(
                                       tabPanel("Map", 
                                                tags$head(
                                                  # Include our custom CSS
                                                  includeCSS("styles.css"),
                                                  includeScript("gomap.js")
                                                ),
                                                leafletOutput("VH_OU_SS_Map", width = "800", height = "600") %>% withSpinner(),
                                                actionButton("Reset_VH_OU_SS_Map", label = "Reset") ),
                                       tabPanel("Habitat Type",
                                                tabsetPanel(
                                                  tabPanel("Map", 
                                                           tags$head(
                                                             # Include our custom CSS
                                                             includeCSS("styles.css"),
                                                             includeScript("gomap.js")
                                                           ),
                                                           leafletOutput("VH_OU_SS_Habitat_Map", width = "800", height = "600") %>% withSpinner(),
                                                           actionButton("Reset_VH_OU_SS_Habitat_Map", label = "Reset") ),
                                                  tabPanel("Statistics", verbatimTextOutput("VH_OU_SS_Habitat_Stat"))
                                                )
                                       )
                                     )
                            ),
                            tabPanel("Species Introduction",
                                     tabsetPanel(
                                       tabPanel("Map", 
                                                tags$head(
                                                  # Include our custom CSS
                                                  includeCSS("styles.css"),
                                                  includeScript("gomap.js")
                                                ),
                                                leafletOutput("VH_OU_SI_Map", width = "800", height = "600") %>% withSpinner(),
                                                actionButton("Reset_VH_OU_SI_Map", label = "Reset") ),
                                       tabPanel("Habitat Type",
                                                tabsetPanel(
                                                  tabPanel("Map", 
                                                           tags$head(
                                                             # Include our custom CSS
                                                             includeCSS("styles.css"),
                                                             includeScript("gomap.js")
                                                           ),
                                                           leafletOutput("VH_OU_SI_Habitat_Map", width = "800", height = "600") %>% withSpinner(),
                                                           actionButton("Reset_VH_OU_SI_Habitat_Map", label = "Reset") ),
                                                  tabPanel("Statistics", verbatimTextOutput("VH_OU_SI_Habitat_Stat"))
                                                )
                                       )
                                     )
                            )
                          )
                        )
                      )
             )
           )
           
  ),          
  
  
  tabPanel(TR$HELP_Name, fluid = TRUE,
           tags$hr(),
           sidebarPanel(width = 5,
                        helpText("MOTIVE ECOSYSTEM(생태계 기후변화 영향 및 취약성평가모형)은 환경부 기후변화 R&D 과제의 결과물입니다.")
                        ,
                        
                        fluidRow(
                          infoBox("New Orders", 10 * 2, icon = icon("credit-card"), width = 12)  
                        ),
                        
                        fluidRow(
                          infoBox("New Orders", 10 * 2, icon = icon("credit-card"), fill = TRUE, width = 12)
                        ),
                        
                        fluidRow(
                          infoBox("Progress", "25%", icon = icon("list"), width = 12, color = "purple")
                        ),
                        
                        fluidRow(
                          infoBox("Approval", paste0(80, "%"), icon = icon("thumbs-up", lib = "glyphicon") ,width = 12, color = "yellow")
                        )
                        
                        
                        
                        
                        
                        
                        
                        
           )
  )
  
)