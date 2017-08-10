c2c
===========
[![](http://cranlogs.r-pkg.org/badges/c2c)](http://cran.rstudio.com/web/packages/c2c/index.html)  
[![Build Status](https://api.travis-ci.org/mitchest/c2c.svg)](https://travis-ci.org/mitchest/c2c)  

## What is c2c?

An R package for comparing two classifications or clustering
solutions that have different structures - i.e. the two 
classifications have a different number of classes, or one 
classification has soft membership and one classification has
hard membership. You can create a confusion matrix (error
matrix) and then calculate various metrics to assess how the
clusters compare to each other. The calculations are simple, but
provide a handy tool for users unfamiliar with matrix
multiplication. The helper functions also help you to do things
like make a soft classification into a hard one, or turn a set
of class labels into a binary classification matrix.

## How to use c2c?

The basic premise is that you already have two (or more perhaps)
classifications that you would like compare - these could be
from a clustering algorithm, extracted from a remote sensing
map, a set of classes assigned manually etc. There already
exist a number of tools and packages to calculate cluster
diagnostics or accuracy metrics, but they are usually focused on
comparing clustering solutions that are hard (i.e. each 
observation has only one class) and have the same number of
classes (e.g. clustering solution vs. the 'truth'). c2c is
designed to allow you to compare classifications that to not fit
into this scenario. The motivating problem was the need to
compare a probabilistic clustering of vegetation data to an
existing hard classification (which had a hierarchy with of
numbers of classes) of that data, without losing the 
probabilistic component that the clustering algorithm produces.  

This example is on silly fake data, but it's quick and will run
without any additional data or package loads. Check out the
vignette for something a little more sensible.  
[c2c vignette](https://rawgit.com/mitchest/c2c/master/c2c-workflow.html).  

First install and load c2c

```r
install.packages("c2c")
library(c2c)
```

Make a silly made up soft classification matrix

```r
my_soft_mat <- matrix(runif(50,0,1), nrow = 10, ncol = 5)
```

and a made up set of class labels, with matching number of observations

```r
my_labels <- rep(c("a","b","c"), length.out = 10)
```

The two main functions are ```get_conf_mat``` and ```calculate_clustering_metrics```.
First generate the confusion matrix

```r
conf_mat <- get_conf_mat(my_soft_mat, my_labels)
conf_mat
```

then calculate the metrics - see ```?calculate_cluster_metrics``` for details

```r
calculate_clustering_metrics(conf_mat)
```

You could also just pass any confusion matrix (that you have already generated elsewhere).
Another thing you can do within ```get_conf_mat``` is turn a soft matrix into a hard one.

## Installation

You can install directly from CRAN as above

```r
install.packages("c2c")
```

or if you want to get the development version,
which might have some new functionality, you can install from GitHub. It's very easy, simply
use Hadley Wickham's (excellent) ```devtools``` package

```r
install.packages("devtools")
```

then call  

```r
library(devtools)
devtools::install_github("mitchest/c2c")
```

### Bugs

There are some probably. If you find them, please let me know
about them - either directly on github, or the contact details below. 

### Contact

* Mitchell Lyons
* mitchell.lyons@gmail.com / mitchell.lyons@unsw.edu.au

### References
Lyons, Foster and Keith (2017). Simultaneous vegetation classification and mapping at
large spatial scales. Journal of Biogeography.

Foster, Hill and Lyons (2017) "Ecological Grouping of Survey Sites when 
Sampling Artefacts are Present". Journal of the Royal Statistical Society: 
Series C (Applied Statistics). DOI: http://dx.doi.org/10.1111/rssc.12211
