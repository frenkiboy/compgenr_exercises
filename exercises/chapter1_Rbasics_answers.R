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

x1=1:100+rnorm(100,mean=0,sd=15)
y1=1:100
# d1)
# make a scatter plot using x1 and x2 generated above
# Answer: plot(x1,y1)
plot(x1,y1)

# d2)
# use main argument to give a title to plot() as in plot(x,y,main="title")
plot(x1,y1,main="scatter plot")

# d3)
# use xlab argument to set a label to x-axis
# Ex: plot(x,y,xlab="my label")
plot(x1,y1,main="scatter plot",xlab="x label")

# d4)
# use ylab argument to set a label to y-axis
plot(x1,y1,main="scatter plot",xlab="x label",ylab="y label")

# d5)
# see what mtext(side=3,text="hi there") does
# HINT: mtext stands for margin text
plot(x1,y1,main="scatter plot",xlab="x label",ylab="y label")
mtext(side=3,text="hi there") 

# d6)
# see what mtext(side=2,text="hi there") does
# it stands for "margin text", look at your plot after execution
mtext(side=2,text="hi there") 
mtext(side=4,text="hi there") 

# d7)
# see what paste() is used for
paste("Text","here")
myText=paste("Text","here")
myText


# d8)
# You can use paste() as 'text' argument in mtext() try that, you need to re-plot
# your plot first. HINT: mtext(side=3,text=paste(...))

mtext(side=3,text=paste("here","here"))

# d9)
# cor() calculates correlation between two vectors
# pearson correlation is a measure of the linear correlation (dependence) 
# between two variables X and Y
corxy=cor(x1,y1) # calculates pearson correlation


# d10)
# Can you use mtext(),cor() and paste() to display correlation coefficient on
# your scatterplot ?

plot(x1,y1,main="scatter")
corxy=cor(x1,y1) 
#mtext(side=3,text=paste("Pearson Corr.",corxy))
mtext(side=3,text=paste("Pearson Corr.",round(corxy,3) ) )

plot(x1,y1)
mtext(side=3,text=paste("Pearson Corr.",round( cor(x1,y1)  ,3)  ) )

# d11)
# change colors using col
# Ex: plot(x,y,col="red")
plot(x1,y1,col="red")

# d12)
# use pch=19 as an argument to your plot() command
plot(x1,y1,col="red",pch=19)


# d13)
# use pch=18 as an argument to your plot() command
plot(x1,y1,col="red",pch=18)
?points

# d14)
# make histogram of x1 with hist() function
# histogram is a graphical representation of the data distribution 
hist(x1)

# d15)
# you can change colors with 'col', add labels with 'xlab', 'ylab', and add a 'title'
# with 'main' arguments. Try all these in a histogram.
hist(x1,main="title")

# d16)
# make boxplot of y1 with boxplot()
boxplot(x1,main="title")


# d17)
# make boxplots of x1 and y1 in the same plot
# boxplot
boxplot(x1,y1,ylab="values",main="title")

# d18)
# in boxplot use horizontal = TRUE  argument
boxplot(x1,y1,ylab="values",main="title",horizontal=TRUE)


# d19)
# make multiple plots with par(mfrow=c(2,1))
# 1. run par(mfrow=c(2,1))
# 2. make a boxplot 
# 3. make a histogram
par( mfrow=c(2,1) )
hist(x1)
boxplot(y1)

# d20)
# do the same as above but this time with par(mfrow=c(1,2))
par(mfrow=c(2,2))
hist(x1)
boxplot(y1)

# d21)
# save your plot using "Export" button


# d22)
# save your plot by running :
# dev.copy(pdf,file="plot.file.pdf");dev.off()
dev.copy(pdf,file="plot.file.pdf");dev.off()

# d23)
# save your plot running :
# dev.copy(png,filename="plot.file.png");dev.off()
dev.copy(png,file="plot.file.png");dev.off()

# d24)
# Another way to save the plot is the following
# 1. Open a graphics device
# 2. Create the plot
# 3. Close the graphics device
pdf("myplot1.pdf", width = 5, height = 5) # 1.
plot(x1, y1) # 2.
dev.off()   # 3.


# d24)
# EXTRA:
# color density scatterplot
x2=1:1000+rnorm(1000,mean=0,sd=200)
y2=1:1000
plot(x2,y2,pch=19,col="blue")
smoothScatter(x2,y2,colramp = heat.colors )
smoothScatter(x2,y2,
               colramp = colorRampPalette(c("white","blue", "green","yellow","red")))

#-------------------------------------------------------------------------------
### Functions and control structures (for, if/else etc.)
#-------------------------------------------------------------------------------

# e1)
# read CpG island data
cpgi=read.table("../data/CpGi.table.hg18.txt",header=TRUE,sep="\t")
head(cpgi)

# e2)
# check values at perGc column using a histogram
# perGc stands for GC percent => percentage of C+G nucleotides
hist(cpgi$perGc) # most values are between 60 and 70

# e3)
# also make a boxplot
boxplot(cpgi$perGc) 

# e4)
# use if/else structure to decide if given GC percent high, low or medium
# if it is low, high, or medium. low < 60, high>75, medium is between 60 and 75
# use greater or less than operators <  or  >
GCper=90
result="low"# set initial value

if(GCper < 60){ # check if GC value is lower than 60, assign "low" to result
  result="low"
}else if(GCper>75){  # check if GC value is higher than 75, assign "high" to result
  result="high"
}else{ # if those two conditions fail then it must be "medium"
  result="medium"
}
result


# e5)
# write a function that takes a value of GC percent and decides
# if it is low, high, or medium. low < 60, high>75, medium is between 60 and 75
# use
GCclass<-function(my.gc){
  
  result="low"# set initial value
  
  if(my.gc < 60){ # check if GC value is lower than 60, assign "low" to result
    result="low"
  }
  else if(my.gc > 75){  # check if GC value is higher than 75, assign "high" to result
    result="high"
  }else{ # if those two conditions fail then it must be "medium"
    result="medium"
  }
  return(result)
}
GCclass(10) # should return "low"
GCclass(90) # should return "high"
GCclass(65) # should return "medium"


# e6)
# use a for loop to get GC percentage classes for gcValues below
gcValues=c(10,50,70,65,90)
for( i in gcValues){
 
  print(GCclass(i) )
}

for( i in gcValues){
  
  cat(GCclass(i),"\n" )
}

for( i in gcValues){
  
  cat(GCclass(i))
}

# e7)
# use lapply to get to get GC percentage classes for gcValues
# Ex: vec=c(1,2,4,5)
#     power2=function(x){ return(x^2)  }
#     lapply(vec,power2)
s=lapply(gcValues,GCclass)

# e8)
# use sapply to get values to get GC percentage classes for gcValues
sapply(gcValues,GCclass)


# e9)
# Is there a way to decide on the GC percentage class of given vector of GCpercentages
# without using if/else structure ? if so, how can you do it?
# HINT: subsetting

result=rep("low",length(gcValues) )
result[gcValues > 75]="high"
result[gcValues < 75 & gcValues > 60 ] = "medium"

