# This library has some nice plots to visualise PCA
library("factoextra")

# Import the iris data set. 
data(iris)

# Explore the iris data set
head(iris)
summary(iris)

#Explore some of the correlations graphically
ggplot(iris, aes(x=Sepal.Length, y=Sepal.Width, color=Species))+geom_point()


#Prepare the iris data for PCA by removing the species label
iris.prepared <- iris[,1:4]


#Do the PCA, automatically scaling the data. 
iris.pca <- prcomp(iris.prepared, scale=TRUE)


#Explore the first few data items in terms of the Principal Components
head(iris.pca$x)



#add species information back into PCA data
iris.pca.data <- data.frame(iris.pca$x, Species=iris$Species)

# plot the PCA data, coloring the points by species. 
ggplot(iris.pca.data, aes(x=PC1, y=PC2, color=Species))+geom_point()

#Draw a Scree plot to check how many principal components are useful
fviz_screeplot(iris.pca)

# draw a correlation circle
fviz_pca_var(iris.pca)


# draw a biplot
fviz_pca_biplot(iris.pca, col.ind=iris$Species, label="none")

#draw a stripchart to analyse the plausibility of using just one principal component

stripchart(PC1 ~ Species, data=iris.pca.data, method="jitter", col=c("blue", "green", "orange"))


# explore the transformation from the original data
print(iris.pca$rotation)


# find the principal components for an iris with values (5,4,1.5,0.4). What species is it?
novel.iris <- data.frame(5,4,1.5,0.4)
colnames(novel.iris)<- colnames(iris.prepared)
novel.iris.pca <-predict(iris.pca, novel.iris)

#Add this point onto the plot
ggplot(iris.pca.data, aes(x=PC1, y=PC2, color=Species))+geom_point()+
  geom_point(x=novel.iris.pca[1], y=novel.iris.pca[2], color="yellow", size=8, shape=15)
