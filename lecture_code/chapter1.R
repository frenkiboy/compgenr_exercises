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
library(MASS)
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



#-------------------------------------------------------------------------------
### Data structures in R 
#-------------------------------------------------------------------------------

## Vectors
############
# It is basically a list of elements of the same type (numeric,character or logical). 
# Later you will see that every column of a table will be represented as a vector

x <- c(1, 3, 2, 10, 5)  #create a vector x with 5 components
x

y <- 1:5  #create a vector of consecutive integers y

# <- and = both assignment operators
y <- 1:5 
y = 1:5

y + 2  # addition

2 * y  # multiplication

y^2  #raise each component to the second power

2^y  #raise 2 to the first through fifth power

y  #y itself has not been unchanged

y <- y * 2
y  #it is now changed

r1 <- rep(1, 3)  # create a vector of 1s, length 3

length(r1)  #length of the vector

class(r1)  # class of the vector

a <- 1  # this is actually a vector length one

a=c(a,2)

## Matrices
############
x <- c(1, 2, 3, 4)
y <- c(4, 5, 6, 7)
m1 <- cbind(x, y)
m1
 
t(m1)  # transpose of m1
 
dim(m1)  # 4 by 2 matrix

m2 <- matrix(c(1, 3, 2, 5, -1, 2, 2, 3, 9), nrow = 3)
m2

#subsetting
m2[1,]
m2[1:2,]
m2[1:2,1:2]
m2[,2:3]


## Data Frames
############
chr <- c("chr1", "chr1", "chr2", "chr2")
strand <- c("-", "-", "+", "+")
start <- c(200, 4000, 100, 400)
end <- c(250, 410, 200, 450)
mydata <- data.frame(chr, start, end, strand)

# change column names
names(mydata) <- c("chr", "start", "end", "strand")
mydata  # OR this will work too

mydata <- data.frame(chr.name = chr, start.loc = start, end.loc = end, 
                     strand.string = strand)
mydata


# subsetting
mydata[, 2:4]  # columns 2,3,4 of data frame

mydata[, c("chr", "start")]  # columns chr and start from data frame

mydata$start  # variable start in the data frame

mydata[c(1, 3), ]  # get 1st and 3rd rows

mydata[mydata$start > 400, ]  # get all rows where start>400


## Lists
############
# An ordered collection of objects (components). A list allows you to gather a 
# variety of (possibly unrelated) objects under one name.

# example of a list with 4 components a string, a numeric vector, a matrix,
# and a number
w <- list(name = "Fred", mynumbers = c(1, 2, 3), mymatrix = matrix(1:4, ncol = 2), 
          age = 5.3)
w

#extract elements of lists
w[[3]]  # 3rd component of the list


w[["mynumbers"]] 
w$mynumbers # component named mynumbers in list
w$age


# Factors used to store categorical data
features = c("promoter", "exon", "intron")
f.feat = factor(features)


#-------------------------------------------------------------------------------
### Reading in and writing data out in R
#-------------------------------------------------------------------------------
enh.df <- read.table("../data/subset.enhancers.hg18.bed", header = FALSE)  # read enhancer marker BED file
cpgi.df <- read.table("../data/subset.cpgi.hg18.bed", header = FALSE)  # read CpG island BED file
# check first lines to see how the data looks like
head(enh.df)
head(cpgi.df)


write.table(x=cpgi.df,file="cpgi.txt",quote=FALSE,
            row.names=FALSE,col.names=FALSE,sep="\t")

#-------------------------------------------------------------------------------
### Plotting in R
#-------------------------------------------------------------------------------
# sample 50 values from normal distribution and store them in vector x
x <- rnorm(50)
hist(x)  # plot the histogram of those values

hist(x, main = "Hello histogram!!!", col = "red")


y <- rnorm(50)
# plot a scatter plot control x-axis and y-axis labels
plot(x, y, main = "scatterplot of random samples", ylab = "y values", 
     xlab = "x values")

