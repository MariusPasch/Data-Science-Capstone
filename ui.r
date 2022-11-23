
suppressWarnings(library(shiny))
shinyUI(fluidPage("Data Science Capstone: Word Prediction Application",
                   tabPanel("Predicting the next word",
                            HTML("<strong>Author: Marios Paschalidis</strong>"),
                            br(),
                            HTML("<strong>Date: 22 Nov 22</strong>"),
                            br(),
                            # Sidebar
                            sidebarLayout(
                              sidebarPanel(
                                helpText("Begin enter word phrase, the application will predict the next word"),
                                textInput("inputString", "Enter phrase here",value = ""),
                                br(),
                                br(),
                                br(),
                                br()
                              ),
                              mainPanel(
                                h2("Predicted word"),
                                textOutput("prediction")
                              
                              )
                            )
                            
                   )
)
)