

### hs03 191024
#####=========================================================
##### installing and Loading packages ========================
# Setting packages and library
# packages <- c("shiny", "shinyWidgets", "shinyFiles", "shinyalert", "shinyjs", "tiff", "sf", "SDMTools", "proj4", "gdata", "colorspace", "plyr", "leaflet", "RColorBrewer", "scales", "lattice", "dplyr", "maps", "maptools",  "sp", "biomod2", "raster", "rgdal", "ggplot2", "hrbrthemes", "plotly", "grid", "reshape", "rgeos",  "stringr", "rgdal", "MigClim", "mgcv", "gsubfn", "DT", "fmsb", "data.table", "foreign",  "scales", "leaflet.minicharts", "manipulateWidget", "shinydashboard", "shinyBS", "shinycssloaders")
# libraries <- c("shiny", "shinyWidgets", "shinyFiles", "shinyalert", "shinyjs", "tiff", "sf", "SDMTools", "proj4", "gdata", "colorspace", "plyr", "leaflet", "RColorBrewer", "scales", "lattice", "dplyr", "maps", "maptools",  "sp", "biomod2", "raster", "rgdal", "ggplot2", "hrbrthemes", "plotly", "grid", "reshape", "rgeos",  "stringr", "rgdal", "MigClim", "mgcv", "gsubfn", "DT", "fmsb", "data.table", "foreign",  "scales", "leaflet.minicharts", "manipulateWidget", "shinydashboard", "shinyBS","shinycssloaders")



### HS Edition 19.10.24 / hs02
#####=========================================================
##### installing and Loading packages ========================
# Setting packages and library

packages <- c("shiny", "shinyWidgets", "shinyFiles", "shinyalert", "tiff", "sf", "SDMTools", "proj4", "gdata", "colorspace", "plyr", "leaflet", "RColorBrewer", "scales", "lattice", "dplyr", "maps", "sp", "biomod2", "raster", "rgdal", "ggplot2", "hrbrthemes", "plotly", "grid", "reshape", "stringr", "rgdal", "MigClim", "mgcv", "gsubfn", "DT", "fmsb", "data.table", "scales", "leaflet.minicharts", "manipulateWidget", "shinydashboard", "shinyBS", "shinycssloaders", "shinyjs", "RPostgreSQL")
libraries <- c("shiny", "shinyWidgets", "shinyFiles", "shinyalert", "tiff", "sf", "SDMTools", "proj4", "gdata", "colorspace", "plyr", "leaflet", "RColorBrewer", "scales", "lattice", "dplyr", "maps", "sp", "biomod2", "raster", "rgdal", "ggplot2", "hrbrthemes", "plotly", "grid", "reshape", "stringr", "rgdal", "MigClim", "mgcv", "gsubfn", "DT", "fmsb", "data.table", "scales", "leaflet.minicharts", "manipulateWidget", "shinydashboard", "shinyBS","shinycssloaders", "shinyjs", "RPostgreSQL")



# installing packages 
CHK_packages <- setdiff(packages, rownames(installed.packages()))
if (length(CHK_packages) > 0) {
  for (i in 1:length(CHK_packages)) {
    if (!require(CHK_packages[i],character.only = TRUE)) {
      install.packages(CHK_packages[i], repos = "http://cran.us.r-project.org/")
      if (!require(CHK_packages[i],character.only = TRUE)) {
        stop("Package not found")
      }
    }
  }
}

# loading packages
CHK_libraries <- setdiff(libraries, rownames(library()))
if (length(CHK_libraries) > 0) {
  for (i in 1:length(CHK_libraries)) {
    if (!require(CHK_libraries[i],character.only = TRUE)) {
      library(CHK_libraries[i])
      if (!require(CHK_libraries[i],character.only = TRUE)) {
        stop("Library not found")
      }
    }
  }
}
##### End installing and loading packages ====================
#####=========================================================

if(Sys.info()['sysname'] == "Windows"){
  setwd("C:/MOTIVE_Ecosystem/R/Programs/ecosystem")
  
}else if(Sys.info()['sysname'] == "Linux"){
  setwd("/srv/shiny-server/ecosystem")
}
  

rm(list = ls())




color_Picker <- c("black","lightgray","gray","white","cadetblue","pink","darkpurple","purple","lightblue","darkblue","blue","lightgreen","darkgreen","green","beige","orange","lightred","darkred","red")

# 타입별 마커 색상
# color_Picker_Type <- c("lightgray","cadetblue","lightblue","darkblue","blue","green","beige","orange","lightred","darkred","red")
color_Picker_Type <- c("green", "darkgreen", "lightgreen", "beige", "purple", "blue", "red", "lightgray", "orange")

# 종별 아이콘 
icon_List_Type <- c('cog', 'heart', 'star', 'flag', 'home', 'plus-sign', 'leaf', 'grain', 'remove-circle', 'asterisk', 'plus', 'remove')


temp_colors <- c()
is_init_colors <- F

temp_colors_type <- c()
is_init_colors_type <- F

test_groups <- c()
GroupLayer_Species_Individual <- c()

temp_icons <- c()
is_init_icons <- F

####################################################################################################
# 랜덤 레이어
####################################################################################################
# makeGroupLayer <- function(species_data, s_icon, g_color){
#   K_NAME <- species_data$K_NAME
#   u_g_color <- unique(g_color)
#   lv_k_name <- levels(factor(K_NAME))
#   for(name in lv_k_name) {
#     rows <- subset(species_data, K_NAME == name)
#     result <- temp_colors_type[[unique(rows$TYPE)]]
#     x <- paste0("<div style='position: relative; display: inline-block' class='awesome-marker-icon-",result," awesome-marker'><i class='glyphicon glyphicon-",s_icon," icon-black '></i></div>",name)
#     test_groups <<- append(test_groups, x)
#   }
# }
####################################################################################################


####################################################################################################
makeGroupLayer_Species <- function(species_data, k_name){
  
  # print('makeGroupLayer_Species')
  
  # print('k_name')
  # print(k_name)
  
  k_name <- unique(k_name)
  f_k_name <- factor(k_name)
  l_f_k_name <- levels(factor(k_name))
  
  # print('f_k_name')
  # print(f_k_name)
  
  # print('k_name')
  # print(k_name)
  
  # print('l_f_k_name')
  # print(l_f_k_name)
  
  # print('start for')
  
  for(name in l_f_k_name) {

    rows <- subset(species_data, K_NAME == name)
    result <- temp_colors_type[[unique(rows$TYPE)]]
    # result <- temp_colors_type[unique(rows$TYPE)]
    
    # print('unique(rows$TYPE)')
    # print(unique(rows$TYPE))
    
    # print('result')
    # print(result)
    
    x <- paste0("<div style='position: relative; display: inline-block' class='awesome-marker-icon-",result," awesome-marker'><i class='glyphicon glyphicon-",temp_icons[[name]]," icon-black '></i></div>",name)
    test_groups <<- c(test_groups, x)

  }
  
  # print('temp_colors_type')
  # print(temp_colors_type)
  
  # print('end for')
  
  # print('test_groups')
  # print(test_groups)
}


makeGroupLayer_Species_Individual <- function(species_data, k_name){
  
  print('species_data')
  print(species_data)
  
  
  k_name <- unique(k_name)
  f_k_name <- factor(k_name)
  l_f_k_name <- levels(factor(k_name))
  temp_groups <- c()
  
  print('k_name')
  print(k_name)
  
  print('f_k_name')
  print(f_k_name)
  
  print('l_f_k_name')
  print(l_f_k_name)
  
  for(name in l_f_k_name) {
    
    rows <- subset(species_data, K_NAME == name)
    result <- temp_colors_type[[unique(rows$TYPE)]]
    
    x <- paste0("<div style='position: relative; display: inline-block' class='awesome-marker-icon-",result," awesome-marker'><i class='glyphicon glyphicon-",temp_icons[[name]]," icon-black '></i></div>",name)
    temp_groups <- c(temp_groups, x)
    
  }
  return (temp_groups)
}



####################################################################################################

####################################################################################################
# 테이블 선택 시 종별 맵 마커 색상
####################################################################################################
init_colors <- function(species_id) {
  dv <- length(species_id) / length(color_Picker)
  
  # for(i in 1:length(dv))
  i <- 1
  while(i <= dv + 1) {
    temp_colors <<- append(temp_colors, color_Picker)
    i <- i + 1
  }
  
  names(temp_colors) <<- species_id
  is_init_colors <<- T
  
  
}

customGetColor <- function(species_data) {
  tapp <- tapply(species_data$ID, species_data$ID, function(val){
    val
  })
  temp_Vector <- c()
  i <- 1
  while( i <= length(tapp) ) {
    j <- 1
    while( j <= length(tapp[[i]]) ) {
      if( tapp[[i]][j] == names(tapp[i]) ) {
        temp_Vector <- append(temp_Vector, temp_colors[[names(tapp[i])]] )
        j <- j+1
      }
    }
    i <- i+1
  }
  return (temp_Vector)
}

