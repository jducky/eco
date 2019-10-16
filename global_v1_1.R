
library(shiny)
library(shinyWidgets)
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

MOTIVE_Language <- "Korean"

if (MOTIVE_Language == "English") {
  Name_System <- "MoTIVE Ecosystem" 
  Name_SP <- "Species" 
  Name_SE <- "Setting"     
} else {
  Name_System <- "MOTIVE 생태계 기후변화 영향 및 취약성 평가모형" 
  Name_SP <- "종정보"
  Name_SE <- "환경설정"    
}
