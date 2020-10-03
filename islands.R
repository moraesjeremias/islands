install.packages("ggplot2")
library(ggplot2)

#Etapa 1
#Loading Island Dataset
islands_dataset = data.frame(islands)
islands_dataset$island_names = rownames(islands_dataset)
colnames(islands_dataset)[names(islands_dataset) == "islands"] = "island_area"

names(islands_dataset)
print(islands_dataset)

#Total Island Occurences
length(islands_dataset$island_names)

#Etapa 2
#Island's area average
mean(islands_dataset$island_area)

#Island's area median
median(islands_dataset$island_area)

#Etapa 3 
#Returns lowest island's area value (square miles)
min(range(islands_dataset$island_area, na.rm = TRUE))

#Returns greatest island's area value (square miles)
max(range(islands_dataset$island_area, na.rm = TRUE))

# Etapa 4
#Standard Deviation
sd(islands_dataset$island_area)

#Range
range(islands_dataset$island_area)

#Etapa 5
#Quantiles
#0 - 25% - 50% - 75% - 100%

full_coverage_quantils = quantile(islands_dataset$island_area, probs = c(0, 25, 50, 75, 100)/100)
print(full_coverage_quantils)

#0.05% - 95%
partial_coverage_quantils = quantile(islands_dataset$island_area, probs = c(0.05, 95)/100)
print(partial_coverage_quantils)


#Etapa 6
#IQR
# - Quantil 1 a Quantil 5 (0% - 100%)
IQR(islands_dataset$island_area)


#Etapa 7
#Frequency Histogram
ggplot(data = islands_dataset, aes(x=island_area))+
  geom_histogram(binwidth = 5000)

#Relative Frequency Histogram
ggplot(data = islands_dataset, aes(x=island_area))+
  geom_histogram(aes(y=stat(count)/sum(count)),binwidth = 5000) +
    scale_y_continuous(labels = scales::percent)

#Etapa 8

#Box Plot with outliers
outliers_plot = ggplot(data = islands_dataset, aes(y=island_area))+
  geom_boxplot()
print(outliers_plot)

#Box Plot without outliers
lower_upper_whiskers = boxplot.stats(islands_dataset$island_area)$stats[c(1,5)]
print(lower_upper_whiskers)
normalized_plot = outliers_plot + coord_cartesian(ylim = lower_upper_whiskers*1.05)
print(normalized_plot)

#Etapa 9 
#Outliers
outliers = boxplot.stats(islands_dataset$island_area)$out
print(outliers)

#Stem and Leaf Plot
stem(islands_dataset$island_area)
