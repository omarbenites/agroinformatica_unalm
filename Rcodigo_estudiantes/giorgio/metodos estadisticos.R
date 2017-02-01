install.packages("googleVis")
install.packages("agricolae")

library(agricolae)
#Diseño completo al azar

variedades <- c("tomasa","yungay","amarilla","revolucion")
repeticiones <- 5
dca<- design.crd(trt= variedades, r=repeticiones, serie=1)
dca$book


libro <- dca$book

#exportar a excel


library(openxlsx)
write.xlsx(libro,file= "dcalibro.xlsx")
shell.exec("dcalibro.xlsx")


# ejemplo 1 tipos de fertilizantes
tratamientos2 <- c("urea","spt","nitratodepotasio","clorurodepotasio","nitratodeamonio")
repeticiones <- 10
dca2 <- design.crd(trt=tratamientos2, r=repeticiones,serie= 2)


dca2
libro2 <- dca2$book


libro2


write.xlsx(libro2,file= "dcalibro2.xlsx")
shell.exec("dcalibro2.xlsx")


#Bloques completos al azar

dbca <- design.rcbd(trt=variedades,r=repeticiones, serie=2)
dbca$book
librodbca <- dbca$book
write.xlsx(librodbca,"dbca.xlsx")
shell.exec("dbca.xlsx")

#ANVA analisis de varianza

data("sweetpotato")

#dca: y ~ trt  (solo se ingresa variable de respuesta y tratamiento)

#variable respuesta~ variable dependiente
model <- aov(yield~virus,data=sweetpotato)
model
cvar <- cv.model(model)
cvar


maov <- anova(model)




