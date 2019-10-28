

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

packages <- c("shiny", "shinyWidgets", "shinyFiles", "shinyalert", "tiff", "sf", "SDMTools", "proj4", "gdata", "colorspace", "plyr", "leaflet", "RColorBrewer", "scales", "lattice", "dplyr", "maps", "sp", "biomod2", "raster", "rgdal", "ggplot2", "hrbrthemes", "plotly", "grid", "reshape", "stringr", "rgdal", "MigClim", "mgcv", "gsubfn", "DT", "fmsb", "data.table", "scales", "leaflet.minicharts", "manipulateWidget", "shinydashboard", "shinyBS", "shinycssloaders", "shinyjs")
libraries <- c("shiny", "shinyWidgets", "shinyFiles", "shinyalert", "tiff", "sf", "SDMTools", "proj4", "gdata", "colorspace", "plyr", "leaflet", "RColorBrewer", "scales", "lattice", "dplyr", "maps", "sp", "biomod2", "raster", "rgdal", "ggplot2", "hrbrthemes", "plotly", "grid", "reshape", "stringr", "rgdal", "MigClim", "mgcv", "gsubfn", "DT", "fmsb", "data.table", "scales", "leaflet.minicharts", "manipulateWidget", "shinydashboard", "shinyBS","shinycssloaders", "shinyjs")



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


setwd("C:/MOTIVE_Ecosystem/R/Programs/ecosystem")
rm(list = ls())


color_Picker <- c("black","lightgray","gray","white","cadetblue","pink","darkpurple","purple","lightblue","darkblue","blue","lightgreen","darkgreen","green","beige","orange","lightred","darkred","red")

temp_colors <- c()
is_init_colors <- F

