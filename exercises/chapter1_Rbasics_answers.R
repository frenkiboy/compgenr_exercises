#-------------------------------------------------------------------------------
### the setup
#-------------------------------------------------------------------------------

# set your working directory to the source file location
# in RStudio top menu:
# Session > Set Working Directory > To Source File Location

# if you have done it correctly you should see this script when you type dir()
dir()
[1] "chapter1_Rbasics.R"

#-------------------------------------------------------------------------------
### Computations in R
#-------------------------------------------------------------------------------


# a1) sum 2 and 3, use +
2+3

# a2) take square root of 36, use sqrt()

sqrt(36)

# a3) take log10 of 1000, use function log10()
log10(1000)

# a4) take log2 of 32, use function log2()
log2(32)

# a5) assign the sum of 2,3 and 4 to variable x
x =  2+3+4
x <- 2+3+4

# a6) find absolute value of:  5 - 145 using abs() function
abs(5-145)

# a7) find the result of square root of 625, divide it by 5 and assign it to variable x
# Ex: y= log10(1000)/5, the previous statement takes log10 of 1000, divides it 
# by 5 and assigns the value to variable y
x = sqrt(625)/5

# a8) multiply the value you get from previous exercise with 10000, assign it variable x
# Ex: y=y*5, multiplies y with 5 and assigns the value to y 
# KEY CONCEPT: results of computations or arbitrary values can be stored in variables
# we can re-use those variables later on and over-write them with new values
x2 = x*10000

#-------------------------------------------------------------------------------
### Data structures in R 
#-------------------------------------------------------------------------------

# b1) 
# make a vector of 1,2,3,5 and 10 using c(), assign it to vec variable
# Ex: vec1=c(1,3,4) makes a vector out of 1,3,4
c(1:5,10)
vec1=c(1,2,3,4,5,10)

# b2) 
# check the length of your vector with length()
# Ex: length(vec1) should return 3
length(vec1)

# b3) 
# make a vector of all numbers between 2 and 15
# Ex: vec=1:6 makes a vector of numbers between 1 and 6, assigns to vec variable
vec=2:15 

# b4) 
# make a vector of  4s repeated 10 times using rep() function
# Ex: rep(x=2,times=5) makes a vector of 2s repeated 5 times
rep(x=4,times=10)
rep(4,10)


# b5) 
# make a logical vector with TRUE, FALSE values of length 4, use c()
# Ex: c(TRUE,FALSE)
c(TRUE,FALSE,FALSE,TRUE,FALSE)
c(TRUE,TRUE,FALSE,TRUE,FALSE)


# b6) 
# make a character vector of gene names PAX6,ZIC2,OCT4 and SOX2.
# Ex: vec=c("a","b","c") makes a character vector of a,b and c
c("PAX6","ZIC2","OCT4","SOX2")

# b7) 
# subset the vector using [] notation, get 5th and 6th elements
# Ex: vec1[1] gets the first element. vec1[c(1,3)] gets 1st and 3rd elements
vec1[c(5,6)]

# b8) 
# You can also subset any vector using a logical vector in []
# Run the following:
myvec=1:5
myvec[c(TRUE,TRUE,FALSE,FALSE,FALSE)] # the length of the logical vector should be equal to length(myvec) 
myvec[c(TRUE,FALSE,FALSE,FALSE,TRUE)]


# b9) 
# >,==,<, >=, <= operators create logical vectors
myvec > 3
myvec == 4
myvec <= 2
myvec != 4

# b10) 
# use > operator in myvec[ ] to get elements larger than 2 in 'myvec', described above
myvec[ myvec > 2 ] 
myvec[ myvec == 2 ] 
myvec[ myvec != 2 ] 

# ---------------------------------------------------------------------------- #
# Matrices
#
# b11) 
# make a 5x3 matrix (5 rows, 3 columns), where the first column contains only number 2
# the second column only number 4, and the third column only number 8
m = matrix(c(2,4,8), ncol=3, nrow=5, byrow=T)
m


