library(devtools)

# create_package(path = getwd())
# use_git()

# adding a function ====
use_r("add2vars")
styler::style_file("R/add2vars.R")
styler::style_pkg()

exists("add2vars", where = globalenv(), inherits = FALSE)
load_all() # DON'T USE source()
add2vars(12, 14)

check()

use_mit_license()
document()

use_git_ignore(c("make_package.R"))
use_build_ignore(c("make_package.R", "make_hexsticker.R", "release"))

# use_package("stringr")

install()

library(rcctvm)
rcctvm::add2vars(2, 3)

use_testthat()
usethis::use_test("add2vars")
test()

use_github()
use_readme_rmd()
build_readme()

check()
install()

devtools::dev_sitrep() # Report package development situation
# devtools::update_packages("devtools")
# devtools::install_dev_deps()

dir.create("release")
devtools::build(path = "release/", binary = TRUE, vignettes = TRUE)
