# << START CLEAN >>
files_to_clean <- c(
  "DESCRIPTION", "NAMESPACE", "LICENSE", "LICENSE.md",
  "NEWS", "README.md", "README.Rmd",
  "package-releases", "data-raw", "data", "R",
  "tests", "inst", "man", "vignettes", "docs", "src", "release")
unlink(files_to_clean, recursive = TRUE, force = TRUE, expand = TRUE)
