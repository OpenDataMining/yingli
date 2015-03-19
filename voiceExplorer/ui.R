#! /usr/bin/env Rscript
library(shiny)
library(shinyFiles)

shinyUI(
  fluidPage(
	  titlePanel("Voice Explorer"),
	  sidebarLayout(
  	  sidebarPanel(
        h4(helpText("select a voice file and then click start")),
        shinyFilesButton('file', "click to select a voice file", "select a voice file", FALSE),
        actionButton("runAnalysis", "start"),
        tags$hr(),
        selectInput("windowSize",
  	                  "change window size for spectrum analysis",
  	                  choices = 2^(8:13),
  	                  selected = 2^10),
  	    tags$hr(),
        sliderInput("overlapSize",
  	                "change window overlap portion",
  	                min = 0,
  	                max = 1,
  	                value = 0.5)
  	  ),
		  mainPanel(
		    tabsetPanel(
		      tabPanel("summary",
		               p(textOutput("filename")),
		               uiOutput('voiceLink'),
		               tags$hr(),
		               p("this application enables you to explore the different aspects of a voice sound"),
                       HTML("<ul>
                    <li>on the left sidebar, you can </li>
                        <ul>
                            <li>choose/change a voice file you want to analyze</li>
                            <li>change the parameters that control the window size for Fourier Transform</li>
                        </ul>
                   <li>on the main tabs, we show different explorations</li>
                        <ul> <li> spectral analysis </li>
                                <li> fundamental frequencies </li>
                        </ul>
                   </ul>")
		        ),
              tabPanel("spectral density",
                      p("Choose a sound wave file from the left, we plot the power spectral density (PSD) of the sound wave here, ",
                        "it is the power contributed to the wave by a frequency per unit frequency. ",
                        "You can learn more about it at this ",
                         a("wikipedia article", href = "http://en.wikipedia.org/wiki/Spectral_density#Power_spectral_density")),
                      br(),
                      p("you can change the analysis window size from left sidebar to see the effect"),
                       plotOutput("specPlot")
		        ),
              tabPanel("fundamental frequencies",
                       p("Choose a sound wave file from the left, we plot the fundamental frequencies of the sound wave here, ",
                         "they are the lowest frequencies of all the individual waves that add up to the voice. ",
                         "You can learn more about human voice frequency from this ",
                         a("article", href = "http://www.uoverip.com/voice-fundamentals-human-speech-frequency/")),
                       br(),
                       p("you can change the analysis window size from left sidebar to see the effect"),
                       plotOutput("FFPlot")
                )
		    )
		  )
	  )
  )
)
