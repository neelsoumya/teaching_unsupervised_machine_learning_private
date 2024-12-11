# Adapted from https://ajitjohnson.com/tsne-for-biologist-tutorial/

library(Rtsne)
library("factoextra")

#Load the data
expression_data <- read.table(file = "Data/Genetic Data.csv", row.names = 1, sep=',', header = T)
meta_data <- read.table(file = "Data/meta.csv", row.names = 1, sep=',', header = T)


fviz_screeplot(expression.pca)
fviz_pca_ind(expression.pca, label="none", col.ind = as.factor(meta_data$louvain))



tsne_realData <- Rtsne(expression_data, perplexity=10, check_duplicates = FALSE)
plot(tsne_realData$Y, col = "blue", bg= as.factor(meta_data$louvain), pch = 21, cex = 1,)
expression.pca <- prcomp(expression_data)

