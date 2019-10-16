
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
