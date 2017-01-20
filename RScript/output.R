output$fig <- renderChart({
  ## Highchart basic;
  H <- Highcharts$new()
  H$addParams(dom = "fig")
  H$chart(type = "column", zoomType = "xy")
  H$subtitle(text = " ")
  H$legend(align = "right", verticalAlign = "middle", layout = "vertical")
  H$yAxis(title = list(text = "Number of cases"), allowDecimals = FALSE)
  H$exporting(enabled = TRUE)

  
  if (!is.null(input$stack)) {
    
    Int <- as.numeric(input$interval)
    Dat$Year <- floor(Dat$Year/Int) * Int
    
    Dat <- aggregate(Dat[, -1], list(Year = Dat$Year), sum, na.rm = TRUE)
    
    H$xAxis(tickLength = 0, categories =Dat$Year, title = list(text = "Year"), 
            events = list(setExtremes = setExtremes), 
            labels = list(step = ceiling(nrow(Dat)/10)))
    
    if(!is.null(input$variable)) {
      v <- input$variable
    } else {
      v <- names(Dat)[-1]
    }
    
    for (i in names(Dat)[-1]) {
      H$series(data = Dat[, i], name = i)
    }
    
    if (input$stack) {
      stack <- "normal"
    } else {
      stack <- NULL
    }
    H$plotOptions(column = list(stacking = stack),series = list(borderWidth = 0))
    
  }
  H
})
