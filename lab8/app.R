# install packages
#install.packages("shiny")
library(shiny)

# read data
data = read.csv("Advertising.csv", row.names = 1)

# separate data
Tv = data[,1]
Radio = data[,2]
Newspaper = data[,3]
Sales = data[,4]

ui = fluidPage(headerPanel("Select data source"),
               selectInput("xData", "X Variable", names(data)[1:3],
                           selected = names(data)[[1]]),
               mainPanel(plotOutput("plot1"))
               )

server = function(input, output) {
  selectedData = reactive({
    data[, input$xData]
  })
  
  model = reactive ({
      lm(data[,"Sales"] ~ data[,input$xData])
    })
  
  output$plot1= renderPlot ({
    plot(selectedData(), data[,"Sales"])
    abline(model(), col = "Red")
  })
  
}

shinyApp(ui=ui, server=server)











