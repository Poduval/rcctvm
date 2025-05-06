# initialize ====
library(devtools)

# create_package(path = getwd()) # create/update description, namespace, .Rproj
# use_git() # setup git configuration
# use_github()

#' ignore extra files and folders
use_git_ignore(c("make_package.R", "misc"))
use_build_ignore(c("make_package.R", "make_hexsticker.R",
                   "release", "misc"))

# modify description ====

# Create or update the DESCRIPTION file
use_description(fields = list(
  Package = "rcctvm",
  Version = "0.0.2",
  Title = "R package developed by RCC Thiruvananthapuram",
  Description = "This contains statistical models in biomedical research.",
  URL = "https://github.com/Poduval/rcctvm",
  BugReports = "https://github.com/Poduval/rcctvm/issues"))

#' ORCID (Open Researcher and Contributor ID) is a globally recognized ID
#' that uniquely identifies researchers.
#'
use_author(given = "Sherlock", family = "Holmes",
           role = c("aut", "cre"),
           email = "s.holmes@bakerstreet.co.uk",
           comment = c(ORCID = "0000-221B-0000-1895"))

use_author(given = "Jagathnath", family = "K.M", role = c("aut"))

use_mit_license("RCC Thiruvananthapuram")

#' test if the required packages are installed
#' recommended to add these via roxygen2 documentation
#'
if (FALSE) {
  requireNamespace(c("stringr", "stringi"), quietly = TRUE)
  use_package("stringr")
  use_package("stringi", type = "Suggest")

}
use_testthat()

# add & load functions ====
# styler::style_file("R/add2vars.R")
# styler::style_pkg()

use_r("add2vars")
use_test("add2vars")
test() # this is done without loading the function in global environment
exists("add2vars", where = globalenv(), inherits = FALSE)

load_all() # DON'T USE source()
add2vars(12, 14)

# documentations ====
document() # package documentation

#' ONE TIME - update contents manually
#' It does ask whethere to replace
#'
if (FALSE) {

  use_news_md()

  use_readme_md()
  use_readme_rmd()

  #' ==============
  # << UPDATE both above >>
  # <!-- Logo in top-right corner -->
  # <img src="man/figures/hexsticker.png" align="right" height="140" />
  # add2vars(2, 3)
  #' ==============

  use_vignette("add2vars")
  #' ==============
  #' << UPDATE >>
  #' add2vars(2, 3)
  #' ==============

}

build_readme()
build_vignettes()

# package checks ====
check()

# package installation ====
install()

if(!dir.exists("release")) dir.create("release")
build(path = "release/", binary = TRUE, vignettes = TRUE)

# package testing ====
# ============================ RESTART =========================== #

packageVersion("rcctvm")
packageDate("rcctvm")
packageDescription("rcctvm")
help(package = "rcctvm")
news(package = "rcctvm")

vignette(topic = "add2vars", package = "rcctvm")
browseVignettes(package = "rcctvm")

ls(getNamespace("rcctvm"))
getNamespaceImports("rcctvm")
getNamespaceExports("rcctvm")

library(rcctvm)

add2vars(2, 3)
getOption("rcctvm.division")
