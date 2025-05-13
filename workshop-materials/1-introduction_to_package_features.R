# understanding your environment ====

utils:::sessionInfo()
devtools::session_info() # alternative & nicer print method

.libPaths() # search paths for packages
lapply(.libPaths(), list.dirs, recursive = FALSE, full.names = FALSE)

packageStatus() # summarize information about installed package
 list of attached packages

# package description ====
packageVersion("devtools")
packageVersion("dplyr")
packageDate("plyr")
packageDescription("dplyr")

if (FALSE) { # SLOW BUT VISUAL
  pak::pkg_deps("plyr")
  pak::pkg_deps_tree("plyr")
  pak::pkg_deps_explain("plyr", "tibble")
}
tools::package_dependencies(c("plyr", "dplyr"), recursive = TRUE)

# package namespace ====
here::here()
lubridate::as_date(Sys.time())
ls(getNamespace("here"))

search() # where to find the functions you execute.
getNamespaceImports("survival") # imports from other packages
getNamespaceExports("survival") # functions exported by the package

# md (roxygen documentation) ====
help(package = "dplyr")
news(package = "dplyr")
vignette(package = "tidyr")
vignette(topic = "in-packages", package = "tidyr")
vignette(topic = "programming", package = "dplyr")

# other meta information ====
citation("tidyverse")

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
