################## INTRODUCCION AL LENGUAJE R ################################# 


######### 1.- El editor de R ################

1+1
50-56
10*20
10/2

######### 2.- Las VARIABLES EN R ######
####

#Una variable en programación puede ser vista como el objeto que contendrá un valor o dato.
#El operador <- asignará el valor a la variable.
#En R: variable <- datos

###TRUCO: Presionar Ctrl + (signo menos '-' )


######### 2.1 - Como escribir Variables ###############


###### 2.1.1  - Forma Incorrecta
##Nunca con espacios: produce error
n vayas <- 18 

##Nunca con números adelante:  produce error
1cosecha <- 30

####No usar tildes, tampoco usar nombres largos: Muy dificil 
numero_de_plantas_cosechadas <- 10  


########  2.1.2- Forma Correcta

#### Usando letras  
edad <- 18

## Usando terminos alfanuméricos: combina letras y números 
cosecha1<- 30 

## Con símbolos, puedes usar "_", "." :  
n_vayas <- 18

## De preferencia escribirlas con letras minúsculas y cortas
## Ejemplo: Numero de plantas cosechadas
npc <- 10


########### 3.- USO DE VARIABLES
x <- 1+1
x
y <- 50-56
y
w <- 10*20
w
z <- 10/2

###  USO DE VARIABLES -- Ejercicio 3.1 

## Número de tubérculos comerciales/parcela (ntmp) = 
#                Número de tubérculos comerciales categoría I/parcela (nmtci)   +                                                + 
#                Número de tubérculos comerciales categoría I/parcela (nmtci)
#
# Donde nmtci equivale a  210 tuberculos
# Donde nmtcii equivale 102 tuberculos
## Solucion 
nmtci <- 210 
nmtcii <- 102 
nmtp <-  nmtci + nmtcii
 
###  Ejercicio 3.2 
##
# Número de tubérculos comerciales/planta (nmtpl) = 
#                Número de tubérculos comerciales por parcela (nmtp)/
#                        Numero de plantas cosechas (nmc)
# Donde numero de plantas cosechadas (nmc) es 40
# Solucion:
#


######### 4.- TIPOS DE DATOS EN R  ############

##### En R existen 4 tipos de datos:
  
## 4.1.- Datos Numéricos: Son los números enteros, decimales
toneladas <- 1
hectáreas <- 3.25 

### 4.2.- Datos de Caracteres:
frase <- "Soy agronomo de corazon"
#
c_pulpa <- "naranja"

### 4.3.- Datos de Factor/Factores
## Concentracion de pesticida
csales <- c("bajo","medio","alto") 
csales <- factor(csales)
# Altitud del experimento
altitud <- c("1000m","2500m" )
altitud <- factor(altitud)

### 4.4.- Datos Logicos
vlogico <- TRUE
lg2 <- FALSE

### 4.5.- Datos Faltantes (Missing Values)
## NA significa Non-Assignment o No-Asignado
d_faltante <- NA     


### Ejercicio 4.1:  Crear 2 variables numericas, 2 variables de tipo caracter y 2 variable 
#                   tipo factor, que esten relacionadas a terminos agronomicos/biologicos.

 
#####  5.- ESTRUCTURA DE DATOS ######

## Vector: Es la estructura de datos mas simple en R. En R por defecto cualquier elemento
##         es un vector. Este puede ser numerico, caracter, logico, etc.
#
## Para construir un usamos: c()

anual <- c(2012,2013,2014,2015)  #vector numerico
pais <- c("peru","peru","peru","peru")  #vector de caracterer
rendimiento <- c(8.2,10.2,11.05,12.23 ) #toneladas por hectarea
cultivo <- c("papa","papa","papa","papa") #tipo de cultivo


## Data.frame: Es la estructura de datos mas usada en R. Permite juntar datos 
#de la misma dimensión y de diversos tipos (numérico,caracter, factor, etc) en forma de Tabla.

##Para construir un data frame usamos: data.frame(vector1, vector2, vector3, …, vectorN)
tabla_papa <- data.frame(pais,cultivo,anual,rendimiento)

#Para ver la que tipo de estructura usamos  'class(variable)'
class(tabla_papa)


####  Ejercicio 5.1 
### Construir 4 vectores y un data frame con el nombre palto, usando los siguientes items:
#anual: 2010
#provincia: Amazonas, Ancash, Lima y Ica
#cultivo: palta
#rendimiento: 10,329, 10,922, 11,658 y 14,221

### Ejercicio 5.2
### Construir 4 vectores y un data frame con el nombre  'sweetpotato' usando los siguientes items:
### Ver de que clase es 'sweetpotato'.

