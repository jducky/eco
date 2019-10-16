
library(shiny)
library(shinyWidgets)
library(shinyFiles)
library(leaflet)
library(RColorBrewer)
library(scales)
library(lattice)
library(dplyr)
library(maps)
library(sp)
library(shinyalert)

# install.packages('raster', repos = 'http://r-forge.r-project.org/', type = 'source')

library(raster)
library(tiff)
library(rgdal)
library(sf)
library(SDMTools)
library(proj4)
library(gdata)
library(colorspace)
library(ggplot2)
library(plyr)



setwd("c:/Projects/GUI/Shiny/Motive/ecosystem")
rm(list = ls())

# Name_SP <- "종정보"
# Name_SE <- "환경설정"    

MOTIVE_Language <- "English"
#MOTIVE_Language <- "Korean"

if (MOTIVE_Language == "English") {
  System_Name <- "MoTIVE Ecosystem" 
  SP_Name <- "Species" 
  SE_Name <- "Setting"
  SE_Language_Name <- "Select Language"
  SE_Dir_Name <- "Chose directory"

} else {
  System_Name <- "MOTIVE 생태계 기후변화 영향 및 취약성 평가모형" 
  SP_Name <- "종정보"
  SE_Name <- "환경설정"
  SE_Language_Name <- "언어선택"
  SE_Dir_Name <- "저장폴더를 선택하세요."

}