# b12) 
# From the above matrix extract columns where the sum of numbers in the column is bigger then 10
# hint: colSums()
m[,colSums(m)> 10]


# b13) 
# Extract first two columns and run class() on the result, now extract the
# first column and run class() on the result, what is the difference?
class(m[,1:2])
class(m[,1,drop=F])
dim(m[,1])


# b14)
# the following indicator matrix (im) gives you the combination of binding sites for 
# a set of transcription factors.
# Firstly, use head(im) to take a look at the matrix
# Now, find the number of loci at which all three transcription factors are bound
set.seed(1)
im = matrix(round(runif(300)), ncol=3)
colnames(im) = c('Smc1','Smc3','Rad21')

head(im,10)
sum(rowSums(im) == 3)


# b14++)
# Try to think of a way in which to count the number of every binding combination
# from the im matrix. (example: Smc1=5, Smc1-Smc3=11, Smc1 Rad21 = 15 ...)
table(rowSums(t(t(im)*(2^(0:(ncol(im)-1))))))


# ---------------------------------------------------------------------------- #
# Lists

# b15) 
# make a list using list() function, your list should have 4 elements, and the first 
# element of the list should be named A and contain a vector of numbers from 10 to 1
l = list(A = 10:1, B=letters[1:5], C=c(T,F), D=rnorm(10))


# b16) 
# select the 1st element of the list you made using $ notation
l$A

# b17) 
# select the 4st element of your list using [ ] notation; now select the 4th element
# of the list using [[ ]] notation. What is the difference between the two?
l[4]
l[[4]]

### [] select a sublist at a certain position, while [[]] selets the elements of the
### sublist

# b18) 
# In the list you created, add 10 to the first five elements under element a
# (e.g. the first element of the list should look like: 20 19 18 17 16  5  4  3  2  1)
l[[1]][1:5] = l[[1]][1:5] + 10


# b19) 
# What is the difference between the following:
l1 = list(1:5, letters[1:5])
l2 = c(list(1:5), letters[1:5])
l3 = c(list(1:5), list(letters[1:5]))

### l1 and l3 are the same
### l2 shows you that if you concatenate a list and a vector, each element of the
### vector will become a separate element of the list

# ---------------------------------------------------------------------------- #
# Data Frames

# b22) 
# make a data frame with 3 columns and 5 rows, make sure first column is sequence
# of numbers 1:5, and second column is a character vector, and the third one is a logical vector
d = data.frame(a=1:5, b=letters[1:5], c=c(T,F,T,F,T))


# b23) 
# Extract rows where the 1st column is larger than 3
d[d$a > 3,]


# b24)
# convert the data.frame to a matrix; What happens to the elements?
as.matrix(d)


# b25) 
# Extract last two columns using column names
d[,c('b','c')]

# b26)
# Add the values from the logical column to the numeric column
d[,1] = d[,1] + d[,3]

# b27)
# remove the second column from the data frame
d[,2] = NULL

# b28)
# replace all values that are TRUE in the logical column with NA; run na.omit
# on the resulting data.frame, what is the result?
d$c[d$c == TRUE] = NA
na.omit(d)

# b29)
# try to explain the following results
f = factor(c(1,1,1,5,5,7))
as.numeric(f)
### when converting from factor to a numeric variable R uses the levels of the
### factor and not the inherent values

# b30)
# from the iris dataset (i.e. to see the dataset, type head(iris))
# count the number of each species speciments that have sepal length > 4 and
# petal length > 4
table(iris$Species[iris$Sepal.Length > 4 & iris$Petal.Length >4])

### alternatively
table(subset(iris, Sepal.Length > 4 & Petal.Length > 4, select=Species))

#-------------------------------------------------------------------------------
### Reading in and writing data out in R
#-------------------------------------------------------------------------------

