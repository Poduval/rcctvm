# initialize ====
source("workshop-materials/0-start-clean.R")
library(devtools)

create_package(path = getwd(), open = FALSE)
# use_git() # setup git configuration
# use_github()

use_data_raw(open = FALSE)

#' ignore extra files and folders

if(!dir.exists("package-releases")) dir.create("package-releases")
use_build_ignore(c("package-releases", "workshop-materials"))
#' use_git_ignore

# modify description ====

# Create or update the DESCRIPTION file
use_description(fields = list(
  Package = "rcctvm",
  Version = "0.0.3",
  Title = "R package developed by RCC Thiruvananthapuram",
  Description = "This contains statistical models in biomedical research.",
  URL = "https://github.com/Poduval/rcctvm",
  BugReports = "https://github.com/Poduval/rcctvm/issues"))

#' ORCID (Open Researcher and Contributor ID) is a globally recognized ID
#' that uniquely identifies researchers.
#'
use_author(given = "Jagathnath", family = "K.M",
           role = c("aut", "cre"),
           email = "jagath.krishna@gmail.com",
           comment = c(ORCID = "0000-221B-0000-1895"))

use_author(given = "Rakesh", family = "Poduval", role = c("aut"))

use_mit_license("RCC Thiruvananthapuram")

#' test if the required packages are installed
#' recommended to add these via roxygen2 documentation
#'
requireNamespace("survival", quietly = TRUE)
use_package("survival", type = "Imports")

# data & model ====

## external ====
source("data-raw/programTable.R", verbose = FALSE)
programTable
use_data(programTable, overwrite = TRUE)

## internal ====
source("data-raw/metaTable.R", verbose = FALSE)
metaTable

source("data-raw/survival-model.R", verbose = FALSE)
.internal_model

use_data(.internal_model, metaTable, internal = TRUE, overwrite = TRUE)

## clean up for testing ====
rm(.internal_model, metaTable, programTable)

# styler::style_file("R/predict_risk.R")
# use_r(name = "predict_risk.R")

# setup tests ====
use_testthat()

use_test("add2vars")
use_test("predict_risk")

test() # this is done without loading the function in global environment

# functions ====
# styler::style_pkg()
# styler::style_file("R/add2vars.R")

use_r("add2vars")
exists("add2vars", where = globalenv(), inherits = FALSE)
load_all() # DON'T USE source()
add2vars(12, 14)

# documentations ====
source("data-raw/make_hexsticker.R", verbose = FALSE) # producing hex sticker
document() # package documentation

## update NEWS ====
# use_news_md()

#' this is used to avoid manual modifications every time
#'
news_text <- c(
  "\n## Version 0.0.4", "",
  "- Added first survival model",
  "\n## Version 0.0.3", "",
  "- Added first data set",
  "\n## Version 0.0.2", "",
  "- Added `onLoad()` & `onAttach()` features",
  "\n## Version 0.0.1", "",
  "- Initial GitHub submission.")

write(news_text, file = "NEWS.md", append = FALSE)

## update citation ====
use_citation()

## update readme ====
build_readme()

## update vignette ====
use_vignette("add2vars", title = "Adding 2 variables")
use_vignette("predict_risk", title = "Predict risk of Leukemia remission")
build_vignettes()

# package checks ====
check()

# package installation ====
install()

if(!dir.exists("release")) dir.create("release")
build(path = "release/", binary = TRUE, vignettes = TRUE)

# package testing ====
# ============================ RESTART R SESSION =========================== #

packageVersion("rcctvm")
packageDate("rcctvm")
packageDescription("rcctvm")
help(package = "rcctvm")
news(package = "rcctvm")
citation("rcctvm")
pak::pkg_deps_tree("rcctvm")

vignette(topic = "add2vars", package = "rcctvm")
browseVignettes(package = "rcctvm")

ls(getNamespace("rcctvm"))
getNamespaceImports("rcctvm")
getNamespaceExports("rcctvm")

library(rcctvm)
getOption("rcctvm.division")

add2vars(2, 3)
data(package = "rcctvm")
dplyr::glimpse(rcctvm::programTable)
?rcctvm::programTable