####################################################################################################
# 종별 아이콘 초기화
####################################################################################################
init_icons <- function(k_name) {
  
  # print('k_name')
  # print(k_name)
  

  if(length(k_name) < length(icon_List_Type)) {
    i <- 1  
    while( i <= length(k_name) ) {
      temp_icons[i] <<- icon_List_Type[i]
      i <- i+1
    }
  } else {
    dv <- length(k_name) / length(icon_List_Type)
    i <- 1
    while(i <= dv + 1) {
      temp_icons <<- append(temp_icons, icon_List_Type)
      i <- i + 1
    }
  }
  names(temp_icons) <<- k_name
  is_init_icons <<- T
  
  # print('temp_icons')
  # print(temp_icons)
  
}

customGetIcon <- function(k_name) {
  # print('k_name')
  # print(k_name)
  temp_Vector <- c()
  u_k_name <- unique(k_name)
  # print('u_k_name')
  # print(u_k_name)
  # l_k_name <- levels(factor(k_name))
  # l_k_name_2 <- levels(factor(k_name, ordered = T))
  
  
  for(uname in u_k_name) {
    for(name in k_name) {
      if(uname == name){
        temp_Vector <- append(temp_Vector, temp_icons[[name]] )
      }
    }
  }
  
  # tapp <- tapply(k_name, k_name, function(val){
  #   val
  # })
  # print('tapp')
  # print(tapp)
  # temp_Vector <- c()
  # i <- 1
  # while( i <= length(tapp) ) {
  #   j <- 1
  #   while( j <= length(tapp[[i]]) ) {
  #     if( tapp[[i]][j] == names(tapp[i]) ) {
  #       temp_Vector <- append(temp_Vector, temp_icons[[names(tapp[i])]] )
  #       j <- j+1
  #     }
  #   }
  #   i <- i+1
  # }
  # print('temp_Vector')
  # print(temp_Vector)
  return (temp_Vector)
}
####################################################################################################


####################################################################################################
# 테이블 선택 시 타입별 맵 마커 색상
####################################################################################################
init_colors_type <- function(species_all_data) {
  type_names <- unique(species_all_data$TYPE)
  type_names <- levels(droplevels(type_names))
  if(length(type_names) < length(color_Picker_Type)) {
    i <- 1  
    while( i <= length(type_names) ) {
      temp_colors_type[i] <<- color_Picker_Type[i]
      i <- i+1
    }
  } else {
    dv <- length(type_names) / length(color_Picker_Type)
    i <- 1
    while(i <= dv + 1) {
      temp_colors_type <<- append(temp_colors_type, color_Picker_Type)
      i <- i + 1
    }
  }
  names(temp_colors_type) <<- type_names
  is_init_colors_type <<- T
}

customGetColor_Type <- function(species_data) {
  tapp <- tapply(drop.levels(species_data$TYPE), species_data$ID, function(val){val})
  tapp <- unlist(tapp, use.names=FALSE)
  temp <- c()
  for(val in tapp){temp <- append(temp, temp_colors_type[[val]])}
  temp
}
####################################################################################################

init_colors_type_02 <- function(species_all_data) {
  type_names <- unique(species_all_data$TYPE)
  # print('type_names')
  # print(type_names)
  if(length(type_names) < length(color_Picker_Type)) {
    i <- 1  
    while( i <= length(type_names) ) {
      temp_colors_type[i] <<- color_Picker_Type[i]
      i <- i+1
    }
  } else {
    dv <- length(type_names) / length(color_Picker_Type)
    i <- 1
    while(i <= dv) {
      temp_colors_type <<- append(temp_colors_type, color_Picker_Type)
      i <- i + 1
    }
  }
  names(temp_colors_type) <<- type_names
  is_init_colors_type <<- T
}


customGetColor_Type_02 <- function(species_data) {
  temp <- c()
  # print('customGetColor_Type_02')
  
  for(val in species_data$TYPE){
    # print('species_data$TYPE val')
    # print(val)
    # print('temp_colors_type[[val]]')
    # print(temp_colors_type[[val]])
    temp <- append(temp, temp_colors_type[[val]])
  }
  # print('temp')
  # print(temp)
  temp
}

customGetColor_Type_Individual_02 <- function(species_data) {
  temp <- c()
  # print('customGetColor_Type_02')
  
  for(val in species_data$TYPE){
    # print('species_data$TYPE val')
    # print(val)
    # print('temp_colors_type[[val]]')
    # print(temp_colors_type[[val]])
    temp <- append(temp, temp_colors_type[[val]])
  }
  # print('temp')
  # print(temp)
  temp
}
####################################################################################################

# PostgreSQL 연결
psql <- dbDriver("PostgreSQL")
pgConn <- function(query) {
  pcon <- dbConnect(psql, dbname = "ecosystem", host = "192.168.0.199", port = "5432", user= "postgres", password = "postgres")
  dbUser <- query(pcon)
  dbDisconnect(pcon)
  return (dbUser)
}

HELP_TEST_desc01 <- pgConn(function(con){
  return ( dbGetQuery(con, paste0("select * from help_test")) )
})




#Select language
lang_selection <- F




##### Path
# G <- reactiveValues()
# G$SE_Dir_Project <- "/home/admin/R/Ecosystem_Data_191106/MOTIVE_projects/proj1"
# G$SE_Dir_Climate <- "/home/admin/R/Ecosystem_Data_191106/MOTIVE_Ecosystem/DATA/Climate2"
# G$SE_Dir_Link <- "/home/admin/R/Ecosystem_Data_191106/MOTIVE_Ecosystem/DATA/Link" 
# G$SE_Dir_Species <- "/home/admin/R/Ecosystem_Data_191106/MOTIVE_Ecosystem/DATA/Species"
# G$SE_Dir_Admin <- "/home/admin/R/Ecosystem_Data_191106/MOTIVE_Ecosystem/DATA/Admin"
# G$SE_speciesindex <- "speciesname_final.csv"
# G$SE_specieslocation <- "shin_specieslocation.csv"
# G_FILE_speciesindex <- read.csv(file.path(isolate(G$SE_Dir_Species), isolate(G$SE_speciesindex)), header = T, sep = "," , fileEncoding = "CP949", encoding = "UTF-8")
# G_FILE_specieslocation <- read.csv(file.path(isolate(G$SE_Dir_Species), isolate(G$SE_specieslocation)), header = T, sep = "," , fileEncoding = "CP949", encoding = "UTF-8")
# G_FILE_speciesfreq <- count(G_FILE_specieslocation, ID)
# G_FILE_speciesinfo <- inner_join(G_FILE_speciesfreq, G_FILE_speciesindex, by = "ID")
# Temp_G_FILE_speciesinfo <- G_FILE_speciesinfo


### 시작 윈도우, 리눅스 경로 ###

G <- reactiveValues()

G$SE_Dir_Project <- NULL
G$SE_Dir_Climate <- NULL
G$SE_Dir_Link <- NULL
G$SE_Dir_Species <- NULL
G$SE_Dir_Admin <- NULL
G$SE_speciesindex <- "speciesname_final.csv"
G$SE_specieslocation <- "shin_specieslocation.csv"

G_FILE_speciesindex <- NULL
G_FILE_specieslocation <- NULL
G_FILE_speciesindex_02 <- NULL
G_FILE_specieslocation_02 <- NULL

G_dir_path <- NULL
S251_path <- NULL
sensitive_species_57 <- NULL
G_2019_DATA_graph <- NULL


