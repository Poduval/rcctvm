utils:::sessionInfo()
devtools::session_info()
.libPaths()

packageVersion("devtools")
packageStatus() # Summarize information about installed package

help(package = "dplyr")
vignette(topic = "in-packages", package = "tidyr")
vignette(topic = "programming", package = "dplyr")

packageVersion("dplyr")
packageDate("plyr")

packageDescription("dplyr")
tail(ls(getNamespace("plyr")))

getNamespaceImports("plyr")
getNamespaceExports("plyr")

library(dplyr)

# e.g data packages
# not recommended to put huge data sets.

data(package = "nycflights13")
?nycflights13::airlines
data(package = "babynames")
nrow(babynames::babynames)
head(babynames::babynames)

# check if package name is available ?
available:::available("dplyr", browse = FALSE)
available:::available("rcctvm", browse = FALSE)

available:::available("rputils", browse = FALSE)
available:::available("rshinytool", browse = FALSE)
