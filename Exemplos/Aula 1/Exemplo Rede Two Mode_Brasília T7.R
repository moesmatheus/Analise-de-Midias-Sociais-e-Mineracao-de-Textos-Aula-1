## FGV-Management - 2S2020
## An�lise de M�dias Sociais e Minera��o de Texto - Aula 1
## Prof. Eduardo de Rezende Francisco
## Data: 24/Agosto/2020                       

## Exemplo de SNA - Social Network Analysis - Rede TWO MODE

# Extens�es para An�lise de Redes
#(devem ser previamente baixadas no CRAN do R)

install.packages("network")
library(network)
install.packages("sna")
library(sna)

# L� o arquivo com as informa��es de compras
compras <- read.table("c:/temp/Exemplo Rede TwoMode.csv",header=TRUE,sep = ";", dec=",")

# Adaptando o data.frame compras para que possa servir para a montagem da rede
gcompras <- compras[,2:6]
rownames(gcompras) <- compras[,1]

# Construindo a rede a partir da matriz de rela��es (0 e 1)
gplot(gcompras)
gplot(gcompras,gmode="twomode",displaylabels = TRUE)
gplot(gcompras,gmode="twomode",displaylabels = TRUE,
      edge.col="gray",label.cex = 0.7,usearrows=FALSE)

# Explorando a rede
degree(gcompras,gmode="twomode",cmode="indegree")
closeness(gcompras,gmode="twomode")
betweenness(gcompras,gmode="twomode")

# Aprimorando a representa��o da rede
gplot(gcompras,gmode="twomode",displaylabels = TRUE,
      edge.col="gray",label.cex = 0.7,usearrows=FALSE,
      vertex.cex = closeness(gcompras,gmode="twomode")*3)

# Analise:
# Voc� acha que as medidas de centralidade de proximidade e intermedia��o
# s�o �teis no contexto da rede Two Mode? 


