c2c
===========
[![Build Status](https://travis-ci.org/mitchest/c2c.svg?branch=master)](https://travis-ci.org/mitchest/c2c)  

## What is c2c??
An R package for comparing two classifications or clustering
solutions that have different structures - i.e. different number
of classes or soft or hard membership. From the DESCRIPTION:  
Compare two classifications that may or may not have the same
number of classes, and that might have hard or soft (fuzzy, 
probabilistic) membership. Calculate various metrics to assess how the
clusters compare to each other. The calculations are simple, but
provide a handy tool for users unfamiliar with matrix multiplication.  

* more detail to come shortly  

## Installation

Up on CRAN soon, but for the meantime install from here.  
It's very easy - simply use Hadley Wickham's (excellent) **devtools**
package - install **devtools**  

    install.packages("devtools")
  
then call  
  
    library(devtools)
	devtools::install_github("mitchest/c2c")

### Bugs

There are some probably. If you find them, please let me know
about them - either directly on github, or the contact details below. 

## How to use c2c?
It's really quite a simply package - check out the examples in the 
function descriptions,  or check out how this type of analysis is 
used in one of the papers below. 
	
### Contact

* Mitchell Lyons
* mitchell.lyons@gmail.com / mitchell.lyons@unsw.edu.au
	
### References
Lyons et al. 2017. Simultaneous vegetation classification and mapping at large spatial scales. \emph{Journal of Biogeography}.  

Foster, Hill and Lyons (2017) "Ecological Grouping of Survey Sites when Sampling Artefacts are Present". Journal of the Royal Statistical Society: Series C (Applied Statistics).
DOI: http://dx.doi.org/10.1111/rssc.12211

