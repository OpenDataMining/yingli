---
title       : Voice Explorer
subtitle    : 
author      : Ying Li
job         : EV Analysis
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

## we are passionate about exploring voice data

1. voice data is very rich in both descriptive power as well as predictive power
2. many existing research works are done in adjacent research fields that are ripe to be brought together for more fruitful research
3. many R packages and functions can readily be applied to voice data for amazing discovery analysis
4. there are vast amount of voice data available to be explored for finding noval solutions to problems new and old
5. example applications
 - human machine communication
 - affective computing

--- .class #id 

## explore in time domain



We can take a look at the sound wave of the voice recording in the time domain. 
Listen to the two voice recordings:
- voice 1: http://evanalysiscorp.com/analysis/shiny/voiceExplorer/JFK_weChoose.wav
- voice 2: http://evanalysiscorp.com/analysis/shiny/voiceExplorer/Obama_theyShare.wav


![plot of chunk unnamed-chunk-2](assets/fig/unnamed-chunk-2-1.png) 


--- .class #id 

## explore in frequency domain

- exploration and analysis in frequency domain often utilize Fast Fourier Transform (FFT)
- there are many functions available for running FFT on a voice wave signal
- we use R function periodogram in library "tuneR", for which we can select the FFT window size and window overlap size (below plots uses window size 1024 and overlap size 256 on recording voice 1)

![plot of chunk unnamed-chunk-3](assets/fig/unnamed-chunk-3-1.png) 


--- .class #id 

## to start exploring

- an interactive application is developed to help the exploration of voice data
- using the application, one can alter the FFT window size and window overlap size and watch the effect in real time
- go to http://yingli.shinyapps.io/voiceExplorer/ 

![plot of chunk unnamed-chunk-4](assets/fig/unnamed-chunk-4-1.png) 

