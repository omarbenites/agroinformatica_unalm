# Librerias ---------------------------------------------------------------

library(ggplot2)
library(gapminder)
library(dplyr)
library(tidyr)
library(ggthemes)
library(ggrepel)


# Diagrama de Cajas o Box Plot --------------------------------------------

# Definicion

# El diagrama caja es una representacion de los datos en forma de 'caja' y 'bigotes'; 
# mediante el cual podemos visualizar variables cuantitativas asociadas a
# diferentes grupos de una variable categorica. 

# - La 'caja' dentro del diagrama esta formada por: el primer cuartil q1 (25%), 
# el segundo cuartil o mediana q2 (50%) y el tercer cuartil q3 (75%).

# - Los 'bigotes' son lineas que se extienden paralelamente a las cajas hasta alcanzar los 
# maximos y minimos (ver ref. #2), indicando variabilidad fuera del cuartil inferior 
# y superior (q1 y q3). Ademas, aqui identificamos a los 'outliers' o 'valores atipicos', 
#los cuales son observaciones que se ubican fuera de los valores maximos y minimos.


# Observacion

# Cuando hablamos de maximo y minimo del diagrama de caja, hacemos referencia los valores obtenidos
# de la suma y resta  del rango interquartilico a los cuartiles q1 y q3 respectivamente. No se hace
# referencia a los valores maximos y minimos de los datos.



# Recomendaciones

# El digrama de cajas facilita la rapida visualizacion de la distribucion de los datos. 
# Permite observar si los datos son simetricos, si los datos estan sesgados y hacia donde; 
# y finalmente si los datos estan agrupados en forma ajustada o extendida.

# En caso de tener un gran numero de observaciones, el diagrama de cajas resulta ser muy eficaz
# para visualizar la variabilidad de nuestros datos. 

# Un punto en contra del diagrama de cajas, es que no permite observar el tipo de distribucion
# bajo el cual se encuentran los datos analizados.

## R-Function

# Base package: boxplot()
# ggplot2 package: ggplot() + geom_boxplot()



# Ejemplo 1 ---------------------------------------------------------------

# 1.1.- Visualizar la distribucion de la expectativa de vida en los 5 continentes. 
# 1.2.- Pintar por continente ( usar comando 'fill' )
# 1.3.- Ver donde estan los valores atipicos 
# 1.4.- Ver donde estan ubicadas las observaciones en cada  

datos <- gapminder
gcaja <- ggplot(data = datos, aes(x = continent, y = lifeExp), fill = continent ) +
         geom_boxplot() # +
         #geom_boxplot(outlier.colour = "hotpink") +
         #geom_jitter() 
         #coord_flip()
gcaja


# Ejemplo 2 ---------------------------------------------------------------

# Del ejemplo anterior ordenar los diagramas de caja de mayor a menor; es decir, 
# de la mayor a la menor expectativa de vida por continente. Ademas, girar el grafico 
# y colocar las etiquetas en cada observacion (usar ggrepel).


datos <- gapminder
gcaja2 <- ggplot(data = datos, aes(x = reorder(continent, lifeExp), y = lifeExp, fill = continent, label = lifeExp)) +
          geom_boxplot() +
          geom_boxplot(outlier.colour = "hotpink") +
          geom_jitter() +
          coord_flip() #+
         # geom_text_repel(aes(continent, lifeExp, label = lifeExp  ))
gcaja2



# Tarea ---------------------------------------------------------------

# 1.- Repetir los graficos anteriores, usando la variable continua de Ingreso Per-Capita.










# Referencias

# 1.- http://www.datavizcatalogue.com/methods/box_plot.html
# 2.- https://www.leansigmacorporation.com/box-plot-with-minitab/ (Box Plot Anatomy)
# 3.- http://docs.ggplot2.org/0.9.3.1/geom_boxplot.html
# 4.- https://cran.r-project.org/web/packages/ggrepel/vignettes/ggrepel.html