if( Sys.info()['sysname'] == "Windows" ) {
  # print(Sys.info()['sysname'])
  ##### Path
  G[['SE_Dir_Project']] <- "C:/MOTIVE_projects/proj1"
  G[['SE_Dir_Climate']] <- "C:/MOTIVE_Ecosystem/DATA/Climate2"
  G[['SE_Dir_Link']] <- "C:/MOTIVE_Ecosystem/DATA/Link" 
  G[['SE_Dir_Species']] <- "C:/MOTIVE_Ecosystem/DATA/Species"
  G[['SE_Dir_Admin']] <- "C:/MOTIVE_Ecosystem/DATA/Admin"
  
  G_FILE_speciesindex <- read.csv(file.path(isolate(G[['SE_Dir_Species']]), isolate(G[['SE_speciesindex']])), header = T, sep = ",", stringsAsFactors = F)
  G_FILE_specieslocation <- read.csv(file.path(isolate(G[['SE_Dir_Species']]), isolate(G[['SE_specieslocation']])), header = T, sep = ",", stringsAsFactors = F)
  
  G_FILE_speciesindex_02 <- read.csv(file.path(isolate(G[['SE_Dir_Species']]), isolate(G[['SE_speciesindex']])), header = T, sep = ",", stringsAsFactors = F)
  G_FILE_specieslocation_02 <- read.csv(file.path(isolate(G[['SE_Dir_Species']]), isolate(G[['SE_specieslocation']])), header = T, sep = ",", stringsAsFactors = F)
  
  G_dir_path <- "C:/MOTIVE_projects/proj1/Invasive_Species/test3"
  S251_path <- "C:/Projects/2019_DATA/4. forest fire, landslide/forest fire/S251"
  sensitive_species_57 <- "C:/Projects/2019_DATA/1. unlimited dispersal/1. 민감종 57종"
  G_2019_DATA_graph <- "C:/Projects/2019_DATA/3. graph"
 
} else if ( Sys.info()['sysname'] == "Linux" ) {
  # print(Sys.info()['sysname'])
  ##### Path
  G[['SE_Dir_Project']] <- "/home/admin/R/Ecosystem_Data_191106/MOTIVE_projects/proj1"
  G[['SE_Dir_Climate']] <- "/home/admin/R/Ecosystem_Data_191106/MOTIVE_Ecosystem/DATA/Climate2"
  G[['SE_Dir_Link']] <- "/home/admin/R/Ecosystem_Data_191106/MOTIVE_Ecosystem/DATA/Link" 
  G[['SE_Dir_Species']] <- "/home/admin/R/Ecosystem_Data_191106/MOTIVE_Ecosystem/DATA/Species"
  G[['SE_Dir_Admin']] <- "/home/admin/R/Ecosystem_Data_191106/MOTIVE_Ecosystem/DATA/Admin"
  
  G_FILE_speciesindex <- read.csv(file.path(isolate(G[['SE_Dir_Species']]), isolate(G[['SE_speciesindex']])), header = T, sep = ",", stringsAsFactors = F , fileEncoding = "CP949", encoding = "UTF-8")
  G_FILE_specieslocation <- read.csv(file.path(isolate(G[['SE_Dir_Species']]), isolate(G[['SE_specieslocation']])), header = T, sep = ",", stringsAsFactors = F , fileEncoding = "CP949", encoding = "UTF-8")
  
  G_FILE_speciesindex_02 <- read.csv(file.path(isolate(G[['SE_Dir_Species']]), isolate(G[['SE_speciesindex']])), header = T, sep = ",", stringsAsFactors = F , fileEncoding = "CP949", encoding = "UTF-8")
  G_FILE_specieslocation_02 <- read.csv(file.path(isolate(G[['SE_Dir_Species']]), isolate(G[['SE_specieslocation']])), header = T, sep = ",", stringsAsFactors = F , fileEncoding = "CP949", encoding = "UTF-8")
  
  G_dir_path <- "/home/admin/R/Ecosystem_Data_191106/MOTIVE_projects/proj1/Invasive_Species/test3"
  S251_path <-"/home/admin/R/Ecosystem_Data_191106/Projects/2019_DATA/4. forest fire, landslide/forest fire/S251"
  sensitive_species_57 <- "/home/admin/R/Ecosystem_Data_191106/Projects/2019_DATA/1. unlimited dispersal/1. 민감종 57종"
  G_2019_DATA_graph <- "/home/admin/R/Ecosystem_Data_191106/Projects/2019_DATA/3. graph"
  
}


G_FILE_speciesfreq <- count(G_FILE_specieslocation, ID)
G_FILE_speciesinfo <- inner_join(G_FILE_speciesfreq, G_FILE_speciesindex, by = "ID")
Temp_G_FILE_speciesinfo <- G_FILE_speciesinfo



## HS
G_FILE_speciesfreq_02 <- count(G_FILE_specieslocation_02, ID)
G_FILE_speciesinfo_02 <- inner_join(G_FILE_speciesfreq_02, G_FILE_speciesindex_02, by = "ID")
Temp_G_FILE_speciesinfo_02 <- G_FILE_speciesinfo_02
Temp_G_FILE_specieslocation_02 <- G_FILE_specieslocation_02
SP_LOC_Info_Table <- NULL

ut <- unique(G_FILE_speciesinfo_02$TYPE)
ut <- c(ut[1],ut[2],ut[3],ut[8],ut[7],ut[1],ut[6],ut[5],ut[4],ut[9]) 



## HS
# G_FILE_speciesindex_02 <- read.csv(file.path(isolate(G$SE_Dir_Species), isolate(G$SE_speciesindex)), header = T, sep = ",", stringsAsFactors = F, fileEncoding = "CP949", encoding = "UTF-8")
# G_FILE_specieslocation_02 <- read.csv(file.path(isolate(G$SE_Dir_Species), isolate(G$SE_specieslocation)), header = T, sep = ",", stringsAsFactors = F, fileEncoding = "CP949", encoding = "UTF-8")
# G_FILE_speciesfreq_02 <- count(G_FILE_specieslocation_02, ID)
# G_FILE_speciesinfo_02 <- inner_join(G_FILE_speciesfreq_02, G_FILE_speciesindex_02, by = "ID")
# Temp_G_FILE_speciesinfo_02 <- G_FILE_speciesinfo_02


### 끝 윈도우, 리눅스 경로 ###


# G_Institute_Choice <- c()
# for(inst in unique(G_FILE_speciesinfo_02$INSTITUTE)) {
#   G_Institute_Choice[[inst]] <- HTML("<div style=\"width:10px; height: 10px; background-color:red;\"></div>")
# }
# 
# print('unique(G_FILE_speciesinfo_02$TYPE)')
# print(unique(G_FILE_speciesinfo_02$TYPE))
# 
# print('color_Picker_Type')
# print(color_Picker_Type)
# 
# 
# 
# el <- div(HTML("I like <u>turtles</u>"))
# 
# G_Institute_Choice <- div(style = "width: 10px; height: 10px; background-color:red;")
# G_Institute_Choice <- div(tags$span('1'), div(style="display: inline-block; width: 10px; height: 10px; background-color:red;"))
# 
# 
# 
# G_Institute_Choice <- list()
# for (o in unique(G_FILE_speciesinfo_02$TYPE)) {
#   G_Institute_Choice[[length(G_Institute_Choice)+1]] <- div(tags$span(o), div(style="display: inline-block; width: 10px; height: 10px; background-color:red;"))
# }






G$IS_VA_Dir_Folder <- paste(isolate(G$SE_Dir_Project), "/Invasive_Species", sep = "")
G$IS_AO_Dir_Folder <- paste(isolate(G$SE_Dir_Project), "/Invasive_Species", sep = "")

Input_img <- "tif"  #asc",
Output_img <- "tif"



CD_Scenarios_list <- c("RCP 4.5" = "RCP4.5",
                       "RCP 8.5" = "RCP8.5")
CD_Year_list <- c("2000" = "2000",
                  "2010" = "2010",
                  "2020" = "2020",
                  "2030" = "2030",
                  "2040" = "2040",
                  "2050" = "2050",
                  "2060" = "2060",
                  "2070" = "2070",
                  "2080" = "2080")
SDM_models_list <- c("GLM (Generalized Linear Model)" = "GLM",
                     "GAM (Generalized Additive Model)" = "GAM",
                     "GBM (Generalized Boosting Model)" = "GBM",
                     "CTA (Classification Tree Analysis)" = "CTA",
                     "ANN (Artificial Neural Network)" = "ANN",
                     "SRE (Surface Range Envelop)" = "SRE",
                     "FDA (Flexible Discriminant Analysis)" = "FDA",
                     "MARS (Multiple Adaptive Regression Splines)" = "MARS",
                     "RF (Random Forest)" = "RF",
                     "MAXENT.Phillips" = "MAXENT.Phillips")
#                    "MAXENT (low-memory multinomial logistic regression)" = "MAXENT")
SDM_models_out_list <- c("GLM (Generalized Linear Model)" = "GLM",
                         "GAM (Generalized Additive Model)" = "GAM",
                         "GBM (Generalized Boosting Model)" = "GBM",
                         "CTA (Classification Tree Analysis)" = "CTA",
                         "ANN (Artificial Neural Network)" = "ANN",
                         "SRE (Surface Range Envelop)" = "SRE",
                         "FDA (Flexible Discriminant Analysis)" = "FDA",
                         "MARS (Multiple Adaptive Regression Splines)" = "MARS",
                         "RF (Random Forest)" = "RF",
                         "MAXENT.Phillips" = "MAXENT.Phillips",
                         #                  	     "MAXENT (low-memory multinomial logistic regression)" = "MAXENT",
                         "Ensemble" = "EM")
DM_Models_list <- c("No Dispersal" = "ND",
                    "SDD (Short Dispersal Distance)" = "SDD",
                    "MDD (Middle Dispersal Distance)" = "MDD",
                    "LDD (Long Dispersal Distance)" = "LDD",
                    "Unlimited Dispersal" = "UD")

ST_Name <- "success"


