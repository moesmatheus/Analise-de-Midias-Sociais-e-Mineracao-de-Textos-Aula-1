## FGV-Management - 2S2020
## An�lise de M�dias Sociais e Minera��o de Texto - Aula 1
## Prof. Eduardo de Rezende Francisco
## Data: 24/Agosto/2020

## Exemplo de Cluster Analysis

# Extens�o para gr�ficos e para An�lise de Agrupamentos

install.packages("ggplot2")
library(ggplot2)
install.packages("ggdendro")
library(ggdendro)

# L� o arquivo com as informa��es dos Sandu�ches
sanduiches <- read.table("c:/temp/Sanduiches.csv",header=TRUE,sep = ";", dec=",")
row.names(sanduiches) <- sanduiches$Sandu�ches

# Implementa o algoritmo hier�rquico e apresenta o dendrograma
hc <- hclust(dist(sanduiches), "average")  # explorar com outros m�todos de dist�ncia
p <- ggdendrogram(hc, rotate=FALSE)
print(p)
ggdendrogram(hc, rotate=TRUE)

hcdata <- dendro_data(hc)
ggdendrogram(hcdata, rotate=TRUE, size=2) + labs(title="Dendrograma dos Sandu�ches")

# "Cortando" a �rvore em 3 grupos
grupos <- cutree(hc,k=3)
grupos

# Analisando as principais vari�veis a partir dos grupos
boxplot(sanduiches$S�dio ~ grupos, col = "blue", main = 'Box Plot do Teor de S�dio')
boxplot(sanduiches$Valor.Energ�tico ~ grupos, col = "blue", main = 'Box Plot do Valor Energ�tico')


## =================================
## Refazendo os clusters, agora com as vari�veis padronizadas
## =================================

sand_padr <- sanduiches
for (i in 2:12) sand_padr[,i] <- scale(sand_padr[,i])

# Implementa o algoritmo hier�rquico e apresenta o dendrograma
hc2 <- hclust(dist(sand_padr), "average")  # explorar com outros m�todos de dist�ncia
p <- ggdendrogram(hc2, rotate=FALSE)
print(p)
ggdendrogram(hc2, rotate=TRUE)

hcdata2 <- dendro_data(hc2)
ggdendrogram(hcdata2, rotate=TRUE, size=2) + labs(title="Dendrograma dos Sandu�ches (padronizado)")

# "Cortando" a �rvore em 3 grupos
grupos2 <- cutree(hc2,k=3)
grupos2

# Analisando as principais vari�veis a partir dos grupos
boxplot(sand_padr$S�dio ~ grupos2, col = "green", main = 'Box Plot do Teor de S�dio')
boxplot(sand_padr$Valor.Energ�tico ~ grupos2, col = "green", main = 'Box Plot do Valor Energ�tico')
