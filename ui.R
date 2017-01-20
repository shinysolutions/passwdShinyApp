library("rCharts")
shinyUI(bootstrapPage(
  # Add custom CSS & Javascript;
  tagList(
    tags$head(
      tags$link(rel="stylesheet", type="text/css",href="style.css"),
      tags$style("hr {margin: 5px 0;}"),
      tags$script(type="text/javascript", src = "md5.js"),
      tags$script(type="text/javascript", src = "passwdInputBinding.js")
    )
  ),
  
  ## Login module;
  div(class = "login", uiOutput("uiLogin"), textOutput("pass")), 
  div(class = "input", 
      uiOutput("uiInterval"),
      uiOutput("uiStack")),
  div(class = "output", chartOutput("fig", lib = "highcharts"))
  
))