
# Librerias ---------------------------------------------------------------

library(ggplot2)
library(gapminder)
library(dplyr)
library(tidyr)
library(ggthemes)

#### Visualizacion de Datos --------------------------------------------------

# La visualizacion de datos es un componente importante durante el analisis de datos.
# Un gráfico es capaz de mostrarnos patrones, comportamientos y/o tendencias que tiene
# nuestra información. 

# Existen diferentes tipos de gráficos que podemos usar para representar de forma
# significativa nuestros datos. A continuacion detallaremos cada uno de ellos, 
# concentrandonos en las ventajas, desventajas y la interpretacion de cada gráfico.


## Diagrama de Barras o Bar plot ------------------------------------------------------

# Definicion:

# El Diagrama de barras emplea barras verticales u horizontales para mostrar una 
# comparación cuantitativa entre categorias. En la cima de la barra podemos representar 
# conteos, medias, porcentajes, etc

# En un eje va la variable cuantitativa, que puede ser discreta o continua, mientras que
# en el eje restante encontramos a la variable categórica.

# Recomendacion: 

# Siempre se recomienda colocar el tamaño de las barras por orden de tamaños. 
#Esto facilita al usuario y/o expectador la interpretacion de nuestro gráfico.

# No es muy recomendable usar un diagrama de barras cuando tenemos demasiadas categorias.
# El aglutinamiento de demasiadas barras en un solo gráfico resulta excesivo para el usuario
# y/o expectador y dificil de interpretar.



## R-Function

# Base package: barplot()
# ggplot2 package: ggplot() + geom_bar()


# Ejemplo #1 --------------------------------------------------------------
# Hacer un grafico donde muestre el ingreso promedio per-capita de los paises 
# del continente de Oceania.

# Hacemos uso de la libreria gapminder, y calculamos el numero de paises y promedio percapita

#Filtramos de los datos de oceania

dtocea <- gapminder %>% filter(continent == "Oceania")
str(dtocea)
# Agrupamos por pais
by_ocea <- group_by(.data = dtocea, country)
# Resumen de los datos usando el promedio o la media.
resumen <- summarise(by_ocea,
                     media_gdp = mean(gdpPercap)
) 
resumen

## Diagrama de barras basico

barras1 <- ggplot(data = resumen, aes(x = country, y = media_gdp, fill = country)) +
          geom_bar(stat = "identity") 

barras1   


# --- ---------------------------------------------------------------------
# Africa

dtafrica <- gapminder %>% filter(continent == "Africa")
str(dtocea)
# Agrupamos por pais
by_africa <- group_by(.data = dtafrica, country)
# Resumen de los datos usando el promedio o la media.
resumen <- summarise(by_africa,
                     media_gdp = mean(gdpPercap)
)
resumen

## Diagrama de barras basico

barras1 <- ggplot(data = resumen, aes(x = country, y = media_gdp, fill = country)) +
  geom_bar(stat = "identity")

barras1

# -- ----------------------------------------------------------------------


# Diagrama de barras mas especifico

# Primera Forma


barras2 <- ggplot(resumen, aes(x = country, y = media_gdp, fill = country)) +
  geom_bar(stat = "identity", position = "dodge", color = "black") +
  labs(title = "Ingreso percapita entre los paises de la region Oceania",
       x = "Paises", y = "Ingreso PerCapita (dollars)") +
  geom_text(aes(label = media_gdp), vjust = 1.6, color = "white",
            position = position_dodge(0.9), size = 3) 

barras2



# Ejemplo 2 ---------------------------------------------------------------
# Hacer un grafico donde muestre el ingreso promedio per-capita por continente

#Guardamos la tabla gapminder en la variable 'dt'
dt <- gapminder
dtcon <-  group_by(dt, continent)
rescon <- summarize(dtcon, 
                    mcon =  round(mean(gdpPercap),1)
                    )

brescon <- ggplot(rescon, aes(x = continent, y = mcon, fill = continent)) +
  geom_bar(stat = "identity", position = "dodge", color = "black") +
  labs(title = "Ingreso Percapita Entre Por Continente",
       x = "Continente", y = "Ingreso PerCapita (dollars)") +
  geom_text(aes(label = mcon), vjust = 1.6, color = "white",
            position = position_dodge(0.9), size = 3) 

