Developing Data Products Project Presentation
========================================================
author: Amithabh Shrinivas
date: Thu Jul 28 01:06:31 2016
autosize: true
type: typename
transition: rotate
Introduction
========================================================


- CO2 dataset available in the base R package is used by the Shiny application
- The application has 3 tabPanels:
  - Plots makes scatter plots 
  - Hypothesis testing
  - Documentation
- Inputs used by application: checkboxInput, selectInput, sliderInput and textInput
- Outputs used: plotOutput, verbatimTextOutput and dataTableOutput

Structure of dataset
========================================================


```r
str(CO2)
```

```
Classes 'nfnGroupedData', 'nfGroupedData', 'groupedData' and 'data.frame':	84 obs. of  5 variables:
 $ Plant    : Ord.factor w/ 12 levels "Qn1"<"Qn2"<"Qn3"<..: 1 1 1 1 1 1 1 2 2 2 ...
 $ Type     : Factor w/ 2 levels "Quebec","Mississippi": 1 1 1 1 1 1 1 1 1 1 ...
 $ Treatment: Factor w/ 2 levels "nonchilled","chilled": 1 1 1 1 1 1 1 1 1 1 ...
 $ conc     : num  95 175 250 350 500 675 1000 95 175 250 ...
 $ uptake   : num  16 30.4 34.8 37.2 35.3 39.2 39.7 13.6 27.3 37.1 ...
 - attr(*, "formula")=Class 'formula'  language uptake ~ conc | Plant
  .. ..- attr(*, ".Environment")=<environment: R_EmptyEnv> 
 - attr(*, "outer")=Class 'formula'  language ~Treatment * Type
  .. ..- attr(*, ".Environment")=<environment: R_EmptyEnv> 
 - attr(*, "labels")=List of 2
  ..$ x: chr "Ambient carbon dioxide concentration"
  ..$ y: chr "CO2 uptake rate"
 - attr(*, "units")=List of 2
  ..$ x: chr "(uL/L)"
  ..$ y: chr "(umol/m^2 s)"
```

Description of the App
========================================================


- Goal of the app:
  - To understand the CO2 dataset using exploratory analysis
  - To make some preliminary statistical analysis
- Here's the link to my app:  [CO2-DataExplorer](https://amithabh.shinyapps.io/workspace17/)
- Here's the link to my project files at github:  [DataProducts](https://github.com/Amithabh/Developing-Data-Products)


Hypothesis testing
========================================================


```

	Welch Two Sample t-test

data:  CO2$uptake by CO2$Type
t = 6.5969, df = 78.533, p-value = 4.451e-09
alternative hypothesis: true difference in means is not equal to 0
95 percent confidence interval:
  8.839475 16.479572
sample estimates:
     mean in group Quebec mean in group Mississippi 
                 33.54286                  20.88333 
```
