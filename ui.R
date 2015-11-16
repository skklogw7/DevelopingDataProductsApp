library(shiny)

shinyUI(fluidPage(
        titlePanel(
                h3("Self-Assessment Tool for Test Performance"),
                
                ),
        br(),
        sidebarLayout(
                sidebarPanel(width = 4, "This app allows you to assess the relationship between your study time 
                             and your test performance. Enter five test scores here, from 0 to 100, 
                             and how many minutes you spent studying for each test. Then click 'Submit'.",
                             br(),
                             br(),
                             "The app will return a table of feedback with some basic summary 
                             statistics of your overall test performance. Then it will plot the 
                             relationship between your test scores and preparation time. If you see 
                             an error in red right now, don't worry. Just enter your scores and 
                             click 'Submit.'",
                             br(),
                             br(),
                             "Note: in order for the app to work, you must change at least one 
                             of the test score boxes AND one of the 'minutes spent' boxes from their 
                             default values.",
                             br(),
                             br(),

                             numericInput("test1", 
                                           label = h4("Test result 1:"),
                                           min = 0, max = 100, step = 0.1,
                                           value = 100),
                              numericInput("test1Minutes", 
                                           "How many minutes did you spend studying for Test 1?",
                                           min = 0, max = 600, step = 1, value = 60),
                              numericInput("test2", 
                                           label = h4("Test result 2:"),
                                           min = 0, max = 100, step = 0.1,
                                           value = 100),
                              numericInput("test2Minutes", 
                                           "How many minutes did you spend studying for Test 2?",
                                           min = 0, max = 600, step = 1,
                                           value = 60),
                              numericInput("test3", 
                                           label = h4("Test result 3:"),
                                           min = 0, max = 100, step = 0.1,
                                           value = 100),
                              numericInput("test3Minutes", 
                                           "How many minutes did you spend studying for Test 3?",
                                           min = 0, max = 600, step = 1,
                                           value = 60),
                              numericInput("test4", 
                                           label = h4("Test result 4:"),
                                           min = 0, max = 100, step = 0.1,
                                           value = 100),
                              numericInput("test4Minutes", 
                                           "How many minutes did you spend studying for Test 4?",
                                           min = 0, max = 600, step = 1,
                                           value = 60),
                              numericInput("test5", 
                                           label = h4("Test result 5:"),
                                           min = 0, max = 100, step = 0.1,
                                           value = 100),
                              numericInput("test5Minutes", 
                                           "How many minutes did you spend studying for Test 5?",
                                           min = 0, max = 600, step = 1,
                                           value = 60),
                              submitButton('Submit')
                              
                              ),
                
                mainPanel(
                        uiOutput("summaryStats"), 
                        uiOutput("dataFrame"),
                        plotOutput("scatterPlot"))
                
                )
))

