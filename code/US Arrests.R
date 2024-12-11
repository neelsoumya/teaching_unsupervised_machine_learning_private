library(factoextra)
data("USArrests")
USArrests.scaled <-scale(USArrests)
fviz_nbclust(USArrests, , method="wss")
gplot(data=USArrests, )





set.seed(42)
USArrests.km <- kmeans(USArrests.scaled, centers=3, nstart=25)
fviz_cluster(USArrests.km, USArrests[,1:2])

