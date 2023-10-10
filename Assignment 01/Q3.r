# Set seed for reproducibility
set.seed(123)

# Generate random dataset
num_rows <- 500
num_cols <- 10

# Define column ranges
column_ranges <- list(
  c(-10, 10), c(-10, 10), c(-10, 10), c(-10, 10),
  c(10, 20), c(10, 20), c(10, 20), c(10, 20),
  c(-100, 100), c(-100, 100)
)

# Generate random dataset
dataset <- matrix(nrow = num_rows, ncol = num_cols)
for (i in 1:num_cols) {
  dataset[, i] <- runif(num_rows, column_ranges[[i]][1], column_ranges[[i]][2])
}

# K-Means Clustering
library(cluster)

# Determine optimal number of clusters using the elbow method
wss <- sapply(1:10, function(k) {
  kmeans_model <- kmeans(dataset, centers = k, nstart = 10)
  return(kmeans_model$tot.withinss)
})

plot(1:10, wss, type = "b", xlab = "Number of Clusters",
     ylab = "Within-cluster sum of squares", main = "K-Means: Elbow Method")

# Fit K-Means clustering with optimal number of clusters
optimal_k <- kElbowPlot(dataset, k.max = 10)
kmeans_model <- kmeans(dataset, centers = optimal_k, nstart = 10)

# Plot distance metric graph
clusplot(dataset, kmeans_model$cluster, color = TRUE,
         shade = TRUE, labels = 2, lines = 0)

# Hierarchical Clustering
library(factoextra)

# Determine optimal number of clusters using the average silhouette method
silhouette_vals <- silhouette_score(dataset, distfun = dist, method = "average")

plot(silhouette_vals, main = "Hierarchical: Average Silhouette Method",
     xlab = "Number of Clusters", ylab = "Average Silhouette Width")

# Fit Hierarchical clustering with optimal number of clusters
optimal_k <- NbClust(dataset, diss = dist(dataset), method = "average")$Best.nc
hierarchical_model <- hclust(dist(dataset))
clusters <- cutree(hierarchical_model, k = optimal_k)

# Plot distance metric graph
fviz_cluster(list(data = dataset, cluster = clusters))
