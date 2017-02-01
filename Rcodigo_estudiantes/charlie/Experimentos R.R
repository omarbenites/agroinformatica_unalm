install.packages("googleVis")
install.packages("agricolae")
library(agricolae)
#Diseño completo al azar

variedades <- c("tomasa", "yungay", "amarilla", "revolucion99")
repeticiones <- 5

dca <- design.crd(trt = variedades, r = repeticiones, serie = 1)
libro <- dca$book

#Usamos openxlsx, sirve para manipular archivos excel
library(openxlsx)
#Creamos un archivo excel de nuestro libro de campo
write.xlsx(libro, file = "dcalibro.xlsx")
shell.exec("dcalibro.xlsx")

# Bloques completos al azar ---------------------------------------

dbca <- design.rcbd(trt = variedades, r = repeticiones, serie = 2)
dbca$book
librodbca <- dbca$book

#Creamos un archivo excel de nuestro libro de campo
write.xlsx(librodbca, file = "dbca.xlsx")
shell.exec("dbca.xlsx")

#Analisis de varianza
data("sweetpotato")
# variable de respuesta ~ variable dependiente
# dca: y ~ trt

model <- aov(yield~virus, data= sweetpotato)
cvar <- cv.model(model)

#analizamos el model
maov <- anova(model)


