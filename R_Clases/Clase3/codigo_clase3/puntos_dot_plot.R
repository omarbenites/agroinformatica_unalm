# Librerias ---------------------------------------------------------------

library(ggplot2)
library(gapminder)
library(dplyr)
library(tidyr)
library(ggthemes)


# Diagrama de Puntos o Dot Chart o Dot Plot -------------------------------------------

# Definicion

# El diagrama de puntos o dot plot es una alternativa al diagrama de barras. En este caso, usamos puntos
# para describir un valor cuantitativo (variable cuantitativa)  como conteos, medias, porncentajes 
# que estan asociadas a una variable categorica.

# Observacion: Se hara uso del 'Cleveland Dot Plot' a lo largo de los ejemplos.


# Recomendacion

# Anteriomente mencionamos, que este gráfico es una gran alternativa al diagrama de barras, en especial,
# cuando tenemos un gran número de 'niveles' o 'clases' en la variable categorica. El dot plot
# remueve el exceso de barras, y los reemplaza por simples puntos, permitiendo al usuario y/o expectador
# concentrarse solamente es los puntos.

# De forma analoga al barchart, 

## R-Function

# Base package: dotchart()
# ggplot2 package: ggplot() + geom_dotplot()


# Ejemplo 1 ---------------------------------------------------------------
# Filtramos la informacion del continente ´Americas´,

dt <- gapminder %>% filter(continent == "Americas")
dtpais <-  group_by(dt, country)
respais <- summarize(dtpais, 
                     mgdpais =  round(mean(gdpPercap),1)
)

gpuntos <- ggplot(data = respais) + geom_point(aes(x=country, y=mgdpais)) +
           coord_flip()

gpuntos

# El ingreso medio per-capita por pais orrdenado de menor a mayor

gpuntos2 <- ggplot(data = respais) + geom_point(aes(x=reorder(country, -mgdpais) , y=mgdpais)) +
  coord_flip()

gpuntos2

# El ingreso medio per-capita por pais ordenado de mayor a menos

gpuntos3 <- ggplot(data = respais) + geom_point(aes(x=reorder(country, mgdpais) , y=mgdpais)) +
  coord_flip()

gpuntos3



# Ejemplo 2 ---------------------------------------------------------------

# Problema: Deseamos ver en un grafico de puntos, el resumen de Gapminder teniendo en cuenta 
# dos factores: continent (continente) y country (pais). Para ello usaremos el 
# promedio de vida en los paises de los 5 continentes.

dt <-  group_by(gapminder, continent, country)
rescp <- summarize(dt, 
                     mlifexp =  round(mean(lifeExp),1)
)

gpuntoscp <- ggplot(data = rescp) + 
             geom_point(aes(x=reorder(country, mlifexp), y=mlifexp, color = continent),show.legend = FALSE) +
             facet_wrap(~continent, scales = "free_y")+
             #facet_wrap(~continent, scales = "free")+
             coord_flip() +
             xlab("Ingreso per capita") +
             ylab("Paises")

             
              
gpuntoscp
























# Referencia

# https://en.wikipedia.org/wiki/Dot_plot_(statistics)
