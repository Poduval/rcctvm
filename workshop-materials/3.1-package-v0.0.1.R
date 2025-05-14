# ============================ RESTART R SESSION =========================== #

# initialize ====
source("workshop-materials/0-start-clean.R")
library(devtools)

create_package(path = getwd(), open = FALSE)
# styler::style_pkg()
# use_git() # setup git configuration
# use_github()

use_data_raw(open = FALSE)
file.remove("data-raw/DATASET.R")

#' ignore extra files and folders

if(!dir.exists("package-releases")) dir.create("package-releases")
use_build_ignore(c("package-releases", "workshop-materials"))
#' use_git_ignore

# description ====

# create or update the DESCRIPTION file
use_description(fields = list(
  Package = "rcctvm",
  Version = "0.0.1",
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

# tests ====
use_testthat()
use_test("add2vars", open = FALSE)
file.copy(from = "workshop-materials/package-files/test-add2vars.R",
          to = "tests/testthat/test-add2vars.R", overwrite = TRUE)

test() # this is done without loading the function in global environment

# documentations ====

## helper files ====
document() # package documentation

## news ====
use_news_md(open = FALSE)

#' this is used to avoid manual modifications every time
cat(news_text <- c("\n## Version 0.0.1", "", "- Initial GitHub submission."))

write(news_text, file = "NEWS.md", append = FALSE)

## readme ====
use_readme_rmd(open = FALSE)
file.copy(from = "workshop-materials/package-files/README-v1.Rmd",
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

packageVersion("rcctvm")
packageDate("rcctvm")
packageDescription("rcctvm")
help(package = "rcctvm")
news(package = "rcctvm")
citation("rcctvm")

vignette(topic = "rcctvm", package = "rcctvm")
browseVignettes(package = "rcctvm")

ls(getNamespace("rcctvm"))
getNamespaceImports("rcctvm")
getNamespaceExports("rcctvm")

