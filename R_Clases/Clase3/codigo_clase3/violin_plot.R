# Librerias ---------------------------------------------------------------

library(ggplot2)
library(gapminder)
library(dplyr)
library(tidyr)
library(ggthemes)
library(ggrepel)


# Diagrama de Violin o Violin Plot ----------------------------------------

# Definicion

# El diagrama de violin sirve paravisualizar la distribucion de los datos 
# y su densidad de probabilidades.

# El diagrama de violin combina dos tipos de graficos: el diagrama de cajas (box plot) y 
# grafico de densidad de probabilidad (density plot).


# Recomendaciones

# El diagrama de violin resulta ser mas informativo que el diagrama de cajas, porqué revela 
# detalles importantes acerca del tipo distribucion, ya sea bimodal o multimodal
# que siguen nuestros datos.

## R-Function

# Base package: boxplot()
# ggplot2 package: ggplot() + geom_boxplot()


# Ejemplo 1 ----------------------------------------------------------------

# Realizar un diagrama de violin, donde veamos la distribucion de la expectativa de vida
# de los 5 continentes, y ademas, mostrar la densidad de probabilidades de cada .


datos <- gapminder
gviolin <- ggplot(datos, aes(x = continent, y = lifeExp)) +
           geom_violin(trim = FALSE) +
           geom_boxplot(width=0.1)

gviolin






