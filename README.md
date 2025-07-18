
# rcctvm

<img src="man/figures/hexsticker.png" align="right" height="140" />

The goal of `rcctvm` is to produce top notch statistical models in bio
medical research.

## Installation

You can install the development version of `rcctvm` from
[GitHub](https://github.com/) with:

``` r
pak::pak("Poduval/rcctvm")
```

## Examples

### Basic functions

This is a basic example which shows you how to solve a common problem:

``` r
library(rcctvm)
#> Attached R package from Regional Cancer Centre, Thiruvananthapuram
add2vars(2, 3)
#> [1] 5
```

### Predictions with survival model

#### Single input

``` r
predict_risk(sex = "female", wbc = 2.1, treatment = "new")
#>         1 
#> 0.1553109
predict_risk(sex = "male", wbc = 4.3, treatment = "standard")
#>         1 
#> 0.0841474
```

#### Vector input

``` r
predict_risk(sex = c("female", "male"),  wbc = c(2.1, 4.3), 
             treatment = c("new", "standard"))
#>         1         2 
#> 0.1553109 0.0841474
```

#### Data frame input

``` r
testdata <- data.frame(
  sex = c("female", "male"), 
  wbc = c(2.1, 4.3),
  treatment = c("new", "standard"))

predict_risk(x = testdata)
#>         1         2 
#> 0.1553109 0.0841474
```