init_colors <- function(species_id) {
  
  dv <- length(species_id) / length(color_Picker)
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


##### Path
G <- reactiveValues()
G$SE_Dir_Project <- "C:/MOTIVE_projects/proj1"
G$SE_Dir_Climate <- "C:/MOTIVE_Ecosystem/DATA/Climate2"
G$SE_Dir_Link <- "C:/MOTIVE_Ecosystem/DATA/Link" 
G$SE_Dir_Species <- "C:/MOTIVE_Ecosystem/DATA/Species"
G$SE_Dir_Admin <- "C:/MOTIVE_Ecosystem/DATA/Admin"
G$SE_speciesindex <- "speciesname_final.csv"
G$SE_specieslocation <- "shin_specieslocation.csv"
G_FILE_speciesindex <- read.csv(file.path(isolate(G$SE_Dir_Species), isolate(G$SE_speciesindex)), header = T, sep = ",")
G_FILE_specieslocation <- read.csv(file.path(isolate(G$SE_Dir_Species), isolate(G$SE_specieslocation)), header = T, sep = ",")
G_FILE_speciesfreq <- count(G_FILE_specieslocation, ID)
G_FILE_speciesinfo <- inner_join(G_FILE_speciesfreq, G_FILE_speciesindex, by = "ID")

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
TR <- reactiveValues(SE_Language = "Korean")



 observe(

   
   if (TR$SE_Language == "English") {
     TR$System_Name <- "Climate Change Impact and Vulnerability Assessment Model for Ecosystem)"
     TR$OV_Name <- "Overview"
     
     TR$LD_Variables_list  <- c("Landuse" = "landuse",
                             "Forest fire" = "forestfire",
                             "Landslide" = "landslide")  
     TR$CD_Variables_list <- c("BIOCLIM 01 (Annual Mean Temperature)" = "bio01",
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
     TR$SDM_Variables_list <- c("BIOCLIM 01 (Annual Mean Temperature)" = paste("bio01.", Input_img, sep = ""),
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
     TR$CD_Models_list <- c("KMA (Korea Meteorological Administration)" = "KMA",
                         "KEI (Korea Environment Institute)" = "KEI")  
     TR$SE_Name_System <- "MOTIVE ECOSYSTEM (Climate Change Impact and Vulnerability Assessment Model for Ecosystem)" 
     TR$SE_Name <- "Setting"
     TR$SE_Name_Language <- "Language"
     TR$SE_Name_WE <- "Working Environment"
     TR$SE_Name_WE_Project <- "Working Project"
     TR$SE_Name_DE <- "Data Environment"
     TR$SE_Name_DE_Climate <- "Climate Data Path"
     TR$SE_Name_DE_Link <- "Link Data Path"
     TR$SE_Name_DE_Species <- "Species Data Path"
     TR$SE_Name_DE_Species_Index <- "Select species index data (CSV file)"
     TR$SE_Name_DE_Species_Location <- "Select species location data (CSV file)"
     TR$SP_Name <- "Species Data"
     TR$SP_Name_Info <- "Species Information"
     TR$SP_Name_Location <- "Species Location"
     TR$LD_Name <- "Link Data"
     TR$LD_Name_Map <- "Map"
     TR$LD_Name_Summary <- "Summary"
     TR$LD_Name_Variables <- "Link Data"
     TR$LD_Name_Variables_list <- TR$LD_Variables_list
     TR$LD_Name_Variables_selected <- "forestfire"
     TR$LD_Name_Models <- "Climate Models"
     TR$LD_Name_Models_list <- TR$CD_Models_list
     TR$LD_Name_Models_selected <- "KMA"    
     TR$LD_Name_Scenarios <- "Climate Scenarios"
     TR$LD_Name_Scenarios_list <- CD_Scenarios_list
     TR$LD_Name_Scenarios_selected <- "RCP4.5"    
     TR$LD_Name_Year <- "Projecting Years"
     TR$LD_Name_Year_list <- CD_Year_list
     TR$LD_Name_Year_selected <- "2000"       
     TR$CD_Name <- "Climate Data"
     TR$CD_Name_Map <- "Map"
     TR$CD_Name_Summary <- "Summary"
     TR$CD_Name_Variables <- "Climate Variables"
     TR$CD_Name_Variables_list <- TR$CD_Variables_list
     TR$CD_Name_Variables_selected <- "bio01"
     TR$CD_Name_Models <- "Climate Models"
     TR$CD_Name_Models_list <- TR$CD_Models_list
     TR$CD_Name_Models_selected <- "KMA"    
     TR$CD_Name_Scenarios <- "Climate Scenarios"
     TR$CD_Name_Scenarios_list <- CD_Scenarios_list
     TR$CD_Name_Scenarios_selected <- "RCP4.5"    
     TR$CD_Name_Year <- "Projecting Years"
     TR$CD_Name_Year_list <- CD_Year_list
     TR$CD_Name_Year_selected <- "2000"     
     TR$SDM_Name <- "Species Distribution Model"
     TR$SDM_Name_Model <- "Modeling"
     TR$SDM_Name_Model_Species <- "Species selection"
     TR$SDM_Name_Model_Projection <- "Projection selection"
     TR$SDM_Name_Model_Variable <- "Variable selection"
     TR$SDM_Name_Model_SDM <- "SDM selection"
     TR$SDM_Name_Model_Out <- "Modeling Outputs"
     TR$SDM_Name_Model_Out_Validation <- "Validation"
     TR$SDM_Name_Model_Out_Contribution <- "Contribution"
     TR$SDM_Name_Model_Out_Probability <- "Probability Map"
     TR$SDM_Name_Model_Out_Prediction <- "Predicted Map"
     TR$SDM_Name_CD_Variables <- "Climate Variables"
     TR$SDM_Name_CD_Variables_list <- TR$SDM_Variables_list
     TR$SDM_Name_CD_Variables_selected <- c(paste("bio01.", Input_img, sep = ""), paste("bio02.", Input_img, sep = ""), paste("bio03.", Input_img, sep = ""), paste("bio12.", Input_img, sep = ""), paste("bio13.", Input_img, sep = ""), paste("bio14.", Input_img, sep = ""))
     TR$SDM_Name_CD_Models <- "Climate Models"
     TR$SDM_Name_CD_Models_list <- TR$CD_Models_list
     TR$SDM_Name_CD_Models_selected <- "KMA"    
     TR$SDM_Name_CD_Scenarios <- "Climate Scenarios"
     TR$SDM_Name_CD_Scenarios_list <- CD_Scenarios_list
     TR$SDM_Name_CD_Scenarios_selected <- "RCP4.5"    
     TR$SDM_Name_CD_Year <- "Projecting Years"
     TR$SDM_Name_CD_Year_list <- CD_Year_list
     TR$SDM_Name_CD_Year_selected <- "2000"
     TR$SDM_Name_models <- "Model types"
     TR$SDM_Name_models_list <- SDM_models_list
     TR$SDM_Name_models_selected <- "GLM"
     TR$SDM_Name_EMmodels <- "Ensemble"
     TR$SDM_Name_models_run <- "Run"
     TR$SDM_Name_models_out <- "Model types"
     TR$SDM_Name_models_out_list <- SDM_models_out_list
     TR$SDM_Name_models_out_selected <- "GLM"
     TR$SDM_Name_CD_Models_out <- "Climate Models"
     TR$SDM_Name_CD_Models_out_list <- TR$CD_Models_list
     TR$SDM_Name_CD_Models_out_selected <- "KMA"    
     TR$SDM_Name_CD_Scenarios_out <- "Climate Scenarios"
     TR$SDM_Name_CD_Scenarios_out_list <- CD_Scenarios_list
     TR$SDM_Name_CD_Scenarios_out_selected <- "RCP4.5"    
     TR$SDM_Name_CD_Year_out <- "Projecting Years"
     TR$SDM_Name_CD_Year_out_list <- CD_Year_list
     TR$SDM_Name_CD_Year_out_selected <- "2000"
     TR$DM_Name <- "Dispesal Model"
     TR$DM_Name_Model <- "Modeling"
     TR$DM_Name_Model_Out <- "Model Outputs"
     TR$DM_Name_Out_Plot <- "Species Distribution Change Plot"
     TR$DM_Name_DM_MO_Barriers <- "Barriers"
     TR$DM_Name_DM_MO_Barriers_list <- TR$LD_Variables_list
     TR$DM_Name_DM_MO_Barriers_selected <- "landuse" 
     TR$DM_Name_DM_MO_Slider <- "Select a dispersal distance"
     TR$DM_Name_DM_MO_Action <- "Run"
     TR$DM_Name_DM_Models <- "DIspersal Models"
     TR$DM_Name_DM_Models_list <- DM_Models_list
     TR$DM_Name_DM_Models_selected <- "UD" 
     TR$DM_Name_CD_Models <- "Climate Models"
     TR$DM_Name_CD_Models_list <- TR$CD_Models_list
     TR$DM_Name_CD_Models_selected <- "KMA"    
     TR$DM_Name_CD_Scenarios <- "Climate Scenarios"
     TR$DM_Name_CD_Scenarios_list <- CD_Scenarios_list
     TR$DM_Name_CD_Scenarios_selected <- "RCP4.5"    
     TR$DM_Name_CD_Year <- "Projecting Years"
     TR$DM_Name_CD_Year_list <- CD_Year_list
     TR$DM_Name_CD_Year_selected <- "2000"
     TR$DM_Name_models <- "Model types"
     TR$DM_Name_models_list <- SDM_models_list
     TR$DM_Name_models_selected <- "GLM"
     TR$DM_Name_EMmodels <- "Ensemble"
     TR$DM_Name_models_run <- "Run"
     TR$DM_Name_models_out <- "Model types"
     TR$DM_Name_models_out_list <- SDM_models_out_list
     TR$DM_Name_models_out_selected <- "GLM"
     TR$DM_Name_CD_Models_out <- "Climate Models"
     TR$DM_Name_CD_Models_out_list <- TR$CD_Models_list
     TR$DM_Name_CD_Models_out_selected <- "KMA"    
     TR$DM_Name_CD_Scenarios_out <- "Climate Scenarios"
     TR$DM_Name_CD_Scenarios_out_list <- CD_Scenarios_list
     TR$DM_Name_CD_Scenarios_out_selected <- "RCP4.5"    
     TR$DM_Name_CD_Year_out <- "Projecting Years"
     TR$DM_Name_CD_Year_out_list <- CD_Year_list
     TR$DM_Name_CD_Year_out_selected <- "2000"
     TR$SS_Name <- "Climate Sensitive Species"
     TR$SS_Name_Analysis <- "Change Analysis"
     TR$SS_Name_Out <- "Analysis Outputs"
     TR$SS_Name_Out_ChangePlot <- "Species Distribution Change Plot"
     TR$SS_Name_Out_Pattern <- "Vulnerability Pattern"
     TR$SS_Name_Out_Vulnerabiity <- "Vulnerable Priority"
     TR$SS_Name_DM_Models <- "DIspersal Types"
     TR$SS_Name_DM_Models_list <- DM_Models_list
     TR$SS_Name_DM_Models_selected <- "UD"    
     TR$SS_Name_CD_Models <- "Climate Models"
     TR$SS_Name_CD_Models_list <- TR$CD_Models_list
     TR$SS_Name_CD_Models_selected <- "KMA"    
     TR$SS_Name_CD_Scenarios <- "Climate Scenarios"
     TR$SS_Name_CD_Scenarios_list <- CD_Scenarios_list
     TR$SS_Name_CD_Scenarios_selected <- "RCP4.5"    
     TR$SS_Name_CD_Year <- "Projecting Years"
     TR$SS_Name_CD_Year_list <- CD_Year_list
     TR$SS_Name_CD_Year_selected <- "2000"
     TR$SS_Name_models <- "Model types"
     TR$SS_Name_models_list <- SDM_models_list
     TR$SS_Name_models_selected <- "GLM"
     TR$SS_Name_EMmodels <- "Ensemble"
     TR$SS_Name_models_run <- "Run"
     TR$SS_Name_models_out <- "Model types"
     TR$SS_Name_models_out_list <- SDM_models_out_list
     TR$SS_Name_models_out_selected <- "GLM"
     TR$SS_Name_CD_Models_out <- "Climate Models"
     TR$SS_Name_CD_Models_out_list <- TR$CD_Models_list
     TR$SS_Name_CD_Models_out_selected <- "KMA"    
     TR$SS_Name_CD_Scenarios_out <- "Climate Scenarios"
     TR$SS_Name_CD_Scenarios_out_list <- CD_Scenarios_list
     TR$SS_Name_CD_Scenarios_out_selected <- "RCP4.5"    
     TR$SS_Name_CD_Year_out <- "Projecting Years"
     TR$SS_Name_CD_Year_out_list <- CD_Year_list
     TR$SS_Name_CD_Year_out_selected <- "2000"
     TR$SS_Name_Group1_list <- c("by Species" = "Species",
                              "by Climate Model" = "Climate_Model",
                              "by Climate Scenario" = "Climate_Scenario",
                              "by Model" = "Model",
                              "by Year" = "Year")
     TR$SS_Name_Group1_selected <- "Year"
     TR$SS_Name_Group2_list <- c("by Species" = "Species",
                              "by Climate Model" = "Climate_Model",
                              "by Climate Scenario" = "Climate_Scenario",
                              "by Model" = "Model")
     TR$SS_Name_Group2_selected <- "Model"
     TR$IS_Name <- "Invasive Species"
     TR$IS_Name_Anlayis <- "Change Analysis"
     TR$IS_Name_Out <- "Model Outputs"
     TR$IS_Name_Out_Species <- "Invasive Species Distribution"
     TR$IS_Name_Out_SR <- "Invasive species Richness"
     TR$IS_Name_Out_SI <- "Invasive species Introduction"
     TR$IS_Name_Out_Map <- "Map"
     TR$IS_Name_Out_SIDO <- "SIDO"
     TR$IS_Name_Out_SGG <- "SIGUNGU"
     TR$IS_Name_Out_Stat <- "Statistics"
     TR$IS_Name_DM_Models <- "DIspersal Types"
     TR$IS_Name_DM_Models_list <- DM_Models_list
     TR$IS_Name_DM_Models_selected <- "UD"    
     TR$IS_Name_CD_Models <- "Climate Models"
     TR$IS_Name_CD_Models_list <- TR$CD_Models_list
     TR$IS_Name_CD_Models_selected <- "KMA"    
     TR$IS_Name_CD_Scenarios <- "Climate Scenarios"
     TR$IS_Name_CD_Scenarios_list <- CD_Scenarios_list
     TR$IS_Name_CD_Scenarios_selected <- "RCP4.5"    
     TR$IS_Name_CD_Year <- "Projecting Years"
     TR$IS_Name_CD_Year_list <- CD_Year_list
     TR$IS_Name_CD_Year_selected <- "2000"
     TR$IS_Name_models <- "Model types"
     TR$IS_Name_models_list <- SDM_models_list
     TR$IS_Name_models_selected <- "GLM"
     TR$IS_Name_EMmodels <- "Ensemble"
     TR$IS_Name_models_run <- "Run"
     TR$IS_Name_models_out <- "Model types"
     TR$IS_Name_models_out_list <- SDM_models_out_list
     TR$IS_Name_models_out_selected <- "GLM"
     TR$IS_Name_Dir <- "Invasive Assessment Output Folder"
     TR$IS_Name_Action <- "Assessing Impact and Vulnerabilty"
     TR$IS_Name_Action_Admin <- "Grouping by Administration"
     TR$IS_Name_Admin <- "Select a Administration Type"
     TR$IS_Name_Admin_list <- c("SIDO" = "SD",
                             "SIGUNGU" = "SGG")
     TR$IS_Name_Admin_selected <- "SD" 
     TR$IS_Name_CD_Models_out <- "Climate Models"
     TR$IS_Name_CD_Models_out_list <- TR$CD_Models_list
     TR$IS_Name_CD_Models_out_selected <- "KMA"    
     TR$IS_Name_CD_Scenarios_out <- "Climate Scenarios"
     TR$IS_Name_CD_Scenarios_out_list <- CD_Scenarios_list
     TR$IS_Name_CD_Scenarios_out_selected <- "RCP4.5"    
     TR$IS_Name_CD_Year_out <- "Projecting Years"
     TR$IS_Name_CD_Year_out_list <- CD_Year_list
     TR$IS_Name_CD_Year_out_selected <- "2000"
     TR$IS_Name_Group1_list <- c("by Species" = "Species",
                              "by Climate Model" = "Climate_Model",
                              "by Climate Scenario" = "Climate_Scenario",
                              "by Model" = "Model",
                              "by Year" = "Year")
     TR$IS_Name_Group1_selected <- "Year"
     TR$IS_Name_Group2_list <- c("by Species" = "Species",
                              "by Climate Model" = "Climate_Model",
                              "by Climate Scenario" = "Climate_Scenario",
                              "by Model" = "Model")
     TR$IS_Name_Group2_selected <- "Model"
     TR$IS_Name_OU_Option1 <- "Assessment Type"
     TR$IS_Name_OU_Option1_list <- c("Species Richness" = "IS_SR",
                                  "Species Loss" = "IS_LOSS",
                                  "Species Stay" = "IS_STAY",
                                  "Species Gain" = "IS_GAIN")
     TR$IS_Name_OU_Option1_selected <- "IS_SR"
     TR$IS_Name_OU_Option2 <- "Vulnerability Type"
     TR$IS_Name_OU_Option2_list <- c("Vulnerability1 (Species Loss)" = "IS_VI1",
                                  "Vulnerability2 (Species Loss Ratio)" = "IS_VI2",
                                  "Vulnerability3 (Species Inside Loss Outside Gain)" = "IS_VI3")
     TR$IS_Name_OU_Option2_selected <- "IS_VI1"
     TR$VH_Name <- "Climate Vulnerable Habitat"
     TR$VH_Name_Analysis <- "Change Analysis"
     TR$VH_Name_Out <- "Model Outputs"
     TR$VH_Name_Out_Dir <- "Habitat Assessment Output Folder"
     TR$VH_Name_Out_SR <- "Species Richness"
     TR$VH_Name_Out_SL <- "Species Loss"
     TR$VH_Name_Out_SS <- "Species Stay"
     TR$VH_Name_Out_SI <- "Species Introduction"
     TR$VH_Name_Out_VI1 <- "Vulnerability 1"
     TR$VH_Name_Out_VI2 <- "Vulnerability 2"
     TR$VH_Name_Out_VI3 <- "Vulnerability 3"
     TR$VH_Name_Out_Map <- "Map"
     TR$VH_Name_Out_SIDO <- "SIDO"
     TR$VH_Name_Out_SGG <- "SIGUNGU"
     TR$VH_Name_Out_NP <- "National Park"
     TR$VH_Name_Out_BR <- "Baekdu Range"
     TR$VH_Name_Out_DMZ <- "DMZ"
     TR$VH_Name_Out_Stat <- "Statistics"
     TR$VH_Name_DM_Models <- "DIspersal Types"
     TR$VH_Name_DM_Models_list <- DM_Models_list
     TR$VH_Name_DM_Models_selected <- "UD"    
     TR$VH_Name_CD_Models <- "Climate Models"
     TR$VH_Name_CD_Models_list <- TR$CD_Models_list
     TR$VH_Name_CD_Models_selected <- "KMA"    
     TR$VH_Name_CD_Scenarios <- "Climate Scenarios"
     TR$VH_Name_CD_Scenarios_list <- CD_Scenarios_list
     TR$VH_Name_CD_Scenarios_selected <- "RCP4.5"    
     TR$VH_Name_CD_Year <- "Projecting Years"
     TR$VH_Name_CD_Year_list <- CD_Year_list
     TR$VH_Name_CD_Year_selected <- "2000"
     TR$VH_Name_models <- "Model types"
     TR$VH_Name_models_list <- SDM_models_list
     TR$VH_Name_models_selected <- "GLM"
     TR$VH_Name_EMmodels <- "Ensemble"
     TR$VH_Name_models_run <- "Run"
     TR$VH_Name_Dir <- "Habitat Assessment Output Folder"
     TR$VH_Name_Action <- "Assessing Impact and Vulnerabilty"
     TR$VH_Name_Action_Habitat <- "Grouping by Habitat"
     TR$VH_Name_Habitat <- "Select a Habitat Type"
     TR$VH_Name_Habitat_list <- c("SIDO" = "SD",
                               "SIGUNGU" = "SGG",
                               "National Park" = "NP",
                               "Baekdu Range" = "BR",
                               "DMZ" = "DMZ")
     TR$VH_Name_Habitat_selected <- "SD" 
     TR$VH_Name_models_out <- "Model types"
     TR$VH_Name_models_out_list <- SDM_models_out_list
     TR$VH_Name_models_out_selected <- "GLM"
     TR$VH_Name_CD_Models_out <- "Climate Models"
     TR$VH_Name_CD_Models_out_list <- TR$CD_Models_list
     TR$VH_Name_CD_Models_out_selected <- "KMA"    
     TR$VH_Name_CD_Scenarios_out <- "Climate Scenarios"
     TR$VH_Name_CD_Scenarios_out_list <- CD_Scenarios_list
     TR$VH_Name_CD_Scenarios_out_selected <- "RCP4.5"    
     TR$VH_Name_CD_Year_out <- "Projecting Years"
     TR$VH_Name_CD_Year_out_list <- CD_Year_list
     TR$VH_Name_CD_Year_out_selected <- "2000"
     TR$VH_Name_Group1_list <- c("by Species" = "Species",
                              "by Climate Model" = "Climate_Model",
                              "by Climate Scenario" = "Climate_Scenario",
                              "by Model" = "Model",
                              "by Year" = "Year")
     TR$VH_Name_Group1_selected <- "Year"
     TR$VH_Name_Group2_list <- c("by Species" = "Species",
                              "by Climate Model" = "Climate_Model",
                              "by Climate Scenario" = "Climate_Scenario",
                              "by Model" = "Model")
     TR$VH_Name_Group2_selected <- "Model"
     HELP_Name <- "Help"
     
     
     
   } else if (TR$SE_Language == "Korean") {
     TR$System_Name <- "생태계 기후변화 영향 및 취약성 평가모형" 
     TR$OV_Name <- "모형개요"
     
     TR$LD_Variables_list  <- c("토지이용" = "landuse",
                             "산불" = "forestfire",
                             "산사태" = "landslide")
     TR$CD_Variables_list <- c("BIOCLIM 01 (연평균 기온)" = "bio01",
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
     TR$SDM_Variables_list <- c("BIOCLIM 01 (연평균 기온)" = paste("bio01.", Input_img, sep = ""),
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
     TR$CD_Models_list <- c("KMA (기상청)" = "KMA",
                         "KEI (한국환경정책평가연구원)" = "KEI")
     
     
     
     
     TR$SE_Name_System <- "MOTIVE ECOSYSTEM (생태계 기후변화 영향 및 취약성 평가모형)"
     TR$SE_Name <- "환경설정"
     TR$SE_Name_Language <- "언어"
     TR$SE_Name_WE <- "작업환경"
     TR$SE_Name_WE_Project <- "작업디렉토리"
     TR$SE_Name_DE <- "데이터환경"
     TR$SE_Name_DE_Climate <- "기후자료"
     TR$SE_Name_DE_Link <- "연계자료"
     TR$SE_Name_DE_Species <- "생물종자료"
     TR$SE_Name_DE_Species_Index <- "생물종정보 인덱스 자료 (CSV file)"
     TR$SE_Name_DE_Species_Location <- "생물종위치자료 (CSV file)"
     TR$SP_Name <- "생물종자료"
     TR$SP_Name_Info <- "생물종정보"
     TR$SP_Name_Location <- "생물종위치"
     TR$LD_Name <- "연계자료"
     TR$LD_Name_Map <- "지도"
     TR$LD_Name_Summary <- "통계"
     TR$LD_Name_Variables <- "연계자료"
     TR$LD_Name_Variables_list <- TR$LD_Variables_list
     TR$LD_Name_Variables_selected <- "forestfire"
     TR$LD_Name_Models <- "기후모델"
     TR$LD_Name_Models_list <- TR$CD_Models_list
     TR$LD_Name_Models_selected <- "KMA"    
     TR$LD_Name_Scenarios <- "기후시나리오"
     TR$LD_Name_Scenarios_list <- CD_Scenarios_list
     TR$LD_Name_Scenarios_selected <- "RCP4.5"    
     TR$LD_Name_Year <- "예측년도"
     TR$LD_Name_Year_list <- CD_Year_list
     TR$LD_Name_Year_selected <- "2000"       
     TR$CD_Name <- "기후자료"
     TR$CD_Name_Map <- "지도"
     TR$CD_Name_Summary <- "통계"
     TR$CD_Name_Variables <- "기후변수"
     TR$CD_Name_Variables_list <- TR$CD_Variables_list
     TR$CD_Name_Variables_selected <- "bio01"
     TR$CD_Name_Models <- "기후모델"
     TR$CD_Name_Models_list <- TR$CD_Models_list
     TR$CD_Name_Models_selected <- "KMA"    
     TR$CD_Name_Scenarios <- "기후시나리오"
     TR$CD_Name_Scenarios_list <- CD_Scenarios_list
     TR$CD_Name_Scenarios_selected <- "RCP4.5"    
     TR$CD_Name_Year <- "예측년도"
     TR$CD_Name_Year_list <- CD_Year_list
     TR$CD_Name_Year_selected <- "2000"     
     TR$SDM_Name <- "종분포모형"
     TR$SDM_Name_Model <- "모형구동"
     TR$SDM_Name_Model_Species <- "종선택"
     TR$SDM_Name_Model_Projection <- "예측옵션"
     TR$SDM_Name_Model_Variable <- "변수선택"
     TR$SDM_Name_Model_SDM <- "SDM 모형"
     TR$SDM_Name_Model_Out <- "모형결과"
     TR$SDM_Name_Model_Out_Validation <- "모형검증"
     TR$SDM_Name_Model_Out_Contribution <- "변수기여도"
     TR$SDM_Name_Model_Out_Probability <- "확률지도"
     TR$SDM_Name_Model_Out_Prediction <- "예측지도"
     TR$SDM_Name_CD_Variables <- "기후변수"
     TR$SDM_Name_CD_Variables_list <- TR$SDM_Variables_list
     TR$SDM_Name_CD_Variables_selected <- c(paste("bio01.", Input_img, sep = ""), paste("bio02.", Input_img, sep = ""), paste("bio03.", Input_img, sep = ""), paste("bio12.", Input_img, sep = ""), paste("bio13.", Input_img, sep = ""), paste("bio14.", Input_img, sep = ""))
     TR$SDM_Name_CD_Models <- "기후모델"
     TR$SDM_Name_CD_Models_list <- TR$CD_Models_list
     TR$SDM_Name_CD_Models_selected <- "KMA"    
     TR$SDM_Name_CD_Scenarios <- "기후시나리오"
     TR$SDM_Name_CD_Scenarios_list <- CD_Scenarios_list
     TR$SDM_Name_CD_Scenarios_selected <- "RCP4.5"    
     TR$SDM_Name_CD_Year <- "예측년도"
     TR$SDM_Name_CD_Year_list <- CD_Year_list
     TR$SDM_Name_CD_Year_selected <- "2000"
     TR$SDM_Name_models <- "모델유형"
     TR$SDM_Name_models_list <- SDM_models_list
     TR$SDM_Name_models_selected <- "GLM"
     TR$SDM_Name_EMmodels <- "앙상블"
     TR$SDM_Name_models_run <- "Run"
     TR$SDM_Name_models_out <- "모델유형"
     TR$SDM_Name_models_out_list <- SDM_models_out_list
     TR$SDM_Name_models_out_selected <- "GLM"
     TR$SDM_Name_CD_Models_out <- "기후모델"
     TR$SDM_Name_CD_Models_out_list <- TR$CD_Models_list
     TR$SDM_Name_CD_Models_out_selected <- "KMA"    
     TR$SDM_Name_CD_Scenarios_out <- "기후시나리오"
     TR$SDM_Name_CD_Scenarios_out_list <- CD_Scenarios_list
     TR$SDM_Name_CD_Scenarios_out_selected <- "RCP4.5"    
     TR$SDM_Name_CD_Year_out <- "예측년도"
     TR$SDM_Name_CD_Year_out_list <- CD_Year_list
     TR$SDM_Name_CD_Year_out_selected <- "2000"
     TR$DM_Name <- "종확산모형"
     TR$DM_Name_Model <- "모형구동"
     TR$DM_Name_Model_Out <- "모형결과"
     TR$DM_Name_Out_Plot <- "생물종 분포변화"
     TR$DM_Name_DM_MO_Barriers <- "장애물"
     TR$DM_Name_DM_MO_Barriers_list <- TR$LD_Variables_list
     TR$DM_Name_DM_MO_Barriers_selected <- "landuse" 
     TR$DM_Name_DM_MO_Slider <- "확산거리를 입력하세요"
     TR$DM_Name_DM_MO_Action <- "실행"
     TR$DM_Name_DM_Models <- "확산모델"
     TR$DM_Name_DM_Models_list <- DM_Models_list
     TR$DM_Name_DM_Models_selected <- "UD" 
     TR$DM_Name_CD_Models <- "기후모델"
     TR$DM_Name_CD_Models_list <- TR$CD_Models_list
     TR$DM_Name_CD_Models_selected <- "KMA"    
     TR$DM_Name_CD_Scenarios <- "기후시나리오"
     TR$DM_Name_CD_Scenarios_list <- CD_Scenarios_list
     TR$DM_Name_CD_Scenarios_selected <- "RCP4.5"    
     TR$DM_Name_CD_Year <- "예측년도"
     TR$DM_Name_CD_Year_list <- CD_Year_list
     TR$DM_Name_CD_Year_selected <- "2000"
     TR$DM_Name_models <- "모델유형"
     TR$DM_Name_models_list <- SDM_models_list
     TR$DM_Name_models_selected <- "GLM"
     TR$DM_Name_EMmodels <- "앙상블"
     TR$DM_Name_models_run <- "실행"
     TR$DM_Name_models_out <- "모델유형"
     TR$DM_Name_models_out_list <- SDM_models_out_list
     TR$DM_Name_models_out_selected <- "GLM"
     TR$DM_Name_CD_Models_out <- "기후모델"
     TR$DM_Name_CD_Models_out_list <- TR$CD_Models_list
     TR$DM_Name_CD_Models_out_selected <- "KMA"    
     TR$DM_Name_CD_Scenarios_out <- "기후시나리오"
     TR$DM_Name_CD_Scenarios_out_list <- CD_Scenarios_list
     TR$DM_Name_CD_Scenarios_out_selected <- "RCP4.5"    
     TR$DM_Name_CD_Year_out <- "예측년도"
     TR$DM_Name_CD_Year_out_list <- CD_Year_list
     TR$DM_Name_CD_Year_out_selected <- "2000"
     TR$SS_Name <- "기후변화민감종"
     TR$SS_Name_Analysis <- "영향 및 취약성평가"
     TR$SS_Name_Out <- "평가결과"
     TR$SS_Name_Out_ChangePlot <- "분포변화 결과"
     TR$SS_Name_Out_Pattern <- "취약성 패턴"
     TR$SS_Name_Out_Vulnerabiity <- "취약성 순위"
     TR$SS_Name_DM_Models <- "확산유형"
     TR$SS_Name_DM_Models_list <- DM_Models_list
     TR$SS_Name_DM_Models_selected <- "UD"    
     TR$SS_Name_CD_Models <- "기후모델"
     TR$SS_Name_CD_Models_list <- TR$CD_Models_list
     TR$SS_Name_CD_Models_selected <- "KMA"    
     TR$SS_Name_CD_Scenarios <- "기후시나리오"
     TR$SS_Name_CD_Scenarios_list <- CD_Scenarios_list
     TR$SS_Name_CD_Scenarios_selected <- "RCP4.5"    
     TR$SS_Name_CD_Year <- "예측년도"
     TR$SS_Name_CD_Year_list <- CD_Year_list
     TR$SS_Name_CD_Year_selected <- "2000"
     TR$SS_Name_models <- "모델유형"
     TR$SS_Name_models_list <- SDM_models_list
     TR$SS_Name_models_selected <- "GLM"
     TR$SS_Name_EMmodels <- "앙상블"
     TR$SS_Name_models_run <- "실행"
     TR$SS_Name_models_out <- "모델유형"
     TR$SS_Name_models_out_list <- SDM_models_out_list
     TR$SS_Name_models_out_selected <- "GLM"
     TR$SS_Name_CD_Models_out <- "기후모델"
     TR$SS_Name_CD_Models_out_list <- TR$CD_Models_list
     TR$SS_Name_CD_Models_out_selected <- "KMA"    
     TR$SS_Name_CD_Scenarios_out <- "기후시나리오"
     TR$SS_Name_CD_Scenarios_out_list <- CD_Scenarios_list
     TR$SS_Name_CD_Scenarios_out_selected <- "RCP4.5"    
     TR$SS_Name_CD_Year_out <- "예측년도"
     TR$SS_Name_CD_Year_out_list <- CD_Year_list
     TR$SS_Name_CD_Year_out_selected <- "2000"
     TR$SS_Name_Group1_list <- c("생물종별" = "Species",
                              "기후모델별" = "Climate_Model",
                              "기후시나리오별" = "Climate_Scenario",
                              "모델유형별" = "Model",
                              "예측년도별" = "Year")
     TR$SS_Name_Group1_selected <- "Year"
     TR$SS_Name_Group2_list <- c("생물종별" = "Species",
                              "기후모델별" = "Climate_Model",
                              "기후시나리오별" = "Climate_Scenario",
                              "모델유형별" = "Model")
     TR$SS_Name_Group2_selected <- "Model"
     TR$IS_Name <- "외래종"
     TR$IS_Name_Anlayis <- "영향 평가"
     TR$IS_Name_Out <- "평가결과"
     TR$IS_Name_Out_Species <- "외래종분포"
     TR$IS_Name_Out_SR <- "외래종 풍부도"
     TR$IS_Name_Out_SI <- "외래종 유입"
     TR$IS_Name_Out_Map <- "지도"
     TR$IS_Name_Out_SIDO <- "시도"
     TR$IS_Name_Out_SGG <- "시군구"
     TR$IS_Name_Out_Stat <- "통계"
     TR$IS_Name_DM_Models <- "확산유형"
     TR$IS_Name_DM_Models_list <- DM_Models_list
     TR$IS_Name_DM_Models_selected <- "UD"    
     TR$IS_Name_CD_Models <- "기후모델"
     TR$IS_Name_CD_Models_list <- TR$CD_Models_list
     TR$IS_Name_CD_Models_selected <- "KMA"    
     TR$IS_Name_CD_Scenarios <- "기후시나리오"
     TR$IS_Name_CD_Scenarios_list <- CD_Scenarios_list
     TR$IS_Name_CD_Scenarios_selected <- "RCP4.5"    
     TR$IS_Name_CD_Year <- "예측년도"
     TR$IS_Name_CD_Year_list <- CD_Year_list
     TR$IS_Name_CD_Year_selected <- "2000"
     TR$IS_Name_models <- "모델유형"
     TR$IS_Name_models_list <- SDM_models_list
     TR$IS_Name_models_selected <- "GLM"
     TR$IS_Name_EMmodels <- "앙상블"
     TR$IS_Name_models_run <- "실행"
     TR$IS_Name_models_out <- "모델유형"
     TR$IS_Name_models_out_list <- SDM_models_out_list
     TR$IS_Name_models_out_selected <- "GLM"
     TR$IS_Name_Dir <- "외래종 평가결과 폴더"
     TR$IS_Name_Action <- "영향 및 취약성 평가 실행"
     TR$IS_Name_Action_Admin <- "행정구역별로 결과분석"
     TR$IS_Name_Admin <- "행정구역유형을 선택하세요"
     TR$IS_Name_Admin_list <- c("시도" = "SD",
                             "시군구" = "SGG")
     TR$IS_Name_Admin_selected <- "SD" 
     TR$IS_Name_CD_Models_out <- "기후모델"
     TR$IS_Name_CD_Models_out_list <- TR$CD_Models_list
     TR$IS_Name_CD_Models_out_selected <- "KMA"    
     TR$IS_Name_CD_Scenarios_out <- "기후시나리오"
     TR$IS_Name_CD_Scenarios_out_list <- CD_Scenarios_list
     TR$IS_Name_CD_Scenarios_out_selected <- "RCP4.5"    
     TR$IS_Name_CD_Year_out <- "예측년도"
     TR$IS_Name_CD_Year_out_list <- CD_Year_list
     TR$IS_Name_CD_Year_out_selected <- "2000"
     TR$IS_Name_Group1_list <- c("by Species" = "Species",
                              "by Climate Model" = "Climate_Model",
                              "by Climate Scenario" = "Climate_Scenario",
                              "by Model" = "Model",
                              "by Year" = "Year")
     TR$IS_Name_Group1_selected <- "Year"
     TR$IS_Name_Group2_list <- c("by Species" = "Species",
                              "by Climate Model" = "Climate_Model",
                              "by Climate Scenario" = "Climate_Scenario",
                              "by Model" = "Model")
     TR$IS_Name_Group2_selected <- "Model"
     TR$IS_Name_OU_Option1 <- "Assessment Type"
     TR$IS_Name_OU_Option1_list <- c("Species Richness" = "IS_SR",
                                  "Species Loss" = "IS_LOSS",
                                  "Species Stay" = "IS_STAY",
                                  "Species Gain" = "IS_GAIN")
     TR$IS_Name_OU_Option1_selected <- "IS_SR"
     TR$IS_Name_OU_Option2 <- "Vulnerability Type"
     TR$IS_Name_OU_Option2_list <- c("Vulnerability1 (Species Loss)" = "IS_VI1",
                                  "Vulnerability2 (Species Loss Ratio)" = "IS_VI2",
                                  "Vulnerability3 (Species Inside Loss Outside Gain)" = "IS_VI3")
     TR$IS_Name_OU_Option2_selected <- "IS_VI1"
     TR$VH_Name <- "취약서식지"
     TR$VH_Name_Analysis <- "영향 및 취약성평가"
     TR$VH_Name_Out <- "평가결과"
     TR$VH_Name_Out_Dir <- "평가결과 디렉토리"
     TR$VH_Name_Out_SR <- "생물종 풍부도"
     TR$VH_Name_Out_SL <- "생물종 소실"
     TR$VH_Name_Out_SS <- "생물종 유지"
     TR$VH_Name_Out_SI <- "생물종 유입"
     TR$VH_Name_Out_VI1 <- "취약성평가 1"
     TR$VH_Name_Out_VI2 <- "취약성평가 2"
     TR$VH_Name_Out_VI3 <- "취약성평가 3"
     TR$VH_Name_Out_Map <- "지도"
     TR$VH_Name_Out_SIDO <- "시도"
     TR$VH_Name_Out_SGG <- "시군구"
     TR$VH_Name_Out_NP <- "국립공원"
     TR$VH_Name_Out_BR <- "백두대간"
     TR$VH_Name_Out_DMZ <- "DMZ"
     TR$VH_Name_Out_Stat <- "통계"
     TR$VH_Name_DM_Models <- "확산유형"
     TR$VH_Name_DM_Models_list <- DM_Models_list
     TR$VH_Name_DM_Models_selected <- "UD"    
     TR$VH_Name_CD_Models <- "기후모델"
     TR$VH_Name_CD_Models_list <- TR$CD_Models_list
     TR$VH_Name_CD_Models_selected <- "KMA"    
     TR$VH_Name_CD_Scenarios <- "기후시나리오"
     TR$VH_Name_CD_Scenarios_list <- CD_Scenarios_list
     TR$VH_Name_CD_Scenarios_selected <- "RCP4.5"    
     TR$VH_Name_CD_Year <- "예측년도"
     TR$VH_Name_CD_Year_list <- CD_Year_list
     TR$VH_Name_CD_Year_selected <- "2000"
     TR$VH_Name_models <- "모델유형"
     TR$VH_Name_models_list <- SDM_models_list
     TR$VH_Name_models_selected <- "GLM"
     TR$VH_Name_EMmodels <- "앙상블"
     TR$VH_Name_models_run <- "실행"
     TR$VH_Name_Dir <- "서식지 평가결과 폴더"
     TR$VH_Name_Action <- "영향 및 취약성 평가 실행"
     TR$VH_Name_Action_Habitat <- "서식지별로 결과분석"
     TR$VH_Name_Habitat <- "서식지유형을 선택하세요"
     TR$VH_Name_Habitat_list <- c("시도" = "SD",
                               "시군구" = "SGG",
                               "국립공원" = "NP",
                               "백두대간" = "BR",
                               "DMZ" = "DMZ")
     TR$VH_Name_Habitat_selected <- "SD" 
     TR$VH_Name_models_out <- "모델유형"
     TR$VH_Name_models_out_list <- SDM_models_out_list
     TR$VH_Name_models_out_selected <- "GLM"
     TR$VH_Name_CD_Models_out <- "기후모델"
     TR$VH_Name_CD_Models_out_list <- TR$CD_Models_list
     TR$VH_Name_CD_Models_out_selected <- "KMA"    
     TR$VH_Name_CD_Scenarios_out <- "기후시나리오"
     TR$VH_Name_CD_Scenarios_out_list <- CD_Scenarios_list
     TR$VH_Name_CD_Scenarios_out_selected <- "RCP4.5"    
     TR$VH_Name_CD_Year_out <- "예측년도"
     TR$VH_Name_CD_Year_out_list <- CD_Year_list
     TR$VH_Name_CD_Year_out_selected <- "2000"
     TR$HELP_Name <- "도움말"
     
   }

)



System_Name <- ""


