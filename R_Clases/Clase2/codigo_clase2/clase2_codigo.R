
# Manipulacion de Datos ---------------------------------------------------

library(ggplot2)
library(gapminder)
library(dplyr)
library(tidyr)
library(doBy)
#library(scales)

# En esta segunda parte pondremos en practica numerosas tecnicas de manipulacion de datos mediante
# el paquete dplyr

# A su vez haremos uso del paquete 'gapminder', paquete de datos que 
# contiene informacion relacionada a la población mundial, el GDP per capita
# y la poblacion mundial, dividos por pais y continente desde el año 1952 hasta el 2007 
# con intervalos de 5 años en cada observación.

#Por defecto gapminder esta en formato tibble.
datos <- gapminder


# Funcion 'select()' --------------------------------------------------------
# Esta funcion nos permite seleccionar 1 o mas columnas de una tabla de datos

# Seleccionas las columnas datos, country, continent
select(datos, country, continent, lifeExp)

# Seleccionar todas las columnas excepto country
select(datos, -country)

# Seleccionar por indice/posicion de columnas/variables
select(datos, 2:4,5)


# Funcion slice()    ------------------------------------
# Slice permite seleccionar filas en base a su posición 

# De la fila 10 hasta la 19. Ver que ahora empieza desde al anho 1997
slice(datos, 10:19)

# Selecionar la fila 10, 15, 18 , 19, 120, 124. 
# Creamos el vector v <- c(10, 15, 18 , 19, 120, 124)
v <- c(10, 15, 18 , 19, 120, 124)
slice(datos, v)



# Funcion 'filter()': Busqueda en base a valores  en columnas ------------------------
# Para ellos usamos el signo el signo igual dos veces ('==')

# Filtrar datos de la tabla relacionados al pais 'Peru'
filter(datos, country == 'Peru')

# Filtrar datos de la tabla relacionados al pais 'Peru'
filter(datos, country == 'Peru')

# Filtrar datos de la tabla relacionados al anho '1952'
filter(datos, year == '1952')


# Filter() con dos condiciones --------------------------------------------

# [1era forma] Filtrar datos de la tabla relacionados al pais 'Peru' y el anho '1952'
filter(datos, country == 'Peru' & year == '1952')

# [2da forma] Filtrar datos de la tabla relacionados al pais 'Peru' y el anho '1952'
filter(datos, country == 'Peru', year == '1952')


# filter() con mas de dos valores de busqueda -----------------------------

# Filtrar datos de la tabla relacionados a los paises 'Peru' y Bolivia
# En caso, al ser mas de un pais, contruimos el vector que contendra 'Peru' y 'Bolivia'

busqueda <- c("Peru","Bolivia") 
res <- filter(datos, country %in% busqueda)
res

#Nota: Todos los valores de nuestra busqueda fueron guardados en la variable res

# Tarea_1: Busqueda de paises: 'Argelia', 'Germany', 'Brasil', 'France', 'Malawi' 
# Tarea_2: Busqueda por anhos: '1952', '1962', '1967', '1977' 


# Busqueda Avanzada -------------------------------------------------------

# En muchos casos, las busquedas son más avanzadas. Necesitamos selecionar y filtrar al mismo tiempo,
# para luego guardar los resultados de nuestra busqueda.

# Problema 1: Seleccionar las columnas country, continent, lifeExp y ver los datos de Malawi.

# [1era forma]
res2 <- select(datos, country, continent, lifeExp)    
res2 # 3 columnas fueron seleccionadas
res2 <- filter(res, country == "Malawi")
res2 #del resultados anterior, filtramos/buscamos por el pais de Malawi

# [2da forma] (Mas rapida)
# Operador '%>%' pipe o tuberia. Presionar ctrl+shift+M para imprimirlo 
res2 <- datos %>% 
        select(country, continent, lifeExp) %>%
        filter(country == 'Malawi')
         

# Problema 2: Seleccionar las columnas country, continent, lifeExp, ver los datos de Malawi, 
# Haiti y Jamaica
valores <- c("Malawi", "Haiti", "Jamaica")
res3 <- datos %>% 
        select(country, continent, lifeExp) %>%
        filter(country %in% valores)


# Problema 3: Seleccionar las columnas country, continent, year, lifeExp, y ver la esperanzada de vida 
# de los paises mayor a 80 anhos

