install.packages("ggplot2")
library(ggplot2)

#Carregando os dados
islands_dataset = data.frame(islands)
print(islands_dataset)

#Soma das ocorrências
sum(islands_dataset$islands)

#Média das ocorrências
mean(islands_dataset$islands)

#Mediana das ocorrências
median(islands_dataset$islands)
