# como se escribe bucle "for"
vp <- c("canchan", "tomasa", "yungay", "amarilla")
# función print("texto", variable)
print( paste("una variable de papa peruana es", vp[1]))
print( paste("una variable de papa peruana es", vp[2]))
print( paste("una variable de papa peruana es", vp[3]))
print( paste("una variable de papa peruana es", vp[4]))

#uso del bucle "for" para no generar redundancia
for(i in 1:4){print( paste("una variable de papa peruana es", vp[i]))}

#que sucede si es vertor es largo y no sabemos cuantos elemntos tene
vp2 <- c("canchan","tomasa","yungay","amarilla","atlantic", "revolucion", "hibrido99"
         , "morten20.10","cipadv1", "cipadv2")

#solucion:hallamos el numero de elemntos del vector con "length"=tamaño
n <- length(vp2)

for(i in 1:n){print( paste("una variable de papa peruana es", vp2[i]))}

#como almacenamos el resultado:
#Inicializar: crear un vector vacio que almacenara cada resultado del bucle "for"
vec <- vector()
for(i in 1:n){vec[i] <-  print( paste("una variable de papa peruana es", vp2[i]))}

#o tambien lo podemos almacenar en listas, usando la fiuncion: list()
p <- list(a=1, b=2, c="unalm")

#inicializar una lista
lista <- list()

for(i in 1:n){lista[[i]] <-  print( paste("una variable de papa peruana es", vp2[i]))}
#lista almacena tablas, elementos, vectores,

#aplicacion a cropdatape

#leyendo 1 aechivo
ruta <- "data/quinua2005.xlsx"
library(readxl)
datos <-  read_excel(path=ruta, sheet=2)

#lisrando los archivos y creando las rutas: list.files
archivos <- list.files("data/")

rutas <-  paste("data/", archivos, sep = "")

#calculando el nuemro de rurtas
n <- length(rutas)
datos <- list()

#primera forma
library(openxlsx)
for(i in 1:n){datos[[i]] <- openxlsx::read.xlsx(rutas[i], 2)}
#ensamblaje de todas tablas
install.packages("data.table")
library(data.table)

#funcion rbindlist

tbem_quinua <- rbindlist(datos) 
saveRDS(tbem_quinua, "tabla_quinua.rds")
