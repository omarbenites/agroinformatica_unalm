# # Declarando la funcion
# 
# library(readxl)
# library(openxlsx)
# library(tidyr)
# library(dplyr)
# library(openxlsx)
# 
# dt_tranf <- function(fp, cultivo, year) {
#   
#   fp <- file.choose()
#   #cultivo <- "Tomate"
#   datos <- readxl::read_excel(fp,sheet =  cultivo)
#   
#   file <- paste(cultivo, year, ".xlsx", sep = "")
#   
#   wb <- createWorkbook()
#   addWorksheet(wb, sheetName = cultivo)
#   writeData(wb, sheet = cultivo, datos)
#   saveWorkbook(wb, file = file, overwrite = TRUE)
#   shell.exec(file = file)
#   
# }
# 
# # Definiendo los parametros
# fp <- file.choose()
# cultivo <- "tomate"
# year <- 2009
# 
# 
# dt_tranf(fp = fp, cultivo = cultivo, year = year)
# 
# 
# 
# 
# dt_tranf(fp = fp, cultivo = cultivo, year = 2006)
# 
# dt_tranf(fp = fp, cultivo = cultivo, year = 2007)
# 
# dt_tranf(fp = fp, cultivo = cultivo, year = 2008)
# 
# dt_tranf(fp = fp, cultivo = cultivo, year = 2009)
# 
# dt_tranf(fp = fp, cultivo = cultivo, year = 2010)
# 
# dt_tranf(fp = fp, cultivo = cultivo, year = 2011)
# 
# dt_tranf(fp = fp, cultivo = cultivo, year = 2012)
# 
# dt_tranf(fp = fp, cultivo = cultivo, year = 2013)
# 
# dt_tranf(fp = fp, cultivo = "tomate", year = 2014)
# 
# 
# 
