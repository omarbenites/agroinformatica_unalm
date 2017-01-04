1+1
50-56
10*20
10/2
40*5+10

peso<-15
altura <- 10

# Forma Incorrecta
n bayas <- 18
1cosecha <- 30
kilogramosporhectareadelcultivodepapa <- 12

# Forma Correcta
edad <- 18
cosecha1 <- 30
kghp <- 12

# Operaciones con variables
kghp*26
kghp-15

exp2 <- kghp + 12

# Tipos de Variable
# caracter
frase <- "Soy agronomo de corazon"
frase

#factor
csales <- c("bajo","medio","alto")
csales
csales2 <- as.factor(csales)
csales2

#dato faltante
d_faltante <- NA
d_faltante

# Vectores
anual <- c(2012,2013,2014,2015)
pais <- c("peru","peru","peru","peru") 
rendimiento <- c(8.2,10.2,11.05,12.23 )
cultivo <- c("papa","papa","papa","papa")


# Data.Frame
tabla_papa <- data.frame(pais,cultivo,anual,rendimiento)
tabla_papa

# Estructura del data.frame
str(tabla_papa)

# Uso del $ 
tabla_papa$rendimiento
tabla_papa$anual

# Operaciones con data frames
colnames(tabla_papa)
ncol(tabla_papa)
nrow(tabla_papa)
summary(tabla_papa) 

# Uso de Funciones

mean(tabla_papa$rendimiento)
sd(tabla_papa$rendimiento)































