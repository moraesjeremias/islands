install.packages("ggplot2")
library(ggplot2)

#Etapa 1
#Carregando os dados
islands_dataset = data.frame(islands)
islands_dataset$island_names = rownames(islands_dataset)
colnames(islands_dataset)[names(islands_dataset) == "islands"] = "island_area"

names(islands_dataset)
print(islands_dataset)

#Quantidade de ocorrências de Ilhas
length(islands_dataset$island_names)

#Etapa 2
#Média das ocorrências
mean(islands_dataset$island_area)

#Mediana das ocorrências
median(islands_dataset$island_area)

#Etapa 3 
#Retorna o menor valor de área (milhas quadradas) Islands
min(range(islands_dataset$island_area, na.rm = TRUE))

#Retorna o maior valor de área (milhas quadradas) Islands
max(range(islands_dataset$island_area, na.rm = TRUE))

# Etapa 4
#Desvio Padrão das áreas (milhas quadradas) Islands
sd(islands_dataset$island_area)

#Retorna a faixa das Ilhas
range(islands_dataset$island_area)

#Etapa 5
#Cálculo dos quantis
#0 - 25% - 50% - 75% - 100%

full_coverage_quantils = quantile(islands_dataset$island_area, probs = c(0, 25, 50, 75, 100)/100)
print(full_coverage_quantils)

#0.05% - 95%
partial_coverage_quantils = quantile(islands_dataset$island_area, probs = c(0.05, 95)/100)
print(partial_coverage_quantils)


#Etapa 6
#Intervalo Interquaril
# - Quantil 1 a Quantil 5 (0% - 100%)
IQR(islands_dataset$island_area)


#Etapa 7
#Plot do Histograma de Frequência de Áreas das Ilhas
ggplot(data = islands_dataset, aes(x=island_area))+
  geom_histogram(binwidth = 5000)

#Plot do Histograma de Frequência Relativa de Áreas das Ilhas
ggplot(data = islands_dataset, aes(x=island_area))+
  geom_histogram(aes(y=stat(count)/sum(count)),binwidth = 5000) +
    scale_y_continuous(labels = scales::percent)

#Etapa 8

#Box Plots com outliers
outliers_plot = ggplot(data = islands_dataset, aes(y=island_area))+
  geom_boxplot()
print(outliers_plot)

#Box Plots sem outliers
lower_upper_whiskers = boxplot.stats(islands_dataset$island_area)$stats[c(1,5)]
print(lower_upper_whiskers)
normalized_plot = outliers_plot + coord_cartesian(ylim = lower_upper_whiskers*1.05)
print(normalized_plot)

#Etapa 9 
#Encontrando Outliers
outliers = boxplot.stats(islands_dataset$island_area)$out
print(outliers)

#Encontrando a representação do gráfico de folhas
stem(islands_dataset$island_area)
