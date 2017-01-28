# Ensamblaje de todas las tablas

fp <- file.choose()
dir <- dirname(fp)
archivos <- list.files(dir, pattern = ".rds")

rutas <- paste(dir, archivos, sep="/")

n <- length(rutas)
datos <- list()

for(i in 1:n){
  datos[[i]] <- readRDS(rutas[i])
}

library(data.table)

cropdatape <- rbindlist(datos)

saveRDS(cropdatape,"cropdatape.rds")


openxlsx::write.xlsx(cropdatape,"cropdatape.xlsx")


# salvar archivos por alumno



