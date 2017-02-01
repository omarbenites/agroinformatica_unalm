vp <- c("canchan","tomasa","yungay","amarilla")
vp
str(vp)



#bucle "for"
#for( i in 1:x)






#funci?n print ("texto",variable)

print(paste("Una variedad de papa peruana es",vp[1]))
print(paste("Una variedad de papa peruana es",vp[2]))
      
print(paste("Una variedad de papa peruana es",vp[3]))
      
print(paste("Una variedad de papa peruana es",vp[4]))
                  

for (i in 1:4){print(paste("Una variedad de papa peruana es ", vp[i]))}     
      
      
#que sucede si el vector es largo y no sabemos cuantos elementos tiene?

vp2 <- c("canchan","tomasa","yungay","amarilla","atlantic","revolucion","hibrido99",
        "montern20.10", "cipadv1", "cipadv2")

#Solucion, usar funcion "length"

n <-length(vp2)


for (i in 1:n){print(paste("Una variedad de papa peruana es ", vp2[i]))}     

      
#para crear el vector vacío usamos la función : vector()

vec <- vector()
            
for (i in 1:n){ 
  vec [i] <- print(paste("Una variedad de papa peruana es ", vp2[i]))}  



vec
vec[1]

#o tambien lo podemos almacenar en lsitas , usando la función: list ()
#recordando listas....
#las listas a diferencia de lso vectores nos pueden almacenar tablas enteras

p <- list(a=1, b=2, c="unalm")
p

#inicializar lista :list ()
lista <- list()

for (i in 1:n){ 
  lista[[i]] <- print(paste("Una variedad de papa peruana es ", vp2[i]))}  


#aplicacion al paquete cropdatape

#leyendo un archivo apretar tab para que aparescan las carpetas y otra ves tab para ver archivos

ruta <- "data/camote2005.xlsx"

library(readxl)

#usar sheet =2 pues es la data procesada
datos <- read_excel(path=ruta,sheet=2) 

#listamos archivos y creamos las rutas

archivos <- list.files("data/")

rutas <- paste("data/", archivos,sep="")

#calculando el número de elementos

n <- length(rutas)
n
datos <- list()

library(openxlsx)

for(i in 1:n){
  datos[[i]] <- read.xlsx(rutas[i],2)
}

install.packages("data.table")
rutas
library(data.table)
datos
library(data.table)
datos[2]
tbem_camote <- rbindlist(datos)
saveRDS(tbem_camote,"tabla_camote.rds") 

fp <- file.choose()
tbem_camote <- readRDS(fp)

#agregamos una columna en ingles
library(dplyr)
tbem_camote <- mutate(tbem_camote,crop= "sweet potato"
                      )
#vemos la tabla en el visor
#vemos la estructura de la tabla

str(tbem_camote)

#al ser pocas columnas , digitamos directo las columnas del 2 al 6
for(i in 3:7) {
  tbem_camote[,i] <- as.numeric(tbem_camote[,i])
}

saveRDS(tbem_camote,"tabla_camote.rds")



