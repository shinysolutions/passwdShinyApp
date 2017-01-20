source("RScript/jsFun.R", local = TRUE)
shinyServer(function(input, output) {
  # Login module;
  source("RScript/Login.R",  local = TRUE)
  observe({
    if (USER$Logged == TRUE) {
      load("Data/Dat.RData")
      ## Source input and output files;
      source("RScript/input.R", local = TRUE)
      source("RScript/output.R", local = TRUE)
    }
  })
})
