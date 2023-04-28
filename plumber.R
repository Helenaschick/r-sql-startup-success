# plumber.R

model <- readRDS("model.rds")

#* Plot a histogram of the relationships
#* @serializer png
#* @get /plotwt
function(){
  hist(train_data$relationships)
}

#* Returns the probability whether the car has a manual transmission
#* @param relationships relationships
#* @param funding_total_usd funding
#* @post /acquired
function(relationships, funding_total_usd){
  newdata <- data.frame(relationships = as.numeric(relationships), funding_total_usd = as.numeric(funding_total_usd))
  predict(model, newdata, type = "response")
}