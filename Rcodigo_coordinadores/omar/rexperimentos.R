# Experimentos en R

library(agricolae)
library(openxlsx)


# Diseno Completo al Azar (Completely Randomized Design) ------------------

# 5 treatments and 6 blocks
trt<-c("canchan","tomasa","amarilla","victoria","revolucion99")
design <-design.rcbd(trt , 4, serie=2) # seed = 986
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
write.xlsx(book, "dca.xlsx")
shell.exec("dca.xlsx")




