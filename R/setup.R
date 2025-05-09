.onAttach <- function(libname, pkgname) {
  msg <- paste0("Attached R package from Regional Cancer Centre, Thiruvananthapuram")
  packageStartupMessage(msg)
}

.onLoad <- function(libname, pkgname) {
  op <- options()
  op.rcctvm <- list(rcctvm.division = "Cancer Epidemiology & Biostatistics")
  toset <- !(names(op.rcctvm) %in% names(op))
  if(any(toset)) options(op.rcctvm[toset])
  invisible()
}