plot(x, y, main = "scatterplot ", ylab = "y", 
     xlab = "x")

plot(x, y, main = "scatterplot ", ylab = "y", 
     xlab = "x",col="blue")

boxplot(x, main = "boxplots of random samples")

boxplot(x, y, main = "boxplots of random samples",col="")

perc=c(50,70,35,25)
barplot(height=perc,names.arg=c("CpGi","exon","CpGi","exon") )
barplot(height=perc,names.arg=c("CpGi","exon","CpGi","exon"),
        ylab="percentages",main="imagine %s",
        col=c("red","red","blue","blue"))
legend("topright",legend=c("test","control"),fill=c("red","blue"))
legend("topleft",legend=c("test","control"),fill=c("red","blue"))
legend("bottomleft",legend=c("test","control"),fill=c("red","blue"))


# line plot
?plot.default
x1=1:50
y1=sqrt(1:50)
plot(x1,y1)

# change 
plot(x1,y1,type="l")

# add more lines
y2=1+sqrt(1:50)/2
lines(x1,y2,col="red")

y3=1+y2
points(x1,y3,pch=19)


# more on plotting with base graphics
#http://www.statmethods.net/graphs/index.html  


# other plotting platforms

# ggplot2
# http://www.cookbook-r.com/Graphs/
# http://www.statmethods.net/advgraphs/ggplot2.html  


# create factors with value labels 
library(ggplot2)
mtcars$gear <- factor(mtcars$gear,levels=c(3,4,5),
                      labels=c("3gears","4gears","5gears")) 
# Kernel density plots for mpg
# grouped by number of gears (indicated by color)
qplot(mpg, data=mtcars, geom="density", fill=gear, alpha=I(.5), 
      main="Distribution of Gas Milage", xlab="Miles Per Gallon", 
      ylab="Density") 

# lattice
# http://www.statmethods.net/advgraphs/trellis.html
library(lattice)
densityplot(~mpg, data = mtcars, groups = gear,
            plot.points = FALSE, ref = TRUE, auto.key = list(columns = 3) )


# 1) both good for complicated graphics with multiple variables, good
# for when you want to make plots for different groups
# ggplot will take some time to learn

#-------------------------------------------------------------------------------
### Functions and control structures (for, if/else etc.)
#-------------------------------------------------------------------------------

# functions simplify repeated tasks
# You can run the same set of operations with different arguments
# Ex: aligning + quantifying reads from a sequencing experiment
# you can write a function that takes an fastq filename, genome and annotation
# arguments and repeats the taks for that fastq file, it will be handy if you will be analyzing 10s of such files

alignQuant(sample.file="sample1.fastq",genome="hg19",annotation="hg19_refseq.bed")
alignQuant(sample.file="sample2.fastq",genome="mm9",annotation="mm9_refseq.bed")



# syntax 
name.of.function <- function(argument1, argument2) {
  statements
  return(something)
}

# function that sums the squares of two input values
sqSum <- function(x, y) {
  result = x^2 + y^2
  return(result)
}
# now try the function out
sqSum(2, 3)


# prints the result, does not return it
sqSumPrint <- function(x, y) {
  result = x^2 + y^2
  cat("here is the result:", result, "\n")
}

# now try the function out
sqSumPrint(2, 3)



# control structures
x=45
if(x<10){
  cat("x less than 10")
}else if(x >= 10 & x <50){
  cat("x is between 10 and 50")
}else{
  cat("x greater than 10")
}


# loops
for (i in 1:10) {
  # number of repetitions
  cat("This is iteration")  # the task to be repeated
  print(i)
}

# calculate the mean of each expression values for each gene
gene.exp = list(gene1=c(20,30,40),gene2=c(100,30,40), gene3=c(220,30,40) )
result=c()
for (i in 1:length(gene.exp)) {
  mean.exp=mean(gene.exp[[i]])
  result=c(result,mean.exp )
  
}

# alternative
lapply(gene.exp,mean)