res3 <- datos %>% 
        select(country, continent, year, lifeExp) %>%
        filter(lifeExp>80)
res3

# Tarea buscar para los paises mayores a 70 anhos. Peru estará ahi? O ya vamos comprando el cajón?


# Problema 4: Seleccionar las columnas country, continent, year, lifeExp, y ver la esperanzada de vida 
# de los paises menor a 60 pero mayores a 40 anhos en Europa

res3 <- datos %>% 
        select(country, continent, year, lifeExp) %>%
        filter(continent =="Europe", lifeExp>40, lifeExp<60)
res3

# Problema 5: Que paises de Europa en el anho 2007 tuvieron una expectativa de vida mayor
# de 60 pero menor de 80 anhos.

res3 <- datos %>% 
  select(country, continent, year, lifeExp) %>%
  filter( continent == "Europe", year == 2007, lifeExp > 60 , lifeExp< 80)
res3


# Problema 6: Al problema anterior ordenar por por el año mas reciente

res3 <- datos %>% 
  select(country, continent, year, lifeExp) %>%
  filter( continent == "Europe", year == 2007, lifeExp > 60 , lifeExp< 80) %>%
  arrange(year)
res3

# Pregunta: Que pasa si queremos ordenar por 'gdpPercap'? Rpta:

res3 <- datos %>%
  select(country, continent, year, lifeExp) %>%
  filter( continent == "Europe", year == 2007, lifeExp > 60 , lifeExp< 80) %>%
  arrange(gdpPercap)
res3

# El problema es que 'gdpPercap' no esta seleccionado, por lo tanto aparecera un error 
# Solucion: Agregar 'gdpPercap' como columna seleccionada

res3 <- datos %>%
  select(country, continent, year, lifeExp, gdpPercap) %>%
  filter( continent == "Europe", year == 2007, lifeExp > 60 , lifeExp< 80) %>%
  arrange(gdpPercap)
res3


# Problema 7: Ordenar por el mayor ingreso al menor ingreso
# usamos el comando 'desc()'

res3 <- datos %>%
  select(country, continent, year, lifeExp, gdpPercap) %>%
  filter( continent == "Europe", year == 2007, lifeExp > 60 , lifeExp< 80) %>%
  arrange(desc(gdpPercap))
res3


# Función 'mutate()': Agrega nuevas columnas a nuestra tabla de datos

# Además de seleccionar y filtrar, es común agregar nuevas columnas. Estas columnas pueden ir
# desde agregar valores sencillos hasta los calculos más complejos.

mutate(datos, group = "Agroinformatics")
mutate(datos, mediciones = 5)

# Vamos a transformar el ingreso percapita (gdpPercap) de dolares a soles
# Multiplicaremos el 'gpdPercap' por el cambio de soles a dolares.

res4 <- mutate(datos, gpd_soles = gdpPercap*3.40)


# Funcion 'summarise()': Resumenes de datos usando funciones estadisticas

summarise(datos,
          delay = mean(gdpPercap, na.rm = TRUE))


# Resumen por pais (country)
by_country <- group_by(datos, country)
resumen <- summarise(by_country,
                   count = n(),
                   media    = mean(gdpPercap),
                   est_desv = sd(gdpPercap)
                   ) 

# Resumen por continente y anho (continent and year)
by_continent_year <- group_by(datos, continent, year)
resumen <- summarise(by_continent_year,
                          count = n(),
                          media    = mean(gdpPercap),
                          est_desv = sd(gdpPercap)
) 

# Tarea: Hacer un resumen por pais(country) del maximo y minimo valor del PBI o GDP percapita


# Visualización de Datos: La elegancia de graficos con 'ggplot2' -------------------------------



# grafico de histogramas.
# grafico de barras.
# grafico de disperscion o scatter diagram.


# Histrogramas o Histograms -----------------------------------------------
# Este grafico sirve para observar la distribucion de nuestros datos y/o observaciones

# Grafico 1: Variable quantitativa continua 
# Graficar la distribucion de la poblacion del ingreso per capita o gdpPercap en el anho 2007

gdp2007 <- datos %>%
           select(country, continent,year, gdpPercap) %>%
           filter(year == 2007)

# La grafica nos muestra como se distribuyen el ingreso per capita. 
# El eje 'X' nos muestra en ingreso per capita que fluctura de 0 hasta 50 000 dolares
# El eje 'y' es mas interesante, nos muestra las barras verticales que son el conteo de casos por cada
# por cada intervalo

