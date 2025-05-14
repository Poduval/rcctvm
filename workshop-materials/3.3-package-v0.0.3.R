# initialize ====
source("workshop-materials/0-start-clean.R")
library(devtools)

create_package(path = getwd(), open = FALSE)
use_data_raw(open = FALSE)
file.remove("data-raw/DATASET.R")

#' ignore extra files and folders

if(!dir.exists("package-releases")) dir.create("package-releases")
use_build_ignore(c("package-releases", "workshop-materials"))

# description ====

# create or update the DESCRIPTION file
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

# r-functions/files ====
use_r("add2vars", open = FALSE)
file.copy(from = "workshop-materials/package-files/add2vars.R",
          to = "R/add2vars.R", overwrite = TRUE)
exists("add2vars", where = globalenv(), inherits = FALSE)
load_all() # DON'T USE source()
add2vars(12, 14)

# data ====

## external ====
file.copy(from = "workshop-materials/package-files/data-programTable.R",
          to = "data-raw/programTable.R", overwrite = TRUE)

source("data-raw/programTable.R", verbose = FALSE)
programTable
use_data(programTable, overwrite = TRUE)

file.copy(from = "workshop-materials/package-files/data-programTable-doc.R",
          to = "R/data-programTable.R", overwrite = TRUE)

## internal ====
file.copy(from = "workshop-materials/package-files/data-metaTable.R",
          to = "data-raw/metaTable.R", overwrite = TRUE)

source("data-raw/metaTable.R", verbose = FALSE)
metaTable

# =========== V0.0.2 add-on =================== #

# model ====

## add files ====
file.copy(from = "workshop-materials/package-files/survival-model.R",
          to = "data-raw/survival-model.R", overwrite = TRUE)
file.copy(from = "workshop-materials/package-files/data-survival.xlsx",
          to = "data-raw/data-survival.xlsx", overwrite = TRUE)

## calculate model & save ====
source("data-raw/survival-model.R", verbose = FALSE)
.internal_model

## add r files ====
use_r(name = "predict_risk.R", open = FALSE)
file.copy(from = "workshop-materials/package-files/predict_risk.R",
          to = "R/predict_risk.R", overwrite = TRUE)

## add dependencies ====
use_package("survival", type = "Imports")

# =========================================== #

use_data(metaTable, .internal_model, internal = TRUE, overwrite = TRUE)
rm(metaTable, programTable, .internal_model) # clean up for proper tests

# config: onLoad + .onAttach ====
file.copy(from = "workshop-materials/package-files/setup.R",
          to = "R/setup.R", overwrite = TRUE)

# tests ====
use_testthat()
use_test("add2vars", open = FALSE)
file.copy(from = "workshop-materials/package-files/test-add2vars.R",
          to = "tests/testthat/test-add2vars.R", overwrite = TRUE)

use_test("predict_risk", open = FALSE)
file.copy(from = "workshop-materials/package-files/test-predict_risk.R",
          to = "tests/testthat/test-predict_risk.R", overwrite = TRUE)

test() # this is done without loading the function in global environment

# documentations ====

## helper files ====
document() # package documentation

## news ====
use_news_md(open = FALSE)

#' this is used to avoid manual modifications every time
cat(news_text <- c(
  "\n## Version 0.0.3", "",
  "- Added survival model for lukemia remission prediction",
  "\n## Version 0.0.2", "",
  "- Added `onLoad()` & `onAttach()` features",
  "- Added first data set",
  "\n## Version 0.0.1", "",
  "- Initial GitHub submission."))

write(news_text, file = "NEWS.md", append = FALSE)

## readme ====
use_readme_rmd(open = FALSE)
file.copy(from = "workshop-materials/package-files/README-v2.Rmd",
          to = "README.Rmd", overwrite = TRUE)
build_readme()

## logo/sticker ====
#' copy required files : it's good practice to keep source files in data-raw
file.copy("workshop-materials/package-files/logo.png",
          "data-raw/logo.png", overwrite = TRUE)
file.copy("workshop-materials/package-files/package-hexsticker.R",
          "data-raw/package-hexsticker.R", overwrite = TRUE)
source("data-raw/package-hexsticker.R", verbose = FALSE) # producing hex sticker

## citation ====
use_citation()
file.copy("workshop-materials/package-files/CITATION",
          "data-raw/CITATION", overwrite = TRUE)
file.copy("data-raw/CITATION", "inst/CITATION", overwrite = TRUE)

## vignette ====
use_vignette("rcctvm", title = "rcctvm")
file.copy("workshop-materials/package-files/vignette-rcctvm.Rmd",
          "vignettes/rcctvm.Rmd", overwrite = TRUE)

build_vignettes()

# package checks ====
check()

# package installation ====
install()
build(path = "package-releases/", binary = TRUE, vignettes = TRUE)

# package testing ====
# ============================ RESTART R SESSION =========================== #

packageDescription("rcctvm")
help(package = "rcctvm")
news(package = "rcctvm")

ls(getNamespace("rcctvm"))
getNamespaceImports("rcctvm")
getNamespaceExports("rcctvm")

library(rcctvm)
getOption("rcctvm.division")

add2vars(2, 3)
rcctvm:::.internal_model

predict_risk(sex = "female", wbc = 2.1, treatment = "new")
predict_risk(sex = "male", wbc = 4.3, treatment = "standard")
predict_risk(sex = c("female", "male"),  wbc = c(2.1, 4.3),
             treatment = c("new", "standard"))

(testdata <- data.frame(
  sex = c("female", "male"),
  wbc = c(2.1, 4.3),
  treatment = c("new", "standard")))

predict_risk(x = testdata)
