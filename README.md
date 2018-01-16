# Foodmapping
Food Items Mapping using Fuzzy Matching

## Overview

**Foodmapping** is an R package that enable to compare any two food items, in term of name similarity. 
Name similarity is computed using Fuzzy Matching (the "Partial Token Sort Ratio" metric, as implemented in the [fuzzywuzzyR package](http://cran.r-project.org/package=fuzzywuzzyR)).

### **System Requirements**

This package is an interface to the excellent [fuzzywuzzyR R package](http://cran.r-project.org/package=fuzzywuzzyR)).

It has the following additional dependencies (cf fuzzywuzzyR [installation guide](https://github.com/mlampros/fuzzywuzzyR) ):

* [Python] (https://www.python.org/) (>= 2.4)

* [fuzzywuzzyR](https://github.com/mlampros/fuzzywuzzyR) (>=1.0.2)

* [fuzzywuzzy](https://github.com/seatgeek/fuzzywuzzy) (>=0.15.0)

* [python-Levenshtein](https://github.com/ztane/python-Levenshtein/) (>=0.12.0, optional but can enable speed-up)

## Installation

To install, run the following commands in R:

``` r
install.packages("devtools")
devtools::install_github("armandvalsesia/Foodmapping")
```
## Quick Start


``` r
require("Foodmapping")

# comparison between two food names:
v_fz_tk_sort_r( "Tomatoes" , "raw. tomatoes" )

# pairwise comparison between a single item and a list of items
item <- "Tomatoes"
query_list <- c(  "raw. tomatoes", "Tomatoe soup with basil", "Carot soup" )
df <- expand.grid( A = item, B = query_list, stringsAsFactors = FALSE ) # create pairwise comparison
df$score <- v_fz_tk_sort_r( df$A , df$B ) # compute fuzzy score
df

# pairwise comparison between elements from two list of items
query_list <- c(  "raw. tomatoes", "Tomatoe soup with basil", "Carot soup", "chicken" )
query_list2 <- c(  "tomato, raw", "soup tomatoes and basil", "tiramisu" )
df <- expand.grid( A = query_list, B = query_list2, stringsAsFactors = FALSE ) # create pairwise comparison
df$score <- v_fz_tk_sort_r( df$A , df$B ) # compute fuzzy score
df


```

## License and authors

This software uses the GPL v2 license, see [LICENSE](LICENSE).
Authors and copyright are provided in [DESCRIPTION](DESCRIPTION). 