# Histograma de conteo
p <-  ggplot(data = gdp2007, aes(x = gdpPercap)) %>%
      geom_histogram()

# Observacion: El mensaje `stat_bin()` using `bins = 30`. Pick better value with `binwidth`. nos indica
# que cada intervalo es tomado la treintava parte (1/30) del rango de datos (50000)


# Histograma de densidad
p <-  ggplot(data = gdp2007, aes(x = gdpPercap)) +
      geom_density()
p

# Histograma: Eje 'y' con notación normal o decimal
# library(scales)
# p <-  ggplot(data = gdp2007, aes(x = gdpPercap)) +
#       geom_density() +
#       scale_y_continuous(labels = comma) #comma es la notacion normal o decimal 
# p

# Diagrama de Barras o Barplot --------------------------------------------

# Graficamos una variable categorica (continent) y una continua (media del ingreso per capita (gdpPercap))

# Hacemos un resumen para hallar la media del ingreso per capita por continente
by_continent <- group_by(gdp2007, continent)
resumen <- summarise(by_continent,
                     count = n(),
                     media    = mean(gdpPercap)
) 

# Graficamos el diagrama de barra
b <- ggplot(data = resumen, aes(x = continent, y = media)) + 
     geom_bar(stat = "identity")+
     scale_y_continuous(labels = comma)  

b

# Giramos las coordenadas
b <- ggplot(data = resumen, aes(x = continent, y = media)) + 
     geom_bar(stat = "identity") +
     scale_y_continuous(labels = comma) +  
     coord_flip() +
     ylab("Ingreso per capita promedio")  

b

# Agregamos un color distinto a cada barra usando el argumento 'fill'
# Colocamos fill dentro del aes (..., fill = variable)

b <- ggplot(data = resumen, aes(x = continent, y = media,  fill= continent)) + 
  geom_bar(stat = "identity") +
  scale_y_continuous(labels = comma) +  
  coord_flip() +
  ylab("Ingreso per capita promedio")  

b


# Diagrama de barras de la poblacion en America por anho (year) y paises (country).
# Una variable cuantitativa poblacion o 'population' (pop), una variable discreta 'year' 
# y una variable categorica pais o 'country' 

americas <- filter(datos, continent == "Americas")

# Forma 1: Haciendo uso de 'face_wrap(~)' para dividir por pais
# Para obtner el simbolo de ' ~ ' apretar 'CTRL+ 126'

b <- ggplot(data = americas, aes(x = year, y = pop)) + 
  geom_bar(stat = "identity") +
  scale_y_continuous(labels = comma) +  
  facet_wrap(~ country) 

b

# Forma 2: Hacer aparecer la escala horizontal o 'eje x' en cada sub-gráfico.

b <- ggplot(data = americas, aes(x = year, y = pop)) + 
  geom_bar(stat = "identity") +
  scale_y_continuous(labels = comma) +  
  facet_wrap(~ country, scales = "free_x") 

b

# Forma 3: Colocar aparecer la escala vertical o 'eje y' en cada sub-grafico
# Se aprecia que en cada sub-grafico las escalas en el eje 'y' varian dependiendo de los datos.

b <- ggplot(data = americas, aes(x = year, y = pop)) + 
  geom_bar(stat = "identity") +
  scale_y_continuous(labels = comma) +  
  facet_wrap(~ country, scales = "free_y") 

b


# Forma 4: Colocar las escalas de 'x' e 'y' en cada subgrafico

b <- ggplot(data = americas, aes(x = year, y = pop)) + 
  geom_bar(stat = "identity") +
  scale_y_continuous(labels = comma) +  
  facet_wrap(~ country, scales = "free") 

b


# Tarea el mismo grafico para europa, asia y oceania



# Diagramas de Lineas o Line Plot -----------------------------------

# Estos graficos nos permiten ver tendencias o patrones en el tiempo.
# Donde en el eje x va una 'variable discreta' y en el eje y una 'variable continua'
 
# Gráfico de anhos (year) vs expectativa de vida (gdpPercap)
dp <- ggplot(data = datos, aes(x = year, y = lifeExp, group = country, color = country)) +
      geom_line(show.legend= FALSE) +
      facet_wrap(~continent, scales = "free_x")

dp
      
# Cual es la relacion entre poblacion y expectativa de vida en Africa 