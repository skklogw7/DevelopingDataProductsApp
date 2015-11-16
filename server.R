library(shiny)
shinyServer(        
        function(input, output) {                
                
                output$summaryStats <-renderTable({
                        scoresVector <- c(input$test1, input$test2, input$test3, input$test4, input$test5)
                        testMean <- (mean(scoresVector))
                        testMedian <- median(scoresVector)
                        testMin <- min(scoresVector)
                        testMax <- max(scoresVector)
                        testSD <- sd(scoresVector)
                        
                        if (testMean >= 90) grade <- "A"
                        else if (testMean >= 80) grade <- "B"
                        else if (testMean >= 70) grade <- "C"
                        else if (testMean >= 60) grade <- "D"
                        else grade <- "F"
                        
                        data.frame(testMean, testMedian, testMin, testMax, testSD, grade)
                        
                
                }
                )
                output$dataFrame <-renderTable({
                        scoresVector <- c(input$test1, input$test2, input$test3, input$test4, input$test5)
                        minutesVector <- c(input$test1Minutes, input$test2Minutes, input$test3Minutes, input$test4Minutes, input$test5Minutes)
                        
                        testMean <- ((input$test1 + input$test2 + input$test3 + input$test4 + input$test5)/5)
                        testMedian <- median(c(input$test1, input$test2, input$test3, input$test4, input$test5))
                        testMin <- min(c(input$test1, input$test2, input$test3, input$test4, input$test5))
                        testMax <- max(c(input$test1, input$test2, input$test3, input$test4, input$test5))
                        testSD <- sd(c(input$test1, input$test2, input$test3, input$test4, input$test5))
                        
                        testData <- data.frame(Scores = scoresVector,
                                               Minutes = minutesVector)                
        }
        )
        output$scatterPlot <-renderPlot({
                
                scoresVector <- c(input$test1, input$test2, input$test3, input$test4, input$test5)
                minutesVector <- c(input$test1Minutes, input$test2Minutes, input$test3Minutes, input$test4Minutes, input$test5Minutes)
                
                
                testData <- data.frame(Scores = scoresVector,
                                       Minutes = minutesVector)
                plot(testData$Minutes, testData$Scores, 
                     main = "Academic Performance vs Preparation Time",
                     ylim = c(0, 100),
                     ylab = "Test Score (% out of 100)", 
                     xlim = c(0, max(minutesVector)),
                     xlab = "Study Time (minutes)",
                     abline(lm(Scores ~ Minutes, data = testData))
                     
                     )
                
                
                
        }
        )

}
)

