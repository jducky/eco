
shinyUI(
  
   fluidPage(h3("MOTIVE Ecosystem"),
             
#            setBackgroundImage(src = "http://wallpics4k.com/wp-content/uploads/2014/07/470318.jpg"),
             
#            setBackgroundImage("C:/Projects/GUI/Shiny/Motive/Wildlife.png"),
             
             tags$hr(),
             
#             fluidRow(
#               column(2,  offset = 3,
#
#            actionButton("login", "Log in")
#               ),
#             column(3,
#             textInput('userid','User id:', value = '')
#             )
#
#             ),
#             tags$hr(),

#   setBackgroundColor(
#     color = c("white", "green"),
#     color = "ghostwhite"
#     gradient = "linear",
#     direction = "bottom"
#   ),

    setBackgroundColor("ghostwhite"),
#    setBackgroundColor("grey"),

#    setBackgroundImage(src = "C:/Projects/GUI/Shiny/Motive/Wildlife.png"),
             
    tabsetPanel(
                            
      tabPanel("Species", fluid = TRUE,
                          sidebarLayout(
                            sidebarPanel(width = 3, Fluid = TRUE,
                              
                              fileInput("file1", "Select species data (CSV file)",
                                        accept = c(
                                          "text/csv",
                                          "text/comma-separated-values,text/plain",
                                          ".csv")
                              ),
                              
                              tags$hr(),
                              checkboxInput("SP_Header", "Header", TRUE),
                              
                              
                              # Input: Select separator ----
                              radioButtons("SP_Sep", "Separator",
                                           choices = c(Comma = ",",
                                                       Semicolon = ";",
                                                       Tab = "\t"),
                                           selected = ","),
                              
                              # Input: Select quotes ----
                              radioButtons("SP_Quote", "Quote",
                                           choices = c(None = "",
                                                       "Double Quote" = '"',
                                                       "Single Quote" = "'"),
                                           selected = '"'),
                              
                              # Horizontal line ----
                              tags$hr(),
                              
                              # Input: Select number of rows to display ----
                              radioButtons("SP_Disp", "Display",
                                           choices = c(Head = "head",
                                                       All = "all"),
                                           selected = "head")
                              
                            ),
                            
                            # Main panel for displaying outputs ----
                            mainPanel(
                              

                              
                              tabsetPanel(
                                tabPanel("Species Information", tableOutput("SP_Information")), 
                                tabPanel("Table", tableOutput("SP_Display")), 
                                tabPanel("Summary", verbatimTextOutput("SP_Summary")),
                                tabPanel("Map", 
                                         tags$head(
                                           # Include our custom CSS
                                           includeCSS("styles.css"),
                                           includeScript("gomap.js")
                                         ),
                                         leafletOutput("SP_Map", width = "800", height = "600"))
                                
                              )
                            )
                          )
                 
      ),  

     tabPanel("Link Data", fluid = TRUE,
              sidebarLayout(
                sidebarPanel(width = 3, Fluid = TRUE,
                             # Input: Select a file ----
                             fileInput("LD_Data", "Select link data from other models",
                                       multiple = FALSE,
                                       accept = c("text/csv",
                                                  "text/comma-separated-values,text/plain",
                                                  ".csv")),
                             
                             # Horizontal line ----
                             tags$hr(),
                             
                             selectInput("LD_Type", "Link Data",
                                         choices = c("토지이용" = "option1",
                                                     "산불" = "option2",
                                                     "산사태" = "option3"),
                                         selected = "option2"
                             ),
                             
                             # Input: Checkbox if file has header ----
                             radioButtons("LD_Climate_model", "Climate Models",
                                                choices = c("KMA" = "KMA",
                                                            "KEI" = "KEI"),
                                                selected = "KMA"
                             ),
                             
                             # Input: Checkbox if file has header ----
                             radioButtons("LD_Climate_scenario", "Climate Scenarios",
                                                choices = c("RCP 4.5" = "rcp4.5",
                                                            "RCP 8.5" = "rcp8.5"),
                                                selected = "rcp4.5"
                             ),
                             
                             # Input: Checkbox if file has header ----
                             radioButtons("LD_Project_year", "Year",
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
                                 tabPanel("Summary", verbatimTextOutput("LD_Summary")), 
                                 tabPanel("Map", 
                                          tags$head(
                                            # Include our custom CSS
                                            includeCSS("styles.css"),
                                            includeScript("gomap.js")
                                          ),
                                          leafletOutput("LD_Map", width = "800", height = "600"))
                               )
                             )
                          )
              
     ),  
     
     tabPanel("Climate Data", fluid = TRUE,
                         sidebarLayout(
                           sidebarPanel(width = 3, Fluid = TRUE,
                                        # Input: Select a file ----
                                        fileInput("CD_Data", "Select climate variables",
                                                  multiple = FALSE,
                                                  accept = c("text/csv",
                                                             "text/comma-separated-values,text/plain",
                                                             ".csv")),
                                        
                                        # Horizontal line ----
                                        tags$hr(),
                                        
                                        selectInput("CD_Variables", "Climate Variables",
                                                    choices = c("BIOCLIM 01" = "bio01",
                                                                "BIOCLIM 02" = "bio02",
                                                                "BIOCLIM 03" = "bio03",
                                                                "BIOCLIM 04" = "bio04",
                                                                "BIOCLIM 05" = "bio05",
                                                                "BIOCLIM 06" = "bio06",
                                                                "BIOCLIM 07" = "bio07",
                                                                "BIOCLIM 08" = "bio08",
                                                                "BIOCLIM 09" = "bio09",
                                                                "BIOCLIM 10" = "bio10",
                                                                "BIOCLIM 11" = "bio11",
                                                                "BIOCLIM 12" = "bio12",
                                                                "BIOCLIM 13" = "bio13",
                                                                "BIOCLIM 14" = "bio14",
                                                                "BIOCLIM 15" = "bio15",
                                                                "BIOCLIM 16" = "bio16",
                                                                "BIOCLIM 17" = "bio17",
                                                                "BIOCLIM 18" = "bio18",
                                                                "BIOCLIM 19" = "bio19"),
                                                    selected = "bio01"
                                        ),
                                        
                                        # Input: Checkbox if file has header ----
                                        radioButtons("CD_Climate_model", "Climate Models",
                                                     choices = c("KMA" = "KMA",
                                                                 "KEI" = "KEI"),
                                                     selected = "KMA"
                                        ),
                                        
                                        # Input: Checkbox if file has header ----
                                        radioButtons("CD_Climate_scenario", "Climate Scenarios",
                                                     choices = c("RCP 4.5" = "rcp4.5",
                                                                 "RCP 8.5" = "rcp8.5"),
                                                     selected = "rcp4.5"
                                        ),
                                        
                                        # Input: Checkbox if file has header ----
                                        radioButtons("CD_Project_year", "Year",
                                                     choices = c("Current" = "00",
                                                                 "2010" = "10",
                                                                 "2020" = "20",
                                                                 "2030" = "30",
                                                                 "2040" = "40",
                                                                 "2050" = "50",
                                                                 "2060" = "60",
                                                                 "2070" = "70",
                                                                 "2080" = "80"),
                                                     selected = "00"
                                        )
                           ),
                           
                           # Main panel for displaying outputs ----
                           mainPanel(
                             tabsetPanel(
                               tabPanel("Summary", verbatimTextOutput("CD_Summary")), 
                               tabPanel("Map", 
                                        tags$head(
                                          # Include our custom CSS
                                          includeCSS("styles.css"),
                                          includeScript("gomap.js")
                                        ),
                                        leafletOutput("CD_Map", width = "800", height = "600"))
                             )
                           )
                         )
                         
                ),  
     

     
     tabPanel("SDM",
                tabsetPanel(
                tabPanel("Modeling", fluid = TRUE,
                         fluidRow(
                           
                           # Sidebar panel for inputs ----
                           sidebarPanel(width = 3,
                             
                             # Horizontal line ----
#                           tags$hr(),

                            selectInput("SDM-MO_Species", "Select a species",
                                         choices = c("구상나무" = "option1",
                                                     "가문비나무 " = "option2"),
                                         selected = "option1"
                             ),
                            tags$hr(),
                             
                             # Input: Checkbox if file has header ----
                             checkboxGroupInput("SDM-MO_Climate_model", "Climate Models",
                                                choices = c("KMA" = "KMA",
                                                            "KEI" = "KEI"),
                                                selected = "KMA"
                             ),

                             # Input: Checkbox if file has header ----
                             checkboxGroupInput("SDM-MO_Climate_scenario", "Climate Scenarios",
                                                choices = c("RCP 4.5" = "rcp4.5",
                                                            "RCP 8.5" = "rcp8.5"),
                                                selected = "rcp4.5"
                              ),

                              # Input: Checkbox if file has header ----
                              checkboxGroupInput("SDM-MO_Protect_year", "Projection Year",
                                               choices = c("2010" = "10",
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

sidebarPanel(width = 2,
             
             # Horizontal line ----
             #                              tags$hr(),
             
             checkboxGroupInput("SDM-MO_Variables", "Climate Variables",
                                choices = c("BIOCLIM 01" = "bio01",
                                            "BIOCLIM 02" = "bio02",
                                            "BIOCLIM 03" = "bio03",
                                            "BIOCLIM 04" = "bio04",
                                            "BIOCLIM 05" = "bio05",
                                            "BIOCLIM 06" = "bio06",
                                            "BIOCLIM 07" = "bio07",
                                            "BIOCLIM 08" = "bio08",
                                            "BIOCLIM 09" = "bio09",
                                            "BIOCLIM 10" = "bio10",
                                            "BIOCLIM 11" = "bio11",
                                            "BIOCLIM 12" = "bio12",
                                            "BIOCLIM 13" = "bio13",
                                            "BIOCLIM 14" = "bio14",
                                            "BIOCLIM 15" = "bio15",
                                            "BIOCLIM 16" = "bio16",
                                            "BIOCLIM 17" = "bio17",
                                            "BIOCLIM 18" = "bio18",
                                            "BIOCLIM 19" = "bio19"),
                                selected = c("bio01", "bio02", "bio03", "bio11", "bio12", "bio13")
             )
),


sidebarPanel(width = 4, Fluid = TRUE,
             

             checkboxGroupInput("SDM-MO_SDM_model", "Model types",
                                choices = c("GLM (Generalized Linear Model)" = "GLM",
                                            "GAM (Generalized Additive Model)" = "GAM",
                                            "GBM (Generalized Boosting Model)" = "GBM",
                                            "CTA (Classification Tree Analysis)" = "CTA",
                                            "ANN (Artificial Neural Network)" = "ANN",
                                            "SRE (Surface Range Envelop)" = "SRE",
                                            "FDA (Flexible Discriminant Analysis)" = "FDA",
                                            "MARS (Multiple Adaptive Regression Splines)" = "MARS",
                                            "RF (Random Forest)" = "RF",
                                            "MAXENT.Phillips" = "MAXENT.Phillips",
                                            "MAXENT (low-memory multinomial logistic regression)" = "MAXENT",
                                            "Ensemble" = "Ensemble"),
                         selected = "MAXENT.Phillips"
             ),

             tags$hr(), 
             useShinyalert(),  # Set up shinyalert
             actionButton("SDM_MO_SDM_run", label = "Run")
             
)

                          )

                         ),

                
                tabPanel("Model Outputs", fluid = TRUE,
                         sidebarLayout(
                           sidebarPanel(width = 3, Fluid = TRUE,

                                        selectInput("SDM-OU_Species", "Select a species",
                                                    choices = c("구상나무" = "option1",
                                                                "가문비나무 " = "option2"),
                                                    selected = "option1"
                                        ),
                                        tags$hr(),
                                        
                                                                                
                                        selectInput("SDM-OU_SDM_model", "Model Types",
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
                                        radioButtons("SDM-OU_Climate_model", "Climate Models",
                                                     choices = c("KMA" = "KMA",
                                                                 "KEI" = "KEI"),
                                                     selected = "KMA"
                                        ),
                                        
                                        # Input: Checkbox if file has header ----
                                        radioButtons("SDM-OU_Climate_scenario", "Climate Scenarios",
                                                     choices = c("RCP 4.5" = "rcp4.5",
                                                                 "RCP 8.5" = "rcp8.5"),
                                                     selected = "rcp4.5"
                                        ),
                                        
                                        # Input: Checkbox if file has header ----
                                        radioButtons("SDM-OU_Project_year", "Projection Year",
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
                               tabPanel("Validation",
                                        tableOutput("SDM_OU_Validation"),
                                        plotOutput("SDM_OU_BoxPlot")),
                               tabPanel("Summary", verbatimTextOutput("SDM_OU_Summary")),
                               tabPanel("Probability Map", 
                                        tags$head(
                                          # Include our custom CSS
                                          includeCSS("styles.css"),
                                          includeScript("gomap.js")
                                        ),
                                        leafletOutput("SDM_OU_Probability_map", width = "800", height = "600")),
                               tabPanel("Predicted Map", 
                                        tags$head(
                                          # Include our custom CSS
                                          includeCSS("styles.css"),
                                          includeScript("gomap.js")
                                        ),
                                        leafletOutput("SDM_OU_Predicted_map", width = "800", height = "600"))
                             )
                           )
                         )
                         )
                )
                ),  
     
     
tabPanel("Dispesal Model",
         tabsetPanel(
           tabPanel("Modeling", fluid = TRUE,
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
     
     
tabPanel("Sensitivity species",
         tabsetPanel(
           tabPanel("Species", fluid = TRUE,
                    sidebarLayout(
                      sidebarPanel(width = 3, Fluid = TRUE,
                                   
                                   selectInput("SS-SP_Species", "Select a species",
                                               choices = c("구상나무" = "option1",
                                                           "가문비나무 " = "option2"),
                                               selected = "option1"
                                   ),
                                   tags$hr(),
                                   
                                   
                                   
                                   selectInput("SS-SP_SDM_model", "Model Types",
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
                                   
                                   checkboxGroupInput("SS-SP_Dispersal_type", "Dispersal Types",
                                                      choices = c("No Dispersal" = "ND",
                                                                  "SDD" = "SDD",
                                                                  "MDD" = "MDD",
                                                                  "LDD" = "LDD",
                                                                  "Unlimited Dispersal" = "UD"),
                                                      selected = "LDD"
                                   ),
                                   
                                   # Input: Checkbox if file has header ----
                                   checkboxGroupInput("SS-SP_Climate_model", "Climate Models",
                                                      choices = c("KMA" = "KMA",
                                                                  "KEI" = "KEI"),
                                                      selected = "KMA"
                                   ),
                                   
                                   # Input: Checkbox if file has header ----
                                   checkboxGroupInput("SS-SP_Climate_scenario", "Climate Scenarios",
                                                      choices = c("RCP 4.5" = "rcp4.5",
                                                                  "RCP 8.5" = "rcp8.5"),
                                                      selected = "rcp4.5"
                                   ),
                                   
                                   # Input: Checkbox if file has header ----
                                   checkboxGroupInput("SS-SP_Project_year", "Projection Year",
                                                      choices = c("Current" = "00",
                                                                  "2030" = "30",
                                                                  "2050" = "50",
                                                                  "2080" = "80"),
                                                      selected = c("00", "30", "50", "80")
                                   )
                      ),
                      
                      # Main panel for displaying outputs ----
                      mainPanel(
                        tabsetPanel(
                          tabPanel("Calculate a Vulnerability Index", verbatimTextOutput("SS-SP_Summary")),
                          tabPanel("Vulnerability Pattern", verbatimTextOutput("SS-SP_Summary2")),
                          tabPanel("Vulnerability Change", plotOutput("SS_SP_Change",
                                                                      width = "100%", height = "400px"))
                        )
                      )
                    )
           ),
           
           
           tabPanel("Species Group", fluid = TRUE,
                    sidebarLayout(
                      sidebarPanel(width = 3, Fluid = TRUE,
                                   
                                   selectInput("SS-SG_Species", "Select a species group",
                                               choices = c("구상나무" = "option1",
                                                           "가문비나무 " = "option2"),
                                               selected = "option1"
                                   ),
                                   tags$hr(),
                                   
                                  
                                   
                                   selectInput("SS-SG_SDM_model", "Model Types",
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
                                   
                                   checkboxGroupInput("SS-SG_Dispersal_type", "Dispersal Types",
                                               choices = c("No Dispersal" = "ND",
                                                           "SDD" = "SDD",
                                                           "MDD" = "MDD",
                                                           "LDD" = "LDD",
                                                           "Unlimited Dispersal" = "UD"),
                                               selected = "LDD"
                                   ),
                                   
                                   # Input: Checkbox if file has header ----
                                   checkboxGroupInput("SS-SG_Climate_model", "Climate Models",
                                                choices = c("KMA" = "KMA",
                                                            "KEI" = "KEI"),
                                                selected = "KMA"
                                   ),
                                   
                                   # Input: Checkbox if file has header ----
                                   checkboxGroupInput("SS-SG_Climate_scenario", "Climate Scenarios",
                                                      choices = c("RCP 4.5" = "rcp4.5",
                                                                  "RCP 8.5" = "rcp8.5"),
                                                      selected = "rcp4.5"
                                   ),
                                   
                                   # Input: Checkbox if file has header ----
                                   checkboxGroupInput("SS-SG_Project_year", "Projection Year",
                                                choices = c("Current" = "00",
                                                            "2030" = "30",
                                                            "2050" = "50",
                                                            "2080" = "80"),
                                                selected = c("00", "30", "50", "80")
                                   )
                      ),
                      
                      # Main panel for displaying outputs ----
                      mainPanel(
                        tabsetPanel(
                          tabPanel("Merge each species vulnerability index", verbatimTextOutput("SS-SG_Summary")),
                          tabPanel("Vulnerability Pattern", verbatimTextOutput("SS-SG_Summary2")),
                          tabPanel("Vulnerability change", verbatimTextOutput("SS-SG_Disperal_map"))
                        )
                      )
                    )
           )
         )
),      

      tabPanel("Invasive species",
               tabsetPanel(
                tabPanel("Vulnerability Assessment", fluid = TRUE,
                         fluidRow(
                           
                           # Sidebar panel for inputs ----
                           sidebarPanel(width = 3,
                                        
                                        # Horizontal line ----
                                        #                           tags$hr(),
                                        
#                                        selectInput("IS_VA_Species", "Select a species",
#                                                    choices = c("구상나무" = "option1",
#                                                                "가문비나무 " = "option2"),
#                                                    selected = "option1"
#                                        ),
                                        
                                        selectInput("IS_VA_Species", "Select a species group",
                                                    list(`식물` = list("돼지풀", "가시박", "미국쑥부쟁이"),
                                                         `동물` = list("뉴트리아", "꽃매미", "붉은귀거북"))
                                        ),
                                        textOutput("IS_VA_SP_result"),
                                        
                                        tags$hr(),
                                        
                                        
                                        selectInput("IS-VA_Dispersal_type", "Dispersal Types",
                                                    choices = c("No Dispersal" = "ND",
                                                                "SDD" = "SDD",
                                                                "MDD" = "MDD",
                                                                "LDD" = "LDD",
                                                                "Unlimited Dispersal" = "UD"),
                                                    selected = "LDD"
                                        ),
                                        
                                        selectInput("IS-VA_SDM_model", "Model Types",
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
                                        checkboxGroupInput("IS-VA_Climate_model", "Climate Models",
                                                           choices = c("KMA" = "KMA",
                                                                       "KEI" = "KEI"),
                                                           selected = "KMA"
                                        ),
                                        
                                        # Input: Checkbox if file has header ----
                                        checkboxGroupInput("IS-VA_Climate_scenario", "Climate Scenarios",
                                                           choices = c("RCP 4.5" = "rcp4.5",
                                                                       "RCP 8.5" = "rcp8.5"),
                                                           selected = "rcp4.5"
                                        ),
                                        
                                        # Input: Checkbox if file has header ----
                                        checkboxGroupInput("IS-VA_Project_year", "Projection Year",
                                                           choices = c("Current" = "00",
                                                                       "2030" = "30",
                                                                       "2050" = "50",
                                                                       "2080" = "80"),
                                                           selected = c("00", "30", "50", "80")
                                        )
                           ),
                           
                           sidebarPanel(width = 3,
                                        
                                        # Horizontal line ----
                                        #                              tags$hr(),
                                        
                                        checkboxGroupInput("IS-VA_Admin", "Select a administration type",
                                                           choices = c("SIDO" = "SIDO",
                                                                       "SIGUNGU" = "SIGUNGU"),
                                                           selected = c("SIDO", "SIGUNGU")
                                        ),
                                        
                                        tags$hr(),             
                                        actionButton("IS_VA_Action_expan", label = "Invasive species Expansion"),
                                        tags$hr(),   
                                        actionButton("IS_VA_Action_intro", label = "Invasive species Introduction")
                                        
                           )
                           
                           
                         )
                         
                ), 
                
                tabPanel("Model Outputs", fluid = TRUE,
                         sidebarLayout(
                           sidebarPanel(width = 3, Fluid = TRUE,
                                        
                                        selectInput("IS-OU_Species", "Select a species",
                                                    choices = c("구상나무" = "option1",
                                                                "가문비나무 " = "option2"),
                                                    selected = "option1"
                                        ),
                                        tags$hr(),
                                        
                                        
                                        
                                        selectInput("IS-OU_SDM_model", "Model Types",
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
                                        
                                        checkboxGroupInput("IS-OU_Dispersal_type", "Dispersal Types",
                                                           choices = c("No Dispersal" = "ND",
                                                                       "SDD" = "SDD",
                                                                       "MDD" = "MDD",
                                                                       "LDD" = "LDD",
                                                                       "Unlimited Dispersal" = "UD"),
                                                           selected = "LDD"
                                        ),
                                        
                                        # Input: Checkbox if file has header ----
                                        checkboxGroupInput("IS-OU_climate_model", "Climate Models",
                                                           choices = c("KMA" = "KMA",
                                                                       "KEI" = "KEI"),
                                                           selected = "KMA"
                                        ),
                                        
                                        # Input: Checkbox if file has header ----
                                        checkboxGroupInput("IS-OU_Climate_scenario", "Climate Scenarios",
                                                           choices = c("RCP 4.5" = "rcp4.5",
                                                                       "RCP 8.5" = "rcp8.5"),
                                                           selected = "rcp4.5"
                                        ),
                                        
                                        # Input: Checkbox if file has header ----
                                        checkboxGroupInput("IS-OU_Project_year", "Projection Year",
                                                           choices = c("Current" = "00",
                                                                       "2030" = "30",
                                                                       "2050" = "50",
                                                                       "2080" = "80"),
                                                           selected = c("00", "30", "50", "80")
                                        )
                           ),
                           
                           # Main panel for displaying outputs ----
                           mainPanel(
                             tabsetPanel(
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
                                        tabsetPanel(
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
               )
                
     ),     
     


tabPanel("Vulnerability habitat",
         tabsetPanel(
           tabPanel("Vulnerability habitat Assessment", fluid = TRUE,
                    fluidRow(
                      
                      # Sidebar panel for inputs ----
                      sidebarPanel(width = 3,
                                   
                                   # Horizontal line ----
                                   #                           tags$hr(),
                                   
#                                   selectInput("VH_VA_Species", "Select a species",
#                                               choices = c("구상나무" = "option1",
#                                                           "가문비나무 " = "option2"),
#                                               selected = "option1"
#                                   ),
                                   
                                   selectInput("VH_VA_Species", "Select a species group",
                                               list(`북방계` = list("구상나무", "가문비나무", "분비나무"),
                                                    `남방계` = list("동백나무", "참식나무", "붉가시나무"),
                                                    `자생식물` = list("금강초롱", "모데미풀", "자주솜대"))
                                   ),
                                   textOutput("VH_VA_SP_result"),
                                   
                                   tags$hr(),
                                   
                                   
                                   selectInput("VH-VA_Dispersal_type", "DIspersal Types",
                                               choices = c("No Dispersal" = "ND",
                                                           "SDD" = "SDD",
                                                           "MDD" = "MDD",
                                                           "LDD" = "LDD",
                                                           "Unlimited Dispersal" = "UD"),
                                               selected = "LDD"
                                   ),
                                   
                                   selectInput("VH-VA_SDM_model", "Model Types",
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
                                   checkboxGroupInput("VH-VA_Climate_model", "Climate Models",
                                                      choices = c("KMA" = "KMA",
                                                                  "KEI" = "KEI"),
                                                      selected = "KMA"
                                   ),
                                   
                                   # Input: Checkbox if file has header ----
                                   checkboxGroupInput("VH-VA_Climate_scenario", "Climate Scenarios",
                                                      choices = c("RCP 4.5" = "rcp4.5",
                                                                  "RCP 8.5" = "rcp8.5"),
                                                      selected = "rcp4.5"
                                   ),
                                   
                                   # Input: Checkbox if file has header ----
                                   checkboxGroupInput("VH-VA_Project_year", "Projection Year",
                                                      choices = c("Current" = "00",
                                                                  "2030" = "30",
                                                                  "2050" = "50",
                                                                  "2080" = "80"),
                                                      selected = c("00", "30", "50", "80")
                                   )
                      ),
                      
                      sidebarPanel(width = 3,
                                   
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
                                   actionButton("VH_VA_Action_SRL", label = "Species Richness Loss"),
                                   tags$hr(),             
                                   actionButton("VH_VA_Action_SSA", label = "Species Stay Area"),
                                   actionButton("VH_VA_Action_SLA", label = "Species Loss Area"),
                                   actionButton("VH_VA_Action_SIA", label = "Species Introduction Area")
                                   
                      )
                      
                      
                    )
                    
           ), 
           
           tabPanel("Model Outputs", fluid = TRUE,
                    sidebarLayout(
                      sidebarPanel(width = 3, Fluid = TRUE,
                                   
                                   selectInput("VH-OU_Species", "Select a weighting type",
                                               choices = c("None" = "W_NA",
                                                           "Area" = "W_Area",
                                                           "VUlnerabiity index" = "W_VIndex"),
                                               selected = "W_NA"
                                   ),
                                   tags$hr(),
                                   
                                   
                                   
                                   selectInput("VH-OU_SDM_model", "Model Types",
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
                                   
                                   checkboxGroupInput("VH-OU_Dispersal_type", "Dispersal Types",
                                                      choices = c("No Dispersal" = "ND",
                                                                  "SDD" = "SDD",
                                                                  "MDD" = "MDD",
                                                                  "LDD" = "LDD",
                                                                  "Unlimited Dispersal" = "UD"),
                                                      selected = "LDD"
                                   ),
                                   
                                   # Input: Checkbox if file has header ----
                                   checkboxGroupInput("VH-OU_Climate_model", "Climate Models",
                                                      choices = c("KMA" = "KMA",
                                                                  "KEI" = "KEI"),
                                                      selected = "KMA"
                                   ),
                                   
                                   # Input: Checkbox if file has header ----
                                   checkboxGroupInput("VH-OU_Climate_scenario", "Climate Scenarios",
                                                      choices = c("RCP 4.5" = "rcp4.5",
                                                                  "RCP 8.5" = "rcp8.5"),
                                                      selected = "rcp4.5"
                                   ),
                                   
                                   # Input: Checkbox if file has header ----
                                   checkboxGroupInput("VH-OU_Project_year", "Projection Year",
                                                      choices = c("Current" = "00",
                                                                  "2030" = "30",
                                                                  "2050" = "50",
                                                                  "2080" = "80"),
                                                      selected = c("00", "30", "50", "80")
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
     
                       
      tabPanel("Help", fluid = TRUE,
              sidebarPanel(width = 5,
                helpText("MOTIVE ECOSYSTEM(생태계 기후변화 영향 및 취약성평가모형)은 환경부 기후변화 R&D 과제의 결과물입니다.")
              )
      )
      
      
    )
  )
)