# c1)
# read CpG islands from ../data/CpGi.table.hg18.txt, this is a tab-separated file 
### here you have to be sure that the working directory is the directory with 
### containing the exercise files
getwd()
### if not, set the working directory to the one with the exercise files
d = read.table('../data/CpGi.table.hg18.txt', sep='\t', header=TRUE)
head(d)

# c2)
# how many rows does the table contain
nrow(d)

# c3)
# why the following doesn't work? see sep argument at help(read.table)
cpgiSepComma=read.table("../data/CpGi.table.hg18.txt",header=TRUE,sep=",")
head(cpgiSepComma)


# c4)
# what happens when header=FALSE ?
### header becomes the first line in the table and all lines are read in as factors
### which is very very bad

# c5)
# read only the first 10 rows
d = read.table('../data/CpGi.table.hg18.txt', sep='\t', header=TRUE, nrows=10)
nrow(d)

# c6)
# use read.table("../data/CpGi.table.hg18.txt",... with header=FALSE
# do head() to see the results


# c7)
# write CpG islands to a text file
write.table(cpgi,file="my.cpgi.file.txt")


# c8)
# same as above but use quote=FALSE,sep="\t" and row.names=FALSE arguments 
# save the file to "my.cpgi.file2.txt" and compare it with "my.cpgi.file.txt"
write.table(cpgi,file="my.cpgi.file2.txt", quote=FALSE, sep='\t')

# c9)
# write out the first 10 rows of 'cpgi'
# HINT: use subsetting for data frames we learned before
write.table(cpgi[1:10,], file="my.cpgi.file2.txt", quote=FALSE, sep='\t')

### alternatively
write.table(head(cpgi,n=10), file="my.cpgi.file2.txt", quote=FALSE, sep='\t')

# c10)
# write CpG islands only on chr1
write.table(cpgi[cpgi$chrom == 'chr1',], file="my.cpgi.file.chr1.txt", quote=FALSE, sep='\t')

# c11)
# read two other data sets "../data/rn4.refseq.bed" and "../data/rn4.refseq2name.txt"
# with header=FALSE, assign them to df1 and df2 respectively.
# merge data sets using merge()
# what is the difference between all.x, all.y and all = TRUE?
r1 = read.table('../data/rn4.refseq.bed', sep='\t', header=FALSE)
r2 = read.table('../data/rn4.refseq2name.txt', sep='\t', header=FALSE)

head(r1)
head(r2)

nrow(r1)
nrow(r2)

m = merge(r1, r2, by.x='V4', by.y='V1')
nrow(m)

#-------------------------------------------------------------------------------
### Plotting in R
#-------------------------------------------------------------------------------


# d1)
# Using the iris dataset, make a scatterplot of Sepal.Length vs Petal.Length
# hint: plot
plot(iris$Sepal.Length, iris$Petal.Length)

# d2)
# color the points on the plot based on the species variable
plot(iris$Sepal.Length, iris$Petal.Length, col=iris$Species)

# d3)
# What do the following arguments do?: xlab, ylab, main, cex, pch, axes, xlim, ylim
# xlab - changes the name of the X axis
plot(iris$Sepal.Length, iris$Petal.Length, col=iris$Species, xlab='My x axis')
# ylab - changes the name of the Y axis
plot(iris$Sepal.Length, iris$Petal.Length, col=iris$Species, ylab='My y axis')
# main - changes the title of the plot
plot(iris$Sepal.Length, iris$Petal.Length, col=iris$Species, main='My title')
# cex - changes the size of the dots
plot(iris$Sepal.Length, iris$Petal.Length, col=iris$Species, cex=2)
# pch - changes the type of the dot (to a square, star, filled dot ....)
plot(iris$Sepal.Length, iris$Petal.Length, col=iris$Species, pch=20)

# axes - stops the plotting of the x and y axis and enables axes customization
plot(iris$Sepal.Length, iris$Petal.Length, col=iris$Species, axes=F)
axis(1, lwd=2)
axis(2, lwd=2)

