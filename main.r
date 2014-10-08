# 
source('get_data.r')
source('col_pairs.r')
source('pca.r')
data <- read.csv("../summary/stock.csv")

palm <- get_data(data, "PHDC")

egx30 <- get_data(data, "EGX30")

egx30 <- egx30[egx30$Date %in% palm$Date,]

palm2 <- palm[palm$CLOSE< 50,]

#  plot correlations

palm2.numeric <- palm2[,5:9]

col_pairs(palm2.numeric)

row.names(palm2.numeric) <- 1:nrow(palm2.numeric)

pca(palm2.numeric)
