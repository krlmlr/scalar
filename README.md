
<!-- README.md is generated from README.Rmd. Please edit that file -->

# scalar

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
<!-- badges: end -->

The goal of scalar is to provide a [vctrs](https://vctrs.r-lib.org/)
compatible way to indicate that a vector is intended to have length one.

## Installation

You can install the released version of scalar from
[CRAN](https://CRAN.R-project.org) with:

``` r
install.packages("scalar")
```

## Example

This class is useful to distinguish between scalars and vectors when
creating one-row tibbles that contain arbitrary objects, e.g. results of
`rowwise()`-like computations.

``` r
library(scalar)

wrap_unless_scalar <- function(x) {
  if (is_scalar(x)) return(x)
  list(x)
}

tibble_row <- function(...) {
  lst <- tibble::lst(...)
  row <- purrr::map(lst, wrap_unless_scalar)
  tibble(!!!row)
}

tibble_row(a = 1, b = 2:3, c = list(4))
#> # A tibble: 1 x 3
#>   a         b         c         
#>   <list>    <list>    <list>    
#> 1 <dbl [1]> <int [2]> <list [1]>
tibble_row(a = scalar(1), b = 2:3, c = scalar(list(4)))
#> # A tibble: 1 x 3
#>   a        b         c        
#>   <scalar> <list>    <scalar> 
#> 1 1        <int [2]> <dbl [1]>
```

Non-scalars are rejected. Concatenation returns a “bare” object.

``` r
scalar(1:2)
#> Error in scalar(1:2): vec_size(x) == 1 is not TRUE
vec_c(scalar(1), scalar(2))
#> [1] 1 2
```
