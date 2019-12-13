### test

library(shinythemes)
shinyUI(
  
  
  
  dashboardPage(
    skin = "green",
    dashboardHeader(title = "MOTIVE Ecosystem"),
    dashboardSidebar(),
    dashboardBody(
      
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
                
             '))),
      
      
      shinyjs::useShinyjs(),
      
      
      tags$script(HTML(
        
        'document.querySelector("body").classList.add("sidebar-collapse");'
        
        
      )),
      
      
      fluidPage( div(
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

                uiOutput('all_Tabs')         
                
      ),
      tags$hr(), # theme에 따라서 선이 보이지 않을 수 있음!!
      tags$footer("MOTIVE ECOSYSTEM(생태계 기후변화 영향 및 취약성평가모형)")
      
    )
    
  )
)