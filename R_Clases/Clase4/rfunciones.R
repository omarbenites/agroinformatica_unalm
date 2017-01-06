library(readxl)
library(openxlsx)

install.packages(c("readxl","openxlsx"))

# Buscamos el archivo y capturamos la direccion
fp <- file.choose()
# Usamos el paquete readxl y examinamos las hojas o 'sheets' del archivo
hojas <- excel_sheets(fp)

# Vamos a leer la o sheet que deseamos
cultivo <- "Tomate"
datos <- read_excel(fp , sheet =  cultivo)

# Creamos el nombre
file <- paste(cultivo, ".xlsx", sep = "")

# Crea en memoria el archivo
wb <- createWorkbook()

# Agregamos un sheet o hoja al archivo
addWorksheet(wb, sheetName = cultivo)

# Escribir los datos de la hoja "Tomate" en un nuevo archivo
writeData(wb, sheet = cultivo, datos)

#salvamos los datos
saveWorkbook(wb, file = file, overwrite = TRUE)

shell.exec(file)


# Generando Funciones -----------------------------------------------------

# Las funciones sirven para automatizar procesos. Se basan en el concepto de
# recursividad, el cual busca simplificar procesos repetitivos en uno solo.

# Estas constan de dos elementos:

# - function name: el nombre que le vamos asignar a la funcion. Esta se genera
# usando:  nombre_de_la_funcion <- function(arg1, arg2, arg3, ...)

# - args o argumentos/parametros: son los inputs o elementos de entrada 
# que requiere la funcion.

# - outputs: las salidas que generan estas funciones.

# Ejemplo 1

# Identificar los argumentos o parametros de entrada que se repiten a lo largo
# del script

# Podemos identificar : 

# A partir de este script vamos a crear una funcione

# Input1: nombre o ruta del archivo
# Input2: Nombre del cultivo (cultivo)

dt_tranf <- function(fp, cultivo) {

#cultivo <- "Tomate"
datos <- readxl::read_excel(fp,sheet =  cultivo)

file <- paste(cultivo, ".xlsx", sep = "")

wb <- createWorkbook()
addWorksheet(wb, sheetName = cultivo)
writeData(wb, sheet = cultivo, datos)
saveWorkbook(wb, file = file, overwrite = TRUE)
shell.exec(file = file)

}

dt_tranf(fp = fp, cultivo = "Tomate")
dt_tranf(fp = fp, cultivo = "Arroz")
dt_tranf(fp = fp, cultivo = "yuca")


# Observacion:

# En el caso de tener solamente 3 tablas, eliminar la primera.
# Solo quedarse con las 2 ultimas.





# dt_transf <- function(fp, cultivo){
#   
#   #cultivo <- "Tomate"
#   datos <- readxl::read_excel(fp, sheet =  cultivo)
#   
#   #usuario <- "omar_pablo"
#   file <- paste(cultivo, ".xlsx", sep = "")
#   
#   wb <- createWorkbook()
#   addWorksheet(wb, sheetName = cultivo)
#   writeData(wb, sheet = cultivo, datos)
#   saveWorkbook(wb, file = file, overwrite = TRUE)
#   
# }

  
  





