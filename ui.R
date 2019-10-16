## JD's Git Merge Test

shinyUI(

   fluidPage(h4(System_Name),
             
             shinythemes::themeSelector(),
             
             tags$hr(),

#   setBackgroundColor(
#     color = c("white", "green"),
#     gradient = "linear",
#     direction = "bottom"
#   ),

    setBackgroundColor("ghostwhite"),

             
    tabsetPanel(
      tabPanel(SE_Name,
                 tabsetPanel(
                   tabPanel("Working Environment",
                        fluidRow(column(6,
                            tags$hr(),
                            shinyDirButton("SE_Dir_Project", "Working Project", "Working Project"),
                            verbatimTextOutput("SE_Dir_Project", placeholder = TRUE)
                            ))
                   ),
                   tabPanel("Data Environment", 
                        fluidRow(column(6,
                          tags$hr(),
                          shinyDirButton("SE_Dir_Climate", "Climate Data Path", "Climate Data Path"),
                          verbatimTextOutput("SE_Dir_Climate", placeholder = TRUE),
                          shinyDirButton("SE_Dir_Link", "Link Data Path", "Link Data Path"),
                          verbatimTextOutput("SE_Dir_Link", placeholder = TRUE),
                          shinyDirButton("SE_Dir_Species", "Species Data Path", "Species Data Path"),
                          verbatimTextOutput("SE_Dir_Species", placeholder = TRUE),
                          tags$hr(),
                          fileInput("SE_speciesinfo", "Select species index data (CSV file)",
                                    accept = c(
                                      "text/csv",
                                      "text/comma-separated-values,text/plain",
                                      ".csv")
                          ),
                          verbatimTextOutput("SE_speciesindex", placeholder = TRUE),
                          tags$hr(),                         
                          fileInput("SE_speciesdata1", "Select species location data (CSV file)",
                                    accept = c(
                                      "text/csv",
                                      "text/comma-separated-values,text/plain",
                                      ".csv")
                          ), 
                          verbatimTextOutput("SE_specieslocation", placeholder = TRUE)
                        ))
                      )
                    )
      ),       
                                  
    tabPanel(SP_Name,
             tabsetPanel(
               tabPanel("Species Information",
                        tags$head(
                          # Include our custom CSS
                          includeCSS("styles.css"),
                          includeScript("gomap.js")
                        ),
                        tags$hr(),
                        fluidRow(
                          column(6, DT::dataTableOutput("SP_Info")),
                          column(6, leafletOutput("SP_Map", width = "500", height = "600"))
                        ),
                        fluidRow(
                          tags$hr(),
                          column(6, 
                               verbatimTextOutput("SP_Summary"),
                               plotOutput("SP_Histogram")
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
                        column(6, DT::dataTableOutput("SP_LOC_Info")),
                        column(6, leafletOutput("SP_LOC_Map", width = "500", height = "600")))               
             )
     ),  

     tabPanel(LD_Name, fluid = TRUE,
              tags$hr(),
              sidebarLayout(
                sidebarPanel(width = 3, Fluid = TRUE,

                             selectInput("LD_Type", LD_Name_Variables,
                                         choices = LD_Name_Variables_list,
                                         selected = LD_Name_Variables_selected
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
                             radioButtons("LD_Project_year", LD_Name_Year,
                                                choices = LD_Name_Year_list,
                                                selected = LD_Name_Year_selected
                             )
                         ),
                             
                             # Main panel for displaying outputs ----
                             mainPanel(
                               tabsetPanel(
                                 tabPanel("Map", 
                                          tags$head(
                                            # Include our custom CSS
                                            includeCSS("styles.css"),
                                            includeScript("gomap.js")
                                          ),
                                          tags$hr(),
                                          column(6, leafletOutput("LD_Map", width = "800", height = "650"))),
                                 tabPanel("Summary",
                                          tags$hr(),
                                          column(10, verbatimTextOutput("LD_Summary")),
                                          column(10, plotOutput("LD_Histogram")))
                               )
                             )
                          )
              
     ),  
     
     tabPanel(CD_Name, fluid = TRUE,
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
                                        radioButtons("CD_Project_year", CD_Name_Year,
                                                     choices = CD_Name_Year_list,
                                                     selected = CD_Name_Year_selected
                                        )
                           ),
                           
                           # Main panel for displaying outputs ----
                           mainPanel(
                             tabsetPanel(
                               tabPanel("Map", 
                                        tags$head(
                                          # Include our custom CSS
                                          includeCSS("styles.css"),
                                          includeScript("gomap.js")
                                        ),
                                        tags$hr(),
                                        column(6, leafletOutput("CD_Map", width = "800", height = "650"))),
                               tabPanel("Summary",
                                        tags$hr(),
                                        column(10, verbatimTextOutput("CD_Summary")),
                                        column(10, plotOutput("CD_Histogram")))
                             )
                           )
                         )
                         
                ),  
     

     
     tabPanel(SDM_Name,
                tabsetPanel(
                tabPanel("Modeling",
                   tabsetPanel(
                   tabPanel("Species selection",
                            fluidRow(
                              tags$hr(),
                              column(6, DT::dataTableOutput("SDM_SP_Info")),
                              column(4, verbatimTextOutput("SDM_SP_Selection"))
                              )
                            ),
                   tabPanel("Projection selection",
                            tags$hr(),
                            fluidRow(
                              # Sidebar panel for inputs ----
                              sidebarPanel(width = 4,
                             # Input: Checkbox if file has header ----
                             checkboxGroupInput("SDM_MO_Climate_model", SDM_Name_CD_Models,
                                                choices = c(SDM_Name_CD_Models_list),
                                                selected = SDM_Name_CD_Models_selected
                             ),

                             # Input: Checkbox if file has header ----
                             checkboxGroupInput("SDM_MO_Climate_scenario", SDM_Name_CD_Scenarios,
                                                choices = c(SDM_Name_CD_Scenarios_list),
                                                selected = SDM_Name_CD_Scenarios_selected
                              ),

                              # Input: Checkbox if file has header ----
                              checkboxGroupInput("SDM_MO_Protect_year", SDM_Name_CD_Year,
                                                 choices = c(SDM_Name_CD_Year_list),
                                                 selected = SDM_Name_CD_Year_selected
                              )
                            )
                            )
                            ),

                   tabPanel("Variable selection",  
                            tags$hr(),
                            fluidRow(
                              # Sidebar panel for inputs ----
                              sidebarPanel(width = 5,
             
             # Horizontal line ----
             #                              tags$hr(),
             
             checkboxGroupInput("SDM_MO_Variables", SDM_Name_CD_Variables,
                                choices = c(SDM_Name_CD_Variables_list),
                                selected = SDM_Name_CD_Variables_selected
                               )
                             )
                            )
          ),


          tabPanel("SDM selection",  
                   tags$hr(),
                   fluidRow(
                     # Sidebar panel for inputs ----
                     sidebarPanel(width = 4,

             checkboxGroupInput("SDM_MO_SDM_model", SDM_Name_models,
                                choices = c(SDM_Name_models_list),
                         selected = c(SDM_Name_models_selected)
             ),
             tags$hr(), 
             checkboxInput("SDM_MO_SDM_EMmodel", label = SDM_Name_EMmodels, value = FALSE),

             tags$hr(), 
             useShinyalert(),  # Set up shinyalert
             actionButton("SDM_MO_SDM_run", label = SDM_Name_models_run)
             
          )
                   )
          )

        )

      ),

                
        tabPanel("Model Outputs", fluid = TRUE,
                         tags$hr(),
                         sidebarLayout(
                           sidebarPanel(width = 3, Fluid = TRUE,

                                        uiOutput("SDM_OU_Species"),
                                        tags$hr(),

                                        uiOutput("SDM_OU_Projection_model"),
                                        tags$hr(),
                                        
                                        uiOutput("SDM_OU_Prediction_model"),
                                        tags$hr(),

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
                                        radioButtons("SDM_OU_Project_year", SDM_Name_CD_Year_out,
                                                     choices = c(SDM_Name_CD_Year_out_list),
                                                     selected = SDM_Name_CD_Year_out_selected
                                        )
                           ),
                           
                           # Main panel for displaying outputs ----
                           mainPanel(
                             tabsetPanel(
                               tabPanel("Validation",
                                        tags$hr(),
                                        fluidRow(
                                          column(6, 
                                               DT::dataTableOutput("SDM_OU_Validation")
                                          )
                                        ),
                                        fluidRow(
                                          column(8, 
                                          tags$hr(),
                                          plotOutput("SDM_OU_Validation_BoxPlot")
                                          )
                                        )
                                        ),
                               tabPanel("Contribution",
                                        tags$hr(),
                                        fluidRow(
                                          column(6, 
                                                 DT::dataTableOutput("SDM_OU_Contribution")
                                          )
                                        ),
                                        fluidRow(
                                          column(8, 
                                                 tags$hr(),
                                                 column(10, plotOutput("SDM_OU_Contribution_Radarchart"))
                                          )
                                        )
                               ),
                               tabPanel("Probability Map", 
                                        tags$head(
                                          # Include our custom CSS
                                          includeCSS("styles.css"),
                                          includeScript("gomap.js")
                                        ),
                                        tags$hr(),
                                        leafletOutput("SDM_OU_Probability_map", width = "800", height = "600"),
                                        tags$hr(),
                                        column(10, verbatimTextOutput("SDM_OU_PROJ_Summary")),
                                        column(10, plotOutput("SDM_OU_PROJ_Histogram"))
                                        ),
                               tabPanel("Predicted Map", 
                                        tags$head(
                                          # Include our custom CSS
                                          includeCSS("styles.css"),
                                          includeScript("gomap.js")
                                        ),
                                        tags$hr(),
                                        leafletOutput("SDM_OU_Predicted_map", width = "800", height = "600"),
                                        tags$hr(),
                                        column(10, verbatimTextOutput("SDM_OU_PRED_Summary")),
                                        column(10, plotOutput("SDM_OU_PRED_Histogram"))
                               )
                             )
                           )
                         )
                         )
                )
                ),  
     
     
tabPanel(DM_Name,
         tabsetPanel(
           tabPanel("Modeling", fluid = TRUE,
                    tags$hr(),
                    fluidRow(
                      
                      # Sidebar panel for inputs ----
                      sidebarPanel(width = 3,
                                   
                                   # Horizontal line ----
                                   #                           tags$hr(),
                                   
                                   selectInput("DM-MO_Species", "Select a species",
                                               choices = c("구상나무" = "option1",
                                                           "가문비나무 " = "option2"),
                                               selected = "option1"
                                   ),
                                   tags$hr(),
                                   
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
                                                      choices = c("RCP 4.5" = "rcp4.5",
                                                                  "RCP 8.5" = "rcp8.5"),
                                                      selected = "rcp4.5"
                                   ),
                                   
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
                                   )
                      ),
                      
                      sidebarPanel(width = 3,
                                   
                                   # Horizontal line ----
                                   #                              tags$hr(),
                                   
                                   checkboxGroupInput("DM-MO_Barrier", "Select Barrier Data",
                                                      choices = c("토지이용" = "토지이용",
                                                                  "산불" = "FORESTFIRE",
                                                                  "산사태" = "산사태"),
                                                      selected = c("토지이용", "FORESTFIRE", "산사태")
                                   )
                      ),
                      
                      
                      sidebarPanel(width = 4, Fluid = TRUE,
                                   
                                   
                                   checkboxGroupInput("DM-MO_Dispersal_type", "Dispersal Types",
                                                      choices = c("ND (No Dispersal)" = "ND",
                                                                  "SDD (Short Distance Dispersal)" = "SDD",
                                                                  "MDD (Middle Distance Dispersal)" = "MDD",
                                                                  "LDD (Long Distance Dispersal)" = "LDD",
                                                                  "UD (Unlimited Dispersal)" = "UD"),
                                                      selected = "LDD"
                                   ),
                                   
                                   
                                   
                                   sliderInput("DM-MO_Slider", label = h5("Select a dispersal distance"), min = 0, 
                                               max = 10000, value = 1000),
                                   
                                   
                                   tags$hr(),             
                                   actionButton("DM_MO_Action", label = "Run")
                                   
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
                                   radioButtons("DM-OU_Climate_model", "Climate Models",
                                                choices = c("KMA" = "KMA",
                                                            "KEI" = "KEI"),
                                                selected = "KMA"
                                   ),
                                   
                                   # Input: Checkbox if file has header ----
                                   radioButtons("DM-OU_Climate_scenario", "Climate Scenarios",
                                                choices = c("RCP 4.5" = "rcp4.5",
                                                            "RCP 8.5" = "rcp8.5"),
                                                selected = "rcp4.5"
                                   ),
                                   
                                   # Input: Checkbox if file has header ----
                                   radioButtons("DM-OU_Project_year", "Projection Year",
                                                choices = c("Current" = "00",
                                                            "2010" = "10",
                                                            "2020" = "20",
                                                            "2030" = "30",
                                                            "2040" = "40",
                                                            "2050" = "50",
                                                            "2060" = "60",
                                                            "2070" = "70",
                                                            "2080" = "80"),
                                                selected = "30"
                                   )
                      ),
                      
                      # Main panel for displaying outputs ----
                      mainPanel(
                        tabsetPanel(
                          tabPanel("Summary", verbatimTextOutput("DM_OU_Summary")), 
                          tabPanel("DIspersal Map", 
                                   tags$head(
                                     # Include our custom CSS
                                     includeCSS("styles.css"),
                                     includeScript("gomap.js")
                                   ),
                                   leafletOutput("DM_OU_DIspersal_map", width = "800", height = "600"))
                        )
                      )
                    )
           )
         )
), 
     
     
tabPanel(SS_Name,
         tabsetPanel(
           tabPanel("Change Analysis", fluid = TRUE,
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

      tabPanel(IS_Name,
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
     


tabPanel(VH_Name,
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
              )
      )
      
      
    )
  )
)

