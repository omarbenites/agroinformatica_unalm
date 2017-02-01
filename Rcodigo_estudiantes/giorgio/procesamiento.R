
#usar este archivo para crear los archivos utilizados en omar_proces, es una especie de lanzadera
dt_tranf <- function(fp,cultivo,year){
  #cultivo <- "camote"
  datos <- readxl::read_excel(fp,sheet =  cultivo)
  
  # usuario <- "omar_pablo"
  file <- paste(cultivo,year, ".xlsx", sep = "")
  
  wb <- createWorkbook()
  addWorksheet(wb, sheetName = cultivo)
  writeData(wb, sheet = cultivo, datos)
  saveWorkbook(wb, file = file, overwrite = TRUE)
  shell.exec(file = file)
}
#definiendo parametros
fp <- file.choose()
cultivo <- "camote"
year <- 2014
dt_tranf(fp=fp,cultivo=cultivo,year=year)