#ano de cosecha: 2010
#provincia: Tacna
#cultivo: "camote"
#virus: moteado plumoso (vmp) y virus del enanismo del camote (vepc). (Factor) 
#rendimiento 28.1, 21.7, 23.0 (bajo vmp) y 14.9, 10.6, 13.1 (vepc)
##Consejo: Usar abreviaciones en las variables


###### 7. LOS DATA FRAMES ####

#Para acceder a la estructura de un d.f usamos el comando str()
str(tabla_papa)

#'data.frame':	4 obs. of  4 variables:
#$ pais       : Factor w/ 1 level "peru": 1 1 1 1
#$ cultivo    : Factor w/ 1 level "papa": 1 1 1 1
#$ anual      : num  2012 2013 2014 2015
#$ rendimiento: num  8.2 10.2 11.1 12.2

#### Accediendo a las columnas del Data.Frame


## En el data frame tabla_papa tendremos, usaremos el simbolo ($) para acceder a las columnas del d.f:  
## Si deseo acceder a la columna 'pais':
tabla_papa$pais

#A la columna 'cultivo': 
tabla_papa$cultivo

#Ejercicio 7.1: Acceder  las siguientes columnas: anual y rendimiento.
#Ejercicio 7.2: Ver la estructura de la tabla 'sweepotato' y extraer sus columnas. 



#### 8.- Operaciones con Data Frames

## Nombre de las columnas: Se usa el comando names(data.frame)
colnames(tabla_potato)
#[1] "pais"        "cultivo"     "anual"       "rendimiento"

## Número de filas nrow(data.frame) y Número de Columnas ncol(data.frame)
ncol(tabla_papa)
#[1] 4
nrow(tabla_papa)
#[1] 4

#Resumen estadistico: Se usa el comando summary(data.frame)
summary(tabla_papa) 

#Ejercicio: Qué muestra el comando summary() ?
#Ejercicio: Realizar las mismas tareas para la tabla 'palto' y 'sweetpotato'


######## 8.- LIBRERIAS E IMPORTACION DE DATOS ###########
## El lenguaje R se compone principalmente de librerías y paquetes.
## Estos paquetes son de gran utilidad pues incorporan diferentes 
## funcionalidades para manipular y analizar nuestros datos.

##Para usar una libreria en R utilizamos: library(nombre_libreria)
library(utils)
library(stats)

##Para installar una nueva libreria/paquete utilizamos: install.packages(nombre_libreria)
#Este descarga de internet directamente.
install.packages("readxl")
install.packages("agricolae")


#### Uso de Funciones ####
## Las funciones son conjuntos de codigos para realizar una tarea especifica

#Las funciones son conjuntos de codigos para realizar una tarea especifica.
#Se componen de un input o argumento de entrada, y un output (salida)

#USO: nombre_funcion(argumento1, argumento2, argumento3, ...argumentoN)

##Ejemplo del uso de funciones 

#Función mean: Calcula la media o promedio aritmético de la muestra
#Función std: Calcula la desviación estándar de la muestra

# Ejemplo 1:
mean(tabla_papa$rendimiento) 

# Ejemplo 2:
sd(tabla_papa$rendimiento)

# Ejercicio 8.1: Aplicar la función mean() y sd() para las tablas sweetpotato y palto

#####9.- Importacion de Base de datos en R #########

### 9.1  Descripcion
# El lenguaje R se caracteriza en poder importar y
# manipular base datos desde diferentes fuentes de información (Excel, Minitab, SAS, Stata, etc) . 

# Los archivos de archivos de Microsoft Excel son el formato más usado 
# para importar al lenguaje R.

# El paquete usado para importar datos desde Excel es readxl.
# Para hacer uso del paquete readxl, escribimos


### 9.2 Importando archivos CSV

fp <- file.choose()
datos_csv <- read.csv(fp) 

#### 9.3 Importando Archivos Excel





#install.packages(“readxl”)
#library(readxl)

##file.choose: Busca y selecciona el nombre de archivo.
#En nuestro caso, fp : Nombre del archivo excel
fp <- file.choose() 



## Obtenemos los sheet u hojas de trabajo del archivo Excel
hojas <- excel_sheets(path = fp)

## Leemos la hoja que deseamos
datos <- read_excel(path = fp, sheet = 1)

## Si sabemos el nombre de la hoja
#datos <- read_excel(path = fp, sheet =  "Nombre de la Hoja")
datos <- read_excel(path = fp, sheet =  "Sheet1")


###Dataset MegaClones

#RYTHA: Yield of total roots per hectar computing tons per ha
#DM   : Storage root dry matter content
#FYTHA: Foliage total yield 

