
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


attr(trial[["trt"]], "label") <- NULL
str(trial)
#> tibble [200 x 8] (S3: tbl_df/tbl/data.frame)
#>  $ trt     : chr [1:200] "Drug A" "Drug B" "Drug A" "Drug A" ...
#>  $ age     : num [1:200] 23 9 31 NA 51 39 37 32 31 34 ...
#>   ..- attr(*, "label")= chr "Age"
#>  $ marker  : num [1:200] 0.16 1.107 0.277 2.067 2.767 ...
#>   ..- attr(*, "label")= chr "Marker Level (ng/mL)"
#>  $ stage   : Factor w/ 4 levels "T1","T2","T3",..: 1 2 1 3 4 4 1 1 1 3 ...
#>   ..- attr(*, "label")= chr "T Stage"
#>  $ grade   : Factor w/ 3 levels "I","II","III": 2 1 2 3 3 1 2 1 2 1 ...
#>   ..- attr(*, "label")= chr "Grade"
#>  $ response: int [1:200] 0 1 0 1 1 0 0 0 0 0 ...
#>   ..- attr(*, "label")= chr "Tumor Response"
#>  $ death   : int [1:200] 0 0 0 1 1 1 0 1 0 1 ...
#>   ..- attr(*, "label")= chr "Patient Died"
#>  $ ttdeath : num [1:200] 24 24 24 17.6 16.4 ...
#>   ..- attr(*, "label")= chr "Months to Death/Censor"


# Restore back the labels

trial <- restorelabels(trial, data_labels)
str(trial)
#> tibble [200 x 8] (S3: tbl_df/tbl/data.frame)
#>  $ trt     : chr [1:200] "Drug A" "Drug B" "Drug A" "Drug A" ...
#>   ..- attr(*, "label")= chr "Chemotherapy Treatment"
#>  $ age     : num [1:200] 23 9 31 NA 51 39 37 32 31 34 ...
#>   ..- attr(*, "label")= chr "Age"
#>  $ marker  : num [1:200] 0.16 1.107 0.277 2.067 2.767 ...
#>   ..- attr(*, "label")= chr "Marker Level (ng/mL)"
#>  $ stage   : Factor w/ 4 levels "T1","T2","T3",..: 1 2 1 3 4 4 1 1 1 3 ...
#>   ..- attr(*, "label")= chr "T Stage"
#>  $ grade   : Factor w/ 3 levels "I","II","III": 2 1 2 3 3 1 2 1 2 1 ...
#>   ..- attr(*, "label")= chr "Grade"
#>  $ response: int [1:200] 0 1 0 1 1 0 0 0 0 0 ...
#>   ..- attr(*, "label")= chr "Tumor Response"
#>  $ death   : int [1:200] 0 0 0 1 1 1 0 1 0 1 ...
#>   ..- attr(*, "label")= chr "Patient Died"
#>  $ ttdeath : num [1:200] 24 24 24 17.6 16.4 ...
#>   ..- attr(*, "label")= chr "Months to Death/Censor"


# Voila!
```
