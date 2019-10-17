
#####=========================================================
##### installing and Loading packages ========================
# Setting packages and library
packages <- c("shiny", "shinyWidgets", "shinyFiles", "shinyalert", "tiff", "sf", "SDMTools", "proj4", "gdata", "colorspace", "plyr", "leaflet", "RColorBrewer", "scales", "lattice", "dplyr", "maps", "sp", "biomod2", "raster", "rgdal", "ggplot2", "hrbrthemes", "plotly", "grid", "reshape", "stringr", "rgdal", "MigClim", "mgcv", "gsubfn", "DT", "fmsb", "data.table", "scales")
libraries <- c("shiny", "shinyWidgets", "shinyFiles", "shinyalert", "tiff", "sf", "SDMTools", "proj4", "gdata", "colorspace", "plyr", "leaflet", "RColorBrewer", "scales", "lattice", "dplyr", "maps", "sp", "biomod2", "raster", "rgdal", "ggplot2", "hrbrthemes", "plotly", "grid", "reshape", "stringr", "rgdal", "MigClim", "mgcv", "gsubfn", "DT", "fmsb", "data.table", "scales")

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

##### Path
G <- reactiveValues()
G$SE_Dir_Project <- "C:/MOTIVE_projects/proj1"
G$SE_Dir_Climate <- "C:/MOTIVE_Ecosystem/DATA/Climate2"
G$SE_Dir_Link <- "C:/MOTIVE_Ecosystem/DATA/Link" 
G$SE_Dir_Species <- "C:/MOTIVE_Ecosystem/DATA/Species" 
G$SE_speciesindex <- "speciesname_final.csv"
G$SE_specieslocation <- "shin_specieslocation.csv"
G_FILE_speciesindex <- read.csv(file.path(isolate(G$SE_Dir_Species), isolate(G$SE_speciesindex)), header = T, sep = ",")
G_FILE_specieslocation <- read.csv(file.path(isolate(G$SE_Dir_Species), isolate(G$SE_specieslocation)), header = T, sep = ",")
G_FILE_speciesfreq <- count(G_FILE_specieslocation, ID)
G_FILE_speciesinfo <- inner_join(G_FILE_speciesfreq, G_FILE_speciesindex, by = "ID")

G$IS_VA_Dir_Folder <- paste(isolate(G$SE_Dir_Project), "/Invasive_Species", sep = "")
G$IS_AO_Dir_Folder <- paste(isolate(G$SE_Dir_Project), "/Invasive_Species", sep = "")

#SDM <- reactiveValues(Name_Species_list = c("구상나무", "가문비나무"), Name_Species_selected = "구상나무")
#SDM <- reactiveValues(Name_Species_list = list.dirs(path = file.path(G$SE_Dir_Project, "Species_Distribution"), full.names = FALSE, recursive = FALSE),
#                       Name_Species_selected = "구상나무")

#Map <- reactiveValues()


##### Language

SE_Language <- "English"
# SE_Language <- "Korean"

if (SE_Language == "English") {
  LD_Variables_list  <- c("Landuse" = "landuse",
                          "Forest fire" = "forestfire",
                          "Landslide" = "landslide")  
} else if (SE_Language == "Korean") {    
  LD_Variables_list  <- c("토지이용" = "landuse",
     "산불" = "forestfire",
     "산사태" = "landslide")
}

if (SE_Language == "English") {
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
} else if (SE_Language == "Korean") {  
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
}

Input_img <- "tif"  #asc"
Output_img <- "tif"

if (SE_Language == "English") {
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
} else if (SE_Language == "Korean") {  
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
}



if (SE_Language == "English") {
    CD_Models_list <- c("KMA (Korea Meteorological Administration)" = "KMA",
                      "KEI (Korea Environment Institute)" = "KEI")  
} else if (SE_Language == "Korean") {  
    CD_Models_list <- c("KMA (기상청)" = "KMA",
                        "ENGIS (엔지스)" = "ENGIS",
     "KEI (한국환경정책평가연구원)" = "KEI")
}

#CD_Scenarios_list <- c("RCP 2.6" = "RCP2.6",
#                       "RCP 4.5" = "RCP4.5",
#                       "RCP 6.0" = "RCP6.0",
#  "RCP 8.5" = "RCP8.5")

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

#CD_Year_list <- c("2000" = "2000",
#                  "2050" = "2050",
#                  "2070" = "2070")

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
#                    "MAXENT (low-memory multinomial logistic regression)" = "MAXENT",
                    "Ensemble" = "EM")

DM_Models_list <- c("No Dispersal" = "ND",
                    "SDD (Short Dispersal Distance)" = "SDD",
                    "MDD (Middle Dispersal Distance)" = "MDD",
                    "LDD (Long Dispersal Distance)" = "LDD",
                    "Unlimited Dispersal" = "UD")

if (SE_Language == "English") {
  System_Name <- "MOTIVE ECOSYSTEM (Climate Change Impact and Vulnerability Assessment Model for Ecosystem)" 
  SE_Name <- "Setting"
    SE_Name_Language <- "Language"
  SP_Name <- "Species Data" 
  LD_Name <- "Link Data"
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
    # SDM_Name_models_selected <- "GLM"
    SDM_Name_models_selected <- "GAM"
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
    DM_Name_DM_Models <- "DIspersal Models"
    DM_Name_DM_Models_list <- DM_Models_list
    DM_Name_DM_Models_selected <- "UD" 
  SS_Name <- "Climate Sensitive Species"
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
  System_Name <- "MOTIVE ECOSYSTEM (생태계 기후변화 영향 및 취약성 평가모형)" 
  SE_Name <- "환경설정"
  SP_Name <- "종자료"
  LD_Name <- "연계자료"
    LD_Name_Variables <- "연계자료"
    LD_Name_Variables_list <- LD_Variables_list
    LD_Name_Variables_selected <- "forestfire"
    LD_Name_Models <- "기후모델"
    LD_Name_Models_list <- CD_Models_list
    LD_Name_Models_selected <- "KMA"    
    LD_Name_Scenarios <- "기후시나리오"
    LD_Name_Scenarios_list <- CD_Scenarios_list
    LD_Name_Scenarios_selected <- "RCP4.5"    
    LD_Name_Year <- "미래연도"
    LD_Name_Year_list <- CD_Year_list
    LD_Name_Year_selected <- "2000"       
  CD_Name <- "기후자료"
    CD_Name_Variables <- "기후변수"
    CD_Name_Variables_list <- CD_Variables_list
    CD_Name_Variables_selected <- "bio01"
    CD_Name_Models <- "기후모델"
    CD_Name_Models_list <- CD_Models_list
    CD_Name_Models_selected <- "KMA"    
    CD_Name_Scenarios <- "기후시나리오"
    CD_Name_Scenarios_list <- CD_Scenarios_list
    CD_Name_Scenarios_selected <- "RCP4.5"    
    CD_Name_Year <- "미래연도"
    CD_Name_Year_list <- CD_Year_list
    CD_Name_Year_selected <- "2000"     
  SDM_Name <- "종분포모형"
  DM_Name <- "종확산모형"
  SS_Name <- "기후변화민감종"
  IS_Name <- "외래종"
  VH_Name <- "취약서식지"
  HELP_Name <- "도움말"

}



