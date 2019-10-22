### JD Edition
library(shinythemes)
ST_Name <- "success"

###
shinyUI(
  
  dashboardPage(
    skin = "green",
    dashboardHeader(title = "MOTIVE Ecosystem"),
    dashboardSidebar(),
    dashboardBody(
      
      shinyjs::useShinyjs(),
      
      
      fluidPage( div(
          h4(System_Name, style = "display: inline-block; color: white; font-size: 200%; margin-left: 20px; position: absolute; line-height: 8vh;"), 
          div( style = "display: inline-block; margin-left: 80%; margin-top: 10px; font-size: 110%; color: white;",
                     
                     a("   한국어", style = "cursor:pointer; margin-right: 5px; color: white;" ),
                     a("English", style = "cursor:pointer; margin-right: 5px; color: white; " ),
                     a("CONTACT US", style = "cursor:pointer; margin-right: 5px; color: white; " ),
                     a("LOGOUT", style = "cursor:pointer; margin-right: 5px; color: white;" )
                )
            , style = "background-image: url(eco_title.png); height: 10vh; position: relative;"),
                tags$script(HTML(
                  
                  'document.querySelector("body").classList.add("sidebar-collapse");'
                  
                  
                )),
                
                theme = shinytheme("yeti"),
                # shinythemes::themeSelector(),
                
                tags$head(tags$style(HTML('
            
                #SE_Dir_Project {
                  display: inline;
                }
                
                #SDM_MO_SDM_run {
                  width: 200px;
                  height: 70px;
                  font-size: 3rem;
                }
                
                #DM_MO_Action {
                  width: 200px;
                  height: 70px;
                }
                
                #CM_UI, #CS_UI, #PY_UI, #SYNC_UI {
                  display: inline-block;
                  
                }
                
                #CM_btn, #CS_btn, #PY_btn {
                  color: #fff;
                  background-color: #0080ff;
                }
                
                #SS_Analy_Box > div > div {
                  padding-left: 0;
                  padding-right: 15px;
                }
                
                #SS_Analy_Box > div > div:first-child,
                #SS_Analy_Box > div > div:last-child {
                  width: 20%;
                }
                
                #SS_Analy_Box > div > div:nth-child(2),
                #SS_Analy_Box > div > div:nth-child(3) {
                  width: 13%;
                }
                
                #SS_Analy_Box > div > div:nth-child(4) {
                  width: 15%;
                }
                
                #SS_Analy_Box > div > div:nth-child(5) {
                  width: 18%;
                }
                
                #CD_Summary, #CD_Histogram {
                  display: inline-block;
                  width: 40%;
                }
                
                ##CD_Histogram {
                  width: 40%;
                }
                
                
                .fa-folder-open {
                	color: #3498db;
                }
                
                .fa-pie-chart {
                	color: #9b59b6;
                }
                
                .fa-table {
                	color: #e74c3c;
                }
                
                .container-fluid > .tabbable > .nav-tabs {
                	font-weight: bold;
                }
                
                
            
               
             '))),
                
                
                
                # div( style = "display: inline-block;",
                
                # div( style = "display: inline-block;",
                #      shinyDirButton("SE_Dir_Project", "Working Project", "Working Project"),
                #      verbatimTextOutput("SE_Dir_Project", placeholder = TRUE)
                # ),
                
                # div( style = "display: inline-block; margin-left: 60%;",
                #      
                #      a("   한국어", style = "cursor:pointer; margin-right: 5px;" ),
                #      a("English", style = "cursor:pointer; margin-right: 5px; " ),
                #      a("CONTACT US", style = "cursor:pointer; margin-right: 5px; " ),
                #      a("LOGOUT", style = "cursor:pointer; margin-right: 5px;" )
                # ),
                
                # ),
                br(),
                

                #   setBackgroundColor(
                #     color = c("white", "green"),
                #     gradient = "linear",
                #     direction = "bottom"
                #   ),
                
                # setBackgroundColor("ghostwhite"),
                
                
                tabsetPanel(
                  # tabPanel(SE_Name,
                  #            tabsetPanel(
                  #              tabPanel("Working Environment",
                  #                   fluidRow(column(6,
                  #                       NULL
                  #                       # tags$hr(),
                  #                       # shinyDirButton("SE_Dir_Project", "Working Project", "Working Project"),
                  #                       # verbatimTextOutput("SE_Dir_Project", placeholder = TRUE)
                  #                       ))
                  #              )
                  #              # ,
                  #              # tabPanel("Data Environment", 
                  #              #      fluidRow(column(6,
                  #              #        tags$hr(),
                  #              #        shinyDirButton("SE_Dir_Climate", "Climate Data Path", "Climate Data Path"),
                  #              #        verbatimTextOutput("SE_Dir_Climate", placeholder = TRUE),
                  #              #        shinyDirButton("SE_Dir_Link", "Link Data Path", "Link Data Path"),
                  #              #        verbatimTextOutput("SE_Dir_Link", placeholder = TRUE),
                  #              #        shinyDirButton("SE_Dir_Species", "Species Data Path", "Species Data Path"),
                  #              #        verbatimTextOutput("SE_Dir_Species", placeholder = TRUE),
                  #              #        tags$hr(),
                  #              #        fileInput("SE_speciesinfo", "Select species index data (CSV file)",
                  #              #                  accept = c(
                  #              #                    "text/csv",
                  #              #                    "text/comma-separated-values,text/plain",
                  #              #                    ".csv")
                  #              #        ),
                  #              #        verbatimTextOutput("SE_speciesindex", placeholder = TRUE),
                  #              #        tags$hr(),                         
                  #              #        fileInput("SE_speciesdata1", "Select species location data (CSV file)",
                  #              #                  accept = c(
                  #              #                    "text/csv",
                  #              #                    "text/comma-separated-values,text/plain",
                  #              #                    ".csv")
                  #              #        ), 
                  #              #        verbatimTextOutput("SE_specieslocation", placeholder = TRUE)
                  #              #      ))
                  #              #    )
                  #               )
                  # ),   
                  
                  
                  
                  tabPanel(OV_Name,
                           
                           hr(),
                           mainPanel(
                             img(src="eco01.png"),
                             hr(),
                             img(src="eco02.png"),
                             br(),br()
                           )
                  ),         
                  
                  tabPanel(SP_Name, icon = icon("folder-open"),
                           tabsetPanel(
                             tabPanel("Species Information",
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
                                        column(4, DT::dataTableOutput("SP_Info")),
                                        column(1, uiOutput("Species_Link")),
                                        column(6, leafletOutput("SP_Map", width = "600", height = "600"))
                                      )
                                      # fluidRow(
                                      #   tags$hr(),
                                      #   column(6, 
                                      #        verbatimTextOutput("SP_Summary"),
                                      #        plotOutput("SP_Histogram")
                                      #   )
                                      # )
                             ),
                             tabPanel("Species Location",
                                      tags$head(
                                        # Include our custom CSS
                                        includeCSS("styles.css"),
                                        includeScript("gomap.js")
                                      ),
                                      tags$hr(),
                                      column(6, DT::dataTableOutput("SP_LOC_Info")),
                                      column(6, leafletOutput("SP_LOC_Map", width = "600", height = "600"))
                             )
                           )
                  ),  
                  
                  tabPanel(LD_Name, fluid = TRUE, icon = icon("folder-open"),
                           tags$hr(),
                           sidebarLayout(
                             sidebarPanel(width = 3, Fluid = TRUE,
                                          selectInput("LD_Type", LD_Name_Variables,
                                                      choices = LD_Name_Variables_list,
                                                      selected = LD_Name_Variables_selected
                                          ),
                                          
                                          fluidRow(
                                            
                                            # actionButton('LD_Value_TY',label = "Type", style = ST_Name)
                                            
                                            # box(status = "primary", solidHeader = T,
                                            #     title = "LD Type", width = 50, height = 45, collapsible = F, collapsed = T
                                            # )
                                            
                                            # valueBoxOutput("LD_Value_TY")
                                          ),
                                          
                                          # Input: Checkbox if file has header ----
                                          radioButtons("LD_Climate_model", LD_Name_Models,
                                                       choices = LD_Name_Models_list,
                                                       selected = LD_Name_Models_selected
                                          ),
                                          
                                          # Input: Checkbox if file has header ----
                                          radioButtons("LD_Climate_scenario", LD_Name_Scenarios,
                                                       choices = LD_Name_Scenarios_list,
                                                       selected = LD_Name_Scenarios_selected
                                          ),
                                          
                                          # Input: Checkbox if file has header ----
                                          # radioButtons("LD_Project_year", LD_Name_Year,
                                          #              choices = LD_Name_Year_list,
                                          #              selected = LD_Name_Year_selected
                                          # )
                                          
                                          sliderInput("LD_Project_year", label = LD_Name_Year, min = 2000,
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
                               # bsCollapse(
                                 # bsCollapsePanel("Summary", verbatimTextOutput("LD_Summary"),style = ST_Name),
                                 # bsCollapsePanel("Histogram", plotOutput("LD_Histogram"),style = ST_Name)
                                 # ,multiple  = TRUE),
                               
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
                               leafletOutput("LD_Map", width = "800", height = "650")
                             )
                           )
                  ),  
                  
                  tabPanel(CD_Name, fluid = TRUE, icon = icon("folder-open"),
                           tags$hr(),
                           sidebarLayout(
                             sidebarPanel(width = 3, Fluid = TRUE,
                                          selectInput("CD_Variables", CD_Name_Variables,
                                                      choices = CD_Name_Variables_list,
                                                      selected = CD_Name_Variables_selected
                                          ),
                                          
                                          # Input: Checkbox if file has header ----
                                          radioButtons("CD_Climate_model", CD_Name_Models,
                                                       choices = CD_Name_Models_list,
                                                       selected = CD_Name_Models_selected
                                          ),
                                          
                                          # Input: Checkbox if file has header ----
                                          radioButtons("CD_Climate_scenario", CD_Name_Scenarios,
                                                       choices = CD_Name_Scenarios_list,
                                                       selected = CD_Name_Scenarios_selected
                                          ),
                                          
                                          # Input: Checkbox if file has header ----
                                          # radioButtons("CD_Project_year", CD_Name_Year,
                                          #              choices = CD_Name_Year_list,
                                          #              selected = CD_Name_Year_selected
                                          # )
                                          sliderInput("CD_Project_year", label = CD_Name_Year, min = 2000,
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
                               leafletOutput("CD_Map", width = "800", height = "650")
                               
                             )
                           )
                           
                  ),  
                  
                  
                  
                  tabPanel(SDM_Name, icon = icon("pie-chart"),
                           tabsetPanel(
                             tabPanel("Modeling",
                                      
                                      fluidRow(
                                        tags$hr(),
                                        # verbatimTextOutput("SDM_SP_Selection"),
                                        uiOutput("SDM_Sel_Box"),
                                        column(4, 
                                               actionButton('resetSpeciesInfo',label = "Reset", style = ST_Name),
                                               tags$style(type='text/css', "button#resetSpeciesInfo {margin-left: 90%;}"),
                                               br(),br(),
                                               DT::dataTableOutput("SDM_SP_Info")
                                        ),
                                        column(4,
                                               
                                               # div( style = "display: inline-block;",
                                               #      checkboxGroupInput("SDM_MO_Climate_model", SDM_Name_CD_Models,
                                               #                         choices = c(SDM_Name_CD_Models_list),
                                               #                         selected = SDM_Name_CD_Models_selected
                                               #      ),
                                               #      # Input: Checkbox if file has header ----
                                               #      checkboxGroupInput("SDM_MO_Climate_scenario", SDM_Name_CD_Scenarios,
                                               #                         choices = c(SDM_Name_CD_Scenarios_list),
                                               #                         selected = SDM_Name_CD_Scenarios_selected
                                               #      ),
                                               #      
                                               #      #            # Input: Checkbox if file has header ----
                                               #      checkboxGroupInput("SDM_MO_Protect_year", SDM_Name_CD_Year,
                                               #                         choices = c(SDM_Name_CD_Year_list),
                                               #                         selected = SDM_Name_CD_Year_selected
                                               #      )
                                               # )

                                               uiOutput('SDM_MO_Condition_CheckBoxGroup')
                                        ),
                                        column(4,
                                               useShinyalert(),  # Set up shinyalert
                                               actionButton("SDM_MO_SDM_run", label = SDM_Name_models_run)
                                               )
                                        
                                      )
                             ),
                             
                             
                             tabPanel("Model Outputs", fluid = TRUE,
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
                                                     radioButtons("SDM_OU_Climate_model", SDM_Name_CD_Models_out,
                                                                  choices = c(SDM_Name_CD_Models_out_list),
                                                                  selected = SDM_Name_CD_Models_out_selected
                                                     ),
                                                     
                                                     # Input: Checkbox if file has header ----
                                                     radioButtons("SDM_OU_Climate_scenario", SDM_Name_CD_Scenarios_out,
                                                                  choices = c(SDM_Name_CD_Scenarios_out_list),
                                                                  selected = SDM_Name_CD_Scenarios_out_selected
                                                     ),
                                                     
                                                     # Input: Checkbox if file has header ----
                                                     # radioButtons("SDM_OU_Project_year", SDM_Name_CD_Year_out,
                                                     #              choices = c(SDM_Name_CD_Year_out_list),
                                                     #              selected = SDM_Name_CD_Year_out_selected
                                                     # )
                                                     
                                                     sliderInput("SDM_OU_Project_year", label = SDM_Name_CD_Year_out, min = 2000,
                                                                 max = 2080, value = 2000, step = 10, sep = "",
                                                                 animate = animationOptions(interval = 10000))
                                        ),
                                        
                                        
                                        
                                        # Main panel for displaying outputs ----
                                        mainPanel(
                                          tabsetPanel(
                                            # tabPanel("Validation",
                                            #          tags$hr(),
                                            #          fluidRow(
                                            #            column(6, 
                                            #                 DT::dataTableOutput("SDM_OU_Validation")
                                            #            )
                                            #          ),
                                            #          fluidRow(
                                            #            column(8, 
                                            #            tags$hr(),
                                            #            plotOutput("SDM_OU_Validation_BoxPlot")
                                            #            )
                                            #          )
                                            #          ),
                                            # tabPanel("Contribution",
                                            #          tags$hr(),
                                            #          fluidRow(
                                            #            column(6, 
                                            #                   DT::dataTableOutput("SDM_OU_Contribution")
                                            #            )
                                            #          ),
                                            #          fluidRow(
                                            #            column(8, 
                                            #                   tags$hr(),
                                            #                   column(10, plotOutput("SDM_OU_Contribution_Radarchart"))
                                            #            )
                                            #          )
                                            # ),
                                            
                                            tabPanel("Validation & Contribution",
                                                     
                                                     # hr(),
                                                     
                                                     fluidRow(
                                                       hr(),
                                                       column(6, DT::dataTableOutput("SDM_OU_Validation")
                                                              
                                                              # tags$hr(),
                                                              # plotOutput("SDM_OU_Validation_BoxPlot")
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
                                                       # valueBox("KMA", "Climate Models", icon = icon("credit-card"), color = "blue", width = 3),
                                                       # valueBox("RCP4.5", "Climate Scenarios", icon = icon("list"), color = "purple", width = 3),
                                                       # valueBox("2050", "Projecting Years", icon = icon("thumbs-up"), color = "yellow", width = 3),
                                                       valueBoxOutput("Value_CM"),
                                                       valueBoxOutput("Value_CS"),
                                                       valueBoxOutput("Value_YR")
                                                       # infoBox("New Orders", 10 * 2, icon = icon("credit-card"), width = 3) ,
                                                       # infoBox("New Orders", 10 * 2, icon = icon("credit-card"), fill = TRUE, width = 3)
                                                       
                                                     ),
                                                     fluidRow(class = "text-center",
                                                              column(6, 
                                                                     # tags$h3("<Probability Map>", style = "text-align: center;"),
                                                                     box(status = "success",
                                                                         title = "PROBABILITY MAP", width = 20, height = 45, collapsible = T, collapsed = T
                                                                         # verbatimTextOutput("SDM_OU_PROJ_Summary")
                                                                         # plotOutput("SDM_OU_PROJ_Histogram")
                                                                     ),
                                                                     # tags$h3("<Probability Map>", style = "display: inline-block;"),
                                                                     
                                                                     # uiOutput('CM_UI'),
                                                                     # uiOutput('CS_UI'),
                                                                     # uiOutput('PY_UI'),
                                                                     
                                                                     # uiOutput('SYNC_UI'),
                                                                     
                                                                     
                                                                     # leafletOutput("SDM_OU_Probability_map", width = "800", height = "600"),
                                                                     leafletOutput("SDM_OU_Probability_map"),
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
                                                                     leafletOutput("SDM_OU_Predicted_map"),
                                                                     br(),
                                                                     actionButton("Reset_Predicted_View", label = "Reset"),
                                                                     tags$hr(),
                                                                     column(12, verbatimTextOutput("SDM_OU_PRED_Summary")),
                                                                     column(12, plotOutput("SDM_OU_PRED_Histogram"))
                                                              )
                                                     )
                                                     
                                            )
                                            
                                            # tabPanel("Probability Map", 
                                            # 
                                            #          tags$hr(),
                                            #          leafletOutput("SDM_OU_Probability_map", width = "800", height = "600"),
                                            #          tags$hr(),
                                            #          column(10, verbatimTextOutput("SDM_OU_PROJ_Summary")),
                                            #          column(10, plotOutput("SDM_OU_PROJ_Histogram"))
                                            #          ),
                                            # tabPanel("Predicted Map", 
                                            # 
                                            #          tags$hr(),
                                            #          leafletOutput("SDM_OU_Predicted_map", width = "800", height = "600"),
                                            #          tags$hr(),
                                            #          column(10, verbatimTextOutput("SDM_OU_PRED_Summary")),
                                            #          column(10, plotOutput("SDM_OU_PRED_Histogram"))
                                            # )
                                          )
                                        )
                                      )
                             )
                           )
                  ),  
                  
                  
                  tabPanel(DM_Name, icon = icon("pie-chart"),
                           tabsetPanel(
                             tabPanel("Modeling", fluid = TRUE,
                                      tags$hr(),
                                      fluidRow(
                                        column(2,
                                               # valueBoxOutput("DM_Value_SP")
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
                                        
                                        # verbatimTextOutput("DM_CD_Selection"),
                                        
                                        # Sidebar panel for inputs ----
                                        sidebarPanel(width = 2,
                                                     
                                                     
                                                     
                                                     
                                                     # Horizontal line ----
                                                     #                           tags$hr(),
                                                     
                                                     selectInput("DM-MO_Species", "Select a species",
                                                                 choices = c("구상나무" = "option1",
                                                                             "가문비나무 " = "option2"),
                                                                 selected = "option1"
                                                     ),
                                                     # tags$hr(),
                                                     
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
                                                     
                                                     # Input: Checkbox if file has header ----
                                                     # checkboxGroupInput("DM-MO_Protect_year", "Projection Year",
                                                     #                    choices = c("2010" = "10",
                                                     #                                "2020" = "20",
                                                     #                                "2030" = "30",
                                                     #                                "2040" = "40",
                                                     #                                "2050" = "50",
                                                     #                                "2060" = "60",
                                                     #                                "2070" = "70",
                                                     #                                "2080" = "80"),
                                                     #                    selected = c("10", "20", "30","40", "50", "60","70", "80")
                                                     # )
                                        ),
                                        
                                        sidebarPanel(width = 2,
                                                     # Input: Checkbox if file has header ----
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
                                                     ),
                                                     
                                                     # Horizontal line ----
                                                     #                              tags$hr(),
                                                     
                                                     checkboxGroupInput("DM-MO_Barrier", "Select Barrier Data",
                                                                        choices = c("토지이용" = "토지이용",
                                                                                    "산불" = "FORESTFIRE",
                                                                                    "산사태" = "산사태"),
                                                                        selected = c("토지이용", "FORESTFIRE", "산사태")
                                                     )
                                        ),
                                        
                                        
                                        sidebarPanel(width = 3, Fluid = TRUE,
                                                     
                                                     
                                                     checkboxGroupInput("DM-MO_Dispersal_type", "Dispersal Types",
                                                                        choices = c("ND (No Dispersal)" = "ND",
                                                                                    "SDD (Short Distance Dispersal)" = "SDD",
                                                                                    "MDD (Middle Distance Dispersal)" = "MDD",
                                                                                    "LDD (Long Distance Dispersal)" = "LDD",
                                                                                    "UD (Unlimited Dispersal)" = "UD"),
                                                                        selected = "LDD"
                                                     ),
                                                     
                                                     
                                                     
                                                     sliderInput("DM-MO_Slider", label = h5("Select a dispersal distance"), min = 0, 
                                                                 max = 10000, value = 1000, step = 50)
                                        ),
                                        
                                        sidebarPanel(width = 3, Fluid = TRUE,
                                                     tags$hr(),  
                                                     # infoBox("Model Run", "RUN", icon = icon("angle-double-right"), width = 2),
                                                     actionButton("DM_MO_Action", label = "Run"),
                                                     tags$hr()
                                        )
                                        
                                      )
                                      
                             ),
                             
                             
                             tabPanel("Model Outputs", fluid = TRUE,
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
                                                     
                                                     # Input: Checkbox if file has header ----
                                                     # radioButtons("DM-OU_Project_year", "Projection Year",
                                                     #              choices = c("Current" = "00",
                                                     #                          "2010" = "10",
                                                     #                          "2020" = "20",
                                                     #                          "2030" = "30",
                                                     #                          "2040" = "40",
                                                     #                          "2050" = "50",
                                                     #                          "2060" = "60",
                                                     #                          "2070" = "70",
                                                     #                          "2080" = "80"),
                                                     #              selected = "30"
                                                     # )
                                                     
                                                     
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
                                          leafletOutput("DM_OU_DIspersal_map", width = "800", height = "650")
                                          
                                          # tabsetPanel(
                                          # tabPanel("Summary", verbatimTextOutput("DM_OU_Summary")), 
                                          # tabPanel("DIspersal Map", 
                                          #          tags$head(
                                          #            # Include our custom CSS
                                          #            includeCSS("styles.css"),
                                          #            includeScript("gomap.js")
                                          #          ),
                                          #          leafletOutput("DM_OU_DIspersal_map", width = "800", height = "600"))
                                          
                                          #   tabPanel("Summary & Dispersal Map", 
                                          #            
                                          #            
                                          #            bsCollapse( bsCollapsePanel("Summary",
                                          #                                        verbatimTextOutput("DM_OU_Summary"), style = ST_Name)
                                          #            ) ,
                                          #   
                                          #   leafletOutput("DM_OU_DIspersal_map", width = "800", height = "600")
                                          #   
                                          # )
                                        )
                                      )
                             )
                           )
                  ), 
                  
                  
                  tabPanel(SS_Name, icon = icon("table"),
                           tabsetPanel(
                             tabPanel("Change Analysis", fluid = TRUE,
                                      
                                      uiOutput("SS_Analy_Box"),
                                      
                                      tags$hr(),
                                      fluidRow(
                                        sidebarPanel(width = 3, Fluid = TRUE,
                                                     uiOutput("SS_CA_Species")
                                        ),
                                        sidebarPanel(width = 3, Fluid = TRUE,             
                                                     
                                                     checkboxGroupInput("SS_CA_Dispersal_type", SS_Name_DM_Models,
                                                                        choices = c(SS_Name_DM_Models_list),
                                                                        selected = SS_Name_DM_Models_selected
                                                     ),
                                                     
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
                                        ),
                                        sidebarPanel(width = 4,
                                                     uiOutput("SS_CA_SDM_model"),
                                                     tags$hr(),
                                                     actionButton("SS_CA_Action_change", label = "Analayzing the change of Species Distribution"),
                                                     tags$hr(),
                                                     actionButton("SS_CA_Action_Vindex", label = "Calculating the Climate Vulnerability Index of Species")
                                        )
                                      )
                             ),
                             
                             
                             tabPanel("Analysis Outputs", fluid = TRUE,
                                      tags$hr(),
                                      sidebarLayout(
                                        sidebarPanel(width = 3, Fluid = TRUE,
                                                     
                                                     uiOutput("SS_AO_Species"),
                                                     tags$hr(),
                                                     
                                                     uiOutput("SS_AO_SDM_model"),
                                                     
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
                  
                  tabPanel(IS_Name, icon = icon("table"),
                           tabsetPanel(
                             tabPanel("Change Analysis", fluid = TRUE,
                                      tags$hr(),
                                      fluidRow(
                                        sidebarPanel(width = 3, Fluid = TRUE,
                                                     uiOutput("IS_CA_Species")
                                        ),
                                        sidebarPanel(width = 3, Fluid = TRUE,             
                                                     
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
                                        ),
                                        sidebarPanel(width = 4,
                                                     uiOutput("IS_CA_SDM_model"),
                                                     tags$hr(),
                                                     checkboxGroupInput("IS-VA_Admin", "Select a administration type",
                                                                        choices = c("SIDO" = "SIDO",
                                                                                    "SIGUNGU" = "SIGUNGU"),
                                                                        selected = c("SIDO", "SIGUNGU")
                                                     ),
                                                     
                                                     tags$hr(),
                                                     tags$hr(),
                                                     shinyDirButton("IS_VA_Dir_Folder", "Invasive Assessment Output Folder", "Invasive Assessment Output Folder"),
                                                     verbatimTextOutput("IS_VA_Dir_Folder", placeholder = TRUE),
                                                     br(),
                                                     tags$hr(),
                                                     actionButton("IS_VA_Action_Analysis", label = "Assessing Impact and Vulnerabilty")
                                        )
                                      )
                             ),
                             
                             tabPanel("Model Outputs", fluid = TRUE,
                                      tags$hr(),
                                      sidebarLayout(
                                        sidebarPanel(width = 3, Fluid = TRUE,
                                                     #                                        uiOutput("IS_AO_Species"),
                                                     shinyDirButton("IS_AO_Dir_Folder", "Invasive Assessment Output Folder", "Invasive Assessment Output Folder"),
                                                     verbatimTextOutput("IS_AO_Dir_Folder", placeholder = TRUE),
                                                     tags$hr(),
                                                     
                                                     checkboxGroupInput("IS_AO_Output_option1", IS_Name_OU_Option1,
                                                                        choices = c(IS_Name_OU_Option1_list),
                                                                        selected = IS_Name_OU_Option1_selected
                                                     ),
                                                     
                                                     checkboxGroupInput("IS_AO_Output_option2", IS_Name_OU_Option2,
                                                                        choices = c(IS_Name_OU_Option2_list),
                                                                        selected = IS_Name_OU_Option2_selected
                                                     ),
                                                     
                                                     uiOutput("IS_AO_SDM_model"),
                                                     
                                                     checkboxGroupInput("IS_AO_Dispersal_type", IS_Name_DM_Models,
                                                                        choices = c(IS_Name_DM_Models_list),
                                                                        selected = IS_Name_DM_Models_selected
                                                     ),
                                                     
                                                     # Input: Checkbox if file has header ----
                                                     checkboxGroupInput("IS_AO_Climate_model", IS_Name_CD_Models,
                                                                        choices = c(IS_Name_CD_Models_list),
                                                                        selected = IS_Name_CD_Models_selected
                                                     ),
                                                     
                                                     # Input: Checkbox if file has header ----
                                                     checkboxGroupInput("IS_AO_Climate_scenario", IS_Name_CD_Scenarios,
                                                                        choices = c(IS_Name_CD_Scenarios_list),
                                                                        selected = IS_Name_CD_Scenarios_selected
                                                     ),
                                                     
                                                     # Input: Checkbox if file has header ----
                                                     checkboxGroupInput("IS_AO_Project_year", IS_Name_CD_Year,
                                                                        choices = c(IS_Name_CD_Year_list),
                                                                        selected = IS_Name_CD_Year_selected
                                                     )
                                        ),
                                        
                                        # Main panel for displaying outputs ----
                                        mainPanel(
                                          tabsetPanel(
                                            tabPanel("Assessment Map", 
                                                     tags$head(
                                                       # Include our custom CSS
                                                       includeCSS("styles.css"),
                                                       includeScript("gomap.js")
                                                     ),
                                                     tags$hr(),
                                                     column(6, leafletOutput("IS_AO_Map1", width = "800", height = "650"))),
                                            tabPanel("Vulnerability Map", 
                                                     tags$head(
                                                       # Include our custom CSS
                                                       includeCSS("styles.css"),
                                                       includeScript("gomap.js")
                                                     ),
                                                     tags$hr(),
                                                     column(6, leafletOutput("IS_AO_Map2", width = "800", height = "650"))),
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
                                                       tabPanel("Map",
                                                                tags$head(
                                                                  # Include our custom CSS
                                                                  includeCSS("styles.css"),
                                                                  includeScript("gomap.js")
                                                                ),
                                                                leafletOutput("IS_OU_EX_Map", width = "800", height = "600")),
                                                       tabPanel("SIDO",
                                                                tabsetPanel(
                                                                  tabPanel("Map", 
                                                                           tags$head(
                                                                             # Include our custom CSS
                                                                             includeCSS("styles.css"),
                                                                             includeScript("gomap.js")
                                                                           ),
                                                                           leafletOutput("IS_OU_EX_SIDO_Map", width = "800", height = "600")),
                                                                  tabPanel("Statistics", plotOutput("IS_OU_EX_SIDO_Stat"))
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
                                                                           leafletOutput("IS_OU_EX_SIGUNGU_Map", width = "800", height = "600")),
                                                                  tabPanel("Statistics", verbatimTextOutput("IS_OU_EX_SIGUNGU_Stat"))
                                                                )
                                                                
                                                       )
                                                     )
                                            ),
                                            tabPanel("Invasive species Introduction",
                                                     tabPanel("Map",
                                                              tags$head(
                                                                # Include our custom CSS
                                                                includeCSS("styles.css"),
                                                                includeScript("gomap.js")
                                                              ),
                                                              leafletOutput("IS_OU_SI_Map", width = "800", height = "600")),
                                                     tabPanel("SIDO",
                                                              tabsetPanel(
                                                                tabPanel("Map", 
                                                                         tags$head(
                                                                           # Include our custom CSS
                                                                           includeCSS("styles.css"),
                                                                           includeScript("gomap.js")
                                                                         ),
                                                                         leafletOutput("IS_OU_SI_SIDO_Map", width = "800", height = "600")),
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
                                                                         leafletOutput("IS_OU_SI_SIGUNGU_Map", width = "800", height = "600")),
                                                                tabPanel("Statistics", verbatimTextOutput("IS_OU_SI_SIGUNGU_Stat"))
                                                              )
                                                              
                                                     )
                                            )
                                          )
                                        )
                                      )
                             )
                           )
                           
                  ),     
                  
                  
                  
                  tabPanel(VH_Name, icon = icon("table"),
                           tabsetPanel(
                             tabPanel("Change Analysis", fluid = TRUE,
                                      tags$hr(),
                                      fluidRow(
                                        sidebarPanel(width = 3, Fluid = TRUE,
                                                     uiOutput("VH_CA_Species")
                                        ),
                                        sidebarPanel(width = 3, Fluid = TRUE,             
                                                     
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
                                        ),
                                        sidebarPanel(width = 3,
                                                     uiOutput("VH_CA_SDM_model"),
                                                     tags$hr(),
                                                     
                                                     # Horizontal line ----
                                                     #                              tags$hr(),
                                                     
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
                                                     ),
                                                     
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
                             
                             tabPanel("Model Outputs", fluid = TRUE,
                                      tags$hr(),
                                      sidebarLayout(
                                        sidebarPanel(width = 3, Fluid = TRUE,
                                                     
                                                     uiOutput("VH_AO_Species"),
                                                     tags$hr(),
                                                     
                                                     uiOutput("VH_AO_SDM_model"),
                                                     
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
                                                                leafletOutput("VH_OU_SR_Map", width = "800", height = "600")),
                                                       tabPanel("Habitat Type",
                                                                tabsetPanel(
                                                                  tabPanel("Map", 
                                                                           tags$head(
                                                                             # Include our custom CSS
                                                                             includeCSS("styles.css"),
                                                                             includeScript("gomap.js")
                                                                           ),
                                                                           leafletOutput("VH_OU_SR_Habitat_Map", width = "800", height = "600")),
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
                                                                leafletOutput("VH_OU_SRL_Map", width = "800", height = "600")),
                                                       tabPanel("Habitat Type",
                                                                tabsetPanel(
                                                                  tabPanel("Map", 
                                                                           tags$head(
                                                                             # Include our custom CSS
                                                                             includeCSS("styles.css"),
                                                                             includeScript("gomap.js")
                                                                           ),
                                                                           leafletOutput("VH_OU_SRL_Habitat_Map", width = "800", height = "600")),
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
                                                                leafletOutput("VH_OU_SL_Map", width = "800", height = "600")),
                                                       tabPanel("Habitat Type",
                                                                tabsetPanel(
                                                                  tabPanel("Map", 
                                                                           tags$head(
                                                                             # Include our custom CSS
                                                                             includeCSS("styles.css"),
                                                                             includeScript("gomap.js")
                                                                           ),
                                                                           leafletOutput("VH_OU_SL_Habitat_Map", width = "800", height = "600")),
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
                                                                leafletOutput("VH_OU_SS_Map", width = "800", height = "600")),
                                                       tabPanel("Habitat Type",
                                                                tabsetPanel(
                                                                  tabPanel("Map", 
                                                                           tags$head(
                                                                             # Include our custom CSS
                                                                             includeCSS("styles.css"),
                                                                             includeScript("gomap.js")
                                                                           ),
                                                                           leafletOutput("VH_OU_SS_Habitat_Map", width = "800", height = "600")),
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
                                                                leafletOutput("VH_OU_SI_Map", width = "800", height = "600")),
                                                       tabPanel("Habitat Type",
                                                                tabsetPanel(
                                                                  tabPanel("Map", 
                                                                           tags$head(
                                                                             # Include our custom CSS
                                                                             includeCSS("styles.css"),
                                                                             includeScript("gomap.js")
                                                                           ),
                                                                           leafletOutput("VH_OU_SI_Habitat_Map", width = "800", height = "600")),
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
                  
                  
                  tabPanel(HELP_Name, fluid = TRUE,
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
      ),
      tags$hr(), # theme에 따라서 선이 보이지 않을 수 있음!!
      tags$footer("MOTIVE ECOSYSTEM(생태계 기후변화 영향 및 취약성평가모형)")
      
    )
    
  )
)