brescon



# Ejemplo 3 ---------------------------------------------------------------

# Hacer un grafico donde muestre el ingreso promedio per-capita por continente
# Guardamos la tabla gapminder en la variable 'dt'


dt <- gapminder %>% filter(continent == "Americas")
dtpais <-  group_by(dt, country)
respais <- summarize(dtpais, 
                    mgdpais =  round(mean(gdpPercap),1)
)


barras1 <- ggplot(data = respais, aes(x = country, y = mgdpais, fill = country)) +
  geom_bar(stat = "identity")

barras1



# Diagrama de barras rellenado con la gradiente de colores usando la variable 'country'
# A su vez ordenar el grafico de barras de menor a mayor 

brespais <- ggplot(respais, aes(x = reorder(country, -mgdpais), y = mgdpais, fill = country)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(title = "Ingreso Percapita De Los paises Americanos",
       x = "Pais", y = "Ingreso PerCapita (dollars)") +
  geom_text(aes(label = mgdpais), vjust = 0.5, hjust= 1.2, color = "white",
            position = position_dodge(0.9), size = 4) +
  coord_flip()  

brespais



# Diagrama de barras rellenado con la gradiente de colores usando la variable cuantitativa
# mgdpais (media por pais), la cual continua.

#Para este caso
# Si deseamos cambiar los colores de la escala usar 'scale_fill_gradient'

brespais <- ggplot(respais, aes(x = reorder(country, -mgdpais), y = mgdpais, fill = mgdpais)) +
  geom_bar(stat = "identity", position = "dodge", show.legend = FALSE) +
  ###scale_colour_gradient(low = "white", high = "black")+
  scale_fill_gradient(low = "red", high = "darkblue")+
  ###scale_fill_gradient2(low = "red", high = "blue")+
  labs(title = "Ingreso Percapita De Los paises Americanos",
       x = "Pais", y = "Ingreso PerCapita (dollars)") +
  geom_text(aes(label = mgdpais), vjust = 0.5, hjust= 1.2, color = "white",
            position = position_dodge(0.9), size = 4) +
  coord_flip() 
  
brespais


# Diagrama de barra destacando a un pais de la region Americana, en nuestro caso "Peru"
# para este fin usamos scale_fill_manual pues 'country' (pais) es una variable categorica

# usaremos 'scale_fill_manual()'

brespais <- ggplot(respais, aes(x = reorder(country, -mgdpais), y = mgdpais, fill = country == "Peru")) +
  geom_bar(stat = "identity", position = "dodge", show.legend = FALSE) +
  scale_fill_manual(values = c('dodgerblue4', 'firebrick1') )+
  labs(title = "Ingreso Percapita De Los paises Americanos",
       x = "Pais", y = "Ingreso PerCapita (dollars)") +
  geom_text(aes(label = mgdpais), vjust = 0.5, hjust= 1.2, color = "white",
            position = position_dodge(0.9), size = 4) +
  coord_flip() 

brespais

# 


# Diagrama de barra destacando lo resultados que tienen un salario mayor al promedio por pais
# en America.  

# Usamos scale_fill_manual

brespais <- ggplot(data = respais, aes(x = reorder(country, -mgdpais), y = mgdpais, fill = mgdpais>mean(mgdpais))) +
  geom_bar(stat = "identity", position = "dodge", show.legend = FALSE) +
  labs(title = "Ingreso Percapita De Los paises Americanos",
       x = "Pais", y = "Ingreso PerCapita (dollars)") +
  scale_fill_manual(values = c('firebrick1', 'dodgerblue4'))+
  geom_text(aes(label = mgdpais), vjust = 0.5, hjust= 1.2, color = "white",
            position = position_dodge(0.9), size = 4) +
  coord_flip() 

brespais








# Referencia --------------------------------------------------------------

# 1- http://www.datavizcatalogue.com/methods/bar_chart.html





