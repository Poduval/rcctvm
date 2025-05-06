# Initialize ====

library(devtools)

create_package(path = getwd())

# use_git()

# description
# Package: rcctvm
# Title: What the Package Does (One Line, Title Case)
# Version: 0.0.0.1
# Authors@R:
#   person("Rakesh", "Poduval", , "rakesh.poduval@rcctvm.com", role = c("aut", "cre"))
# Description: What the package does (one paragraph).
# License: MIT + file LICENSE
# Encoding: UTF-8
# Roxygen: list(markdown = TRUE)
# RoxygenNote: 7.3.2
# Imports:
#   stringr
# Suggests:
#   testthat (>= 3.0.0)
# Config/testthat/edition: 3


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

use_git_ignore(c("make_package.R", "materials"))
use_build_ignore(c("make_package.R", "make_hexsticker.R",
                   "release", "materials"))

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
