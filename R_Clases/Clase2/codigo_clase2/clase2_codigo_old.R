fp <- file.choose()
fp
#fp <- "C:\\OMAR_2016\\Curso_R_UNALM\\clase2\\dataset_clase2\\combinado.csv"
#fp <-  "D:\\OMAR_2016\\CURSOS_R_UNALM\\dataset_clase2\\combinado.csv"
datos <- read.csv(fp)
datos
#head : es una funcion para ver las primeras filas de la tabla
head(datos)

# Anho: 2012, 2013
# LUGARES: CHIARA, LA VICTORIA, CIP SAN RAMON, CIPHQ
# Genotipos: 28 genotipos
# ATMW	:	Average marketable tuber weight
# AVDM	:	Average Dry Matter
# Chip_Color	:	Chipping color
# MTWP	:	Marketable tuber weight/plot
# MTWPL	:	Marketable tuber weight/plant
# MTYA	:	Marketable tuber yield adjusted
# MTYNA	:	Marketable tuber yield no adjusted
# NMTP	:	Number marketable tubers/plot
# NPH	:	Number of plants harvested
# NTP	:	Number of tubers planted
# Plant_Vigor	:	Plant vigor
# PPH	:	Percentage of plants harvested
# SE	:	Senescence
# Tuber_Apper	:	Tuber Appearance

####En el data set todas las variables catagoricas tiene un simbolo de "_"


#### MANIPULACION DE DATOS #####
library(dplyr)
##Seleccionar Columnas con la funcion select()



#De la forma convencional con R
#Selccionamos el anho, la ubiacion y el genotipo
datos[,c("YEAR")]

datos[, c("YEAR","LOCATION","GENOTIPO")]
#Seleccionar Columnas con la funcion select() [con dplyr]

select(.data = datos,YEAR)


select(.data = datos, YEAR,LOCATION,GENOTIPO)

#Funcion "names" : names(nombre del data.frame o tabla de datos)
names(datos)

#Ejercicio: seleccionar las columnas MONTH, PLOT, REP Y GENOTIPO
clase2 <- select(.data = datos, -GENOTIPO)
names(clase2)
#Que pasa si 
#select(.data = datos, -YEAR,LOCATION,GENOTIPO)


#Partial Matching 
#Las variables que esten relacionadas  "Marketable" y la columna YEAR
select(.data = datos, YEAR, contains("MT"))

#La columna YEAR, LOCATION Y que contenga MT
select(.data = datos, YEAR, LOCATION, contains("MT") )
#Ejercicio: Extraer las columnas YEAR, PLOT, REP, GENOTIPO Y
#las columnas que esten relacionadas a "Total Tuber" 
select(.data = datos, YEAR, PLOT, REP, GENOTIPO, contains("TT"))

# Ejercicio extrarer las columnas con variables categoricas, la columna YEAR y MONTH
#select(.data = datos, YEAR:LOCATION, contains("MT"), contains("_"), contains("NP"))


####Filtrando Resultados
#funcion filter: filter(.data = datos, [CONDICION] columna == valor)
filter(.data = datos, YEAR == 2002 )
#Color del CHIP, en la escala 3
filter(.data = datos, Chip_Color == 3)

#Filtramos la tabla usando la ubicacion o LOCATION: "CHIARA"
filter(.data = datos, LOCATION == "CHIARA")

#Combinando Filtros: Para que se cumplea la condicion1 y la condicion2 usar el simbolo "&"
filter(.data = datos,  YEAR == 2002 & Chip_Color == 3)

#Filtro de Condicion Super Multiple :)
filter(.data = datos,  YEAR == 2002 & Chip_Color==3 & 10<MTYA & MTYA< 15)



#Ejercicio 
## el anho o year es 2002 
## el la escala o color del chip es 3
## que Marketable tuber yield adjusted o rendimiento ajustado de tuberculo comercial mayor a 1- y menor-igual a 18



### “Chaining” or “Pipelining” o simplemente Encadenando resulados

sel <- select(.data = datos, YEAR,LOCATION,GENOTIPO,Chip_Color)
filter(sel, Chip_Color==3) 

#Pipping o Encadenamiento de Resultados
library(magrittr)
#Funcion pipe operator: %>%  (Presionan el Boton  Ctrl + Shift + M )

output <- datos %>%
  select( YEAR, LOCATION, Chip_Color) %>%
  filter(Chip_Color == 3 ) 

write.csv(output, file = "clase2.csv")
shell.exec("clase2.csv")


#AVDN >14
datos %>%
  select( YEAR:Chip_Color) %>%
  filter(AVDM > 14 )

### Resumen Estadisitco




