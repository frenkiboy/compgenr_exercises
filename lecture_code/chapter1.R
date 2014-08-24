#-------------------------------------------------------------------------------
### The setup
#-------------------------------------------------------------------------------


# install package named 'randomForests' from CRAN
install.packages("randomForests")

# get the installer package
source("http://bioconductor.org/biocLite.R")
# install bioconductor package 'rtracklayer'
biocLite("rtracklayer")

library(devtools)
install_github("roxygen")

# getting help
libray(MASS)
ls("package:MASS") # functions in the package
ls() # objects in your R enviroment
# get help on hist() function
?hist
help("hist")
# search the word "hist" in help pages
help.search("hist")
??hist


#-------------------------------------------------------------------------------
### Computations in R
#-------------------------------------------------------------------------------

2 + 3 * 5       # Note the order of operations.
log(10)        # Natural logarithm with base e
5^2            # 5 raised to the second power
3/2            # Division
sqrt(16)      # Square root
abs(3-7)      # Absolute value of 3-7
pi             # The number
exp(2)        # exponential function
# This is a comment line


