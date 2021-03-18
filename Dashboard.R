library(shiny)
library(shinydashboard)
library(DT)

ui <- dashboardPage(
  
  dashboardHeader(title="Dashboard"),
  dashboardSidebar(
    
    menuItem("Logistic Regression Display", tabName = "Logistic Regression Display") ,
    menuItem("P-value Display", tabName = "Logistic Regression Display") 
    
  ),
  dashboardBody(
    
    box(plotOutput("box_plot"),width = 6),
    box(plotOutput("correlation_plot"),width = 6),
    
    DT::dataTableOutput("mytable")
    
    
  )
  

  
  
)



server <- function(input,output){
  

  
  output$box_plot<-renderPlot(
    
    boxplot(box_whisker$Before,box_whisker$After,col=c("#FF000099", "#FF6D0099"),  whiskcol=c("#49FF00FF"), main="Box and Whisker Plot", ylab = "Defect Density")
  )
  
  
  output$mytable = DT::renderDataTable({
    box_whisker
  })

  
  output$correlation_plot<-renderPlot(
    
    plot(box_whisker$Before,box_whisker$After,col=c("#FF000099", "#FF6D0099"),  whiskcol=c("#49FF00FF"), main="Box and Whisker Plot", ylab = "Defect Density")
  )
  
  

 
 
  
}

shinyApp(ui,server)