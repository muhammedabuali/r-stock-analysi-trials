library(gclus)

col_pairs <- function(palm2.numeric){  
  palm2.cor.abs <- abs(cor(palm2.numeric))
  palm2.colors <- dmat.color(palm2.cor.abs)
  palm2.ordered <- order.single(cor(palm2.numeric))
  cpairs(palm2.numeric, palm2.ordered, panel.colors = palm2.colors, gap= .5)
}


