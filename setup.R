# Package Installation 

pkg_list <- c("tidyverse",
                 "Rcpp")

installed <- pkg_list %in% rownames(installed.packages())

if (any(!installed)) {
  install.packages(pkg_list[!installed])
}

# Establish Working Directory
  # Identify working directory using the getwd() function, setting it to environmental variable WD
WD <- getwd()
  # Check working directory is as expected (the folder of this github repo)
if (grepl("coding_basics", WD, ignore.case = TRUE)){
  message ("Working directory looks correct")
} else {
  stop ("Please review working directory")
}

