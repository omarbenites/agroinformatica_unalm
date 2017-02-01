library(agricolae)

#diseño completo al azar

variedades <- c("tomasa","yungay","amarilla","revolucion99")
repeticiones <- 5

dca <- design.crd(trt= variedades, r= repeticiones, serie = 1)
libro <- dca$book

library(openxlsx)
write.xlsx(libro, file = "dcalibro.xlsx")
shell.exec("dcalibro.xlsx")

tratamientos2 <- c("urea", "spt","ndp", "kcl","nda")
repeticiones2 <- 10
dca2 <- design.crd(trt= tratamientos2, r= repeticiones2, serie = 2)
libro2 <- dca2$book

library(openxlsx)
write.xlsx(libro2, file = "dcalibro2.xlsx")
shell.exec("dcalibro2.xlsx")

#bloques completos al azar

dbca <- design.rcbd(trt = variedades, r= repeticiones, serie = 2)
librodbca <- dbca$book
write.xlsx(librodbca, file = "librodbca.xlsx")
shell.exec("librodbca.xlsx")

#analisis de varianza

data("sweetpotato")
#variable y respuesta ~ variable dependiente
# dca: y ~ trt
model <- aov(yield~virus, data= sweetpotato)

cvar <-  cv.model(model)

maov <- anova(model)




