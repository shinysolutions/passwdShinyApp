
#### Log in module ###
Logged <- FALSE;
USER <- reactiveValues(Logged = Logged)

# Load password table;
PASSWORD <- data.frame(Username = "Huidong Tian", Password = "0483858e13ff82347629ac26b5510b69")

# Front end;
passwdInput <- function(inputId, label) {
  tagList(
    tags$div(
      tags$label(label),
      tags$input(id = inputId, type="password", value="", class = "form-control shiny-bound-input")
    )

  )
}

output$uiLogin <- renderUI({
  if (USER$Logged == FALSE) {
    wellPanel(
      textInput("userName", "User Name:"),
      passwdInput("passwd", "Pass word:"),
      br(),
      actionButton("Login", "Log in")
    )
  }
})

output$pass <- renderText({  
  if (USER$Logged == FALSE) {
    if (!is.null(input$Login)) {
      if (input$Login > 0) {
        Username <- isolate(input$userName)
        Password <- isolate(input$passwd)
        Id <- which(PASSWORD$Username == Username)
        if (length(Id) > 0) {
          if (PASSWORD$Password[Id] == Password) {
            USER$Logged <- TRUE
          } else {
            "Password failed!"
          }
        } else  {
          "User name is not correct!"
        }
      } 
    }
  }
})