# xlim, ylim - change the plotting range
plot(iris$Sepal.Length, iris$Petal.Length, col=iris$Species, xlim=c(0,10),ylim=c(1,10))

# d4)
# Make three plots on the same canvas: 
# Sepal.Length vs Petal.Length, Sepal.Width vs Petal.Width, Petal.Length vs Petal Width
# on each plot color with red, points corresponding to the setosa species
# hint: (par(mfrow)), points
### par function changes the default parameters of the canvas; the mfrow
### parameter changes the number of plots on the same canvas
par(mfrow=c(1,3))
plot(iris$Sepal.Length, iris$Petal.Length, col=c('red','black','black')[iris$Species])
plot(iris$Sepal.Width,  iris$Petal.Width, col=c('red','black','black')[iris$Species])
plot(iris$Petal.Length, iris$Petal.Width, col=c('red','black','black')[iris$Species])


### alternative solution
setosa = iris[iris$Species == 'setosa',]
plot(iris$Sepal.Length, iris$Petal.Length, pch=20)
points(setosa$Sepal.Length, setosa$Petal.Length, col='red', pch=20)

plot(iris$Sepal.Width,  iris$Petal.Width, pch=20)
points(setosa$Sepal.Width,  setosa$Petal.Width, col='red', pch=20)

plot(iris$Petal.Length, iris$Petal.Width, pch=20)
points(setosa$Petal.Length, setosa$Petal.Width, col='red', pch=20)

# d5)
# Plot a scatter plot of Sepal.Length vs Sepal.Width only for the setosa species,
# and add the correlation between the vairables in the left upper corner of the plot
# hint: cor, text
### I am reseting the canvas to plot only one graph
par(mfrow=c(1,1))
### here I am selecting only the setosa species
setosa = iris[iris$Species == 'setosa',]
plot(setosa$Sepal.Length, setosa$Sepal.Width, pch=20)

### cor function calculates the correlation between the variables
set.cor = cor(setosa$Sepal.Length, setosa$Sepal.Width)

### text is very similar to the plot function it has three main arguments:
### x position, y position and labels, which represent text to plot
text(4.5,4.0,labels=round(set.cor,3))

# d6)
# read into R the Cpgi.table.hg18.txt
# plot a histogram of start sites of cpg islands on chromosome 1
# what does the breaks argument do? Try changing the breaks argument to 1000
# what does the include.lowest argument do?
# hint: hist
cpgi = read.table('../data/CpGi.table.hg18.txt', header=TRUE, sep='\t')
hist(cpgi$chromStart[cpgi$chrom == 'chr1'])

### the breaks parameter controls the number of bins - for example, you can
### see the centromere quite nicely now
hist(cpgi$chromStart[cpgi$chrom == 'chr1'], breaks=1000)

v = c(rnorm(10), 4, -4)
hist(v, breaks=-4:4)
### the include lowest parameter enables the histogram to include the values
### into the lowest bin that correspond to the left border
### e.g. in the histogram above, the -4 is included into the bin from -4 to -43, and
### in the histogram belov, it is included in the bin from -5 to -4
hist(v, breaks=-5:4, include.lowest=FALSE)

# d7)
# using the ToothGrowth dataset
# draw a boxplot of teeth length
# draw a boxplot of teeth length conditioned on the amount of vitamin C (dose)
# draw a boxplot of teeth length conditioned on the amount of vitamin C and 
# the method of delivery (supp variable) - color the boxplot of different groups
# in pretty colors
# what does the horizontal = TRUE argument do?
boxplot(ToothGrowth$len)

### boxplot plotting works with a formula interface (i.e. it uses ~)
### to plot a continuous variable (teeth length in our case) for different groups, 
### you put the variable on the left side of the ~, and the groups on the right side
boxplot(ToothGrowth$len ~ ToothGrowth$supp)
boxplot(ToothGrowth$len ~ ToothGrowth$dose)



