### lx04
library(shinythemes)

shinyUI(
  
  dashboardPage(
    skin = "green",
# <<<<<<< HEAD
    # dashboardHeader(title = tags$a(href='http://mycompanyishere.com',
    #                                tags$img(src='logo3.png')),  tags$li(class = "dropdown",
    #                                                                     tags$style(".main-header {max-height: 65px;}"),
    #                                                                     tags$style(".main-header .logo {height: 65px}") ),
    #                 dropdownMenu(
    #                   # type = "notifications", 
    #                   icon = icon("question-circle"),
    #                   # tags$li(src='logo3.png'),
    #                   badgeStatus = NULL,
    #                   # headerText = "See also:",
    #                   
    #                   notificationItem("shiny", icon = icon("file"),
    #                                    href = "http://shiny.rstudio.com/"),
    #                   notificationItem("shinydashboard", icon = icon("file"),
    #                                    href = "https://rstudio.github.io/shinydashboard/")
    #                 )
    #                 ),
    # dashboardSidebar(
    #   
    #   # sidebarUserPanel("User Name",
    #   #                  subtitle = a(href = "#", icon("circle", class = "text-success"), "Online"),
    #   #                  # Image file should be in www/ subdir
    #   #                  image = "userimage.png"
    #   # ),
    #   # sidebarSearchForm(label = "Enter a number", "searchText", "searchButton"),
    #   
    #   
    #   # sidebarMenu(
    #   #   # Setting id makes input$tabs give the tabName of currently-selected tab
    #   #   id = "tabs",
    #   #   menuItem("모형개요", tabName = "dashboard", icon = icon("dashboard")),
    #   #   menuItem("Widgets", icon = icon("th"), tabName = "widgets", badgeLabel = "new",
    #   #            badgeColor = "green"),
    #   #   menuItem("Charts", icon = icon("bar-chart-o"),
    #   #            menuSubItem("Sub-item 1", tabName = "subitem1"),
    #   #            menuSubItem("Sub-item 2", tabName = "subitem2")
    #   #   )
    #   # )
    #   
    # ),
# =======
    dashboardHeader(title = "MOTIVE Ecosystem",
                    disable=F,
      dropdownMenu(type = "messages",
                   messageItem(
                     from = "공지사항",
                     message = "시스템 오픈 일정"
                   ),
                   messageItem(
                     from = "국립생태원",
                     message = "회원등록 문의",
                     icon = icon("question"),
                     time = "13:45"
                   ),
                   messageItem(
                     from = "Support",
                     message = "시스템 정기점검 예정",
                     icon = icon("life-ring"),
                     time = "2019-12-01"
                   )
      ),
      dropdownMenu(type = "notifications",
                   notificationItem(
                     text = "5 new users today",
                     icon("users")
                   ),
                   notificationItem(
                     text = "12 items delivered",
                     icon("truck"),
                     status = "success"
                   ),
                   notificationItem(
                     text = "Server load at 86%",
                     icon = icon("exclamation-triangle"),
                     status = "warning"
                   )
      ),
      dropdownMenu(type = "tasks", badgeStatus = "success",
                   taskItem(value = 90, color = "green",
                            "Documentation"
                   ),
                   taskItem(value = 17, color = "aqua",
                            "Project X"
                   ),
                   taskItem(value = 75, color = "yellow",
                            "Server deployment"
                   ),
                   taskItem(value = 80, color = "red",
                            "Overall project"
                   )
      )
    ),
    
    dashboardSidebar(disable = F,
      sidebarMenu(
        menuItem("Motive System", tabName = "ecosystem", icon = icon("th")),
        menuItem("통합리포트", icon = icon("dashboard"), tabName = "report",
                 badgeLabel = "new", badgeColor = "green"),
        menuItem("국립생태원", icon = icon("file-code-o"), 
                 href = "http://www.nie.re.kr/main/")
      )
    ),
    
# >>>>>>> lx02jd2
    dashboardBody(
      tags$head(
        tags$style(type='text/css', 
                   ".nav-tabs {font-size: 17px; 
                   font-weight: bold}")),
      tabItems(
        tabItem(tabName = "ecosystem",

      ##### Start Main          
      tags$head(tags$style(HTML('
            
                #SE_Dir_Project {
                  display: inline;
                }
                
                #SDM_MO_SDM_run {
                  width: 200px;
                  height: 0px;
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
                
                .fa-clipboard-list {
                  color: #00FF80;
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
                
                #Reset_SP_Map, #Reset_SP_LOC_Map, #Reset_LD_Map, #Reset_CD_Map, 
                #Reset_DM_OU_DIspersal_map, #Reset_IS_AO_Map1, #Reset_IS_AO_Map2,
                #Reset_IS_OU_EX_Map, #Reset_IS_OU_EX_SIDO_Map , #Reset_IS_OU_EX_SIGUNGU_Map,
                #Reset_IS_OU_SI_Map, #Reset_IS_OU_SI_SIDO_Map, #Reset_IS_OU_SI_SIGUNGU_Map,
                #Reset_VH_OU_SR_Map, #Reset_VH_OU_SR_Habitat_Map, #Reset_VH_OU_SRL_Map, #Reset_VH_OU_SRL_Habitat_Map,
                #Reset_VH_OU_SL_Map, #Reset_VH_OU_SL_Habitat_Map, #Reset_VH_OU_SS_Map, #Reset_VH_OU_SS_Habitat_Map,
                #Reset_VH_OU_SI_Map, #Reset_VH_OU_SI_Habitat_Map {
                  margin-top: 17px;
                }
                
                #kor_link_top, #eng_link_top {
                  display: inline-block;
                }
                
                .title_ul li {
                  display: inline-block;
                }
                
                .icon01 {
                  color: red;
                }
                
                .icon02 {
                  color: blue;
                }
                
         

                
                
             '))),
      
      
      shinyjs::useShinyjs(),
      
      
      tags$script(HTML(

        'document.querySelector("body").classList.add("sidebar-collapse");'


      )),
      
      # tabItems(
      #   tabItem(tabName = "dashboard",
      #           "모형개요"
      #           ),
      #   tabItem(tabName = "widgets",
      #           "위"
      #   )
      # ),
      
      
      
      fluidPage(div(
        h4(System_Name, style = "display: inline-block; color: white; font-size: 200%; margin-left: 20px; position: absolute; line-height: 8vh;"), 
        div( style = "display: inline-block; font-size: 110%; color: white; margin-top: 10px; margin-right: 10px; float: right;",
             tags$ul( style = "list-style: none;" , class = "title_ul",
                      
                      tags$li(
                        uiOutput("kor_link_top")
                      ),
                      
                      tags$li(
                        uiOutput("eng_link_top")
                      ),
                      
                      tags$li(
                        a("CONTACT US", style = "cursor:pointer; color: white; " )
                      ),
                      tags$li(
                        a("LOGOUT", style = "cursor:pointer; color: white;" )
                      )
             )
        )
        , style = "background-image: url(eco_title.png); height: 10vh; position: relative;"),
        
        theme = shinytheme("yeti"),
        # shinythemes::themeSelector(),
        br(),
        tabsetPanel(
          tabPanel(OV_Name,
                   hr(),
                   mainPanel(
                     img(src="eco01.png", height="400"),
                     # hr(),
                     img(src="eco02.png", height="400"),
                     br(),br()
                   )
          ),    

          tabPanel(MR_Name, fluid = TRUE, icon = icon("list"),
                   tags$hr(),
                   
                   fluidRow(
                   column(8,
                          # DT::dataTableOutput("MR_Info")
                          # uiOutput("MR_Info"),
                          box(width = 12, title = "모형목록", status = "primary", height = "500", solidHeader = T, collapsible = TRUE,
                              div(style = "overflow-y: scroll;height:400px;", width = "600",
                                  uiOutput("MR_Info")
                              )
                          )
                   ),
                    column(4,
                           plotOutput("MR_Result")
                           )
                   # br(),br(),br(),br(),
                   # sidebarPanel(width = 4, Fluid = TRUE,
                   #              plotOutput("MR_Result")
                   # )
                   ),
                   fluidRow(
                     box(width = 8, title = "프로젝트 폴더 선택", status = "primary", solidHeader = F, collapsible = TRUE,
                         shinyDirButton("SE_Dir_Project", SE_Name_WE_Project, SE_Name_WE_Project),
                         verbatimTextOutput("SE_Dir_Project", placeholder = TRUE)
                     )
                   ),
          ), 
          
          tabPanel(SP_Name, icon = icon("folder-open"),
                   tabsetPanel(
                     tabPanel(SP_Name_Info,
                              tags$head(
                                # Include our custom CSS
                                # includeCSS("style.css"),
                                includeCSS("styles.css"),
                                includeScript("gomap.js")
                              ),
                              tags$hr(),
                              
                              sidebarLayout(
                                sidebarPanel(width = 2,
                                             checkboxGroupInput("SP_Info_inst", "INSTITUTE",	
                                                                choices = unique(G_FILE_speciesinfo_02$INSTITUTE),
                                                                selected = NULL
                                                                # choiceNames = G_Institute_Choice,
                                                                # choiceValues = G_Institute_Choice
                                             ),
                                             
                                             actionButton('all_SP_Info_inst',label = "selectAll"),
                                             actionButton('reset_SP_Info_inst',label = "reset"), br(), hr(),
                                             
                                             
                                             
                                             checkboxGroupInput("SP_Info_type", "TYPE",	
                                                                choices = ut,	
                                                                selected = NULL),
                                             
                                             actionButton('all_SP_Info_type',label = "selectAll"), 
                                             actionButton('reset_SP_Info_type',label = "reset"), br()
                                             
                                             
                                             # selectInput("SP_Info_inst", "INSTITUTE",
                                             #             choices = unique(G_FILE_speciesinfo_02$INSTITUTE),
                                             #             selected = NULL),
                                             # 
                                             # selectInput("SP_Info_type", "TYPE",
                                             #             choices = unique(G_FILE_speciesinfo_02$TYPE),
                                             #             selected = NULL),
                                             
                                             # actionButton('SP_Info_Apply',label = "Apply"), br()
                                             
                                             
                                ),
                                
                                mainPanel(
                                  # bsCollapse(
                                  #   bsCollapsePanel("Summary & Histogram",
                                  #                   style = ST_Name,
                                  #                   fluidRow(
                                  #                     column(5,verbatimTextOutput("SP_Summary")),
                                  #                     column(5,plotOutput("SP_Histogram"))
                                  #                   ) 
                                  #   )
                                  # ),
                                  
                                  fluidRow(
                                    
                                    column(4, 
                                           actionButton('reset_SP_Info',label = "Reset", style = "float: right; margin-bottom: 15px;"), br(),
                                           DT::dataTableOutput("SP_Info")
                                    ),
                                    column(2,
                                           tags$table( style = "border: 1px solid black; padding: 1%; width: 150px; border-spacing: 10px;",
                                                       
                                                       tags$tr( style = "border: 1px solid black; padding: 1%; font-size: 120%;",
                                                                tags$td(style = "padding: 3px;border: 1px solid black;", div(unique(G_FILE_speciesinfo_02$TYPE)[1])),
                                                                tags$td(style = "padding: 3px;border: 1px solid black;width: 30%; background-color: #6AA323;")
                                                                
                                                       ),
                                                       tags$tr( style = "border: 1px solid black; padding: 1%; font-size: 120%;",
                                                                tags$td(style = "padding: 3px;border: 1px solid black;", div(unique(G_FILE_speciesinfo_02$TYPE)[2])),
                                                                tags$td(style = "padding: 3px;border: 1px solid black;width: 30%; background-color: #83913E;")
                                                                
                                                       ),
                                                       tags$tr( style = "border: 1px solid black; padding: 1%; font-size: 120%;",
                                                                tags$td(style = "padding: 3px;border: 1px solid black;", div(unique(G_FILE_speciesinfo_02$TYPE)[3])),
                                                                tags$td(style = "padding: 3px;border: 1px solid black;width: 30%; background-color: #B5EF71;")
                                                                
                                                       ),
                                                       tags$tr( style = "border: 1px solid black; padding: 1%; font-size: 120%;",
                                                                tags$td(style = "padding: 3px;border: 1px solid black;", div(unique(G_FILE_speciesinfo_02$TYPE)[8])),
                                                                tags$td(style = "padding: 3px;border: 1px solid black;width: 30%; background-color: #A3A3A3;")
                                                                
                                                       ),
                                                       tags$tr( style = "border: 1px solid black; padding: 1%; font-size: 120%;",
                                                                tags$td(style = "padding: 3px;border: 1px solid black;", div(unique(G_FILE_speciesinfo_02$TYPE)[7])),
                                                                tags$td(style = "padding: 3px;border: 1px solid black;width: 30%; background-color: #D9513F;")
                                                                
                                                       ),
                                                       tags$tr( style = "border: 1px solid black; padding: 1%; font-size: 120%;",
                                                                tags$td(style = "padding: 3px;border: 1px solid black;", div(unique(G_FILE_speciesinfo_02$TYPE)[6])),
                                                                tags$td(style = "padding: 3px;border: 1px solid black;width: 30%; background-color: #36A6D8;")
                                                                
                                                       ),
                                                       tags$tr( style = "border: 1px solid black; padding: 1%; font-size: 120%;",
                                                                tags$td(style = "padding: 3px;border: 1px solid black;", div(unique(G_FILE_speciesinfo_02$TYPE)[5])),
                                                                tags$td(style = "padding: 3px;border: 1px solid black;width: 30%; background-color: #D154B9;")
                                                                
                                                       ),
                                                       tags$tr( style = "border: 1px solid black; padding: 1%; font-size: 120%;",
                                                                tags$td(style = "padding: 3px;border: 1px solid black;", div(unique(G_FILE_speciesinfo_02$TYPE)[4])),
                                                                tags$td(style = "padding: 3px;border: 1px solid black;width: 30%; background-color: #FFC68A;")
                                                                
                                                       ),
                                                       tags$tr( style = "border: 1px solid black; padding: 1%; font-size: 120%;",
                                                                tags$td(style = "padding: 3px;border: 1px solid black;", div(unique(G_FILE_speciesinfo_02$TYPE)[9])),
                                                                tags$td(style = "padding: 3px;border: 1px solid black;width: 30%; background-color: #F1942F;")
                                                                
                                                       )
                                           )
                                           , hr(),
                                           uiOutput("Species_Link")),
                                    column(6, leafletOutput("SP_Map", width = "600", height = "600") %>% withSpinner(), 
                                           uiOutput('SP_Map_Reset_UI')
                                           
                                    )
                                  )
                                )
                              )
                     ),
                     tabPanel(SP_Name_Location,
                              tags$head(
                                # Include our custom CSS
                                includeCSS("styles.css"),
                                includeScript("gomap.js")
                              ),
                              tags$hr(),
                              sidebarLayout(
                                sidebarPanel(width = 2,
                                             
                                  
                                  
                                    # checkboxGroupInput("SP_Loc_K_Name", "K_NAME",
                                    #                    choices = unique(SP_LOC_Info_Table$K_NAME),
                                    #                    selected = NULL),
                                    
                                  # uiOutput('SP_Loc_K_Name_UI'),
                                  # actionButton('all_SP_Loc_K_Name',label = "selectAll"),
                                  # actionButton('reset_SP_Loc_K_Name',label = "reset"), br(),
                                  # actionButton('c_kname',label = "c_kname")
                                  
                                  NULL
                                  
                                  
                                ),
                                mainPanel(
                                  column(6, 
                                         actionButton('reset_SP_Loc', label = "Reset", style = "float: right; margin-bottom: 15px;"),
                                         DT::dataTableOutput("SP_LOC_Info")
                                  ),
                                  column(6, leafletOutput("SP_LOC_Map", width = "600", height = "600")  %>% withSpinner(),
                                         uiOutput('SP_LOC_Map_Reset_UI')
                                  )
                                )
                                
                              )
                              
                     )
                   )
          ),  
          
          
          
          tabPanel(LD_Name, fluid = TRUE, icon = icon("folder-open"),
                   tags$hr(),
                   sidebarLayout(
                     sidebarPanel(width = 3, Fluid = TRUE,
                                  
                                  selectInput("LD_Variables", LD_Name_Variables,
                                              choices = LD_Name_Variables_list,
                                              selected = LD_Name_Variables_selected),
                                  
                                  # selectInput("LD_Type", LD_Name_Variables,
                                  #             choices = LD_Name_Variables_list,
                                  #             selected = LD_Name_Variables_selected
                                  # ),
                                  
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
                                  
                                  
                                  sliderInput("LD_Project_year", label = LD_Name_Year, min = 2000,
                                              max = 2080, value = 2000, step = 10, sep = "",
                                              animate = animationOptions(interval = 3000))
                                  
                                  
                     ),
                     
                     # Main panel for displaying outputs ----
                     mainPanel(
                       bsCollapsePanel("Summary & Histogram",
                                       style = ST_Name,
                                       fluidRow(
                                         column(3,verbatimTextOutput("LD_Summary")),
                                         column(9,plotOutput("LD_Histogram"))
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
                                  
                                  
                                  sliderInput("CD_Project_year", label = CD_Name_Year, min = 2000,
                                              max = 2080, value = 2000, step = 10, sep = "",
                                              animate = animationOptions(interval = 3000))
                     ),
                     
                     # Main panel for displaying outputs ----
                     mainPanel(
                        bsCollapsePanel("Summary & Histogram",
                                        style = ST_Name,
                                        fluidRow(
                                          column(4,verbatimTextOutput("CD_Summary")),
                                          column(6,plotOutput("CD_Histogram"))
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
          
          
          tabPanel(SDM_Name, icon = icon("pie-chart"),
                   
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
                                  
                                  
                                  sliderInput("SDM_OU_Project_year", label = SDM_Name_CD_Year_out, min = 2000,
                                              max = 2080, value = 2000, step = 10, sep = "",
                                              animate = animationOptions(interval = 10000))
                     ),
                     
                     
                     # Main panel for displaying outputs ----
                     mainPanel(
                       tags$head(
                         # Include our custom CSS
                         includeCSS("styles.css"),
                         includeScript("gomap.js")
                       ),
                       
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
                   # tabsetPanel(
                   #   tabPanel(SDM_Name_Model,
                   #            
                   #            fluidRow(
                   #              tags$hr(),
                   #              uiOutput("SDM_Sel_Box"),
                   #              column(4, 
                   #                     actionButton('resetSpeciesInfo',label = "Reset", style = ST_Name),
                   #                     tags$style(type='text/css', "button#resetSpeciesInfo {margin-left: 90%;}"),
                   #                     br(),br(),
                   #                     DT::dataTableOutput("SDM_SP_Info")
                   #              ),
                   #              column(4,
                   #                     
                   #                     
                   #                     uiOutput('SDM_MO_Condition_CheckBoxGroup')
                   #              ),
                   #              column(4,
                   #                     useShinyalert(),  # Set up shinyalert
                   #                     actionButton("SDM_MO_SDM_run", label = SDM_Name_models_run)
                   #              )
                   #              
                   #            )
                   #   ),
                   #   
                   #   
                   #   tabPanel(SDM_Name_Model_Out, fluid = TRUE,
                   #            tags$hr(),
                   #            sidebarLayout(
                   #              sidebarPanel(width = 3, Fluid = TRUE,
                   #                           
                   #                           uiOutput("SDM_OU_Species"),
                   #                           # tags$hr(),
                   #                           
                   #                           uiOutput("SDM_OU_Projection_model"),
                   #                           # tags$hr(),
                   #                           
                   #                           uiOutput("SDM_OU_Prediction_model"),
                   #                           # tags$hr(),
                   #                           
                   #                           # Input: Checkbox if file has header ----
                   #                           radioButtons("SDM_OU_Climate_model", SDM_Name_CD_Models_out,
                   #                                        choices = c(SDM_Name_CD_Models_out_list),
                   #                                        selected = SDM_Name_CD_Models_out_selected
                   #                           ),
                   #                           
                   #                           # Input: Checkbox if file has header ----
                   #                           radioButtons("SDM_OU_Climate_scenario", SDM_Name_CD_Scenarios_out,
                   #                                        choices = c(SDM_Name_CD_Scenarios_out_list),
                   #                                        selected = SDM_Name_CD_Scenarios_out_selected
                   #                           ),
                   #                           
                   #                           
                   #                           sliderInput("SDM_OU_Project_year", label = SDM_Name_CD_Year_out, min = 2000,
                   #                                       max = 2080, value = 2000, step = 10, sep = "",
                   #                                       animate = animationOptions(interval = 10000))
                   #              ),
                   #              
                   #              
                   #              # Main panel for displaying outputs ----
                   #              mainPanel(
                   #                tabsetPanel(
                   #                  
                   #                  
                   #                  tabPanel(SDM_Name_Model_Out_Validation,
                   #                           
                   #                           # hr(),
                   #                           
                   #                           # 열 기준
                   #                           fluidRow(
                   #                             hr(),
                   #                             column(6, DT::dataTableOutput("SDM_OU_Validation")),
                   #                             column(6, plotOutput("SDM_OU_Validation_BoxPlot"))
                   #                             
                   #                           ),
                   #                           
                   #                           fluidRow(
                   #                             br(), hr(),
                   #                             column(6, DT::dataTableOutput("SDM_OU_Contribution"), hr(), plotOutput("SDM_OU_Contribution_Radarchart"))
                   #                             
                   #                           )
                   #                           
                   #                           # seo03
                   #                           # 행 기준
                   #                           # fluidRow(
                   #                           #   column(6, DT::dataTableOutput("SDM_OU_Validation"))
                   #                           # ),
                   #                           # 
                   #                           # hr(),
                   #                           # 
                   #                           # fluidRow(
                   #                           #   column(6, plotOutput("SDM_OU_Validation_BoxPlot"))
                   #                           # ),
                   #                           # hr()
                   #                           
                   #                           
                   #                  ),
                   #                  
                   #                  # seo03
                   #                  # tabPanel(SDM_Name_Model_Out_Contribution,
                   #                  #          tags$hr(),
                   #                  #          fluidRow(
                   #                  #            column(6, DT::dataTableOutput("SDM_OU_Contribution"))
                   #                  #          ),
                   #                  #          tags$hr(),
                   #                  #          fluidRow(
                   #                  #            column(8,plotOutput("SDM_OU_Contribution_Radarchart"))
                   #                  #          )
                   #                  # ),
                   #                  # tabPanel(SDM_Name_Model_Out_Probability, 
                   #                  #          tags$head(
                   #                  #            # Include our custom CSS
                   #                  #            includeCSS("styles.css"),
                   #                  #            includeScript("gomap.js")
                   #                  #          ),
                   #                  #          tags$hr(),
                   #                  #          leafletOutput("SDM_OU_Probability_map", width = "800", height = "600") %>% withSpinner(),
                   #                  #          tags$hr(),
                   #                  #          column(10, verbatimTextOutput("SDM_OU_PROJ_Summary")),
                   #                  #          column(10, plotOutput("SDM_OU_PROJ_Histogram"))
                   #                  # ),
                   #                  # tabPanel(SDM_Name_Model_Out_Prediction, 
                   #                  #          tags$head(
                   #                  #            # Include our custom CSS
                   #                  #            includeCSS("styles.css"),
                   #                  #            includeScript("gomap.js")
                   #                  #          ),
                   #                  #          tags$hr(),
                   #                  #          leafletOutput("SDM_OU_Predicted_map", width = "800", height = "600") %>% withSpinner(),
                   #                  #          tags$hr(),
                   #                  #          column(10, verbatimTextOutput("SDM_OU_PRED_Summary")),
                   #                  #          column(10, plotOutput("SDM_OU_PRED_Histogram"))
                   #                  # )
                   #                  
                   #                  tabPanel("Map",
                   #                           tags$head(
                   #                             # Include our custom CSS
                   #                             includeCSS("styles.css"),
                   #                             includeScript("gomap.js")
                   #                           ),
                   #                           tags$hr(),
                   #                           fluidRow(
                   #                             valueBoxOutput("Value_CM"),
                   #                             valueBoxOutput("Value_CS"),
                   #                             valueBoxOutput("Value_YR")
                   # 
                   #                           ),
                   #                           fluidRow(class = "text-center",
                   #                                    column(6,
                   #                                           # tags$h3("<Probability Map>", style = "text-align: center;"),
                   #                                           box(status = "success",
                   #                                               title = "PROBABILITY MAP", width = 20, height = 45, collapsible = T, collapsed = T
                   #                                           ),
                   # 
                   #                                           leafletOutput("SDM_OU_Probability_map") %>% withSpinner(),
                   #                                           br(),
                   #                                           actionButton("Reset_Probability_View", label = "Reset"),
                   #                                           tags$hr(),
                   #                                           column(12, verbatimTextOutput("SDM_OU_PROJ_Summary")),
                   #                                           column(12, plotOutput("SDM_OU_PROJ_Histogram"))
                   #                                    ),
                   # 
                   #                                    column(6,
                   #                                           # tags$h3("<Predicted Map>", style = "text-align: center;"),
                   #                                           box(status = "success",
                   #                                               title = "PREDICTED MAP", width = 20, height = 45, collapsible = T, collapsed = T
                   #                                           ),
                   #                                           # tags$h3("<Predicted Map>"),
                   # 
                   #                                           # leafletOutput("SDM_OU_Predicted_map", width = "800", height = "600"),
                   #                                           leafletOutput("SDM_OU_Predicted_map") %>% withSpinner(),
                   #                                           br(),
                   #                                           actionButton("Reset_Predicted_View", label = "Reset"),
                   #                                           tags$hr(),
                   #                                           column(12, verbatimTextOutput("SDM_OU_PRED_Summary")),
                   #                                           column(12, plotOutput("SDM_OU_PRED_Histogram"))
                   #                                    )
                   #                           )
                   # 
                   #                  )
                   #                  
                   #                )
                   #              )
                   #            )
                   #   )
                   # )
          ),  
          
          
          tabPanel(DM_Name, icon = icon("pie-chart"),
                   
                   tags$hr(),
                   
                   sidebarLayout(
                     
                     sidebarPanel(width = 3, Fluid = TRUE,
                                  
                                  uiOutput("DM_OU_Species"),
                                  tags$hr(),
                                  
                                  uiOutput('DM_OU_SDM_model'),
                                  
                                  fluidRow(
                                    checkboxGroupInput("DM_OU_Dispersal_type", DM_Name_DM_Models,
                                                       choices = c(DM_Name_DM_Models_list),
                                                       selected = DM_Name_DM_Models_selected
                                    ),
                                    
                                    checkboxGroupInput("DM_OU_Climate_model", DM_Name_CD_Models,
                                                       choices = c(DM_Name_CD_Models_list),
                                                       selected = DM_Name_CD_Models_selected
                                    ),
                                    
                                    checkboxGroupInput("DM_OU_Climate_scenario", DM_Name_CD_Scenarios,
                                                       choices = c(DM_Name_CD_Scenarios_list),
                                                       selected = DM_Name_CD_Scenarios_selected
                                    ),
                                    
                                    checkboxGroupInput("DM_OU_Project_year", DM_Name_CD_Year,
                                                       choices = c(DM_Name_CD_Year_list),
                                                       selected = DM_Name_CD_Year_selected
                                                       
                                    )
                                  )
                                  ,style = "margin-top: 1px, margin-left: 1px"

                     ),
                     
                     # Main panel for displaying outputs ----
                     mainPanel(
  
                       
                       uiOutput("DM_OU_UI_plot") %>% withSpinner()
                       
                     ) # mainPanel
                   )
                   
                   
                   # tabsetPanel(
                     # tabPanel(DM_Name_Model, fluid = TRUE,
                     #          tags$hr(),
                     #          fluidRow(
                     #            column(2,
                     #                   
                     #                   valueBox("구상나무", "선택종명",
                     #                            icon = icon("tree"), color = "green", width = 12
                     #                   )
                     #            ),
                     #            
                     #            column(10,
                     #                   uiOutput("DM_Sel_Box")
                     #            )
                     #          ),
                     #          tags$hr(),
                     #          fluidRow(
                     #            
                     #            
                     #            # Sidebar panel for inputs ----
                     #            sidebarPanel(width = 2,
                     #                         
                     #                         uiOutput("DM_MO_Species"),
                     #                         uiOutput("DM_MO_Col_Box_01")
                     #                         
                     #                         
                     #            ),
                     #            
                     #            sidebarPanel(width = 2,
                     #                         
                     #                         uiOutput("DM_MO_Col_Box_02"),
                     #                         uiOutput("DM_MO_SDM_model")
                     #                         
                     #                         
                     #            ),
                     #            
                     #            column( 3,
                     #                    fluidRow( sidebarPanel(width = 12, Fluid = TRUE, 
                     #                                           uiOutput("DM_MO_Col_Box_03") 
                     #                    )
                     #                    ),
                     #                    
                     #                    fluidRow( 
                     #                      sidebarPanel(width = 12, Fluid = TRUE, 
                     #                                   div( actionButton('reset_DM_MO',label = "Reset"), style = "margin: 0 60% 0 40%;" ) 
                     #                      )
                     #                    )
                     #                    
                     #                    
                     #            ),
                     #            
                     #            
                     #            
                     #            sidebarPanel(width = 3, Fluid = TRUE,
                     #                         tags$hr(),  
                     #                         # infoBox("Model Run", "RUN", icon = icon("angle-double-right"), width = 2),
                     #                         actionButton("DM_MO_Action", label = "Run"),
                     #                         tags$hr()
                     #            )
                     #            
                     #          )
                     #          
                     # ),
                     
                     
                     # tabPanel(DM_Name_Model_Out, fluid = TRUE,
                     #          tags$hr(),
                     #          sidebarLayout(
                     #            sidebarPanel(width = 3, Fluid = TRUE,
                     #                         
                     #                         uiOutput("DM_OU_Species"),
                     #                         tags$hr(),
                     #                         
                     #                         uiOutput('DM_OU_SDM_model'),
                     #                         
                     #                         checkboxGroupInput("DM_OU_Dispersal_type", DM_Name_DM_Models,
                     #                                            choices = c(DM_Name_DM_Models_list),
                     #                                            selected = DM_Name_DM_Models_selected
                     #                         ),
                     #                         
                     #                         checkboxGroupInput("DM_OU_Climate_model", DM_Name_CD_Models,
                     #                                            choices = c(DM_Name_CD_Models_list),
                     #                                            selected = DM_Name_CD_Models_selected
                     #                         ),
                     #                         
                     #                         checkboxGroupInput("DM_OU_Climate_scenario", DM_Name_CD_Scenarios,
                     #                                            choices = c(DM_Name_CD_Scenarios_list),
                     #                                            selected = DM_Name_CD_Scenarios_selected
                     #                         ),
                     #                         
                     #                         checkboxGroupInput("DM_OU_Project_year", DM_Name_CD_Year,
                     #                                            choices = c(DM_Name_CD_Year_list),
                     #                                            selected = DM_Name_CD_Year_selected
                     #                         )
                     #                         
                     #                         # sliderInput("DM_OU_Project_year", label = DM_Name_CD_Year, min = 2000,
                     #                         #             max = 2080, value = 2000, step = 10, sep = "",
                     #                         #             animate = animationOptions(interval = 3000))
                     #            ),
                     #            
                     #            # Main panel for displaying outputs ----
                     #            mainPanel(
                     #              
                     #              # bsCollapse(
                     #              #   bsCollapsePanel("Summary",
                     #              #                   verbatimTextOutput("DM_OU_Summary"), style = ST_Name)
                     #              # ),
                     #              # fluidRow(
                     #              #   valueBoxOutput("DM_Value_CM"),
                     #              #   valueBoxOutput("DM_Value_CS"),
                     #              #   valueBoxOutput("DM_Value_YR")
                     #              # ),
                     #              # leafletOutput("DM_OU_DIspersal_map", width = "800", height = "650") %>% withSpinner(),
                     #              # actionButton("Reset_DM_OU_DIspersal_map", label = "Reset")
                     #              
                     #              tabsetPanel(
                     #                tabPanel(DM_Name_Out_Plot,
                     #                         tags$hr(),
                     #                         uiOutput("DM_OU_UI_plot") %>% withSpinner()
                     #                )
                     #              )
                     #              
                     #            ) # mainPanel
                     #          )
                     # )
                   # )
          ), 
          
          
          tabPanel(SS_Name, icon = icon("table"),
                   tags$hr(),
                   sidebarLayout(
                     sidebarPanel(width = 3, Fluid = TRUE,
                                  # shinyDirButton("SS_AO_Dir_Folder", SS_Name_AO_Dir, SS_Name_AO_Dir),
                                  # verbatimTextOutput("SS_AO_Dir_Folder", placeholder = TRUE),
                                  # tags$hr(),
                                  
                                  uiOutput("SS_AO_Species"),
                                  tags$hr(),
                                  
                                  uiOutput("SS_AO_SDM_model"),
                                  
                                  radioButtons("SS_AO_Dispersal_type", SS_Name_DM_Models,
                                               choices = c(SS_Name_DM_Models_list),
                                               selected = SS_Name_DM_Models_selected),
                                  
                                  # Input: Checkbox if file has header ----
                                  checkboxGroupInput("SS_AO_Climate_model", SS_Name_CD_Models,
                                                     choices = c(SS_Name_CD_Models_list),
                                                     selected = SS_Name_CD_Models_selected),
                                  
                                  # Input: Checkbox if file has header ----
                                  checkboxGroupInput("SS_AO_Climate_scenario", SS_Name_CD_Scenarios,
                                                     choices = c(SS_Name_CD_Scenarios_list),
                                                     selected = SS_Name_CD_Scenarios_selected),
                                  
                                  # Input: Checkbox if file has header ----
                                  checkboxGroupInput("SS_AO_Project_year", SS_Name_CD_Year,
                                                     choices = c(SS_Name_CD_Year_list),
                                                     selected = SS_Name_CD_Year_selected),
                                  shinyDirButton("SS_AO_Dir_Folder", SS_Name_AO_Dir, SS_Name_AO_Dir),
                                  verbatimTextOutput("SS_AO_Dir_Folder", placeholder = TRUE)
                     ),
                     
                     # Main panel for displaying outputs ----
                     mainPanel(
                       tabsetPanel(
                         tabPanel(SS_Name_Out_ChangePlot,
                                  tags$hr(),
                                  uiOutput("SS_AO_UI_plot")
                         ),
                         tabPanel(SS_Name_Out_Pattern, 
                                  tags$hr(),
                                  fluidRow(
                                    column(6, DT::dataTableOutput("SS_AO_IV_Table"))
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
                         tabPanel(SS_Name_Out_Vulnerabiity, 
                                  tags$hr(),
                                  fluidRow(
                                    column(6,DT::dataTableOutput("SS_AO_VP_Table"))
                                  ),
                                  fluidRow(
                                    tags$hr(),
                                    uiOutput("SS_AO_VP_UI_plot1"),
                                    tags$hr(),
                                    column(6, plotOutput("SS_AO_VP_Plot1")),
                                    column(6, plotOutput("SS_AO_VP_Plot2"))
                                  ),
                                  fluidRow(
                                    tags$hr(),
                                    uiOutput("SS_AO_VP_UI_plot2"),
                                    tags$hr(),
                                    column(6, plotOutput("SS_AO_VP_Plot11")),
                                    column(6, plotOutput("SS_AO_VP_Plot21"))
                                  ),
                                  fluidRow(
                                    tags$hr(),
                                    uiOutput("SS_AO_VP_UI_plot3"),
                                    tags$hr(),
                                    column(6, plotOutput("SS_AO_VP_Plot12")),
                                    column(6, plotOutput("SS_AO_VP_Plot22"))
                                  )
                         )
                       )
                     )
                   )
                   
                   
                   # sidebarLayout(
                   #   sidebarPanel(width = 3, Fluid = TRUE,
                   #                
                   #                uiOutput("SS_AO_Species"),
                   #                tags$hr(),
                   #                
                   #                uiOutput("SS_AO_SDM_model"),
                   #                
                   #                uiOutput("SS_AO_DT_CM_CS_PY"),
                   #                hr(),
                   #                actionButton('reset_SS_AO', label = "Reset")
                   #   ),
                   #   
                   #   # Main panel for displaying outputs ----
                   #   mainPanel(
                   #     tabsetPanel(
                   #       tabPanel(SS_Name_Out_ChangePlot,
                   #                tags$hr(),
                   #                uiOutput("SS_AO_UI_plot")
                   #       ),
                   #       tabPanel(SS_Name_Out_Pattern, 
                   #                tags$hr(),
                   #                fluidRow(
                   #                  column(6, 
                   #                         DT::dataTableOutput("SS_AO_IV_Table")
                   #                  )
                   #                ),
                   #                fluidRow(
                   #                  tags$hr(),
                   #                  uiOutput("SS_AO_IV_UI_plot1"),
                   #                  tags$hr(),
                   #                  column(6, plotOutput("SS_AO_IV_Plot1")),
                   #                  column(6, plotOutput("SS_AO_IV_Plot2"))
                   #                ),
                   #                fluidRow(
                   #                  tags$hr(),
                   #                  uiOutput("SS_AO_IV_UI_plot2"),
                   #                  tags$hr(),
                   #                  column(6, plotOutput("SS_AO_IV_Plot11")),
                   #                  column(6, plotOutput("SS_AO_IV_Plot21"))
                   #                )
                   #       ),
                   #       tabPanel(SS_Name_Out_Vulnerabiity, 
                   #                tags$hr(),
                   #                fluidRow(
                   #                  column(6, 
                   #                         DT::dataTableOutput("SS_AO_VP_Table")
                   #                  )
                   #                ),
                   #                fluidRow(
                   #                  tags$hr(),
                   #                  uiOutput("SS_AO_VP_UI_plot1"),
                   #                  tags$hr(),
                   #                  column(6, plotOutput("SS_AO_VP_Plot1")),
                   #                  column(6, plotOutput("SS_AO_VP_Plot2"))
                   #                ),
                   #                fluidRow(
                   #                  tags$hr(),
                   #                  uiOutput("SS_AO_VP_UI_plot2"),
                   #                  tags$hr(),
                   #                  column(6, plotOutput("SS_AO_VP_Plot11")),
                   #                  column(6, plotOutput("SS_AO_VP_Plot21"))
                   #                ),
                   #                fluidRow(
                   #                  tags$hr(),
                   #                  uiOutput("SS_AO_VP_UI_plot3"),
                   #                  tags$hr(),
                   #                  column(6, plotOutput("SS_AO_VP_Plot12")),
                   #                  column(6, plotOutput("SS_AO_VP_Plot22"))
                   #                )
                   #                # fluidRow(
                   #                #   tags$hr(),
                   #                #   plotOutput("SS_AO_VP_Priority",width = "100%", height = "600px"))
                   #       )
                   #     )
                   #   )
                   # )
                   
                   
                   # tabsetPanel(
                   #   tabPanel(SS_Name_Analysis, fluid = TRUE,
                   #            
                   #            uiOutput("SS_Analy_Box"),
                   #            
                   #            tags$hr(),
                   #            fluidRow(
                   #              sidebarPanel(width = 2, Fluid = TRUE,
                   #                           uiOutput("SS_CA_Species"),
                   #                           
                   #                           uiOutput("SS_CA_Types")
                   #                           
                   #                           
                   #              ),
                   #              sidebarPanel(width = 2, Fluid = TRUE,             
                   #                           
                   #                           
                   #                           uiOutput("SS_CA_Col_Box_02")
                   #                           
                   #                           
                   #              ),
                   #              sidebarPanel(width = 2,
                   #                           uiOutput("SS_CA_SDM_model"),
                   #                           br(),
                   #                           actionButton('reset_SS_CA', label = "Reset")
                   #              ),
                   #              sidebarPanel(width = 1,
                   #                           cat("Hello"),
                   #                           # print("=====>"),
                   #                           tags$br(),
                   #                           tags$br()
                   #              ),
                   #              sidebarPanel(width = 3,
                   #                           actionButton("SS_CA_Action_change", label = "Analayzing the change of Species Distribution"),
                   #                           tags$br(),
                   #                           tags$br(),
                   #                           actionButton("SS_CA_Action_Vindex", label = "Calculating the Climate Vulnerability Index of Species")
                   #              )
                   #            )
                   #   ),
                   #   
                   #   
                   #   tabPanel(SS_Name_Out, fluid = TRUE,
                   #            tags$hr(),
                   #            sidebarLayout(
                   #              sidebarPanel(width = 3, Fluid = TRUE,
                   #                           
                   #                           uiOutput("SS_AO_Species"),
                   #                           tags$hr(),
                   #                           
                   #                           uiOutput("SS_AO_SDM_model"),
                   #                           
                   #                           uiOutput("SS_AO_DT_CM_CS_PY"),
                   #                           hr(),
                   #                           actionButton('reset_SS_AO', label = "Reset")
                   #              ),
                   #              
                   #              # Main panel for displaying outputs ----
                   #              mainPanel(
                   #                tabsetPanel(
                   #                  tabPanel(SS_Name_Out_ChangePlot,
                   #                           tags$hr(),
                   #                           uiOutput("SS_AO_UI_plot")
                   #                  ),
                   #                  tabPanel(SS_Name_Out_Pattern, 
                   #                           tags$hr(),
                   #                           fluidRow(
                   #                             column(6, 
                   #                                    DT::dataTableOutput("SS_AO_IV_Table")
                   #                             )
                   #                           ),
                   #                           fluidRow(
                   #                             tags$hr(),
                   #                             uiOutput("SS_AO_IV_UI_plot1"),
                   #                             tags$hr(),
                   #                             column(6, plotOutput("SS_AO_IV_Plot1")),
                   #                             column(6, plotOutput("SS_AO_IV_Plot2"))
                   #                           ),
                   #                           fluidRow(
                   #                             tags$hr(),
                   #                             uiOutput("SS_AO_IV_UI_plot2"),
                   #                             tags$hr(),
                   #                             column(6, plotOutput("SS_AO_IV_Plot11")),
                   #                             column(6, plotOutput("SS_AO_IV_Plot21"))
                   #                           )
                   #                  ),
                   #                  tabPanel(SS_Name_Out_Vulnerabiity, 
                   #                           tags$hr(),
                   #                           fluidRow(
                   #                             column(6, 
                   #                                    DT::dataTableOutput("SS_AO_VP_Table")
                   #                             )
                   #                           ),
                   #                           fluidRow(
                   #                             tags$hr(),
                   #                             uiOutput("SS_AO_VP_UI_plot1"),
                   #                             tags$hr(),
                   #                             column(6, plotOutput("SS_AO_VP_Plot1")),
                   #                             column(6, plotOutput("SS_AO_VP_Plot2"))
                   #                           ),
                   #                           fluidRow(
                   #                             tags$hr(),
                   #                             uiOutput("SS_AO_VP_UI_plot2"),
                   #                             tags$hr(),
                   #                             column(6, plotOutput("SS_AO_VP_Plot11")),
                   #                             column(6, plotOutput("SS_AO_VP_Plot21"))
                   #                           ),
                   #                           fluidRow(
                   #                             tags$hr(),
                   #                             uiOutput("SS_AO_VP_UI_plot3"),
                   #                             tags$hr(),
                   #                             column(6, plotOutput("SS_AO_VP_Plot12")),
                   #                             column(6, plotOutput("SS_AO_VP_Plot22"))
                   #                           )
                   #                           # fluidRow(
                   #                           #   tags$hr(),
                   #                           #   plotOutput("SS_AO_VP_Priority",width = "100%", height = "600px"))
                   #                  )
                   #                )
                   #              )
                   #            )
                   #   )
                   # )
          ),      
          
          tabPanel(IS_Name, icon = icon("table"),
                   
                   tags$hr(),
                   
                   sidebarLayout(
                     sidebarPanel(width = 3, Fluid = TRUE,
                                  
                                  shinyDirButton("IS_AO_Dir_Folder", IS_Name_AO_Dir, IS_Name_AO_Dir),
                                  verbatimTextOutput("IS_AO_Dir_Folder", placeholder = TRUE),
                                  tags$hr(),
                                  #uiOutput("IS_AO_Species"),
                                  uiOutput("IS_AO_Species"),
                                  tags$hr(),
                                  uiOutput("IS_AO_SDM_model"),
                                  
                                  radioButtons("IS_AO_Dispersal_type", IS_Name_DM_Models,
                                               choices = c(IS_Name_DM_Models_list),
                                               selected = IS_Name_DM_Models_selected),
                                  
                                  # Input: Checkbox if file has header ----
                                  radioButtons("IS_AO_Climate_model", IS_Name_CD_Models,
                                               choices = c(IS_Name_CD_Models_list),
                                               selected = IS_Name_CD_Models_selected),
                                  
                                  # Input: Checkbox if file has header ----
                                  radioButtons("IS_AO_Climate_scenario", IS_Name_CD_Scenarios,
                                               choices = c(IS_Name_CD_Scenarios_list),
                                               selected = IS_Name_CD_Scenarios_selected),
                                  
                                  # Input: Checkbox if file has header ----
                                  # radioButtons("IS_AO_Project_year", IS_Name_CD_Year,
                                  #              choices = c(IS_Name_CD_Year_list),
                                  #              selected = IS_Name_CD_Year_selected),
                                  
                                  sliderInput("IS_AO_Project_year", label = IS_Name_CD_Year, min = 2000,
                                              max = 2080, value = 2000, step = 10, sep = "",
                                              animate = animationOptions(interval = 3000)),
                                  
                                  shinyDirButton("IS_MI_Dir_Folder", IS_Name_MO_Dir, IS_Name_MO_Dir),
                                  verbatimTextOutput("IS_MI_Dir_Folder", placeholder = TRUE)
                     ),
                     
                     # sidebarPanel(width = 3, Fluid = TRUE,
                     #              # shinyDirButton("IS_AO_Dir_Folder", "Invasive Assessment Output Folder", "Invasive Assessment Output Folder"),
                     #              # verbatimTextOutput("IS_AO_Dir_Folder", placeholder = TRUE),
                     #              # tags$hr(),
                     #              uiOutput("IS_AO_Species"),
                     #              tags$hr(),
                     #              
                     #              uiOutput("IS_AO_SDM_model"),
                     #              
                     #              radioButtons("IS_AO_Dispersal_type", IS_Name_DM_Models,
                     #                           choices = c(IS_Name_DM_Models_list),
                     #                           selected = IS_Name_DM_Models_selected
                     #              ),
                     #              
                     #              # Input: Checkbox if file has header ----
                     #              radioButtons("IS_AO_Climate_model", IS_Name_CD_Models,
                     #                           choices = c(IS_Name_CD_Models_list),
                     #                           selected = IS_Name_CD_Models_selected
                     #              ),
                     #              
                     #              # Input: Checkbox if file has header ----
                     #              radioButtons("IS_AO_Climate_scenario", IS_Name_CD_Scenarios,
                     #                           choices = c(IS_Name_CD_Scenarios_list),
                     #                           selected = IS_Name_CD_Scenarios_selected
                     #              ),
                     #              
                     #              # Input: Checkbox if file has header ----
                     #              radioButtons("IS_AO_Project_year", IS_Name_CD_Year,
                     #                           choices = c(IS_Name_CD_Year_list),
                     #                           selected = IS_Name_CD_Year_selected
                     #              )
                     # ),
                     
                     # Main panel for displaying outputs ----
                     mainPanel(
                       tabsetPanel(
                         tabPanel(IS_Name_Out_Species, 
                                  tags$head(
                                    # Include our custom CSS
                                    includeCSS("styles.css"),
                                    includeScript("gomap.js")
                                  ),
                                  tags$hr(),
                                  column(6, leafletOutput("IS_AO_SD_Map", width = "800", height = "650")),
                                  tags$hr(),
                                  column(10, verbatimTextOutput("IS_AO_SD_Summary")),
                                  column(10, plotOutput("IS_AO_SD_Histogram"))
                         ),
                         
                         
                         tabPanel(IS_Name_Out_SR,	
                                  tags$br(), tags$br(),	
                                  # fluidRow(	
                                  #   valueBoxOutput("IS_Value_CM"),	
                                  #   valueBoxOutput("IS_Value_CS"),	
                                  #   valueBoxOutput("IS_Value_YR")	
                                  # ),	
                                  fluidRow(	
                                    valueBoxOutput("IS_Value_CM"),	
                                    valueBoxOutput("IS_Value_CS"),	
                                    valueBoxOutput("IS_Value_YR")
                                  ),
                                  fluidRow(
                                    column(4, class = "text-center",
                                           h4("< 외래종 풍부도 >"),
                                           leafletOutput("IS_AO_SR_Map", width = "360", height = "600") %>% withSpinner() ),
                                    column(4, class = "text-center",
                                           h4("< 시도 지도 >"),
                                           leafletOutput("IS_AO_SR_SIDO_Map", width = "360", height = "600") %>% withSpinner()  ,
                                           tags$br(), tags$br(),
                                           actionButton('Reset_IS_AO_SR_Map', label = 'Reset')
                                           # tags$br(), tags$br(),
                                           # plotOutput("IS_AO_SR_SIDO_Stat")
                                    ),
                                    column(4, class = "text-center",
                                           h4("< 시도 통계 >"),
                                           plotOutput("IS_AO_SR_SIDO_Stat")
                                    )
                                    # column(4, class = "text-center",
                                    #        h4("< 시군구 통계 >"),
                                    #        leafletOutput("IS_AO_SR_SGG_Map", width = "360", height = "600") %>% withSpinner()
                                    # plotOutput("IS_AO_SR_SGG_Stat")
                                    # )
                                  )
                         ),
                         
                         tabPanel(IS_Name_Out_SI,
                                  tabsetPanel(
                                    tabPanel(IS_Name_Out_Map,
                                             
                                             
                                             
                                             #          column(6, leafletOutput("IS_AO_Map1", width = "800", height = "650") %>% withSpinner(),
                                             #                 actionButton("Reset_IS_AO_Map1", label = "Reset") )),
                                             # tabPanel("Vulnerability Map", 
                                             #          tags$head(
                                             #            # Include our custom CSS
                                             #            includeCSS("styles.css"),
                                             #            includeScript("gomap.js")
                                             #          ),
                                             # tags$hr(),
                                             # column(6, leafletOutput("IS_AO_Map2", width = "800", height = "650") %>% withSpinner(),
                                             # actionButton("Reset_IS_AO_Map2", label = "Reset") )),
                                             #                               tabPanel("Assessment Plot",
                                             #                                        tags$hr(),
                                             #                                        uiOutput("IS_AO_UI_plot1")
                                             #                              ),
                                             #                               tabPanel("Vulnerability Plot",
                                             #                                        tags$hr(),
                                             #                                        uiOutput("IS_AO_UI_plot2")
                                             #                               ),
                                             # tabPanel("Invasive species Expansion",
                                             
                                             # tabsetPanel(
                                             # tabPanel(IS_Name_Out_Map,
                                             tags$head(
                                               # Include our custom CSS
                                               includeCSS("styles.css"),
                                               includeScript("gomap.js")
                                             ),
                                             
                                             # leafletOutput("IS_OU_EX_Map", width = "800", height = "600") %>% withSpinner(),
                                             # actionButton("Reset_IS_OU_EX_Map", label = "Reset") ),
                                             
                                             leafletOutput("IS_AO_SI_Map", width = "800", height = "600")
                                    ),
                                    
                                    tabPanel(IS_Name_Out_SIDO,
                                             
                                             tabsetPanel(
                                               tabPanel(IS_Name_Out_Map, 
                                                        tags$head(
                                                          # Include our custom CSS
                                                          includeCSS("styles.css"),
                                                          includeScript("gomap.js")
                                                        ),
                                                        
                                                        # leafletOutput("IS_OU_EX_SIDO_Map", width = "800", height = "600") %>% withSpinner(),
                                                        # actionButton("Reset_IS_OU_EX_SIDO_Map", label = "Reset") ),
                                                        leafletOutput("IS_AO_Si_SIDO_Map", width = "800", height = "600")
                                               ),
                                               
                                               tabPanel(IS_Name_Out_Stat, 	
                                                        plotOutput("IS_AO_SI_SIDO_Stat")	
                                               )
                                             )
                                    ),
                                    
                                    #            tabPanel("Statistics", plotOutput("IS_OU_EX_SIDO_Stat"))
                                    #            
                                    #          )
                                    # ),
                                    
                                    tabPanel(IS_Name_Out_SGG,
                                             tabsetPanel(
                                               tabPanel(IS_Name_Out_Map, 
                                                        tags$head(
                                                          # Include our custom CSS
                                                          includeCSS("styles.css"),
                                                          includeScript("gomap.js")
                                                        ),
                                                        
                                                        # leafletOutput("IS_OU_EX_SIGUNGU_Map", width = "800", height = "600") %>% withSpinner(),
                                                        # actionButton("Reset_IS_OU_EX_SIGUNGU_Map", label = "Reset") ),
                                                        
                                                        leafletOutput("IS_AO_Si_SGG_Map", width = "800", height = "600")),
                                               
                                               tabPanel(IS_Name_Out_Stat, plotOutput("IS_AO_SI_SGG_Stat") 
                                               )
                                             )
                                    )
                                  )
                         )
                       )
                     )
                   )
                   
                   
                   # tabsetPanel(
                   #   tabPanel(IS_Name_Anlayis, fluid = TRUE,
                   #            tags$hr(),
                   #            fluidRow(
                   #              sidebarPanel(width = 3, Fluid = TRUE,
                   #                           uiOutput("IS_CA_Species")
                   #              ),
                   #              
                   #              sidebarPanel(width = 3, Fluid = TRUE,                                                      	
                   #                           checkboxGroupInput("IS_CA_Dispersal_type", IS_Name_DM_Models,	
                   #                                              choices = c(IS_Name_DM_Models_list),	
                   #                                              selected = IS_Name_DM_Models_selected	
                   #                           ),
                   #                           
                   #                           
                   #                           uiOutput("IS_CA_Col_Box_02")
                   #                           
                   #                           
                   #                           
                   #              ),
                   #              sidebarPanel(width = 4,
                   #                           uiOutput("IS_CA_SDM_model"),
                   #                           tags$hr(),
                   #                           
                   #                           shinyDirButton("IS_VA_Dir_Folder", "Invasive Assessment Output Folder", "Invasive Assessment Output Folder"),
                   #                           verbatimTextOutput("IS_VA_Dir_Folder", placeholder = TRUE),
                   #                           actionButton("IS_VA_Action_Analysis", label = IS_Name_Action),
                   #                           
                   #                           
                   #                           tags$hr(),
                   #                           br(),
                   #                           checkboxGroupInput("IS_VA_Admin", IS_Name_Admin,
                   #                                              choices = c(IS_Name_Admin_list),
                   #                                              selected = IS_Name_Admin_selected
                   #                           ),
                   #                           actionButton("IS_VA_Action_Admin", label = IS_Name_Action_Admin)
                   #                           
                   #                           
                   #                           # uiOutput("IS_CA_Admin"),
                   #                           # 
                   #                           # 
                   #                           # actionButton('reset_IS_CA', label = "Reset"),
                   #                           # tags$hr(),
                   #                           
                   #                           
                   #                           
                   #                           
                   #              )
                   #            )
                   #   ),
                   #   
                   #   tabPanel(IS_Name_Out, fluid = TRUE,
                   #            tags$hr(),
                   #            sidebarLayout(
                   #              sidebarPanel(width = 3, Fluid = TRUE,
                   #                           shinyDirButton("IS_AO_Dir_Folder", "Invasive Assessment Output Folder", "Invasive Assessment Output Folder"),
                   #                           verbatimTextOutput("IS_AO_Dir_Folder", placeholder = TRUE),
                   #                           tags$hr(),
                   #                           #uiOutput("IS_AO_Species"),
                   #                           uiOutput("IS_AO_Species"),
                   #                           tags$hr(),
                   #                           
                   #                           
                   #                           
                   #                           uiOutput("IS_AO_SDM_model"),
                   #                           
                   #                           radioButtons("IS_AO_Dispersal_type", IS_Name_DM_Models,
                   #                                        choices = c(IS_Name_DM_Models_list),
                   #                                        selected = IS_Name_DM_Models_selected
                   #                           ),
                   #                           
                   #                           # Input: Checkbox if file has header ----
                   #                           radioButtons("IS_AO_Climate_model", IS_Name_CD_Models,
                   #                                        choices = c(IS_Name_CD_Models_list),
                   #                                        selected = IS_Name_CD_Models_selected
                   #                           ),
                   #                           
                   #                           # Input: Checkbox if file has header ----
                   #                           radioButtons("IS_AO_Climate_scenario", IS_Name_CD_Scenarios,
                   #                                        choices = c(IS_Name_CD_Scenarios_list),
                   #                                        selected = IS_Name_CD_Scenarios_selected
                   #                           ),
                   #                           
                   #                           # Input: Checkbox if file has header ----
                   #                           radioButtons("IS_AO_Project_year", IS_Name_CD_Year,
                   #                                        choices = c(IS_Name_CD_Year_list),
                   #                                        selected = IS_Name_CD_Year_selected
                   #                           )
                   #              ),
                   #              
                   #              # Main panel for displaying outputs ----
                   #              mainPanel(
                   #                tabsetPanel(
                   #                  tabPanel(IS_Name_Out_Species, 
                   #                           tags$head(
                   #                             # Include our custom CSS
                   #                             includeCSS("styles.css"),
                   #                             includeScript("gomap.js")
                   #                           ),
                   #                           tags$hr(),
                   #                           
                   #                           
                   #                           
                   #                           
                   #                           
                   #                           column(6, leafletOutput("IS_AO_SD_Map", width = "800", height = "650")),
                   #                           tags$hr(),
                   #                           column(10, verbatimTextOutput("IS_AO_SD_Summary")),
                   #                           column(10, plotOutput("IS_AO_SD_Histogram"))
                   #                  ),
                   #                  
                   #                  
                   #                  tabPanel(IS_Name_Out_SR,	
                   #                           tags$br(), tags$br(),	
                   #                           # fluidRow(	
                   #                           #   valueBoxOutput("IS_Value_CM"),	
                   #                           #   valueBoxOutput("IS_Value_CS"),	
                   #                           #   valueBoxOutput("IS_Value_YR")	
                   #                           # ),	
                   #                           fluidRow(	
                   #                             valueBoxOutput("IS_Value_CM"),	
                   #                             valueBoxOutput("IS_Value_CS"),	
                   #                             valueBoxOutput("IS_Value_YR")
                   #                           ),
                   #                           fluidRow(
                   #                             column(4, class = "text-center",
                   #                                    print("< 외래종 풍부도 >"),
                   #                                    leafletOutput("IS_AO_SR_Map", width = "360", height = "600") %>% withSpinner() ),
                   #                             column(4, class = "text-center",
                   #                                    print("< 시도 통계 >"),
                   #                                    leafletOutput("IS_AO_SR_SIDO_Map", width = "360", height = "600") %>% withSpinner()  ,
                   #                                    tags$br(), tags$br(),
                   #                                    actionButton('Reset_IS_AO_SR_Map', label = 'Reset'),
                   #                                    tags$br(), tags$br(),
                   #                                    plotOutput("IS_AO_SR_SIDO_Stat")
                   #                             ),
                   #                             column(4, class = "text-center",
                   #                                    print("< 시군구 통계 >"),
                   #                                    leafletOutput("IS_AO_SR_SGG_Map", width = "360", height = "600") %>% withSpinner()
                   #                             )
                   #                           )
                   #                  ),
                   #                  
                   #                  tabPanel(IS_Name_Out_SI,
                   #                           tabsetPanel(
                   #                             tabPanel(IS_Name_Out_Map,
                   #                                      
                   #                                      
                   #                                      
                   #                                      #          column(6, leafletOutput("IS_AO_Map1", width = "800", height = "650") %>% withSpinner(),
                   #                                      #                 actionButton("Reset_IS_AO_Map1", label = "Reset") )),
                   #                                      # tabPanel("Vulnerability Map", 
                   #                                      #          tags$head(
                   #                                      #            # Include our custom CSS
                   #                                      #            includeCSS("styles.css"),
                   #                                      #            includeScript("gomap.js")
                   #                                      #          ),
                   #                                      # tags$hr(),
                   #                                      # column(6, leafletOutput("IS_AO_Map2", width = "800", height = "650") %>% withSpinner(),
                   #                                      # actionButton("Reset_IS_AO_Map2", label = "Reset") )),
                   #                                      #                               tabPanel("Assessment Plot",
                   #                                      #                                        tags$hr(),
                   #                                      #                                        uiOutput("IS_AO_UI_plot1")
                   #                                      #                              ),
                   #                                      #                               tabPanel("Vulnerability Plot",
                   #                                      #                                        tags$hr(),
                   #                                      #                                        uiOutput("IS_AO_UI_plot2")
                   #                                      #                               ),
                   #                                      # tabPanel("Invasive species Expansion",
                   #                                      
                   #                                      # tabsetPanel(
                   #                                      # tabPanel(IS_Name_Out_Map,
                   #                                      tags$head(
                   #                                        # Include our custom CSS
                   #                                        includeCSS("styles.css"),
                   #                                        includeScript("gomap.js")
                   #                                      ),
                   #                                      
                   #                                      # leafletOutput("IS_OU_EX_Map", width = "800", height = "600") %>% withSpinner(),
                   #                                      # actionButton("Reset_IS_OU_EX_Map", label = "Reset") ),
                   #                                      
                   #                                      leafletOutput("IS_AO_SI_Map", width = "800", height = "600")
                   #                             ),
                   #                             
                   #                             tabPanel(IS_Name_Out_SIDO,
                   #                                      
                   #                                      tabsetPanel(
                   #                                        tabPanel(IS_Name_Out_Map, 
                   #                                                 tags$head(
                   #                                                   # Include our custom CSS
                   #                                                   includeCSS("styles.css"),
                   #                                                   includeScript("gomap.js")
                   #                                                 ),
                   #                                                 
                   #                                                 # leafletOutput("IS_OU_EX_SIDO_Map", width = "800", height = "600") %>% withSpinner(),
                   #                                                 # actionButton("Reset_IS_OU_EX_SIDO_Map", label = "Reset") ),
                   #                                                 leafletOutput("IS_AO_Si_SIDO_Map", width = "800", height = "600")
                   #                                        ),
                   #                                        
                   #                                        tabPanel(IS_Name_Out_Stat, 	
                   #                                                 plotOutput("IS_AO_SI_SIDO_Stat")	
                   #                                        )
                   #                                      )
                   #                             ),
                   #                             
                   #                             #            tabPanel("Statistics", plotOutput("IS_OU_EX_SIDO_Stat"))
                   #                             #            
                   #                             #          )
                   #                             # ),
                   #                             
                   #                             tabPanel(IS_Name_Out_SGG,
                   #                                      tabsetPanel(
                   #                                        tabPanel(IS_Name_Out_Map, 
                   #                                                 tags$head(
                   #                                                   # Include our custom CSS
                   #                                                   includeCSS("styles.css"),
                   #                                                   includeScript("gomap.js")
                   #                                                 ),
                   #                                                 
                   #                                                 # leafletOutput("IS_OU_EX_SIGUNGU_Map", width = "800", height = "600") %>% withSpinner(),
                   #                                                 # actionButton("Reset_IS_OU_EX_SIGUNGU_Map", label = "Reset") ),
                   #                                                 
                   #                                                 leafletOutput("IS_AO_Si_SGG_Map", width = "800", height = "600")),
                   #                                        
                   #                                        tabPanel(IS_Name_Out_Stat, plotOutput("IS_AO_SI_SGG_Stat") 
                   #                                        )
                   #                                      )
                   #                             )
                   #                           )
                   #                  )
                   #                )
                   #              )
                   #            )
                   #   )
                   # )
          ),
          
          
          
          # tabPanel(VH_Name, icon = icon("table"),
          #          
          #          
          #          tags$hr(),
          #          sidebarLayout(
          #            sidebarPanel(width = 3, Fluid = TRUE,
          #                         
          #                         uiOutput("VH_AO_Species"),
          #                         tags$hr(),
          #                         
          #                         uiOutput("VH_AO_SDM_model"),
          #                         
          #                         uiOutput("VH_AO_DT_CM_CS_PY"),
          #                         hr(),
          #                         actionButton('reset_VH_AO', label = "Reset")
          #                         
          #            ),
          #            
          #            # Main panel for displaying outputs ----
          #            mainPanel(
          #              tabsetPanel(
          #                tabPanel("Species Richness",
          #                         tabsetPanel(
          #                           tabPanel("Map", 
          #                                    tags$head(
          #                                      # Include our custom CSS
          #                                      includeCSS("styles.css"),
          #                                      includeScript("gomap.js")
          #                                    ),
          #                                    leafletOutput("VH_OU_SR_Map", width = "800", height = "600") %>% withSpinner(),
          #                                    actionButton("Reset_VH_OU_SR_Map", label = "Reset") ),
          #                           tabPanel("Habitat Type",
          #                                    tabsetPanel(
          #                                      tabPanel("Map", 
          #                                               tags$head(
          #                                                 # Include our custom CSS
          #                                                 includeCSS("styles.css"),
          #                                                 includeScript("gomap.js")
          #                                               ),
          #                                               leafletOutput("VH_OU_SR_Habitat_Map", width = "800", height = "600") %>% withSpinner(),
          #                                               actionButton("Reset_VH_OU_SR_Habitat_Map", label = "Reset") ),
          #                                      tabPanel("Statistics", plotOutput("VH_OU_SR_Habitat_Stat"))
          #                                    )
          #                           )
          #                         )
          #                ),
          #                tabPanel("Species Richness Loss",
          #                         tabsetPanel(
          #                           tabPanel("Map", 
          #                                    tags$head(
          #                                      # Include our custom CSS
          #                                      includeCSS("styles.css"),
          #                                      includeScript("gomap.js")
          #                                    ),
          #                                    leafletOutput("VH_OU_SRL_Map", width = "800", height = "600") %>% withSpinner(),
          #                                    actionButton("Reset_VH_OU_SRL_Map", label = "Reset") ),
          #                           tabPanel("Habitat Type",
          #                                    tabsetPanel(
          #                                      tabPanel("Map", 
          #                                               tags$head(
          #                                                 # Include our custom CSS
          #                                                 includeCSS("styles.css"),
          #                                                 includeScript("gomap.js")
          #                                               ),
          #                                               leafletOutput("VH_OU_SRL_Habitat_Map", width = "800", height = "600") %>% withSpinner(),
          #                                               actionButton("Reset_VH_OU_SRL_Habitat_Map", label = "Reset") ),
          #                                      tabPanel("Statistics", verbatimTextOutput("VH_OU_SRL_Habitat_Stat"))
          #                                    )
          #                           )
          #                         )
          #                ),
          #                tabPanel("Species Loss",
          #                         tabsetPanel(
          #                           tabPanel("Map", 
          #                                    tags$head(
          #                                      # Include our custom CSS
          #                                      includeCSS("styles.css"),
          #                                      includeScript("gomap.js")
          #                                    ),
          #                                    leafletOutput("VH_OU_SL_Map", width = "800", height = "600") %>% withSpinner(),
          #                                    actionButton("Reset_VH_OU_SL_Map", label = "Reset") ),
          #                           tabPanel("Habitat Type",
          #                                    tabsetPanel(
          #                                      tabPanel("Map", 
          #                                               tags$head(
          #                                                 # Include our custom CSS
          #                                                 includeCSS("styles.css"),
          #                                                 includeScript("gomap.js")
          #                                               ),
          #                                               leafletOutput("VH_OU_SL_Habitat_Map", width = "800", height = "600") %>% withSpinner(),
          #                                               actionButton("Reset_VH_OU_SL_Habitat_Map", label = "Reset") ),
          #                                      tabPanel("Statistics", verbatimTextOutput("VH_OU_SL_Habitat_Stat"))
          #                                    )
          #                           )
          #                         )
          #                ),
          #                tabPanel("Species Stay",
          #                         tabsetPanel(
          #                           tabPanel("Map", 
          #                                    tags$head(
          #                                      # Include our custom CSS
          #                                      includeCSS("styles.css"),
          #                                      includeScript("gomap.js")
          #                                    ),
          #                                    leafletOutput("VH_OU_SS_Map", width = "800", height = "600") %>% withSpinner(),
          #                                    actionButton("Reset_VH_OU_SS_Map", label = "Reset") ),
          #                           tabPanel("Habitat Type",
          #                                    tabsetPanel(
          #                                      tabPanel("Map", 
          #                                               tags$head(
          #                                                 # Include our custom CSS
          #                                                 includeCSS("styles.css"),
          #                                                 includeScript("gomap.js")
          #                                               ),
          #                                               leafletOutput("VH_OU_SS_Habitat_Map", width = "800", height = "600") %>% withSpinner(),
          #                                               actionButton("Reset_VH_OU_SS_Habitat_Map", label = "Reset") ),
          #                                      tabPanel("Statistics", verbatimTextOutput("VH_OU_SS_Habitat_Stat"))
          #                                    )
          #                           )
          #                         )
          #                ),
          #                tabPanel("Species Introduction",
          #                         tabsetPanel(
          #                           tabPanel("Map", 
          #                                    tags$head(
          #                                      # Include our custom CSS
          #                                      includeCSS("styles.css"),
          #                                      includeScript("gomap.js")
          #                                    ),
          #                                    leafletOutput("VH_OU_SI_Map", width = "800", height = "600") %>% withSpinner(),
          #                                    actionButton("Reset_VH_OU_SI_Map", label = "Reset") ),
          #                           tabPanel("Habitat Type",
          #                                    tabsetPanel(
          #                                      tabPanel("Map", 
          #                                               tags$head(
          #                                                 # Include our custom CSS
          #                                                 includeCSS("styles.css"),
          #                                                 includeScript("gomap.js")
          #                                               ),
          #                                               leafletOutput("VH_OU_SI_Habitat_Map", width = "800", height = "600") %>% withSpinner(),
          #                                               actionButton("Reset_VH_OU_SI_Habitat_Map", label = "Reset") ),
          #                                      tabPanel("Statistics", verbatimTextOutput("VH_OU_SI_Habitat_Stat"))
          #                                    )
          #                           )
          #                         )
          #                )
          #              )
          #            )
          #          )
          # ),
                   
# <<<<<<< HEAD
                   
                   
                   # tabsetPanel(
                   #   tabPanel(VH_Name_Analysis, fluid = TRUE,
                   #            tags$hr(),
                   #            fluidRow(
                   #              sidebarPanel(width = 3, Fluid = TRUE,
                   #                           uiOutput("VH_CA_Species")
                   #              ),
                   #              sidebarPanel(width = 3, Fluid = TRUE,             
                   #                           uiOutput("VH_CA_Col_Box_02")
                   #                           
                   #              ),
                   #              sidebarPanel(width = 3,
                   #                           uiOutput("VH_CA_SDM_model"),
                   #                           tags$hr(),
                   #                           
                   #                           uiOutput("VH_CA_Habitat_Weighting"),
                   #                           tags$hr(),  
                   #                           
                   #                           actionButton('reset_VH_CA', label = "Reset"),
                   #                           tags$hr(),             
                   #                           
                   #                           actionButton("VH_VA_Action_SR", label = "Species Richness"),
                   #                           br(),
                   #                           actionButton("VH_VA_Action_SRL", label = "Species Richness Loss"),
                   #                           tags$hr(),
                   #                           actionButton("VH_VA_Action_SSA", label = "Species Stay Area"),
                   #                           br(),
                   #                           actionButton("VH_VA_Action_SLA", label = "Species Loss Area"),
                   #                           br(),
                   #                           actionButton("VH_VA_Action_SIA", label = "Species Introduction Area")
                   #                           
                   #              )
                   #            )
                   #            
                   #   ), 
                   #   
                   #   tabPanel(VH_Name_Out, fluid = TRUE,
                   #            tags$hr(),
                   #            sidebarLayout(
                   #              sidebarPanel(width = 3, Fluid = TRUE,
                   #                           
                   #                           uiOutput("VH_AO_Species"),
                   #                           tags$hr(),
                   #                           
                   #                           uiOutput("VH_AO_SDM_model"),
                   #                           
                   #                           uiOutput("VH_AO_DT_CM_CS_PY"),
                   #                           hr(),
                   #                           actionButton('reset_VH_AO', label = "Reset")
                   #                           
                   #              ),
                   #              
                   #              # Main panel for displaying outputs ----
                   #              mainPanel(
                   #                tabsetPanel(
                   #                  tabPanel("Species Richness",
                   #                           tabsetPanel(
                   #                             tabPanel("Map", 
                   #                                      tags$head(
                   #                                        # Include our custom CSS
                   #                                        includeCSS("styles.css"),
                   #                                        includeScript("gomap.js")
                   #                                      ),
                   #                                      leafletOutput("VH_OU_SR_Map", width = "800", height = "600") %>% withSpinner(),
                   #                                      actionButton("Reset_VH_OU_SR_Map", label = "Reset") ),
                   #                             tabPanel("Habitat Type",
                   #                                      tabsetPanel(
                   #                                        tabPanel("Map", 
                   #                                                 tags$head(
                   #                                                   # Include our custom CSS
                   #                                                   includeCSS("styles.css"),
                   #                                                   includeScript("gomap.js")
                   #                                                 ),
                   #                                                 leafletOutput("VH_OU_SR_Habitat_Map", width = "800", height = "600") %>% withSpinner(),
                   #                                                 actionButton("Reset_VH_OU_SR_Habitat_Map", label = "Reset") ),
                   #                                        tabPanel("Statistics", plotOutput("VH_OU_SR_Habitat_Stat"))
                   #                                      )
                   #                             )
                   #                           )
                   #                  ),
                   #                  tabPanel("Species Richness Loss",
                   #                           tabsetPanel(
                   #                             tabPanel("Map", 
                   #                                      tags$head(
                   #                                        # Include our custom CSS
                   #                                        includeCSS("styles.css"),
                   #                                        includeScript("gomap.js")
                   #                                      ),
                   #                                      leafletOutput("VH_OU_SRL_Map", width = "800", height = "600") %>% withSpinner(),
                   #                                      actionButton("Reset_VH_OU_SRL_Map", label = "Reset") ),
                   #                             tabPanel("Habitat Type",
                   #                                      tabsetPanel(
                   #                                        tabPanel("Map", 
                   #                                                 tags$head(
                   #                                                   # Include our custom CSS
                   #                                                   includeCSS("styles.css"),
                   #                                                   includeScript("gomap.js")
                   #                                                 ),
                   #                                                 leafletOutput("VH_OU_SRL_Habitat_Map", width = "800", height = "600") %>% withSpinner(),
                   #                                                 actionButton("Reset_VH_OU_SRL_Habitat_Map", label = "Reset") ),
                   #                                        tabPanel("Statistics", verbatimTextOutput("VH_OU_SRL_Habitat_Stat"))
                   #                                      )
                   #                             )
                   #                           )
                   #                  ),
                   #                  tabPanel("Species Loss",
                   #                           tabsetPanel(
                   #                             tabPanel("Map", 
                   #                                      tags$head(
                   #                                        # Include our custom CSS
                   #                                        includeCSS("styles.css"),
                   #                                        includeScript("gomap.js")
                   #                                      ),
                   #                                      leafletOutput("VH_OU_SL_Map", width = "800", height = "600") %>% withSpinner(),
                   #                                      actionButton("Reset_VH_OU_SL_Map", label = "Reset") ),
                   #                             tabPanel("Habitat Type",
                   #                                      tabsetPanel(
                   #                                        tabPanel("Map", 
                   #                                                 tags$head(
                   #                                                   # Include our custom CSS
                   #                                                   includeCSS("styles.css"),
                   #                                                   includeScript("gomap.js")
                   #                                                 ),
                   #                                                 leafletOutput("VH_OU_SL_Habitat_Map", width = "800", height = "600") %>% withSpinner(),
                   #                                                 actionButton("Reset_VH_OU_SL_Habitat_Map", label = "Reset") ),
                   #                                        tabPanel("Statistics", verbatimTextOutput("VH_OU_SL_Habitat_Stat"))
                   #                                      )
                   #                             )
                   #                           )
                   #                  ),
                   #                  tabPanel("Species Stay",
                   #                           tabsetPanel(
                   #                             tabPanel("Map", 
                   #                                      tags$head(
                   #                                        # Include our custom CSS
                   #                                        includeCSS("styles.css"),
                   #                                        includeScript("gomap.js")
                   #                                      ),
                   #                                      leafletOutput("VH_OU_SS_Map", width = "800", height = "600") %>% withSpinner(),
                   #                                      actionButton("Reset_VH_OU_SS_Map", label = "Reset") ),
                   #                             tabPanel("Habitat Type",
                   #                                      tabsetPanel(
                   #                                        tabPanel("Map", 
                   #                                                 tags$head(
                   #                                                   # Include our custom CSS
                   #                                                   includeCSS("styles.css"),
                   #                                                   includeScript("gomap.js")
                   #                                                 ),
                   #                                                 leafletOutput("VH_OU_SS_Habitat_Map", width = "800", height = "600") %>% withSpinner(),
                   #                                                 actionButton("Reset_VH_OU_SS_Habitat_Map", label = "Reset") ),
                   #                                        tabPanel("Statistics", verbatimTextOutput("VH_OU_SS_Habitat_Stat"))
                   #                                      )
                   #                             )
                   #                           )
                   #                  ),
                   #                  tabPanel("Species Introduction",
                   #                           tabsetPanel(
                   #                             tabPanel("Map", 
                   #                                      tags$head(
                   #                                        # Include our custom CSS
                   #                                        includeCSS("styles.css"),
                   #                                        includeScript("gomap.js")
                   #                                      ),
                   #                                      leafletOutput("VH_OU_SI_Map", width = "800", height = "600") %>% withSpinner(),
                   #                                      actionButton("Reset_VH_OU_SI_Map", label = "Reset") ),
                   #                             tabPanel("Habitat Type",
                   #                                      tabsetPanel(
                   #                                        tabPanel("Map", 
                   #                                                 tags$head(
                   #                                                   # Include our custom CSS
                   #                                                   includeCSS("styles.css"),
                   #                                                   includeScript("gomap.js")
                   #                                                 ),
                   #                                                 leafletOutput("VH_OU_SI_Habitat_Map", width = "800", height = "600") %>% withSpinner(),
                   #                                                 actionButton("Reset_VH_OU_SI_Habitat_Map", label = "Reset") ),
                   #                                        tabPanel("Statistics", verbatimTextOutput("VH_OU_SI_Habitat_Stat"))
                   #                                      )
                   #                             )
                   #                           )
                   #                  )
                   #                )
                   #              )
                   #            )
                   #   )
                   # )
                   
          # ),          
# =======
          # )         
# >>>>>>> lx02jd2
          
          # tabPanel(HELP_Name,
          #          tabsetPanel(
          #            tabPanel("Help", fluid = TRUE,
          #                     tags$hr(),
          #                     sidebarPanel(width = 5,
          #                                  helpText("MOTIVE ECOSYSTEM(생태계 기후변화 영향 및 취약성평가모형)은 환경부 기후변화 R&D 과제의 결과물입니다."),
          #                                  helpText(hh)
          #                     )
          #            ),
          #            tabPanel("서식지 변동", fluid = TRUE,
          #                     tags$hr(),
          #                     sidebarLayout(
          #                       sidebarPanel(width=3,
          #                                    fluidRow( 
          #                                      fileInput("myFile", "Choose a file", accept = c('image/png', 'image/jpeg'))
          #                                    ),
          #                                    selectInput("RP_Type1", "Type of Map1",
          #                                                choices = RP_Name_Type_list,
          #                                                selected = RP_Name_Type1_selected
          #                                    ),
          #                                    selectInput("RP_Type2", "Type of Map2",
          #                                                choices = RP_Name_Type_list,
          #                                                selected = RP_Name_Type2_selected
          #                                    ),
          #                                    selectInput("RP_Type3", "Type of Map3",
          #                                                choices = RP_Name_Type_list,
          #                                                selected = RP_Name_Type3_selected
          #                                    )
          #                       ),
          #                       mainPanel(
          #                         fluidRow(
          #                           valueBoxOutput("RP_Value_GN"),
          #                           valueBoxOutput("RP_Value_ST"),
          #                           valueBoxOutput("RP_Value_LS")
          #                         ),
          #                         uiOutput("MAP_2020"),
          #                         uiOutput("MAP_2050"),
          #                         uiOutput("MAP_2080"),
          #                         imageOutput("imgOut")
          #                       )
          #                     )
          #            ),
          #            tabPanel("취약성지수", fluid = TRUE,
          #                     tags$hr(),
          #                     sidebarLayout(
          #                       sidebarPanel(width=3,
          #                                    fluidRow( 
          #                                      fileInput("myFile", "Choose a file", accept = c('image/png', 'image/jpeg'))
          #                                    ),
          #                                    selectInput("RP_Type1", "Type of Map1",
          #                                                choices = RP_Name_Type_list,
          #                                                selected = RP_Name_Type1_selected
          #                                    ),
          #                                    selectInput("RP_Type2", "Type of Map2",
          #                                                choices = RP_Name_Type_list,
          #                                                selected = RP_Name_Type2_selected
          #                                    ),
          #                                    selectInput("RP_Type3", "Type of Map3",
          #                                                choices = RP_Name_Type_list,
          #                                                selected = RP_Name_Type3_selected
          #                                    )
          #                       ),
          #                       mainPanel(
          #                         fluidRow(
          #                           valueBox("취약성지수", "Themes", icon = icon("thumbs-up"), color = "green", width = 6),
          #                           valueBox("KMA", "Model", icon = icon("thumbs-up"), color = "yellow", width = 3),
          #                           valueBox("RCP4.5", "Scenario", icon = icon("thumbs-up"), color = "yellow", width = 3)
          #                         ),
          #                         fluidRow(
          #                           box(width=3, title="1km", solidHeader = TRUE, status = "info", class = "text-center"),
          #                           box(width=3, title="5km", solidHeader = TRUE, status = "info"),
          #                           box(width=3, title="10km", solidHeader = TRUE, status = "info"),
          #                           box(width=3, title="Unlimited", solidHeader = TRUE, status = "info")
          #                         ),
          #                         # fluidRow(
          #                         #   infoBox("Distance", "1km", icon = icon("check"), color="aqua", width = 3),
          #                         #   infoBox("Distance", "5km", icon = icon("check"), color="light-blue", width = 3),
          #                         #   infoBox("Distance", "10km", icon = icon("check"), color="blue", width = 3),
          #                         #   infoBox("Distance", "UnLimited", icon = icon("check"), color="purple", width = 3),
          #                         # ),
          #                         box(
          #                           title = "[취약성 RCP4.5 2030]", width = NULL, solidHeader = TRUE, status = "success", collapsible = T,
          #                           column(3, class = "text-center",
          #                                  plotOutput("VH_45_30_01", height=250)
          #                           ),
          #                           column(3, class = "text-center",
          #                                  plotOutput("VH_45_30_05", height=250)
          #                           ),
          #                           column(3, class = "text-center",
          #                                  plotOutput("VH_45_30_10", height=250)
          #                           ),
          #                           column(3, class = "text-center",
          #                                  plotOutput("VH_45_30_UN", height=250)
          #                           )
          #                         ),
          #                         box(
          #                           title = "[취약성 RCP4.5 2050]", width = NULL, solidHeader = TRUE, status = "primary", collapsible = T,
          #                           column(3, class = "text-center",
          #                                  plotOutput("VH_45_50_01", height=250)
          #                           ),
          #                           column(3, class = "text-center",
          #                                  plotOutput("VH_45_50_05", height=250)
          #                           ),
          #                           column(3, class = "text-center",
          #                                  plotOutput("VH_45_50_10", height=250)
          #                           ),
          #                           column(3, class = "text-center",
          #                                  plotOutput("VH_45_50_UN", height=250)
          #                           )
          #                         ),
          #                         box(
          #                           title = "[취약성 RCP4.5 2080]", width = NULL, solidHeader = TRUE, status = "warning", collapsible = T,
          #                           column(3, class = "text-center",
          #                                  plotOutput("VH_45_80_01", height=250)
          #                           ),
          #                           column(3, class = "text-center",
          #                                  plotOutput("VH_45_80_05", height=250)
          #                           ),
          #                           column(3, class = "text-center",
          #                                  plotOutput("VH_45_80_10", height=250)
          #                           ),
          #                           column(3, class = "text-center",
          #                                  plotOutput("VH_45_80_UN", height=250)
          #                           )
          #                         )
          #                       )
          #                     )
          #            ),
          #            tabPanel("시나리오별 리포트", fluid = TRUE,
          #                     tags$hr(),
          #                     sidebarLayout(
          #                       sidebarPanel(width=3,
          #                           fileInput("myFile", "Choose a file", accept = c('image/png', 'image/jpeg')),
          #                           tags$hr(),
          #                           print("<Current>"),
          #                           tags$img(src = "test.jpg", width = ww, height = hh, alt = "This is alternate text")
          #                         
          #                       ),
          #                       mainPanel(
          #                         fluidRow(
          #                            box(
          #                              title = "[KMA - RCP4.5]", width = NULL, solidHeader = TRUE, status = "info", collapsible = T,
          #                              column(4, class = "text-center",
          #                                     print("<2020>"),
          #                                     tags$img(src = "test.jpg", width = ww, height = hh)
          #                              ),
          #                              column(4, class = "text-center",
          #                                     print("<2050>"),
          #                                     tags$img(src = "test.jpg", width = ww, height = hh)
          #                              ),
          #                              column(4, class = "text-center",
          #                                     print("<2080>"),
          #                                     tags$img(src = "test.jpg", width = ww, height = hh)
          #                              )
          #                            )
          #                        ),
          #                         fluidRow(
          #                           box(
          #                             title = "[KMA - RCP8.5]", width = NULL, solidHeader = TRUE, status = "warning", collapsible = T,
          #                             column(4, class = "text-center",
          #                                    print("<2020>"),
          #                                    tags$img(src = "test.jpg", width = ww, height = hh)
          #                             ),
          #                             column(4, class = "text-center",
          #                                    print("<2050>"),
          #                                    tags$img(src = "test.jpg", width = ww, height = hh)
          #                             ),
          #                             column(4, class = "text-center",
          #                                    print("<2080>"),
          #                                    tags$img(src = "test.jpg", width = ww, height = hh)
          #                             )
          #                           )
          #                         ),
          #                         fluidRow(
          #                           box(
          #                             title = "[KEI - RCP4.5]", width = NULL, solidHeader = TRUE, status = "info", collapsible = T,
          #                             column(4, class = "text-center",
          #                                    print("<2020>"),
          #                                    tags$img(src = "test.jpg", width = ww, height = hh)
          #                             ),
          #                             column(4, class = "text-center",
          #                                    print("<2050>"),
          #                                    tags$img(src = "test.jpg", width = ww, height = hh)
          #                             ),
          #                             column(4, class = "text-center",
          #                                    print("<2080>"),
          #                                    tags$img(src = "test.jpg", width = ww, height = hh)
          #                             )
          #                           )
          #                         ),
          #                         fluidRow(
          #                           box(
          #                             title = "[KEI - RCP8.5]", width = NULL, solidHeader = TRUE, status = "warning", collapsible = T,
          #                             column(4, class = "text-center",
          #                                    print("<2020>"),
          #                                    tags$img(src = "test.jpg", width = ww, height = hh)
          #                             ),
          #                             column(4, class = "text-center",
          #                                    print("<2050>"),
          #                                    tags$img(src = "test.jpg", width = ww, height = hh)
          #                             ),
          #                             column(4, class = "text-center",
          #                                    print("<2080>"),
          #                                    tags$img(src = "test.jpg", width = ww, height = hh)
          #                             )
          #                           )
          #                         )
          #                       )
          #                     ),
          # 
          #               # tags$img(src = "yy.jpg")
          #               # img(src="C:/MOTIVE_projects/proj30/img/test.jpg")
          #               # imageOutput("image1", height=400)
          #            ),
          #            tabPanel("통합리포트", fluid = TRUE,
          #                     tags$hr(),
          #                     sidebarLayout(
          #                       sidebarPanel(width=3,
          #                                    fluidRow( 
          #                                      fileInput("myFile", "Choose a file", accept = c('image/png', 'image/jpeg'))
          #                                    ),
          #                                    selectInput("region", "Region:", 
          #                                                choices=colnames(WorldPhones)),
          #                                    hr(),
          #                                    helpText("Data from AT&T (1961) The World's Telephones.")
          #                       ),
          #                       mainPanel(
          #                         fluidRow(
          #                           valueBoxOutput("RP_Value_CM"),
          #                           valueBoxOutput("RP_Value_CS"),
          #                           valueBoxOutput("RP_Value_YR")
          #                         ),
          #                         box(
          #                           title = "[확산면적]", width = NULL, solidHeader = TRUE, status = "success", collapsible = T,
          #                           plotOutput("RP_SS_AO_IV_Plot", height=300)
          #                         ),
          #                         box(
          #                           title = "[확산면적 비율]", width = NULL, solidHeader = TRUE, status = "success", collapsible = T,
          #                           plotOutput("RP_SS_AO_IV_Plot2", height=300)
          #                         ),
          #                         box(
          #                           title = "[확산면적(Bar)]", width = NULL, solidHeader = TRUE, status = "success", collapsible = T,
          #                           plotOutput("RP_SS_AO_IV_Plot3", height=300)
          #                         ),
          #                         # plotOutput("RP_SS_AO_IV_Plot"),
          #                         # plotOutput("RP_SS_AO_IV_Plot2"),
          #                         DT::dataTableOutput("RP_SS_AO_IV_Table")
          #                       )
          #                     )
          #            ),
          #            tabPanel("Convert Image", fluid = TRUE,
          #                     tags$hr(),
          #                     sidebarPanel(width = 4,
          #                                  fluid = TRUE,
          #                                  shinyDirButton("CV_TIF_Folder", "변환할 TIF폴더", "TIF폴더 선택"),
          #                                  verbatimTextOutput("CV_TIF_Folder", placeholder = TRUE),
          #                                  tags$hr(),
          #                                  helpText("변환된 PNG 파일은 output 폴더(create & overwrite)에 저장됨"),
          #                                  uiOutput("CV_TIF_Time"),
          #                                  tags$hr(),
          #                                  actionButton("CV_TIF_run", label = "변환실행")  
          #                                  # 
          #                                  # uiOutput("VH_AO_SDM_model")
          #                     ),
          #                     mainPanel(
          #                       fluidRow(
          #                         # valueBoxOutput("Value_TM_DF"),
          #                         # valueBoxOutput("Value_TM_AV")
          #                       ),
          #                       fluidRow(
          #                         # valueBoxOutput("Value_TM_ES"),
          #                         # valueBoxOutput("Value_TM_RM")
          #                       )
          #                     )
          #            )
          #          )
          #          
          # )
          
# <<<<<<< HEAD
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
                                ),
                                fluidRow(
                                  h1(HELP_TEST_desc01)
                                ),
                                
                                fluidRow(
                                  br(),br(),br(),
                                  hr(),
                                  verbatimTextOutput("choice_radio_Table"),
                                  uiOutput('radio_Table')
                                ))
          )
# =======
          # tabPanel(HELP_Name, fluid = TRUE,
          #          tags$hr(),
          #          sidebarPanel(width = 5,
          #                       helpText("MOTIVE ECOSYSTEM(생태계 기후변화 영향 및 취약성평가모형)은 환경부 기후변화 R&D 과제의 결과물입니다.")
          #                       ,
          #                       
          #                       fluidRow(
          #                         infoBox("New Orders", 10 * 2, icon = icon("credit-card"), width = 12)  
          #                       ),
          #                       
          #                       fluidRow(
          #                         infoBox("New Orders", 10 * 2, icon = icon("credit-card"), fill = TRUE, width = 12)
          #                       ),
          #                       
          #                       fluidRow(
          #                         infoBox("Progress", "25%", icon = icon("list"), width = 12, color = "purple")
          #                       ),
          #                       
          #                       fluidRow(
          #                         infoBox("Approval", paste0(80, "%"), icon = icon("thumbs-up", lib = "glyphicon") ,width = 12, color = "yellow")
          #                       ),
          #                       fluidRow(
          #                         # h1(HELP_TEST_desc01)
          #                       )
          #                       
          #                       
          #          )
          # )
# >>>>>>> lx02jd2
          
        ) # tabset
        
      ),
# <<<<<<< HEAD
      
      # tags$hr(), # theme에 따라서 선이 보이지 않을 수 있음!!
      # tags$footer("MOTIVE ECOSYSTEM(생태계 기후변화 영향 및 취약성평가모형)")
      
      # tags$footer("
      # <p>(우)30147 세종특별자치시 시청대로 370 세종국책연구단지 B동(과학 ·인프라동) 8층~11층 한국환경정책·평가연구원 국가기후변화적응센터<br>
      #   TEL : 82-44-415-7845 ㅣ FAX : 82-44-415-7788 ㅣ E-Mail : kaccc@kei.re.kr</p>
      #   <p class="cr">COPYRIGHT KOREA ADAPTATION CENTER FOR CLIMATE CHANGE ALL RIGHT RESERVED</p>")
      
      # tags$footer( style = "background-color: grey;",
      fluidRow(
        tags$hr(),
        column(6,
               tags$footer( style = "font-size: 11px;",
                 p("(우)30147 세종특별자치시 시청대로 370 세종국책연구단지 B동(과학 ·인프라동) 8층~11층 한국환경정책·평가연구원 국가기후변화적응센터"),
                 p("TEL : 82-44-415-7845 ㅣ FAX : 82-44-415-7788 ㅣ E-Mail : kaccc@kei.re.kr"),
                 
                 p("COPYRIGHT KOREA ADAPTATION CENTER FOR CLIMATE CHANGE ALL RIGHT RESERVED", class = "cr")
                 
               )
               ),
        column(6,
               selectInput("Input1", "관련사이트:", 
                           choices = c('국립생태원'='1',
                                       '국립생물자원관'='2',
                                       '한국환경정책평가연구원'='3',
                                       '환경부'='4'))
               # tags$select(
               #   tags$option('관련사이트')
               # ),
               # tags$button('이동')
               )
      )
      
      
      
      
      #   <p>(우)30147 세종특별자치시 시청대로 370 세종국책연구단지 B동(과학 ·인프라동) 8층~11층 한국환경정책·평가연구원 국가기후변화적응센터<br>
      #   TEL : 82-44-415-7845 ㅣ FAX : 82-44-415-7788 ㅣ E-Mail : kaccc@kei.re.kr</p>
      #   <p class="cr">COPYRIGHT KOREA ADAPTATION CENTER FOR CLIMATE CHANGE ALL RIGHT RESERVED</p>
      
      # div(
      #   div(
      #     div()
      #   )
      # )
      # HTML('
      # <div class="footer">
      #   <div class="wrap">
      #   <div class="ft_lt">
      #   <p>(우)30147 세종특별자치시 시청대로 370 세종국책연구단지 B동(과학 ·인프라동) 8층~11층 한국환경정책·평가연구원 국가기후변화적응센터<br>
      #   TEL : 82-44-415-7845 ㅣ FAX : 82-44-415-7788 ㅣ E-Mail : kaccc@kei.re.kr</p>
      #   <p class="cr">COPYRIGHT KOREA ADAPTATION CENTER FOR CLIMATE CHANGE ALL RIGHT RESERVED</p>
      #   </div>
      #   <div class="ft_rt">
      #   <select>
      #   <option>관련사이트</option>
      #   </select>
      #   <button>이동</button>
      #   </div>
      #   </div>
      #   </div>
      #      ')
      
# =======
      # tags$hr(), # theme에 따라서 선이 보이지 않을 수 있음!!
      # tags$footer("MOTIVE ECOSYSTEM(생태계 기후변화 영향 및 취약성평가모형)")
# >>>>>>> lx02jd2
      
      ), # tab1
    
    tabItem(tabName = "report",
            # theme = shinytheme("yeti"),            
            h2("[통합 리포트]"),
            fluidRow(

            tabBox(
              # title = "통합리포트",
              width = 12,
              id = "tabset1",
              # height = "250px",
              
              
              
            # tabPanel(HELP_Name,
            #          tabsetPanel(
             tabPanel("개요", fluid = TRUE, width = 3,
                      tags$hr(),
                # tags$hr(),
                sidebarPanel(width = 22,
                   h3("MOTIVE ECOSYSTEM"),
                   tags$li("서식지 변동"),
                   tags$li("취약성지수"),
                   tags$li("시나리오별 리포트"),
                   tags$li("통합리포트")
                )
             ),
            
            tabPanel(RP_Name, fluid = TRUE, icon = icon("folder-open"),
                     tags$hr(),
                 sidebarLayout(
                     sidebarPanel(width = 3,
                        h3("외래종변화"),
                        hr(),
                        h4("현재"),
                        plotOutput("MR_Result0", height=350)
                     ),
                     # style = "margin-top: 1px, margin-left: 1px",
                     
                     mainPanel( width = 8,
                           fluidRow(
                             # style = "height:200px; background-color: light-gray;",
                             column(4, 
                                    h4("[RCP4.5 20]"),
                                    plotOutput("MR_Result1", height=270)
                             ),
                             column(4,
                                    h4("[RCP4.5 50]"),
                                    plotOutput("MR_Result2", height=270)
                             ),
                             column(4,
                                    h4("[RCP4.5 80]"),
                                    plotOutput("MR_Result3", height=270)
                             )
                           ),
                        hr(),
                           # style = "margin-top: 1px, margin-left: 1px",
                           fluidRow(
                             
                             column(4, 
                                    h4("[RCP4.5 20]"),
                                    leafletOutput("CD_Map1", height=300, width=280) %>% withSpinner()
                             ),
                             column(4,
                                    h4("[RCP4.5 50]"),
                                    leafletOutput("CD_Map2", height=300, width=280) %>% withSpinner()
                             ),
                             column(4,
                                    h4("[RCP4.5 80]"),
                                    leafletOutput("CD_Map3", height=300, width=280) %>% withSpinner()
                             )
                           )
                     )
                 )
            ),  

                      tabPanel("종합리포트", fluid = TRUE, icon = icon("folder-open"),
                               tags$hr(),
                               sidebarLayout(
                                 sidebarPanel(width=3,
                                              h3("종합 리포트"),
                                              hr(),
                                              # fileInput("myFile", "Choose a file", accept = c('image/png', 'image/jpeg')),
                                              # tags$hr(),
                                              print("<Current>"),
                                              tags$img(src = "test.jpg", width = ww, height = hh, alt = "This is alternate text")
                                              
                                 ),
                                 mainPanel(
                                   fluidRow(
                                     valueBox("KMA/KEI", "Model", icon = icon("thumbs-up"), color = "light-blue", width = 4),
                                     valueBox("RCP4.5/8.5", "Scenario", icon = icon("list"), color = "green", width = 4),
                                     valueBox("2030/50/80", "Years", icon = icon("calendar"), color = "yellow", width = 4)
                                   ),
                                   fluidRow(
                                     box(
                                       title = "[KMA - RCP4.5]", width = NULL, solidHeader = F, status = "info", collapsible = T,
                                       column(4, class = "text-center",
                                              print("<2020>"),
                                              tags$img(src = "test.jpg", width = ww, height = hh)
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
                                   ),
                                   fluidRow(
                                     box(
                                       title = "[KMA - RCP8.5]", width = NULL, solidHeader = F, status = "warning", collapsible = T,
                                       column(4, class = "text-center",
                                              print("<2020>"),
                                              tags$img(src = "test.jpg", width = ww, height = hh)
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
                                   ),
                                   fluidRow(
                                     box(
                                       title = "[KEI - RCP4.5]", width = NULL, solidHeader = F, status = "info", collapsible = T,
                                       column(4, class = "text-center",
                                              print("<2020>"),
                                              tags$img(src = "test.jpg", width = ww, height = hh)
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
                                   ),
                                   fluidRow(
                                     box(
                                       title = "[KEI - RCP8.5]", width = NULL, solidHeader = F, status = "warning", collapsible = T,
                                       column(4, class = "text-center",
                                              print("<2020>"),
                                              tags$img(src = "test.jpg", width = ww, height = hh)
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
                                   )
                                 )
                               )
                               
                               # tags$img(src = "yy.jpg")
                               # img(src="C:/MOTIVE_projects/proj30/img/test.jpg")
                               # imageOutput("image1", height=400)
                      ),
                       
                       tabPanel("취약성지수", fluid = TRUE, icon = icon("pie-chart"),
                                tags$hr(),
                                sidebarLayout(
                                  sidebarPanel(width=3,
                                               h3("확산범위별 취약성지수"),
                                               hr(),
                                               print("<Current>"),
                                               tags$img(src = "test.jpg", width = ww, height = hh, alt = "This is alternate text")
                                               # fluidRow(
                                               #   fileInput("myFile", "Choose a file", accept = c('image/png', 'image/jpeg'))
                                               # ),
                                               # selectInput("RP_Type1", "Type of Map1",
                                               #             choices = RP_Name_Type_list,
                                               #             selected = RP_Name_Type1_selected
                                               # ),
                                               # selectInput("RP_Type2", "Type of Map2",
                                               #             choices = RP_Name_Type_list,
                                               #             selected = RP_Name_Type2_selected
                                               # ),
                                               # selectInput("RP_Type3", "Type of Map3",
                                               #             choices = RP_Name_Type_list,
                                               #             selected = RP_Name_Type3_selected
                                               # )
                                  ),
                                  mainPanel(
                                    fluidRow(
                                      valueBox("KMA/KEI", "Model", icon = icon("thumbs-up"), color = "light-blue", width = 4),
                                      valueBox("RCP4.5/8.5", "Scenario", icon = icon("list"), color = "green", width = 4),
                                      valueBox("2030/50/80", "Years", icon = icon("calendar"), color = "yellow", width = 4)
                                      # valueBox("RCP4.5", "Scenario", icon = icon("list"), color = "green", width = 4),
                                      # valueBox("2030/50/80", "Model", icon = icon("calendar"), color = "yellow", width = 4)
                                    ),
                                    fluidRow(
                                      box(width=3, title="1km", solidHeader = TRUE, status = "info", class = "text-center"),
                                      box(width=3, title="5km", solidHeader = TRUE, status = "info"),
                                      box(width=3, title="10km", solidHeader = TRUE, status = "info"),
                                      box(width=3, title="Unlimited", solidHeader = TRUE, status = "info")
                                    ),
                                    # fluidRow(
                                    #   box(width=3, title="1km", solidHeader = TRUE, status = "info", class = "text-center"),
                                    #   box(width=3, title="5km", solidHeader = TRUE, status = "info"),
                                    #   box(width=3, title="10km", solidHeader = TRUE, status = "info"),
                                    #   box(width=3, title="Unlimited", solidHeader = TRUE, status = "info")
                                    # ),
                                    # fluidRow(
                                    #   infoBox("Distance", "1km", icon = icon("check"), color="aqua", width = 3),
                                    #   infoBox("Distance", "5km", icon = icon("check"), color="light-blue", width = 3),
                                    #   infoBox("Distance", "10km", icon = icon("check"), color="blue", width = 3),
                                    #   infoBox("Distance", "UnLimited", icon = icon("check"), color="purple", width = 3),
                                    # ),
                                    box(
                                      title = "[취약성 RCP4.5 2030]", width = NULL, solidHeader = F, status = "success", collapsible = T,
                                      column(3, class = "text-center",
                                             plotOutput("VH_45_30_01", height=250)
                                      ),
                                      column(3, class = "text-center",
                                             plotOutput("VH_45_30_05", height=250)
                                      ),
                                      column(3, class = "text-center",
                                             plotOutput("VH_45_30_10", height=250)
                                      ),
                                      column(3, class = "text-center",
                                             plotOutput("VH_45_30_UN", height=250)
                                      )
                                    ),
                                    box(
                                      title = "[취약성 RCP4.5 2050]", width = NULL, solidHeader = F, status = "primary", collapsible = T,
                                      column(3, class = "text-center",
                                             plotOutput("VH_45_50_01", height=250)
                                      ),
                                      column(3, class = "text-center",
                                             plotOutput("VH_45_50_05", height=250)
                                      ),
                                      column(3, class = "text-center",
                                             plotOutput("VH_45_50_10", height=250)
                                      ),
                                      column(3, class = "text-center",
                                             plotOutput("VH_45_50_UN", height=250)
                                      )
                                    ),
                                    box(
                                      title = "[취약성 RCP4.5 2080]", width = NULL, solidHeader = F, status = "warning", collapsible = T,
                                      column(3, class = "text-center",
                                             plotOutput("VH_45_80_01", height=250)
                                      ),
                                      column(3, class = "text-center",
                                             plotOutput("VH_45_80_05", height=250)
                                      ),
                                      column(3, class = "text-center",
                                             plotOutput("VH_45_80_10", height=250)
                                      ),
                                      column(3, class = "text-center",
                                             plotOutput("VH_45_80_UN", height=250)
                                      )
                                    )
                                  )
                                )
                       ),
                        tabPanel("서식지변동", fluid = TRUE, icon = icon("pie-chart"),
                                 tags$hr(),
                                 sidebarLayout(
                                   sidebarPanel(width=3,
                                                h3("연도별 서식지 변동"),
                                                hr(),
                                                # fluidRow( 
                                                #   fileInput("myFile", "Choose a file", accept = c('image/png', 'image/jpeg'))
                                                # ),
                                                selectInput("RP_Type1", "Type of Map1",
                                                            choices = RP_Name_Type_list,
                                                            selected = RP_Name_Type1_selected
                                                ),
                                                selectInput("RP_Type2", "Type of Map2",
                                                            choices = RP_Name_Type_list,
                                                            selected = RP_Name_Type2_selected
                                                ),
                                                selectInput("RP_Type3", "Type of Map3",
                                                            choices = RP_Name_Type_list,
                                                            selected = RP_Name_Type3_selected
                                                )
                                   ),
                                   mainPanel(
                                     fluidRow(
                                       valueBoxOutput("RP_Value_GN"),
                                       valueBoxOutput("RP_Value_ST"),
                                       valueBoxOutput("RP_Value_LS")
                                     ),
                                     uiOutput("MAP_2020"),
                                     uiOutput("MAP_2050"),
                                     uiOutput("MAP_2080")
                                   )
                                 )
                        ),
                       tabPanel("맞춤형 리포트", fluid = TRUE, icon = icon("table"),
                                tags$hr(),
                                sidebarLayout(
                                  sidebarPanel(width=3,
                                               h3("사용자 맞춤형 리포트"),
                                               hr(),
                                               print("<Current>"),
                                               tags$img(src = "test.jpg", width = ww, height = hh, alt = "This is alternate text")
                                  ),
                                  mainPanel(
                                    fluidRow(
                                      valueBoxOutput("RP_Value_CM"),
                                      valueBoxOutput("RP_Value_CS"),
                                      valueBoxOutput("RP_Value_YR")
                                    ),
                                    box(
                                      title = "[확산면적]", width = NULL, solidHeader = F, status = "success", collapsible = T,
                                      plotOutput("RP_SS_AO_IV_Plot", height=300)
                                    ),
                                    box(
                                      title = "[확산면적 비율]", width = NULL, solidHeader = F, status = "success", collapsible = T,
                                      plotOutput("RP_SS_AO_IV_Plot2", height=300)
                                    ),
                                    box(
                                      title = "[확산면적(Bar)]", width = NULL, solidHeader = F, status = "success", collapsible = T,
                                      plotOutput("RP_SS_AO_IV_Plot3", height=300)
                                    ),
                                    # plotOutput("RP_SS_AO_IV_Plot"),
                                    # plotOutput("RP_SS_AO_IV_Plot2"),
                                    DT::dataTableOutput("RP_SS_AO_IV_Table")
                                  )
                                )
                       ),
                       tabPanel("SUPPORT", fluid = TRUE,
                                tags$hr(),
                                sidebarPanel(width = 4,
                                             fluid = TRUE,
                                             shinyDirButton("CV_TIF_Folder", "변환할 TIF폴더", "TIF폴더 선택"),
                                             verbatimTextOutput("CV_TIF_Folder", placeholder = TRUE),
                                             tags$hr(),
                                             helpText("변환된 PNG 파일은 output 폴더(create & overwrite)에 저장됨"),
                                             uiOutput("CV_TIF_Time"),
                                             tags$hr(),
                                             actionButton("CV_TIF_run", label = "변환실행")  
                                             # 
                                             # uiOutput("VH_AO_SDM_model")
                                ),
                                mainPanel(
                                  fluidRow(
                                    # valueBoxOutput("Value_TM_DF"),
                                    # valueBoxOutput("Value_TM_AV")
                                  ),
                                  fluidRow(
                                    # valueBoxOutput("Value_TM_ES"),
                                    # valueBoxOutput("Value_TM_RM")
                                  )
                                )
                       ),
            #          )
            #          
            # ),
            #################
            
            
            tabPanel("HELP",
                     
            
            fluidRow(
              column(width = 4,
                     box(
                       title = "Box title", width = NULL, status = "primary",
                       "Box content"
                     ),
                     box(
                       title = "Title 1", width = NULL, solidHeader = TRUE, status = "primary",
                       "Box content"
                     ),
                     box(
                       width = NULL, background = "black",
                       "A box with a solid black background"
                     )
              ),
              
              column(width = 4,
                     box(
                       status = "warning", width = NULL,
                       "Box content"
                     ),
                     box(
                       title = "Title 3", width = NULL, solidHeader = TRUE, status = "warning",
                       "Box content"
                     ),
                     box(
                       title = "Title 5", width = NULL, background = "light-blue",
                       "A box with a solid light-blue background"
                     )
              ),
              
              column(width = 4,
                     box(
                       title = "Title 2", width = NULL, solidHeader = TRUE,
                       "Box content"
                     ),
                     box(
                       title = "Title 6", width = NULL, background = "maroon",
                       "A box with a solid maroon background"
                     )
              )
              
            )

            )
            
            
            ) # tabbox1
            ) # fluidRow
    
      ) # tab2
      ) # tabset
    
    ) # body
    
    
    
# <<<<<<< HEAD
    
  # )
# )
# =======
  ) # page
) # shiny UI
# >>>>>>> lx02jd2
