library(shiny)

ui <- fluidPage(
  selectInput("data_choice", label = "Meow", choices = ls("package:datasets")),
  verbatimTextOutput("summary"),
  tableOutput("table")
)

server <- function(input, output, session) {
  # Create a reactive expression
  data_choice <- reactive({
    get(input$data_choice, "package:datasets")
  })

  output$summary <- renderPrint({
    # Use a reactive expression by calling it like a function
    summary(data_choice)
  })

  output$table <- renderTable({
    data_choice
  })
}

shinyApp(ui, server)