

library(shiny)

# Define server logic required to draw a histogram
#dividir els fitxers per anys, i anar fent ifs, per generar-ho en funcio de les variables
shinyServer(function(input, output) {
   #SABER QUE FA CADA PAQUET
  output$mapa <- renderPlot({ 
    library(XLConnect)
    require("rgdal")
    require("ggplot2")
    require("plyr")
    library(maptools)
    library(RColorBrewer)
    require("gpclib")
    #Carreguem excel
    any <- input$anys
    tipo <- input$tipos
    if((tipo == "b") && (any = 2009))
      data <- readWorksheetFromFile("PM1009.xlsx",sheet=1,startRow = 1, endCol = 2)
    else if((tipo == "b") && (any = 2010))
      data <- readWorksheetFromFile("PM1010.xlsx",sheet=1,startRow = 1, endCol = 2)
    else if((tipo == "b") && (any = 2011))
      data <- readWorksheetFromFile("PM1011.xlsx",sheet=1,startRow = 1, endCol = 2)
    else if((tipo == "b") && (any = 2012))
      data <- readWorksheetFromFile("PM1012.xlsx",sheet=1,startRow = 1, endCol = 2)
    else if((tipo == "b") && (any = 2013))
      data <- readWorksheetFromFile("PM1013.xlsx",sheet=1,startRow = 1, endCol = 2)
    else if((tipo == "b") && (any = 2014))
      data <- readWorksheetFromFile("PM1014.xlsx",sheet=1,startRow = 1, endCol = 2)
    else if((tipo == "b") && (any = 2015))
      data <- readWorksheetFromFile("PM1015.xlsx",sheet=1,startRow = 1, endCol = 2)
    else if((tipo == "b") && (any = 2016))
      data <- readWorksheetFromFile("PM1016.xlsx",sheet=1,startRow = 1, endCol = 2)
    else if((tipo == "a") && (any = 2009))
      data <- readWorksheetFromFile("NO209.xlsx",sheet=1,startRow = 1, endCol = 2)
    else if((tipo == "a") && (any = 2010))
      data <- readWorksheetFromFile("NO210.xlsx",sheet=1,startRow = 1, endCol = 2)
    else if((tipo == "a") && (any = 2011))
      data <- readWorksheetFromFile("NO211.xlsx",sheet=1,startRow = 1, endCol = 2)
    else if((tipo == "a") && (any = 2012))
      data <- readWorksheetFromFile("NO212.xlsx",sheet=1,startRow = 1, endCol = 2)
    else if((tipo == "a") && (any = 2013))
      data <- readWorksheetFromFile("NO213.xlsx",sheet=1,startRow = 1, endCol = 2)
    else if((tipo == "a") && (any = 2014))
      data <- readWorksheetFromFile("NO214.xlsx",sheet=1,startRow = 1, endCol = 2)
    else if((tipo == "a") && (any = 2015))
      data <- readWorksheetFromFile("NO215.xlsx",sheet=1,startRow = 1, endCol = 2)
    else if((tipo == "a") && (any = 2016))
      data <- readWorksheetFromFile("NO216.xlsx",sheet=1,startRow = 1, endCol = 2)
   
    
    g <- readOGR("bm50mv33sh1fpm1r170.shp")
    
    names(data) <- c("id", "NO2")

    library(maptools)
    gpclibPermit()
    d2 <- fortify(g, region="NOM_MUNI")
    e2 <- join(d2,data, by="id")
  
    e2$NO2 <- cut_number(e2$NO2, 8)
    
    ma <- ggplot(e2) + aes(long,lat,group=group, fill = NO2) + geom_polygon()

    sethTheme <- theme(
      panel.background = element_rect(fill = "black"),
      plot.background = element_rect(fill = "black"),
      panel.grid.minor = element_blank(),
      panel.grid.major = element_line(linetype = 3, colour = "white"),
      axis.text.x = element_text(colour = "grey80"),
      axis.text.y = element_text(colour = "grey80"),
      axis.title.x = element_text(colour = "grey80"),
      axis.title.y = element_text(colour = "grey80"),
      legend.key = element_rect(fill = "black"),
      legend.text = element_text(colour = "white"),
      legend.title = element_text(colour = "black"),
      legend.background = element_rect(fill = "black"),
      axis.ticks = element_blank())
    
    
    
    mapa <- ggplot(e2) + aes(long,lat,group=group, fill = NO2) + geom_polygon(aes(fill = NO2))
    mapa <- mapa + geom_path(color="gray") + coord_equal()
    mapa <- mapa + scale_fill_brewer(palette = "YlOrRd") + sethTheme
    theme(plot.title = element_text(size=30, face = "bold", color="yellow"))
    mapa
  })
  
})