# d8)
# What do the following commands do?
### this is an advanced version of the formula interface, where you want to visualize
### your variable of interest (teeth length in our case), but for several groups
### that is done by putting the groups on the right side of the ~ and separating them
### with +
### the order in which you specify the groups matters as you can see on the plots below
boxplot(len~supp+dose, data=ToothGrowth,  col=c('darkorange','cornflowerblue'))
boxplot(len~dose+supp, data=ToothGrowth, col=c(rep('red',3), rep('blue',3)))


# d9) 
# Save your last plot into a file in three different ways:
# Click on export in the bottom right command panel
# use the dev.copy command
# use the pdf command
boxplot(len~dose+supp, data=ToothGrowth, col=c(rep('red',3), rep('blue',3)))

pdf(filename='MyBoxplot.pdf')
boxplot(len~dose+supp, data=ToothGrowth, col=c(rep('red',3), rep('blue',3)))
dev.off()
### if you don't specify dev.off(), the plot will not be saved

boxplot(len~dose+supp, data=ToothGrowth, col=c(rep('red',3), rep('blue',3)))
dev.copy(pdf, filename='MyBoxplot.pdf');dev.off()


# d10)
# what does the following set of commands do?
### set.seed is a function that regulates how the random numbers will be generated
### for example, if you put set.seed(1), and generate 10 random numbers from the normal 
### distribution, it will always be the same 10 random numbers
set.seed(1)
### rpois generates numbers from the poisson distribution; here we are generating
###  1000 numbers from the poisson distribution that has the average value 7
r = rpois(1000, 7)

### the table function counts the number of each distinct element in a vector
### e.g. v = c(1,1,2,2,2,5) - then table would say 1-2, 2-3, 5-1
### here we are using the table function to count how much of each number we have in vector r
### we convert r to a factor, and explicitly set the levels, because that will make
### the table function countt the occurences of a specific number 
### even if it that number is not included in the vector
### e.g. values 17 - 30 are not present in the vector r, but they are nevertheless counted
### this is acutally one of the rare ocasions where a factor variable is useful
tr = table(factor(r, levels=1:30))

### barplot is used for plottin the distribution of categorical variables
barplot(tr)

r2 = rpois(1000, 15)
tr2 = table(factor(r2, levels=1:30))
m = rbind(tr, tr2)

### if you supply a matrix to the barplot function, each row will be printed in 
### a different color
barplot(m)

### the beside argument tells the function not to stack the counts that belong to
### same bins, but to plot two columns side by side
barplot(m, beside=TRUE)

# d11)
# EXTRA:
# color density scatterplot
x2=1:1000+rnorm(1000,mean=0,sd=200)
y2=1:1000
plot(x2,y2,pch=19,col="blue")
smoothScatter(x2,y2,colramp = heat.colors )
smoothScatter(x2,y2,colramp = colorRampPalette(c("white","blue", "green","yellow","red")))

#-------------------------------------------------------------------------------
### Functions and control structures (for, if/else etc.)
#-------------------------------------------------------------------------------

# e1)
# write a function called my.mean that calculates the average value of a vector
# write a function called my.sd that calculates the standard deviation of a vector

my.mean = function(v){
  
  the.mean = sum(v)/length(v)
  return(the.mean)
}

my.sd = function(v){
  
  the.var = sum((v - my.mean(v))^2 )/(length(v)-1)
  the.sd = sqrt(the.var)
  return(the.sd)
}

v = 1:10
my.mean(v) == mean(v)
my.sd(v) == sd(v)

# e2) 
# write a function that takes two vectors and returns the pearson correlation 
# coefficient

my.cor = function(x,y){
  
  my.cor = cov(x,y)/(sd(x)*sd(y))
  return(my.cor)
}

### alternative solution
my.cor2 = function(x,y){
  
  my.cov = sum((x-mean(x))*(y-mean(y)))/(length(x)-1)
  my.cor = my.cov/(sd(x)*sd(y))
  return(my.cor)
}

