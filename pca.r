library("lattice")

pca <- function(palm){
  palm.pca <- prcomp(palm, center = T, scale. = T)
  cat("summary of PCA\n")
  print(summary(palm.pca))
  cat("eigen values\n")
  print(palm.pca$sdev^2)
  #screeplot
  screeplot(palm.pca, main="Scree Plot", xlab="Components")
  screeplot(palm.pca, main="Scree Plot", type = "line")
  #dotplot
  
  load    <- palm.pca$rotation
  cat("scroes (rotations)\n")
  print(load)
  sorted.loadings <- load[order(load[, 1]), 1]
  myTitle <- "Loadings Plot for PC1" 
  myXlab  <- "Variable Loadings"
  dotplot(sorted.loadings, main=myTitle, xlab=myXlab, cex=1.5, col="red")
  
  # DotPlot PC2
  
  sorted.loadings <- load[order(load[, 2]), 2]
  myTitle <- "Loadings Plot for PC2"
  myXlab  <- "Variable Loadings"
  dotplot(sorted.loadings, main=myTitle, xlab=myXlab, cex=1.5, col="red")
  
  # Now draw the BiPlot
  biplot(palm.pca, cex=c(1, 0.7))
  
  # Apply the Varimax Rotation
  palm.var <- varimax(palm.pca$rotation)
  cat("varimax rotations\n")
  print(palm.var)
}