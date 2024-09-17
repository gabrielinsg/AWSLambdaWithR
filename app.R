# app.R
library(jsonlite)

handler <- function(event, context) {
  response <- list(
    statusCode = 200,
    body = "Hello World"
  )
  toJSON(response, auto_unbox = TRUE)
}
