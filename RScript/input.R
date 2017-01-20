

output$uiInterval <- renderUI({
  Items <- c(10, 20, 50)
  selectInput(inputId = "interval", 
              label   = "Interval", 
              choices = Items, 
              selected = 10)
})


output$uiStack <- renderUI({
  checkboxInput(inputId = "stack", 
                label   = "Stack all variables",
                value   = TRUE)
})
