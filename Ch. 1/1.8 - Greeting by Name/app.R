library(shiny)

ui <- fluidPage(
  textInput("name", "What's your name?"),
  textOutput("greeting")
)

server <- function(input, output, session) {
  # only show greeting if textinput is not empty

output$greeting <- renderText({
  if (input$name != "") {
    paste0("Grüezi, ", input$name, "!")
  } else {
    ""
  }})
}

shinyApp(ui, server)