v1 = 1:10
v2 = 10:1
my.cor(v1, v1)
my.cor(v1, v2)
my.cor(v1, v2) == cor(v1, v2)

my.cor2(v1, v2) == my.cor(v1, v2)

# e3)
# write a function that calculates the average value of a numeric vector, but
# if you give the function a character or a factor, it returns "Error: this is not
# a numeric vector"

my.mean2 = function(x){

  if(!is.numeric(x)){
    return("Error: this is not a numeric vector")
  }
  return(mean(x))
  
}


# e4)
# write a function that returns either a product or a sum of n numbers, based
# on what the user specifies
# hint if

sumprod = function(x, what='sum'){
  
  if(what == 'sum'){
    return(sum(x))
  }else{
    return(prod(x))
  }
}

### solution number 2
sumprod2 = function(x, what='sum'){
  
  if(what == 'sum'){
    return(sum(x))
  }
  if(what == 'prod'){}
    return(prod(x))
  }
}

### solution number 3
sumprod3 = function(x, what='sum'){
  
  if(what == 'sum'){
    res = sum(x)
  }
  if(what == 'prod'){}
   res = prod(x)
  }
  return(res)
}

# e5)
# change the correlation function to give an error if the two vectors do not have 
# the same length
# hint - if, stop


my.cor3 = function(x,y){
  
  if(length(x) != length(y)){
    stop('X and Y do not have the same length')
  }
  
  my.cor = cov(x,y)/(sd(x)*sd(y))
  return(my.cor)
}

my.cor3(1:5, 1:10)

# e6)
# write a function that calculates the sum of numbers from 1 to n; use a for loop


my.sum = function(x){

  res = 0
  for(i in 1:x){
    res = res + i
  }
  return(res)
}

v = 10
my.sum(10) == sum(1:10)

# e7)
# read into R the GolubExprs.txt
# using a 2 for loops, calculate all pariwise correlation coefficients between the samples
# and save them into a matrix named mcor

r = read.table('../data/GolubExprs.txt', header=TRUE, sep='\t')
r = r[,-1]
head(r)

mcor = matrix(ncol=ncol(r), nrow=ncol(r))
for(i in 1:ncol(r)){
  for(j in 1:ncol(r)){
    cat(i,j,'\n')
    mcor[i,j] = cor(r[,i],r[,j])
  }
}

all(round(mcor,2) == round(cor(r),2))



# e8.)
# From the following data frame, replace each NA value with the average of values
# in the column in which the NA is located
d = data.frame(matrix(1:5, ncol=5, nrow=5, byrow=TRUE))
d[col(d) == row(d)] = NA

### solution 1
d1 = d
### this loop goes column by column - as designates by the i variable, then it
### selects the values in the column that correspond to NA: d1[is.na(d1[,i]),i]
### and replaces them with the mean of values in the same column: mean(d1[,i], na.rm=TRUE)
for(i in 1:ncol(d1)){
  d1[is.na(d1[,i]),i] = mean(d1[,i], na.rm=TRUE)
}
d1

### solution 2
d2 = lapply(d, function(x){x[is.na(x)] = mean(x, na.rm=TRUE);x})
d2 = data.frame(d2)
d2


# e9.)
# read in the rn4.refseq.bed; From the dataset count the number of transcripts
# that have more than one exon - exons start locations are located in column 11
# compare your results with column 10

### you have to put stringsAsFactors=FALSE
r = read.table('../data/rn4.refseq.bed', header=FALSE, sep='\t', stringsAsFactors=FALSE)
head(r)

### lets break this one apart:
### strsplit(r[,11],',') takes the eleventh column and splits it using a comma
### execute: head(strsplit(r[,11],','))
### then the lapply function goes over each element of the list and uses the length
### function to count the number of exons 
### and finally the unlist function converts the produced list into a vector
ex.num = unlist(lapply(strsplit(r[,11], ','), function(x)length(x)))
head(ex.num)
sum(ex.num > 1)

all(ex.num == r[,10])




