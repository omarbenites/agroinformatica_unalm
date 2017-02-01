#Declarando la funcion

library(readxl)
library(openxlsx)
library(tidyr)
library(dplyr)
library(openxlsx)

#Requiere instalacion stringr
library(stringr)

dt_tranf <- function(fp,cultivo, year){
  
  
  #cultivo <- "Tomate"
  datos <- readxl::read_excel(fp,sheet =  cultivo)
  
  # usuario <- "omar_pablo"
  file <- paste(cultivo,year, ".xlsx", sep = "")
  
  wb <- createWorkbook()
addWorksheet(wb, sheetName = cultivo)
  writeData(wb, sheet = cultivo, datos)
  saveWorkbook(wb, file = file, overwrite = TRUE)
  shell.exec(file=file)
}

# Definiendo los parametros 
fp <- file.choose()
cultivo <- "quinua"
year <- 2014
dt_tranf(fp=fp,cultivo = cultivo,year=year)
fp
