library(shiny)

animals <- c("dog", "cat", "mouse", "bird", "other", "I hate animals")

ui <- fluidPage(
  # ecommend supplying the inputId and label arguments by position, and all other arguments by name:
  sliderInput("min", "Limit (minimum)", value = 50, min = 0, max = 100),
  textInput("name", "What's your name?"),
  # hide input ofr passwords
  passwordInput("password", "What's your password?"),
  # make a larger text box with rows
  textAreaInput("story", "Tell me about yourself", rows = 3),
  # get a range of nums using c(num, num)
  # ony small rages otherwise bad UI
  sliderInput("rng", "Range", value = c(10, 20), min = 0, max = 100),
  # date default to USA standards, set format, language, and weekstart with locale
  dateInput("dob", "When were you born?"),
  dateRangeInput("holiday", "When do you want to go on vacation next?"),
  # state.name built in
  selectInput("state", "What's your favourite state?", state.name),
  # see animals variable defined above
  radioButtons("animal", "What's your favourite animal?", animals),
  # radio choiceNames determines what is shown to the user; choiceValues determines what is returned in your server function
  radioButtons("rb", "Choose one:",
    choiceNames = list(
      icon("angry"),
      icon("smile"),
      icon("sad-tear")
    ),
    choiceValues = list("angry", "happy", "sad")
  ),
  # dropdown multiple input
  selectInput(
    "state", "What's your favourite state?", state.name,
    multiple = TRUE
  ),
  # radio mulitple input hack
  checkboxGroupInput("animal", "What animals do you like?", animals),
  # checkboxeds
  checkboxInput("cleanup", "Clean up?", value = TRUE),
  checkboxInput("shutdown", "Shutdown?"),
  # upload file, requires special handling on service side
  fileInput("upload", NULL),
  # action buttons! paired with observeEvent() or eventReactive() in  server function.
  actionButton("click", "Click me!"),
  actionButton("drink", "Drink me!", icon = icon("cocktail")),
  # fluid row and using boostrap
  fluidRow(
    actionButton("click", "Click me!", class = "btn-danger"),
    actionButton("drink", "Drink me!", class = "btn-lg btn-success")
  ),
  fluidRow(
    actionButton("eat", "Eat me!", class = "btn-block")
  ),
  # 2.2.8 Exercises
  # create a placeholder
  textInput("name", "", placeholder = "Your name"),
  # make a date slider
  sliderInput("deliver_date",
    "When should we deliver?",
    min = as.Date("2020-09-17"),
    max = as.Date("2020-09-20"),
    value = as.Date("2015-09-17"),
    timeFormat = "%Y-%m-%d"
  ),
  # animate a slider
  sliderInput("slider_animate", "Select a value", min = 0, max = 100, value = 0, step = 5, animate = animationOptions(interval = 500)),
  # subgroups in a dropdown
  selectInput("select_with_groups", "Choose a subgroup:",
    choices = list(
      "Fruits" = list("Apple" = "apple", "Banana" = "banana", "Cherry" = "cherry"),
      "Vegetables" = list("Carrot" = "carrot", "Broccoli" = "broccoli", "Spinach" = "spinach"),
      "Dairy" = list("Milk" = "milk", "Cheese" = "cheese", "Yogurt" = "yogurt")
    )
  )
)

server <- function(input, output, session) {
}

shinyApp(ui, server)
