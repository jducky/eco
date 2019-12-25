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
                      