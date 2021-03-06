## FGV-Management - 2S2020
## An�lise de M�dias Sociais e Minera��o de Texto - Aula 2
## Prof. Eduardo de Rezende Francisco
## Data: 25/Agosto/2020

### Exemplo Matriz de Adjac�ncia

library(igraph)

g <- graph.formula(1-2, 1-3, 2-3, 2-4, 3-5, 4-5, 4-6, 4-7, 5-6, 6-7)
plot(g)
get.adjacency(g)
A <- as.matrix(get.adjacency(g))
A

g2 <- graph_from_adjacency_matrix(A,mode=c("undirected"), weighted=NULL)
plot(g)
plot(g2)
get.adjacency(g)
get.adjacency(g2)

A[2,7] <- 1
A[7,2] <- 1
A
gA <- graph_from_adjacency_matrix(A,mode=c("undirected"), weighted=NULL)

degree(gA)
closeness(gA)

B <- matrix(c(0,1,1,0,1,0,1,0,1,1,0,1,0,0,1,0),nrow=4,ncol=4)
gB <- graph_from_adjacency_matrix(B,mode=c("undirected"), weighted=NULL)
plot(gB)

# diagonal da matriz traz os graus dos n�s ( degree(B) )
B %*% t(B)

# entradas da matriz B^p trazem a quantidade de walks de tamanho p
# entre n� i e n� j
B %*% t(B) %*% B
B %*% t(B) %*% B %*% t(B)

A
A %*%  t(A)
A %*%  t(A) %*% A

tkplot(gA)

ganel <- graph.formula(1-2, 2-3, 3-4, 4-5, 5-6, 6-7, 7-8, 8-1)
plot(ganel)
as.matrix(get.adjacency(ganel))

gprocesso <- graph.formula(1-+2, 2-+3, 3-+4, 4-+5)
plot(gprocesso)
as.matrix(get.adjacency(gprocesso))
