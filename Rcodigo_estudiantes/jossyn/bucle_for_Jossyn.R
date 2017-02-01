vp <- c("canchan","tomasa","yungay","amarilla")
structure(vp)

#funcion print ("texto", variable)
print (paste("Una variedad de papa peruana es", vp [1]))
print (paste("Una variedad de papa peruana es", vp [2]))
print (paste("Una variedad de papa peruana es", vp [3]))
print (paste("Una variedad de papa peruana es", vp [4]))

for(i in 1:4){
  print (paste("Una variedad de papa peruana es", vp [i]))
}

#que sucede si el vector es largo y no sabemos cuantos elementos tiene

vp2 <- c("canchan","tomasa","yungay","amarilla","atrlantic","revolucion","hibrido69","morten20.10",
         "cipadv1","cipavd2")
#solucion : hallamos el numero de elementos del vector con "length()"
n <- length(vp2)
n

for(i in 1:10){
  print (paste("Una variedad de papa peruana es", vp2 [i]))
}

#creamos un vector vacio para almacenar lo avanzado, 
#para crear el vector usamos la funcion vector()

vec <- vector()

for(i in 1:n){
  vec[i]<- print (paste("Una variedad de papa peruana es", vp2 [i]))
}

#o tambien lo podemos almacenar en listas, usando la funcion :list()
#recordando listas
p <- list(a=1, b=2, c="unalm")
p

#iniciar lista: list()
lista <- list()

for(i in 1:n){
  lista[[i]]<- print (paste("Una variedad de papa peruana es", vp2 [i]))
}

#leyendo 1 archivo

ruta <- "data/Arroz2005.xlsx "
ruta
library(readxl)
datos <- read_excel(path = ruta,sheet=2)

#listando los archivos y creando las rutas

archivos <- list.files("data/")

rutas <- paste("data/",archivos, sep="")

#calculamos el numero de archivos 

n <- length(rutas)
datos <- list()
library(openxlsx)

#primera forma
for(i in 1:n){
  datos[[i]] <- read.xlsx(rutas[i],2)
}
datos
datos[[1]]

library(data.table)

#funcion :rbindlist
#esta funcion sirve para juntar una lista (tabla) ima
#como sabemos datos es una lista que contiene data.frames

tbem_arroz <- rbindlist(datos)

saveRDS(tbem_arroz,"tabla_arroz.rds")

#leyendo el archivo guardado
fp <- file.choose()
tbem_arroz <- readRDS(fp)

#agregamos la columna de nuestro cultivo (en inglés)
library(dplyr)
tbem_arroz <- mutate(tbem_arroz,crop="rice")

#vemos la tabla en el visor
#vemos la estructura de la tabla

structure(tbem_arroz)
head(tbem_arroz)
tail(tbem_arroz)

#Al ser pocas columnas, digitamos directo las columnas 2 al 6

for(i in 3:7){
  tbem_arroz[,i] <- as.numeric(tbem_arroz[,i])
}
saveRDS(tbem_arroz,"tabla_arroz.rds")

#Siguiente paso, subir al github