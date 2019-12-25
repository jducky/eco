tabPanel(DM_Name,
tabsetPanel(
tabPanel(DM_Name_Model, fluid = TRUE,
tabsetPanel(
tabPanel(DM_Name_Model_SDM,
fluidRow(
sidebarPanel(width = 2, Fluid = TRUE,
shinyDirButton("DM_SDM_Dir_Folder", DM_Name_Dir, DM_Name_Dir),
verbatimTextOutput("DM_SDM_Dir_Folder", placeholder = TRUE),
tags$hr(),
uiOutput("DM_MO_Species")
),
sidebarPanel(width = 2, Fluid = TRUE,             
# Input: Checkbox if file has header ----
checkboxGroupInput("DM_MO_Climate_model", DM_Name_CD_Models,
choices = c(DM_Name_CD_Models_list),
selected = DM_Name_CD_Models_selected),
# Input: Checkbox if file has header ----
checkboxGroupInput("DM_MO_Climate_scenario", DM_Name_CD_Scenarios,
choices = c(DM_Name_CD_Scenarios_list),
selected = DM_Name_CD_Scenarios_selected),
# Input: Checkbox if file has header ----
checkboxGroupInput("DM_MO_Project_year", DM_Name_CD_Year,
choices = c(DM_Name_CD_Year_list),
selected = DM_Name_CD_Year_selected)
),
sidebarPanel(width = 3,
uiOutput("DM_MO_SDM_model")
)
)
),
tabPanel(DM_Name_Model_DM,