##### Language
SE_Language = "Korean"





   
   if (SE_Language == "English") {
     System_Name <- "Climate Change Impact and Vulnerability Assessment Model for Ecosystem)"
     OV_Name <- "Overview"
     
     LD_Variables_list  <- c("Landuse" = "landuse",
                             "Forest fire" = "forestfire",
                             "Landslide" = "landslide")  
     CD_Variables_list <- c("BIOCLIM 01 (Annual Mean Temperature)" = "bio01",
                            "BIOCLIM 02 (Mean Diurnal Range (Mean of monthly (max temp - min temp)))" = "bio02",
                            "BIOCLIM 03 (Isothermality (BIO2/BIO7) (* 100))" = "bio03",
                            "BIOCLIM 04 (Temperature Seasonality (standard deviation *100))" = "bio04",
                            "BIOCLIM 05 (Max Temperature of Warmest Month)" = "bio05",
                            "BIOCLIM 06 (Min Temperature of Coldest Month)" = "bio06",
                            "BIOCLIM 07 (Temperature Annual Range (BIO5-BIO6))" = "bio07",
                            "BIOCLIM 08 (Mean Temperature of Wettest Quarter)" = "bio08",
                            "BIOCLIM 09 (Mean Temperature of Driest Quarter)" = "bio09",
                            "BIOCLIM 10 (Mean Temperature of Warmest Quarter)" = "bio10",
                            "BIOCLIM 11 (Mean Temperature of Coldest Quarter)" = "bio11",
                            "BIOCLIM 12 (Annual Precipitation)" = "bio12",
                            "BIOCLIM 13 (Precipitation of Wettest Month)" = "bio13",
                            "BIOCLIM 14 (Precipitation of Driest Month)" = "bio14",
                            "BIOCLIM 15 (Precipitation Seasonality (Coefficient of Variation))" = "bio15",
                            "BIOCLIM 16 (Precipitation of Wettest Quarter)" = "bio16",
                            "BIOCLIM 17 (Precipitation of Driest Quarter)" = "bio17",
                            "BIOCLIM 18 (Precipitation of Warmest Quarter)" = "bio18",
                            "BIOCLIM 19 (Precipitation of Coldest Quarter)" = "bio19") 
     SDM_Variables_list <- c("BIOCLIM 01 (Annual Mean Temperature)" = paste("bio01.", Input_img, sep = ""),
                             "BIOCLIM 02 (Mean Diurnal Range (Mean of monthly (max temp - min temp)))" = paste("bio02.", Input_img, sep = ""),
                             "BIOCLIM 03 (Isothermality (BIO2/BIO7) (* 100))" = paste("bio03.", Input_img, sep = ""),
                             "BIOCLIM 04 (Temperature Seasonality (standard deviation *100))" = paste("bio04.", Input_img, sep = ""),
                             "BIOCLIM 05 (Max Temperature of Warmest Month)" = paste("bio05.", Input_img, sep = ""),
                             "BIOCLIM 06 (Min Temperature of Coldest Month)" = paste("bio06.", Input_img, sep = ""),
                             "BIOCLIM 07 (Temperature Annual Range (BIO5-BIO6))" = paste("bio07.", Input_img, sep = ""),
                             "BIOCLIM 08 (Mean Temperature of Wettest Quarter)" = paste("bio08.", Input_img, sep = ""),
                             "BIOCLIM 09 (Mean Temperature of Driest Quarter)" = paste("bio09.", Input_img, sep = ""),
                             "BIOCLIM 10 (Mean Temperature of Warmest Quarter)" = paste("bio10.", Input_img, sep = ""),
                             "BIOCLIM 11 (Mean Temperature of Coldest Quarter)" = paste("bio11.", Input_img, sep = ""),
                             "BIOCLIM 12 (Annual Precipitation)" = paste("bio12.", Input_img, sep = ""),
                             "BIOCLIM 13 (Precipitation of Wettest Month)" = paste("bio13.", Input_img, sep = ""),
                             "BIOCLIM 14 (Precipitation of Driest Month)" = paste("bio14.", Input_img, sep = ""),
                             "BIOCLIM 15 (Precipitation Seasonality (Coefficient of Variation))" = paste("bio15.", Input_img, sep = ""),
                             "BIOCLIM 16 (Precipitation of Wettest Quarter)" = paste("bio16.", Input_img, sep = ""),
                             "BIOCLIM 17 (Precipitation of Driest Quarter)" = paste("bio17.", Input_img, sep = ""),
                             "BIOCLIM 18 (Precipitation of Warmest Quarter)" = paste("bio18.", Input_img, sep = ""),
                             "BIOCLIM 19 (Precipitation of Coldest Quarter)" = paste("bio19.", Input_img, sep = ""))
     CD_Models_list <- c("KMA (Korea Meteorological Administration)" = "KMA",
                         "KEI (Korea Environment Institute)" = "KEI")  
     SE_Name_System <- "MOTIVE ECOSYSTEM (Climate Change Impact and Vulnerability Assessment Model for Ecosystem)" 
     SE_Name <- "Setting"
     SE_Name_Language <- "Language"
     SE_Name_WE <- "Working Environment"
     SE_Name_WE_Project <- "Working Project"
     SE_Name_DE <- "Data Environment"
     SE_Name_DE_Climate <- "Climate Data Path"
     SE_Name_DE_Link <- "Link Data Path"
     SE_Name_DE_Species <- "Species Data Path"
     SE_Name_DE_Species_Index <- "Select species index data (CSV file)"
     SE_Name_DE_Species_Location <- "Select species location data (CSV file)"
     SP_Name <- "Species Data"
     SP_Name_Info <- "Species Information"
     SP_Name_Location <- "Species Location"
     LD_Name <- "Link Data"
     LD_Name_Map <- "Map"
     LD_Name_Summary <- "Summary"
     LD_Name_Variables <- "Link Data"
     LD_Name_Variables_list <- LD_Variables_list
     LD_Name_Variables_selected <- "forestfire"
     LD_Name_Models <- "Climate Models"
     LD_Name_Models_list <- CD_Models_list
     LD_Name_Models_selected <- "KMA"    
     LD_Name_Scenarios <- "Climate Scenarios"
     LD_Name_Scenarios_list <- CD_Scenarios_list
     LD_Name_Scenarios_selected <- "RCP4.5"    
     LD_Name_Year <- "Projecting Years"
     LD_Name_Year_list <- CD_Year_list
     LD_Name_Year_selected <- "2000"       
     CD_Name <- "Climate Data"
     CD_Name_Map <- "Map"
     CD_Name_Summary <- "Summary"
     CD_Name_Variables <- "Climate Variables"
     CD_Name_Variables_list <- CD_Variables_list
     CD_Name_Variables_selected <- "bio01"
     CD_Name_Models <- "Climate Models"
     CD_Name_Models_list <- CD_Models_list
     CD_Name_Models_selected <- "KMA"    
     CD_Name_Scenarios <- "Climate Scenarios"
     CD_Name_Scenarios_list <- CD_Scenarios_list
     CD_Name_Scenarios_selected <- "RCP4.5"    
     CD_Name_Year <- "Projecting Years"
     CD_Name_Year_list <- CD_Year_list
     CD_Name_Year_selected <- "2000"     
     SDM_Name <- "Species Distribution Model"
     SDM_Name_Model <- "Modeling"
     SDM_Name_Model_Species <- "Species selection"
     SDM_Name_Model_Projection <- "Projection selection"
     SDM_Name_Model_Variable <- "Variable selection"
     SDM_Name_Model_SDM <- "SDM selection"
     SDM_Name_Model_Out <- "Modeling Outputs"
     SDM_Name_Model_Out_Validation <- "Validation"
     SDM_Name_Model_Out_Contribution <- "Contribution"
     SDM_Name_Model_Out_Probability <- "Probability Map"
     SDM_Name_Model_Out_Prediction <- "Predicted Map"
     SDM_Name_CD_Variables <- "Climate Variables"
     SDM_Name_CD_Variables_list <- SDM_Variables_list
     SDM_Name_CD_Variables_selected <- c(paste("bio01.", Input_img, sep = ""), paste("bio02.", Input_img, sep = ""), paste("bio03.", Input_img, sep = ""), paste("bio12.", Input_img, sep = ""), paste("bio13.", Input_img, sep = ""), paste("bio14.", Input_img, sep = ""))
     SDM_Name_CD_Models <- "Climate Models"
     SDM_Name_CD_Models_list <- CD_Models_list
     SDM_Name_CD_Models_selected <- "KMA"    
     SDM_Name_CD_Scenarios <- "Climate Scenarios"
     SDM_Name_CD_Scenarios_list <- CD_Scenarios_list
     SDM_Name_CD_Scenarios_selected <- "RCP4.5"    
     SDM_Name_CD_Year <- "Projecting Years"
     SDM_Name_CD_Year_list <- CD_Year_list
     SDM_Name_CD_Year_selected <- "2000"
     SDM_Name_models <- "Model types"
     SDM_Name_models_list <- SDM_models_list
     SDM_Name_models_selected <- "GLM"
     SDM_Name_EMmodels <- "Ensemble"
     SDM_Name_models_run <- "Run"
     SDM_Name_models_out <- "Model types"
     SDM_Name_models_out_list <- SDM_models_out_list
     SDM_Name_models_out_selected <- "GLM"
     SDM_Name_CD_Models_out <- "Climate Models"
     SDM_Name_CD_Models_out_list <- CD_Models_list
     SDM_Name_CD_Models_out_selected <- "KMA"    
     SDM_Name_CD_Scenarios_out <- "Climate Scenarios"
     SDM_Name_CD_Scenarios_out_list <- CD_Scenarios_list
     SDM_Name_CD_Scenarios_out_selected <- "RCP4.5"    
     SDM_Name_CD_Year_out <- "Projecting Years"
     SDM_Name_CD_Year_out_list <- CD_Year_list
     SDM_Name_CD_Year_out_selected <- "2000"
     DM_Name <- "Dispesal Model"
     DM_Name_Model <- "Modeling"
     DM_Name_Model_Out <- "Model Outputs"
     DM_Name_Out_Plot <- "Species Distribution Change Plot"
     DM_Name_DM_MO_Barriers <- "Barriers"
     DM_Name_DM_MO_Barriers_list <- LD_Variables_list
     DM_Name_DM_MO_Barriers_selected <- "landuse" 
     DM_Name_DM_MO_Slider <- "Select a dispersal distance"
     DM_Name_DM_MO_Action <- "Run"
     DM_Name_DM_Models <- "DIspersal Models"
     DM_Name_DM_Models_list <- DM_Models_list
     DM_Name_DM_Models_selected <- "UD" 
     DM_Name_CD_Models <- "Climate Models"
     DM_Name_CD_Models_list <- CD_Models_list
     DM_Name_CD_Models_selected <- "KMA"    
     DM_Name_CD_Scenarios <- "Climate Scenarios"
     DM_Name_CD_Scenarios_list <- CD_Scenarios_list
     DM_Name_CD_Scenarios_selected <- "RCP4.5"    
     DM_Name_CD_Year <- "Projecting Years"
     DM_Name_CD_Year_list <- CD_Year_list
     DM_Name_CD_Year_selected <- "2000"
     DM_Name_models <- "Model types"
     DM_Name_models_list <- SDM_models_list
     DM_Name_models_selected <- "GLM"
     DM_Name_EMmodels <- "Ensemble"
     DM_Name_models_run <- "Run"
     DM_Name_models_out <- "Model types"
     DM_Name_models_out_list <- SDM_models_out_list
     DM_Name_models_out_selected <- "GLM"
     DM_Name_CD_Models_out <- "Climate Models"
     DM_Name_CD_Models_out_list <- CD_Models_list
     DM_Name_CD_Models_out_selected <- "KMA"    
     DM_Name_CD_Scenarios_out <- "Climate Scenarios"
     DM_Name_CD_Scenarios_out_list <- CD_Scenarios_list
     DM_Name_CD_Scenarios_out_selected <- "RCP4.5"    
     DM_Name_CD_Year_out <- "Projecting Years"
     DM_Name_CD_Year_out_list <- CD_Year_list
     DM_Name_CD_Year_out_selected <- "2000"
     SS_Name <- "Climate Sensitive Species"
     SS_Name_Analysis <- "Change Analysis"
     SS_Name_Out <- "Analysis Outputs"
     SS_Name_Out_ChangePlot <- "Species Distribution Change Plot"
     SS_Name_Out_Pattern <- "Vulnerability Pattern"
     SS_Name_Out_Vulnerabiity <- "Vulnerable Priority"
     SS_Name_DM_Models <- "DIspersal Types"
     SS_Name_DM_Models_list <- DM_Models_list
     SS_Name_DM_Models_selected <- "UD"    
     SS_Name_CD_Models <- "Climate Models"
     SS_Name_CD_Models_list <- CD_Models_list
     SS_Name_CD_Models_selected <- "KMA"    
     SS_Name_CD_Scenarios <- "Climate Scenarios"
     SS_Name_CD_Scenarios_list <- CD_Scenarios_list
     SS_Name_CD_Scenarios_selected <- "RCP4.5"    
     SS_Name_CD_Year <- "Projecting Years"
     SS_Name_CD_Year_list <- CD_Year_list
     SS_Name_CD_Year_selected <- "2000"
     SS_Name_models <- "Model types"
     SS_Name_models_list <- SDM_models_list
     SS_Name_models_selected <- "GLM"
     SS_Name_EMmodels <- "Ensemble"
     SS_Name_models_run <- "Run"
     SS_Name_models_out <- "Model types"
     SS_Name_models_out_list <- SDM_models_out_list
     SS_Name_models_out_selected <- "GLM"
     SS_Name_CD_Models_out <- "Climate Models"
     SS_Name_CD_Models_out_list <- CD_Models_list
     SS_Name_CD_Models_out_selected <- "KMA"    
     SS_Name_CD_Scenarios_out <- "Climate Scenarios"
     SS_Name_CD_Scenarios_out_list <- CD_Scenarios_list
     SS_Name_CD_Scenarios_out_selected <- "RCP4.5"    
     SS_Name_CD_Year_out <- "Projecting Years"
     SS_Name_CD_Year_out_list <- CD_Year_list
     SS_Name_CD_Year_out_selected <- "2000"
     SS_Name_Group1_list <- c("by Species" = "Species",
                              "by Climate Model" = "Climate_Model",
                              "by Climate Scenario" = "Climate_Scenario",
                              "by Model" = "Model",
                              "by Year" = "Year")
     SS_Name_Group1_selected <- "Year"
     SS_Name_Group2_list <- c("by Species" = "Species",
                              "by Climate Model" = "Climate_Model",
                              "by Climate Scenario" = "Climate_Scenario",
                              "by Model" = "Model")
     SS_Name_Group2_selected <- "Model"
     IS_Name <- "Invasive Species"
     IS_Name_Anlayis <- "Change Analysis"
     IS_Name_Out <- "Model Outputs"
     IS_Name_Out_Species <- "Invasive Species Distribution"
     IS_Name_Out_SR <- "Invasive species Richness"
     IS_Name_Out_SI <- "Invasive species Introduction"
     IS_Name_Out_Map <- "Map"
     IS_Name_Out_SIDO <- "SIDO"
     IS_Name_Out_SGG <- "SIGUNGU"
     IS_Name_Out_Stat <- "Statistics"
     IS_Name_DM_Models <- "DIspersal Types"
     IS_Name_DM_Models_list <- DM_Models_list
     IS_Name_DM_Models_selected <- "UD"    
     IS_Name_CD_Models <- "Climate Models"
     IS_Name_CD_Models_list <- CD_Models_list
     IS_Name_CD_Models_selected <- "KMA"    
     IS_Name_CD_Scenarios <- "Climate Scenarios"
     IS_Name_CD_Scenarios_list <- CD_Scenarios_list
     IS_Name_CD_Scenarios_selected <- "RCP4.5"    
     IS_Name_CD_Year <- "Projecting Years"
     IS_Name_CD_Year_list <- CD_Year_list
     IS_Name_CD_Year_selected <- "2000"
     IS_Name_models <- "Model types"
     IS_Name_models_list <- SDM_models_list
     IS_Name_models_selected <- "GLM"
     IS_Name_EMmodels <- "Ensemble"
     IS_Name_models_run <- "Run"
     IS_Name_models_out <- "Model types"
     IS_Name_models_out_list <- SDM_models_out_list
     IS_Name_models_out_selected <- "GLM"
     IS_Name_Dir <- "Invasive Assessment Output Folder"
     IS_Name_Action <- "Assessing Impact and Vulnerabilty"
     IS_Name_Action_Admin <- "Grouping by Administration"
     IS_Name_Admin <- "Select a Administration Type"
     IS_Name_Admin_list <- c("SIDO" = "SD",
                             "SIGUNGU" = "SGG")
     IS_Name_Admin_selected <- "SD" 
     IS_Name_CD_Models_out <- "Climate Models"
     IS_Name_CD_Models_out_list <- CD_Models_list
     IS_Name_CD_Models_out_selected <- "KMA"    
     IS_Name_CD_Scenarios_out <- "Climate Scenarios"
     IS_Name_CD_Scenarios_out_list <- CD_Scenarios_list
     IS_Name_CD_Scenarios_out_selected <- "RCP4.5"    
     IS_Name_CD_Year_out <- "Projecting Years"
     IS_Name_CD_Year_out_list <- CD_Year_list
     IS_Name_CD_Year_out_selected <- "2000"
     IS_Name_Group1_list <- c("by Species" = "Species",
                              "by Climate Model" = "Climate_Model",
                              "by Climate Scenario" = "Climate_Scenario",
                              "by Model" = "Model",
                              "by Year" = "Year")
     IS_Name_Group1_selected <- "Year"
     IS_Name_Group2_list <- c("by Species" = "Species",
                              "by Climate Model" = "Climate_Model",
                              "by Climate Scenario" = "Climate_Scenario",
                              "by Model" = "Model")
     IS_Name_Group2_selected <- "Model"
     IS_Name_OU_Option1 <- "Assessment Type"
     IS_Name_OU_Option1_list <- c("Species Richness" = "IS_SR",
                                  "Species Loss" = "IS_LOSS",
                                  "Species Stay" = "IS_STAY",
                                  "Species Gain" = "IS_GAIN")
     IS_Name_OU_Option1_selected <- "IS_SR"
     IS_Name_OU_Option2 <- "Vulnerability Type"
     IS_Name_OU_Option2_list <- c("Vulnerability1 (Species Loss)" = "IS_VI1",
                                  "Vulnerability2 (Species Loss Ratio)" = "IS_VI2",
                                  "Vulnerability3 (Species Inside Loss Outside Gain)" = "IS_VI3")
     IS_Name_OU_Option2_selected <- "IS_VI1"
     VH_Name <- "Climate Vulnerable Habitat"
     VH_Name_Analysis <- "Change Analysis"
     VH_Name_Out <- "Model Outputs"
     VH_Name_Out_Dir <- "Habitat Assessment Output Folder"
     VH_Name_Out_SR <- "Species Richness"
     VH_Name_Out_SL <- "Species Loss"
     VH_Name_Out_SS <- "Species Stay"
     VH_Name_Out_SI <- "Species Introduction"
     VH_Name_Out_VI1 <- "Vulnerability 1"
     VH_Name_Out_VI2 <- "Vulnerability 2"
     VH_Name_Out_VI3 <- "Vulnerability 3"
     VH_Name_Out_Map <- "Map"
     VH_Name_Out_SIDO <- "SIDO"
     VH_Name_Out_SGG <- "SIGUNGU"
     VH_Name_Out_NP <- "National Park"
     VH_Name_Out_BR <- "Baekdu Range"
     VH_Name_Out_DMZ <- "DMZ"
     VH_Name_Out_Stat <- "Statistics"
     VH_Name_DM_Models <- "DIspersal Types"
     VH_Name_DM_Models_list <- DM_Models_list
     VH_Name_DM_Models_selected <- "UD"    
     VH_Name_CD_Models <- "Climate Models"
     VH_Name_CD_Models_list <- CD_Models_list
     VH_Name_CD_Models_selected <- "KMA"    
     VH_Name_CD_Scenarios <- "Climate Scenarios"
     VH_Name_CD_Scenarios_list <- CD_Scenarios_list
     VH_Name_CD_Scenarios_selected <- "RCP4.5"    
     VH_Name_CD_Year <- "Projecting Years"
     VH_Name_CD_Year_list <- CD_Year_list
     VH_Name_CD_Year_selected <- "2000"
     VH_Name_models <- "Model types"
     VH_Name_models_list <- SDM_models_list
     VH_Name_models_selected <- "GLM"
     VH_Name_EMmodels <- "Ensemble"
     VH_Name_models_run <- "Run"
     VH_Name_Dir <- "Habitat Assessment Output Folder"
     VH_Name_Action <- "Assessing Impact and Vulnerabilty"
     VH_Name_Action_Habitat <- "Grouping by Habitat"
     VH_Name_Habitat <- "Select a Habitat Type"
     VH_Name_Habitat_list <- c("SIDO" = "SD",
                               "SIGUNGU" = "SGG",
                               "National Park" = "NP",
                               "Baekdu Range" = "BR",
                               "DMZ" = "DMZ")
     VH_Name_Habitat_selected <- "SD" 
     VH_Name_models_out <- "Model types"
     VH_Name_models_out_list <- SDM_models_out_list
     VH_Name_models_out_selected <- "GLM"
     VH_Name_CD_Models_out <- "Climate Models"
     VH_Name_CD_Models_out_list <- CD_Models_list
     VH_Name_CD_Models_out_selected <- "KMA"    
     VH_Name_CD_Scenarios_out <- "Climate Scenarios"
     VH_Name_CD_Scenarios_out_list <- CD_Scenarios_list
     VH_Name_CD_Scenarios_out_selected <- "RCP4.5"    
     VH_Name_CD_Year_out <- "Projecting Years"
     VH_Name_CD_Year_out_list <- CD_Year_list
     VH_Name_CD_Year_out_selected <- "2000"
     VH_Name_Group1_list <- c("by Species" = "Species",
                              "by Climate Model" = "Climate_Model",
                              "by Climate Scenario" = "Climate_Scenario",
                              "by Model" = "Model",
                              "by Year" = "Year")
     VH_Name_Group1_selected <- "Year"
     VH_Name_Group2_list <- c("by Species" = "Species",
                              "by Climate Model" = "Climate_Model",
                              "by Climate Scenario" = "Climate_Scenario",
                              "by Model" = "Model")
     VH_Name_Group2_selected <- "Model"
     HELP_Name <- "Help"
     
     
     
   } else if (SE_Language == "Korean") {
     System_Name <- "생태계 기후변화 영향 및 취약성 평가모형" 
     OV_Name <- "모형개요"
     
     LD_Variables_list  <- c("토지이용" = "landuse",
                             "산불" = "forestfire",
                             "산사태" = "landslide")
     CD_Variables_list <- c("BIOCLIM 01 (연평균 기온)" = "bio01",
                            "BIOCLIM 02 (일평균 기온변화" = "bio02",
                            "BIOCLIM 03 (등온성 (BIO2/BIO7 * 100))" = "bio03",
                            "BIOCLIM 04 (기온 계절변동성(표준편차 *100))" = "bio04",
                            "BIOCLIM 05 (더운달의 최고기온)" = "bio05",
                            "BIOCLIM 06 (추운달의 최저기온)" = "bio06",
                            "BIOCLIM 07 (기온 연변화(BIO5-BIO6))" = "bio07",
                            "BIOCLIM 08 (습한 분기의 평균기온)" = "bio08",
                            "BIOCLIM 09 (건조한 분기의 평균기온)" = "bio09",
                            "BIOCLIM 10 (더운 분기의 평균기온)" = "bio10",
                            "BIOCLIM 11 (추운 분기의 평균기온)" = "bio11",
                            "BIOCLIM 12 (연강수량)" = "bio12",
                            "BIOCLIM 13 (습한 달의 강수량)" = "bio13",
                            "BIOCLIM 14 (건조한 달의 강수량)" = "bio14",
                            "BIOCLIM 15 (강수량의 계절변동성(변동계수)" = "bio15",
                            "BIOCLIM 16 (습한 분기의 강수량)" = "bio16",
                            "BIOCLIM 17 (건조한 분기의 강수량)" = "bio17",
                            "BIOCLIM 18 (더운 분기의 강수량)" = "bio18",
                            "BIOCLIM 19 (추운 분기의 강수량)" = "bio19") 
     SDM_Variables_list <- c("BIOCLIM 01 (연평균 기온)" = paste("bio01.", Input_img, sep = ""),
                             "BIOCLIM 02 (일평균 기온변화" = paste("bio02.", Input_img, sep = ""),
                             "BIOCLIM 03 (등온성 (BIO2/BIO7 * 100))" = paste("bio03.", Input_img, sep = ""),
                             "BIOCLIM 04 (기온 계절변동성(표준편차 *100))" = paste("bio04.", Input_img, sep = ""),
                             "BIOCLIM 05 (더운달의 최고기온)" = paste("bio05.", Input_img, sep = ""),
                             "BIOCLIM 06 (추운달의 최저기온)" = paste("bio06.", Input_img, sep = ""),
                             "BIOCLIM 07 (기온 연변화(BIO5-BIO6))" = paste("bio07.", Input_img, sep = ""),
                             "BIOCLIM 08 (습한 분기의 평균기온)" = paste("bio08.", Input_img, sep = ""),
                             "BIOCLIM 09 (건조한 분기의 평균기온)" = paste("bio09.", Input_img, sep = ""),
                             "BIOCLIM 10 (더운 분기의 평균기온)" = paste("bio10.", Input_img, sep = ""),
                             "BIOCLIM 11 (추운 분기의 평균기온)" = paste("bio11.", Input_img, sep = ""),
                             "BIOCLIM 12 (연강수량)" = paste("bio12.", Input_img, sep = ""),
                             "BIOCLIM 13 (습한 달의 강수량)" = paste("bio13.", Input_img, sep = ""),
                             "BIOCLIM 14 (건조한 달의 강수량)" = paste("bio14.", Input_img, sep = ""),
                             "BIOCLIM 15 (강수량의 계절변동성(변동계수)" = paste("bio15.", Input_img, sep = ""),
                             "BIOCLIM 16 (습한 분기의 강수량)" = paste("bio16.", Input_img, sep = ""),
                             "BIOCLIM 17 (건조한 분기의 강수량)" = paste("bio17.", Input_img, sep = ""),
                             "BIOCLIM 18 (더운 분기의 강수량)" = paste("bio18.", Input_img, sep = ""),
                             "BIOCLIM 19 (추운 분기의 강수량)" = paste("bio19.", Input_img, sep = ""))
     CD_Models_list <- c("KMA (기상청)" = "KMA",
                         "KEI (한국환경정책평가연구원)" = "KEI")
     
     
     
     
     SE_Name_System <- "MOTIVE ECOSYSTEM (생태계 기후변화 영향 및 취약성 평가모형)"
     SE_Name <- "환경설정"
     SE_Name_Language <- "언어"
     SE_Name_WE <- "작업환경"
     SE_Name_WE_Project <- "작업디렉토리"
     SE_Name_DE <- "데이터환경"
     SE_Name_DE_Climate <- "기후자료"
     SE_Name_DE_Link <- "연계자료"
     SE_Name_DE_Species <- "생물종자료"
     SE_Name_DE_Species_Index <- "생물종정보 인덱스 자료 (CSV file)"
     SE_Name_DE_Species_Location <- "생물종위치자료 (CSV file)"
     SP_Name <- "생물종자료"
     SP_Name_Info <- "생물종정보"
     SP_Name_Location <- "생물종위치"
     LD_Name <- "연계자료"
     LD_Name_Map <- "지도"
     LD_Name_Summary <- "통계"
     LD_Name_Variables <- "연계자료"
     LD_Name_Variables_list <- LD_Variables_list
     LD_Name_Variables_selected <- "forestfire"
     LD_Name_Models <- "기후모델"
     LD_Name_Models_list <- CD_Models_list
     LD_Name_Models_selected <- "KMA"    
     LD_Name_Scenarios <- "기후시나리오"
     LD_Name_Scenarios_list <- CD_Scenarios_list
     LD_Name_Scenarios_selected <- "RCP4.5"    
     LD_Name_Year <- "예측년도"
     LD_Name_Year_list <- CD_Year_list
     LD_Name_Year_selected <- "2000"       
     CD_Name <- "기후자료"
     CD_Name_Map <- "지도"
     CD_Name_Summary <- "통계"
     CD_Name_Variables <- "기후변수"
     CD_Name_Variables_list <- CD_Variables_list
     CD_Name_Variables_selected <- "bio01"
     CD_Name_Models <- "기후모델"
     CD_Name_Models_list <- CD_Models_list
     CD_Name_Models_selected <- "KMA"    
     CD_Name_Scenarios <- "기후시나리오"
     CD_Name_Scenarios_list <- CD_Scenarios_list
     CD_Name_Scenarios_selected <- "RCP4.5"    
     CD_Name_Year <- "예측년도"
     CD_Name_Year_list <- CD_Year_list
     CD_Name_Year_selected <- "2000"     
     SDM_Name <- "종분포모형"
     SDM_Name_Model <- "모형구동"
     SDM_Name_Model_Species <- "종선택"
     SDM_Name_Model_Projection <- "예측옵션"
     SDM_Name_Model_Variable <- "변수선택"
     SDM_Name_Model_SDM <- "SDM 모형"
     SDM_Name_Model_Out <- "모형결과"
     SDM_Name_Model_Out_Validation <- "모형검증"
     SDM_Name_Model_Out_Contribution <- "변수기여도"
     SDM_Name_Model_Out_Probability <- "확률지도"
     SDM_Name_Model_Out_Prediction <- "예측지도"
     SDM_Name_CD_Variables <- "기후변수"
     SDM_Name_CD_Variables_list <- SDM_Variables_list
     SDM_Name_CD_Variables_selected <- c(paste("bio01.", Input_img, sep = ""), paste("bio02.", Input_img, sep = ""), paste("bio03.", Input_img, sep = ""), paste("bio12.", Input_img, sep = ""), paste("bio13.", Input_img, sep = ""), paste("bio14.", Input_img, sep = ""))
     SDM_Name_CD_Models <- "기후모델"
     SDM_Name_CD_Models_list <- CD_Models_list
     SDM_Name_CD_Models_selected <- "KMA"    
     SDM_Name_CD_Scenarios <- "기후시나리오"
     SDM_Name_CD_Scenarios_list <- CD_Scenarios_list
     SDM_Name_CD_Scenarios_selected <- "RCP4.5"    
     SDM_Name_CD_Year <- "예측년도"
     SDM_Name_CD_Year_list <- CD_Year_list
     SDM_Name_CD_Year_selected <- "2000"
     SDM_Name_models <- "모델유형"
     SDM_Name_models_list <- SDM_models_list
     SDM_Name_models_selected <- "GLM"
     SDM_Name_EMmodels <- "앙상블"
     SDM_Name_models_run <- "Run"
     SDM_Name_models_out <- "모델유형"
     SDM_Name_models_out_list <- SDM_models_out_list
     SDM_Name_models_out_selected <- "GLM"
     SDM_Name_CD_Models_out <- "기후모델"
     SDM_Name_CD_Models_out_list <- CD_Models_list
     SDM_Name_CD_Models_out_selected <- "KMA"    
     SDM_Name_CD_Scenarios_out <- "기후시나리오"
     SDM_Name_CD_Scenarios_out_list <- CD_Scenarios_list
     SDM_Name_CD_Scenarios_out_selected <- "RCP4.5"    
     SDM_Name_CD_Year_out <- "예측년도"
     SDM_Name_CD_Year_out_list <- CD_Year_list
     SDM_Name_CD_Year_out_selected <- "2000"
     DM_Name <- "종확산모형"
     DM_Name_Model <- "모형구동"
     DM_Name_Model_Out <- "모형결과"
     DM_Name_Out_Plot <- "생물종 분포변화"
     DM_Name_DM_MO_Barriers <- "장애물"
     DM_Name_DM_MO_Barriers_list <- LD_Variables_list
     DM_Name_DM_MO_Barriers_selected <- "landuse" 
     DM_Name_DM_MO_Slider <- "확산거리를 입력하세요"
     DM_Name_DM_MO_Action <- "실행"
     DM_Name_DM_Models <- "확산모델"
     DM_Name_DM_Models_list <- DM_Models_list
     DM_Name_DM_Models_selected <- "UD" 
     DM_Name_CD_Models <- "기후모델"
     DM_Name_CD_Models_list <- CD_Models_list
     DM_Name_CD_Models_selected <- "KMA"    
     DM_Name_CD_Scenarios <- "기후시나리오"
     DM_Name_CD_Scenarios_list <- CD_Scenarios_list
     DM_Name_CD_Scenarios_selected <- "RCP4.5"    
     DM_Name_CD_Year <- "예측년도"
     DM_Name_CD_Year_list <- CD_Year_list
     DM_Name_CD_Year_selected <- "2000"
     DM_Name_models <- "모델유형"
     DM_Name_models_list <- SDM_models_list
     DM_Name_models_selected <- "GLM"
     DM_Name_EMmodels <- "앙상블"
     DM_Name_models_run <- "실행"
     DM_Name_models_out <- "모델유형"
     DM_Name_models_out_list <- SDM_models_out_list
     DM_Name_models_out_selected <- "GLM"
     DM_Name_CD_Models_out <- "기후모델"
     DM_Name_CD_Models_out_list <- CD_Models_list
     DM_Name_CD_Models_out_selected <- "KMA"    
     DM_Name_CD_Scenarios_out <- "기후시나리오"
     DM_Name_CD_Scenarios_out_list <- CD_Scenarios_list
     DM_Name_CD_Scenarios_out_selected <- "RCP4.5"    
     DM_Name_CD_Year_out <- "예측년도"
     DM_Name_CD_Year_out_list <- CD_Year_list
     DM_Name_CD_Year_out_selected <- "2000"
     SS_Name <- "기후변화민감종"
     SS_Name_Analysis <- "영향 및 취약성평가"
     SS_Name_Out <- "평가결과"
     SS_Name_Out_ChangePlot <- "분포변화 결과"
     SS_Name_Out_Pattern <- "취약성 패턴"
     SS_Name_Out_Vulnerabiity <- "취약성 순위"
     SS_Name_DM_Models <- "확산유형"
     SS_Name_DM_Models_list <- DM_Models_list
     SS_Name_DM_Models_selected <- "UD"    
     SS_Name_CD_Models <- "기후모델"
     SS_Name_CD_Models_list <- CD_Models_list
     SS_Name_CD_Models_selected <- "KMA"    
     SS_Name_CD_Scenarios <- "기후시나리오"
     SS_Name_CD_Scenarios_list <- CD_Scenarios_list
     SS_Name_CD_Scenarios_selected <- "RCP4.5"    
     SS_Name_CD_Year <- "예측년도"
     SS_Name_CD_Year_list <- CD_Year_list
     SS_Name_CD_Year_selected <- "2000"
     SS_Name_models <- "모델유형"
     SS_Name_models_list <- SDM_models_list
     SS_Name_models_selected <- "GLM"
     SS_Name_EMmodels <- "앙상블"
     SS_Name_models_run <- "실행"
     SS_Name_models_out <- "모델유형"
     SS_Name_models_out_list <- SDM_models_out_list
     SS_Name_models_out_selected <- "GLM"
     SS_Name_CD_Models_out <- "기후모델"
     SS_Name_CD_Models_out_list <- CD_Models_list
     SS_Name_CD_Models_out_selected <- "KMA"    
     SS_Name_CD_Scenarios_out <- "기후시나리오"
     SS_Name_CD_Scenarios_out_list <- CD_Scenarios_list
     SS_Name_CD_Scenarios_out_selected <- "RCP4.5"    
     SS_Name_CD_Year_out <- "예측년도"
     SS_Name_CD_Year_out_list <- CD_Year_list
     SS_Name_CD_Year_out_selected <- "2000"
     SS_Name_Group1_list <- c("생물종별" = "Species",
                              "기후모델별" = "Climate_Model",
                              "기후시나리오별" = "Climate_Scenario",
                              "모델유형별" = "Model",
                              "예측년도별" = "Year")
     SS_Name_Group1_selected <- "Year"
     SS_Name_Group2_list <- c("생물종별" = "Species",
                              "기후모델별" = "Climate_Model",
                              "기후시나리오별" = "Climate_Scenario",
                              "모델유형별" = "Model")
     SS_Name_Group2_selected <- "Model"
     IS_Name <- "외래종"
     IS_Name_Anlayis <- "영향 평가"
     IS_Name_Out <- "평가결과"
     IS_Name_Out_Species <- "외래종분포"
     IS_Name_Out_SR <- "외래종 풍부도"
     IS_Name_Out_SI <- "외래종 유입"
     IS_Name_Out_Map <- "지도"
     IS_Name_Out_SIDO <- "시도"
     IS_Name_Out_SGG <- "시군구"
     IS_Name_Out_Stat <- "통계"
     IS_Name_DM_Models <- "확산유형"
     IS_Name_DM_Models_list <- DM_Models_list
     IS_Name_DM_Models_selected <- "UD"    
     IS_Name_CD_Models <- "기후모델"
     IS_Name_CD_Models_list <- CD_Models_list
     IS_Name_CD_Models_selected <- "KMA"    
     IS_Name_CD_Scenarios <- "기후시나리오"
     IS_Name_CD_Scenarios_list <- CD_Scenarios_list
     IS_Name_CD_Scenarios_selected <- "RCP4.5"    
     IS_Name_CD_Year <- "예측년도"
     IS_Name_CD_Year_list <- CD_Year_list
     IS_Name_CD_Year_selected <- "2000"
     IS_Name_models <- "모델유형"
     IS_Name_models_list <- SDM_models_list
     IS_Name_models_selected <- "GLM"
     IS_Name_EMmodels <- "앙상블"
     IS_Name_models_run <- "실행"
     IS_Name_models_out <- "모델유형"
     IS_Name_models_out_list <- SDM_models_out_list
     IS_Name_models_out_selected <- "GLM"
     IS_Name_Dir <- "외래종 평가결과 폴더"
     IS_Name_Action <- "영향 및 취약성 평가 실행"
     IS_Name_Action_Admin <- "행정구역별로 결과분석"
     IS_Name_Admin <- "행정구역유형을 선택하세요"
     IS_Name_Admin_list <- c("시도" = "SD",
                             "시군구" = "SGG")
     IS_Name_Admin_selected <- "SD" 
     IS_Name_CD_Models_out <- "기후모델"
     IS_Name_CD_Models_out_list <- CD_Models_list
     IS_Name_CD_Models_out_selected <- "KMA"    
     IS_Name_CD_Scenarios_out <- "기후시나리오"
     IS_Name_CD_Scenarios_out_list <- CD_Scenarios_list
     IS_Name_CD_Scenarios_out_selected <- "RCP4.5"    
     IS_Name_CD_Year_out <- "예측년도"
     IS_Name_CD_Year_out_list <- CD_Year_list
     IS_Name_CD_Year_out_selected <- "2000"
     IS_Name_Group1_list <- c("by Species" = "Species",
                              "by Climate Model" = "Climate_Model",
                              "by Climate Scenario" = "Climate_Scenario",
                              "by Model" = "Model",
                              "by Year" = "Year")
     IS_Name_Group1_selected <- "Year"
     IS_Name_Group2_list <- c("by Species" = "Species",
                              "by Climate Model" = "Climate_Model",
                              "by Climate Scenario" = "Climate_Scenario",
                              "by Model" = "Model")
     IS_Name_Group2_selected <- "Model"
     IS_Name_OU_Option1 <- "Assessment Type"
     IS_Name_OU_Option1_list <- c("Species Richness" = "IS_SR",
                                  "Species Loss" = "IS_LOSS",
                                  "Species Stay" = "IS_STAY",
                                  "Species Gain" = "IS_GAIN")
     IS_Name_OU_Option1_selected <- "IS_SR"
     IS_Name_OU_Option2 <- "Vulnerability Type"
     IS_Name_OU_Option2_list <- c("Vulnerability1 (Species Loss)" = "IS_VI1",
                                  "Vulnerability2 (Species Loss Ratio)" = "IS_VI2",
                                  "Vulnerability3 (Species Inside Loss Outside Gain)" = "IS_VI3")
     IS_Name_OU_Option2_selected <- "IS_VI1"
     VH_Name <- "취약서식지"
     VH_Name_Analysis <- "영향 및 취약성평가"
     VH_Name_Out <- "평가결과"
     VH_Name_Out_Dir <- "평가결과 디렉토리"
     VH_Name_Out_SR <- "생물종 풍부도"
     VH_Name_Out_SL <- "생물종 소실"
     VH_Name_Out_SS <- "생물종 유지"
     VH_Name_Out_SI <- "생물종 유입"
     VH_Name_Out_VI1 <- "취약성평가 1"
     VH_Name_Out_VI2 <- "취약성평가 2"
     VH_Name_Out_VI3 <- "취약성평가 3"
     VH_Name_Out_Map <- "지도"
     VH_Name_Out_SIDO <- "시도"
     VH_Name_Out_SGG <- "시군구"
     VH_Name_Out_NP <- "국립공원"
     VH_Name_Out_BR <- "백두대간"
     VH_Name_Out_DMZ <- "DMZ"
     VH_Name_Out_Stat <- "통계"
     VH_Name_DM_Models <- "확산유형"
     VH_Name_DM_Models_list <- DM_Models_list
     VH_Name_DM_Models_selected <- "UD"    
     VH_Name_CD_Models <- "기후모델"
     VH_Name_CD_Models_list <- CD_Models_list
     VH_Name_CD_Models_selected <- "KMA"    
     VH_Name_CD_Scenarios <- "기후시나리오"
     VH_Name_CD_Scenarios_list <- CD_Scenarios_list
     VH_Name_CD_Scenarios_selected <- "RCP4.5"    
     VH_Name_CD_Year <- "예측년도"
     VH_Name_CD_Year_list <- CD_Year_list
     VH_Name_CD_Year_selected <- "2000"
     VH_Name_models <- "모델유형"
     VH_Name_models_list <- SDM_models_list
     VH_Name_models_selected <- "GLM"
     VH_Name_EMmodels <- "앙상블"
     VH_Name_models_run <- "실행"
     VH_Name_Dir <- "서식지 평가결과 폴더"
     VH_Name_Action <- "영향 및 취약성 평가 실행"
     VH_Name_Action_Habitat <- "서식지별로 결과분석"
     VH_Name_Habitat <- "서식지유형을 선택하세요"
     VH_Name_Habitat_list <- c("시도" = "SD",
                               "시군구" = "SGG",
                               "국립공원" = "NP",
                               "백두대간" = "BR",
                               "DMZ" = "DMZ")
     VH_Name_Habitat_selected <- "SD" 
     VH_Name_models_out <- "모델유형"
     VH_Name_models_out_list <- SDM_models_out_list
     VH_Name_models_out_selected <- "GLM"
     VH_Name_CD_Models_out <- "기후모델"
     VH_Name_CD_Models_out_list <- CD_Models_list
     VH_Name_CD_Models_out_selected <- "KMA"    
     VH_Name_CD_Scenarios_out <- "기후시나리오"
     VH_Name_CD_Scenarios_out_list <- CD_Scenarios_list
     VH_Name_CD_Scenarios_out_selected <- "RCP4.5"    
     VH_Name_CD_Year_out <- "예측년도"
     VH_Name_CD_Year_out_list <- CD_Year_list
     VH_Name_CD_Year_out_selected <- "2000"
     HELP_Name <- "도움말"
   }




System_Name <- ""

