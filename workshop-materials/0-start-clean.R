# << START CLEAN >>
files_to_clean <- c(
  ".Rbuildignore", "DESCRIPTION", "NAMESPACE", "LICENSE.md",
  "README.Rmd", "NEWS.md", "Meta", "doc", "data-raw", "data", "R",
  "tests", "inst", "man", "vignettes", "docs", "src", "release")
unlink(files_to_clean, recursive = TRUE, force = TRUE, expand = TRUE)
