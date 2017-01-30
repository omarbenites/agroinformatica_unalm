## Github: AgroInformatica Projecto

## Cada alumno guardara sus archivos de excel por cultivo en:
## https://github.com/omarbenites/agroinformatica_unalm/tree/master/AgroInformatica_database 

## Cada alumno guardara sus archivo de R, que estan en los folder de cropdatape/R
## y agroinformatica.

## Hacer un nuevo cropdatape en sus PC

##




# Analisis Exploratorio
# Grafico de Box-Plot

library(dplyr)
library(ggplot2)
library(cropdatape)

#Hacemos un resumen de los datos por anho (year) y cultivo (crop)

by_year <- group_by(cropdatape, year, crop) 

resumen <- summarise(by_year, msowa  = median(sowa, na.rm = TRUE), 
                                 mharva = median(harva, na.rm = TRUE),
                                 mproduction = median(production, na.rm = TRUE),
                                 myield = median(yield, na.rm = TRUE), 
                                 mprice = median(pricePlot,na.rm = TRUE)
                        ) 
resumen <- as.data.frame(resumen)


# Grafico de BoxPlot


rtomate <- filter(resumen, crop == "tomato")
rtomate <- as.data.frame(rtomate)


dp <- ggplot(data = rtomate, aes(x = year, y = myield)) +
  geom_line(show.legend= FALSE) 

dp <- ggplot(data = rtomate, aes(x = year, y = mproduction)) +
  geom_line(show.legend= FALSE) 


#googleVis

Motion=gvisMotionChart(mtomate, 
                       idvar="crop", 
                       timevar="year")
plot(Motion)




dp <- ggplot(data = resumen, aes(x = as.factor(year), y = mproduction, group = crop, color = crop)) +
  geom_line(show.legend= FALSE,size=1)

dp


