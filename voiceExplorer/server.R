#! /usr/bin/env Rscript
library(shiny)
library(shinyFiles)
library(shinyapps)
library(tuneR)
shinyServer(function(input, output, session) {
    shinyFileChoose(input, 'file', roots=c(wd='./data/'), filetypes = c("wav"), session=session, restrictions=system.file(package='base'))
    output$filename <- renderText({
      if (input$runAnalysis == 0) "please select a voice file from the left sidebar and click start"
      else paste0("you have selected file ",
                 as.character(parseFilePaths(roots=c(wd='./data/'), input$file)[1,4]),
                 ", you can play the sound by clicking on the below link")
    })
    output$voiceLink <- renderUI({
        if (input$runAnalysis == 0) ""
        else{
            fileUrl <- as.character(parseFilePaths(roots=c(wd=''), input$file)[1,4])
            a("play the sound of the voice", class = "web", href = paste0('http://www.evanalysiscorp.com/analysis/shiny/voiceExplorer/data', fileUrl))
        }
    })
   output$specPlot <- renderPlot({
       if (input$runAnalysis == 0) ""
       else{
           voice <- readWave(as.character(parseFilePaths(roots=c(wd='./data/'), input$file)[1,4]))
           par(mfrow=c(2,1))
           plot(periodogram(voice, width = as.numeric(input$windowSize),
                            overlap=as.numeric(input$windowSize)*as.numeric(input$overlapSize)),
                        col="red", xlim=c(0,4000), xlab="frequency (Hz)",ylab = NA, main = "spectral density")
           plot(voice, xlab = " time index", main="the voice wave you selected, as reference")
           }
    })
   output$FFPlot <- renderPlot({
       if (input$runAnalysis == 0) ""
       else{
           voice <- readWave(as.character(parseFilePaths(roots=c(wd='./data/'), input$file)[1,4]))
           par(mfrow=c(2,1))
           plot(FFpure(periodogram(voice, width = as.numeric(input$windowSize), overlap=as.numeric(input$windowSize)*as.numeric(input$overlapSize))),
                xlab="time window index", ylab=NA, main="fundamental frequencies", col="blue", pch=20)
           plot(voice, xlab = " time index", main="the voice wave you selected, as reference")
       }
   })
})
