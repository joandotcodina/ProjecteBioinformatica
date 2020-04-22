
library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  tags$head(
    tags$link(rel = "stylesheet", type = "text/css", href = "bootstrap.css")
  ),
  navbarPage("Contaminació a Catalunya",
             
             tabPanel("Mapa",# Application title
                      titlePanel("La contaminació atmosfèrica a Catalunya"),
                      
                      # Sidebar with a slider input for number of bins 
                      sidebarPanel(
                        
                        selectInput(inputId ="anys", label = h3("Any"), 
                                    choices = list(2009 , 2010 ,2011, 2012, 2013, 2014, 2015, 2016), selected = 2016),
                        radioButtons(inputId ="tipos", label = h3("Tipus de contaminació"),
                                     choices = list("NO2" = "a","PM10" = "b"))
                      ),
                       "AVIS: NORMALMENT TRIGA UNS MINUTS EN GENERAR-SE, NO ES INSTANTANI",
                      
                      
                      # Show a plot of the generated distribution
                      mainPanel(
                        plotOutput("mapa")
                      )),
             tabPanel("Com utilitzar-ho",   # Information about data collection.
                      "Darrera actualizació 03/06/2017.",
                      br(),
                      br(),
                      "1º Seleccionar el any",
                      br(),
                      "2º Seleccionar el tipus de contaminació",
                      br(),
                      br(),
                      "Informació sobre els tipus que hem analitzat.",br(),br(),
                      "El Dióxid de nitrogen (NO2) es generat en bona part per els cotxes, fent que sigui un dels causants de la famosa pluja Ã cida,",
                      br(),
                      "ja que en reaccionar amb el vapor d'aigua produiria ácid nítric.",
                      br(),
                      br(),
                      "Les particules PM10, al estar a l'exposiciÃ³ perllongada o repetitiva pot provocar efectes nocius en el sistema ",
                      br(),
                      "respiratori de la persona. En general, es bona part generat per la indústria. ", 
                      br(),
                      br(),
                      br(),
                      "Qualsevol dubte o pregunta ens el podeu fer arribar via mail a :",
                      br(),
                      "Joan Dot Codina: " ,
                      a("jdot@campus.eug.es", href="mailto:jdot@campus.eug.es"),
                      br(),
                      "Javier Valero: ",
                      a("javi_bcn_rubi@hotmail.com", href=" - ")))
  
  
))
