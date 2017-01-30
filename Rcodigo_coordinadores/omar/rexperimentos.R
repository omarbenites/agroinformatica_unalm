# Experimentos en R

library(agricolae)
library(openxlsx)


# Diseno Completo al Azar (Completely Randomized Design) ------------------

# 5 treatments and 6 blocks
trt<-c("canchan","tomasa","amarilla","victoria","revolucion99")
design <-design.crd(trt , 4, serie=2) # seed = 986
design
book <- design$book # field book o libro de campo
write.xlsx(book, "dca.xlsx")
shell.exec("dca.xlsx")



# Diseno de Bloques Completos al Azar (Complete Randomized Block Design) ------------------

# 5 treatments and 6 blocks
trt<-c("canchan","tomasa","amarilla","victoria","revolucion99")
design <-design.rcbd(trt , 4, serie=2) # seed = 986
design
book <- design$book # field book o libro de campo
write.xlsx(book, "dbca.xlsx")
shell.exec("dbca.xlsx")


# Diseno Factorial

library(agricolae)
# 3 fertilizantes a 2 difernetes dosis
trt<-c(3,2) # factorial 3x2
outdesign <-design.ab(trt, r=3, serie=2)

#hacking
f <- c("F1","F2","F3")
f <- data.frame()


d <- c("d0","d100")
book<-outdesign$book

library(dplyr)
book %>% left_join(, )





# Diseno Cuadrado Latino





