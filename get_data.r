# data collection

get_data <- function(data , company){
  com <- data[ data[,"TICKER"] == company ,]
  com <- com[ com$OPEN != 0 ,]
  return(com)
}