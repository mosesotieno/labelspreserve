
<!-- README.md is generated from README.Rmd. Please edit that file -->

# labelspreserve

<!-- badges: start -->
<!-- badges: end -->

Whenever we perform some manipulations on a tibble with some variable
labels, we tend to lose those attributes. Some times it may be pain to
re-write the variables again. This package answers that question by
preserving the variable labels before you perform such actions then you
can restore those labels.

## Installation

You can install the released version of labelspreserve like so:

``` r
devtools::install_github("mosesotieno/labelspreserve")
```

## Quick demo

Preserving and restoring variables with `labelspreserve`

``` r
library(labelspreserve)

# Load a dataset with variable labels

trial <- gtsummary::trial

# We first begin by preserving the variables 

preservelabels(trial)
#> $trt
#> [1] "Chemotherapy Treatment"
#> 
#> $age
#> [1] "Age"
#> 
#> $marker
#> [1] "Marker Level (ng/mL)"
#> 
#> $stage
#> [1] "T Stage"
#> 
#> $grade
#> [1] "Grade"
#> 
#> $response
#> [1] "Tumor Response"
#> 
#> $death
#> [1] "Patient Died"
#> 
#> $ttdeath
#> [1] "Months to Death/Censor"

# Computations and manipulations
# Example: Drop the label for trt  


trial <- attr(trial[['trt']], "label") <- NULL
str(trial)
#>  NULL


# Restore back the labels

trial <- restorelabels(trial, data_labels)
str(trial)
#>  NULL


# Voila!
```
