library(shiny)
# https://stellali.shinyapps.io/HealthyDiet/

shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel("Healthy Diet"),
  
  # Sidebar with a slider input for number of bins 
  sidebarPanel(
      radioButtons("gender","Choose your gender",choices = c("Male"="M", "Female"="F")),
      numericInput("age", "Your age",25, min=1, max=100),
      sliderInput("weight", "Your weight (kg)", min = 40, max = 150, value = 60),
      sliderInput("height", "Your height (cm)", min = 100, max = 200, value = 170),
      radioButtons("goal", "Choose your goal", choices = c("Maintain"="mt", "Loss Weight"="lw")),
      radioButtons("exercise", "How often do you do exercise", 
                   choices = c("Rarely"="e1", 
                               "1-2 times per week"="e2",
                               "3-5 times per week"="e3",
                               "6-7 times per week"="e4",
                               "Professional athlete"="e5"))
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      h3("Your Daily Energy Expenditure (kCal):"), 
      verbatimTextOutput("DEE"),
      h3("Recommended Daily Needs (kCal):"), 
      verbatimTextOutput("RDN"),
      h3("Your BMI:"),
      plotOutput("distPlot", height="120px")
    )
))
