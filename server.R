library(shiny)
library(ggplot2)

shinyServer(function(input, output) {
 
  output$DEE <- renderText({
    df <- data.frame(exercise=c("e1","e2","e3","e4","e5"), factor=c(1.2, 1.375, 1.55, 1.725, 1.9))
    efactor <- df[df$exercise == input$exercise, 2]
    if(input$gender == "M") 
      DEE <- (9.99 * input$weight + 6.25 * input$height -4.92 * input$age + 5) * efactor
    else DEE <- (9.99 * input$weight + 6.25 * input$height -4.92 * input$age - 161) * efactor
    DEE
  })
  
  output$RDN <- renderText({
    df <- data.frame(exercise=c("e1","e2","e3","e4","e5"), factor=c(1.2, 1.375, 1.55, 1.725, 1.9))
    efactor <- df[df$exercise == input$exercise, 2]
    if(input$gender == "M") 
      DEE <- (9.99 * input$weight + 6.25 * input$height -4.92 * input$age + 5) * efactor
    else DEE <- (9.99 * input$weight + 6.25 * input$height -4.92 * input$age - 161) * efactor
    
    if(input$goal == "mt") RDN = DEE
    else RDN = DEE - 500
    RDN
  })
   
  output$distPlot <- renderPlot({
    BMI <- input$weight/input$height^2 *10000
    sc <- data.frame(type=c("4.underweight","3.normal","2.overweight","1.obese"),
                        BMI=c(18.5, 6.5, 5, 20),t=c(1,1,1,1))
    p1 <- ggplot(sc, aes(x=t,y=BMI,fill=type))
    p2 <- p1 + geom_col() + scale_fill_manual(values =c("#FF6347","#FF7F50","#FFE4B5","#FFA500"))
    p3 <- p2 + geom_hline(yintercept = BMI,show.legend = FALSE)
    p3 + coord_flip() + theme(
      axis.title.y=element_blank(),axis.text.y=element_blank(),axis.ticks.y=element_blank())
  })

})
