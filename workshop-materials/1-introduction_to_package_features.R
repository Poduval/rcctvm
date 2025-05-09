# understanding your environment ====

utils:::sessionInfo()
devtools::session_info() # alternative & nicer print method

.libPaths() # search paths for packages
lapply(.libPaths(), list.dirs, recursive = FALSE, full.names = FALSE)

packageStatus() # summarize information about installed package
search() # list of attached packages

# package overview ====
packageVersion("devtools")
packageVersion("dplyr")

packageDate("plyr")

packageDescription("dplyr")

pak::pkg_deps("plyr") # slow
pak::pkg_deps_tree("plyr") # slow
pak::pkg_deps_explain("plyr", "tibble") # slow

help(package = "dplyr")
news(package = "dplyr")

vignette(package = "tidyr")
vignette(topic = "in-packages", package = "tidyr")
vignette(topic = "programming", package = "dplyr")

citation("tidyverse")

# package namespace ====
getNamespaceImports("plyr") # imports used by namespace ns
getNamespaceExports("plyr") # names exported by ns
tail(ls(getNamespace("plyr")))

names(Filter(is.function, mget(
  ls(getNamespace("plyr")), envir = getNamespace("plyr"))))

names(Filter(Negate(is.function), mget(
  ls(getNamespace("plyr")), envir = getNamespace("plyr"))))

# some package examples ====

## devtools ====
#' https://devtools.r-lib.org
library(devtools) # loading required package: usethis
dev_sitrep() # report package development situation
# devtools::update_packages("devtools")
# devtools::install_dev_deps()

## usethis ====
#' automate package/project setup tasks that are otherwise performed manually
#' https://usethis.r-lib.org
grep("^use_.+", lsf.str("package:usethis"), value = TRUE)

## testthat ====
#' R package to make testing fun!
grep("^test_.+", lsf.str("package:testthat"), value = TRUE)
library(testthat)

## styler ====
#' styler allows you to format .R, .Rmd, .Rmarkdown and/or .qmd, .Rnw files,
#' R packages, or entire R source trees according to a style guide.
#'
library(styler)
grep("^style_.+", lsf.str("package:styler"), value = TRUE)

## withr ====
#' execute code in temporarily altered environment
library(withr)
grep("^with_.+", lsf.str("package:withr"), value = TRUE)

## crayon ====
crayon::show_ansi_colors()

## data packages ====
data(package = "nycflights13")
dplyr::glimpse(nycflights13::airlines)
?nycflights13::airlines

data(package = "babynames")
dplyr::glimpse(babynames::babynames)
?babynames::babynames



# check availability ====
available:::available("dplyr", browse = FALSE)

available:::available("rshinytool", browse = FALSE) # public
available:::available("rputils", browse = FALSE) # private

available:::available("rcctvm", browse = FALSE)
