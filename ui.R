library(shiny)
shinyUI(
  pageWithSidebar(
    headerPanel("Mean Arterial Pressure (MAP) calculator"),
    sidebarPanel(
      numericInput('sbp', 'Enter systolic blood pressure (mmHg)', 120, min = 0, max = 1000, step = 1),
      numericInput('dbp', 'Enter diastolic blood pressure (mmHg)', 80, min = 0, max = 1000, step = 1),
      submitButton('Calculate')
    ),
    mainPanel(
      tabsetPanel(type="tabs",
                  tabPanel("Output", br(), h4('MAP:'), verbatimTextOutput("out1"), textOutput("out2")),
                  tabPanel("Documentation", br(), h3('What is MAP?'), textOutput("docu"), h4('References'), 
                           textOutput("refer1"), textOutput("refer2"), h3('How to use this app'), textOutput("how"))
                  
    )
  )
))
     
