install.packages("ggplot2")
library(ggplot2)


#Etapa 1
#Carregando os dados
islands_dataset = data.frame(islands)
islands$names = 
print(islands_dataset)


#Etapa 2
#Soma das ocorrências
sum(islands_dataset$islands)

#Média das ocorrências
mean(islands_dataset$islands)

#Mediana das ocorrências
median(islands_dataset$islands)


#Etapa 3 
#Retorna o menor valor de área (milhas quadradas) Islands
min(range(islands_dataset, na.rm = TRUE))

#Retorna o maior valor de área (milhas quadradas) Islands
max(range(islands_dataset, na.rm = TRUE))

#Etapa 4
#Desvio Padrão das áreas (milhas quadradas) Islands
sd(islands_dataset$islands)

#Retorna a faixa das Ilhas
range(islands_dataset$islands)

