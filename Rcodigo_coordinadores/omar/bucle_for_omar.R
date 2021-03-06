# Programacion en R -------------------------------------------------------
# Estructuras de control
#
# Definicion: Las estructuras de control permiten modificar el flujo
# de ejecución de las instrucciones de un programa. [wikipedia]. Dentro
# de las estructuras de control encontramos los llamados "loops" que
# nos permiten ejecutar un grupo de sentencias (de codigo) un numero
# determinado de veces.


# Bucle 'for': El bucle 'for'

# El bucle 'for' (loop 'for'): Nos permite indicar desde un inicio
# cuantas iteraciones (o numero de veces) podemos ejecutar un grupo
# de sentencias de nuestro código.

# Como se escribe un bucle 'for'

  # for (i in  vi:vf){
  #
  # }

#Donde i: es el valor que va ir iterando (o cambiado) un numero determinado de veces
#vi: valor inicial
#vf: valor finial


# Ejemplo1 ----------------------------------------------------------------

# Supongamos que tenemos 5 variedades de papa
# Y queremos imprimir el siguiente mensaje
# Sin 'for'

vp <- c("canchan", "tomasa", "yungay", "amarilla")

# funcion print("texto", variable)
print( paste("Una variedad de papa peruana es ", vp[1]) )
print( paste("Una variedad de papa peruana es ", vp[2]) )
print( paste("Una variedad de papa peruana es ", vp[3]) )
print( paste("Una variedad de papa peruana es ", vp[4]) )

for(i in 1:4){
  print (paste("Una variedad de papa peruana es ",vp[i]))
}


# Qué sucede si el vector es largo y no sabemos cuantos elementos tiene?
vp2 <- c("canchan", "tomasa", "yungay", "amarilla", "atlantic", "revolucion",
        "hibrido99", "morten20.10", "cipadv1","cipadv2")

# Solucion: hallamos el numero de elementos del vector con "length()"
n <- length(vp2)

for(i in 1:n){
  print (paste("Una variedad de papa peruana es ",vp2[i]))
}


# Como almacenamos el resultado del bucle for
# Solucion: creamos un vector vacio, para ir almacenando cada resultado

vp2 <- c("canchan", "tomasa", "yungay", "amarilla", "atlantic", "revolucion",
         "Hibrido99", "ADV19", "ADVCLONE20", "HER190.20", "WMORTEN")
n <- length(vp2)


# Para crear el vector vacio usamos la funcion: vector()

vec <- vector()

for(i in 1:n){
  vec[i] <- print (paste("Una variedad de papa peruana es ",vp2[i]))
}

# O tambien lo podemos almacenar en listas, usando la funcion: list()
# Recordando listas p <- list(a =1 , b = 2)

lista <- list()

for(i in 1:n){
  lista[[i]] <- print (paste("Una variedad de papa peruana es ",vp2[i]))
}

lista


# Aplicacion al paquete cropdatape ------------------------------------------------

# Leyendo 1 archivo
datos <- readxl::read_excel("data/tomate2005.xlsx", 2)

# Listando los archivos y creando las  rutas.
archivos <- list.files("data/")
rutas <- paste("data/", archivos, sep= "")


#Calculando el numero de elementos
n <- length(archivos)
datos <- list()

for( i in 1:n) {
    datos[[i]] <- openxlsx::read.xlsx(rutas[i], 2)
}


# Ensamblaje de todas tablas -------------------------------------------------

library(data.table)
# Funcion: rbindlist
# Esta funcion sirve para juntar juntar una lista (tabla) una debajo de otra.

# Como sabemos datos, es una lista que contine data.frames.
tbem_tomate <- rbindlist(datos)

saveRDS(tbem_tomate,"tabla_tomate.rds")

#leyendo el archivo guardado
fp <- file.choose()
tbem_tomate <- readRDS(fp)

#agregamos la columna de nuestro cultivo (en ingles)

library(dplyr)
tbem_tomate <- mutate(tbem_tomate, crop = "tomato")

#vemos la tabla en el visor
#vemos la estructura de la tabla

#Al ser pocas columnas, digitamos directo las columnsa 2 al 6
for ( i in 3:7){
  tbem_tomate[, i] <- as.numeric(tbem_tomate[,i])
}

saveRDS(tbem_tomate,"tabla_tomate.rds")


# Siguiente paso, subir al github

# Cada uno ira subiendo su archivo a github
# Solamente seleciona el archivo .rds











