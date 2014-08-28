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

# b11) 
# make a list using list() function, your list should have 4 elements
# the one below has 2
# Ex: mylist= list(a=c(1,2,3),b=c("apple,"orange"))
mylist= list(a=c(1,2,3),
            b=c("apple","orange"),
            c=matrix(1:4,nrow=2),
            d="hello")

# b12) 
# select the 1st element of the list you made using $ notation
# Ex: mylist$a selects first element named "a"
mylist$a

# b13) 
# select the 4th element of the list you made using $ notation
mylist$d

# b14) 
# select the 1st element of your list using [ ] notation 
# Ex: mylist[1] selects first element named "a", you get a list with one element
# Ex: mylist["a"] selects first element named "a", you get a list with one element
mylist[1] # -> still a list
mylist[[1]] # not a list

mylist["a"] 
mylist[["a"]] 

# b15) 
# select the 4th element of your list using [ ] notation 
mylist[4] 
mylist[[4]]

# b16) 
# make a 5x3 matrix (5 rows, 3 columns) using matrix()
# Ex: matrix(1:6,nrow=3,ncol=2) makes a 3x2 matrix using numbers between 1 and 6
mat=matrix(1:15,nrow=5,ncol=3)

# b17) 
# What happens when you use byrow = TRUE in your matrix() as an additional argument?
# Ex: mat=matrix(1:6,nrow=3,ncol=2,byrow = TRUE)
mat=matrix(1:15,nrow=5,ncol=3,byrow = TRUE)

# b18) 
# Extract first 3 columns and first 3 rows of your matrix using [] notation
# Ex: mat[1:2,1:2]
mat[1:3,1:3]

# b19) 
# Extract last two rows
# Ex: mat[2:3,] or mat[c(2,3),]
mat[4:5,] 
mat[c(nrow(mat)-1,nrow(mat)),] 
tail(mat,n=1)
tail(mat,n=2)

# b20) 
# Extract first two columns and run class() on the result
class(mat[,1:2])

# b21) 
# Extract first column and run class() on the result, compare with the above exercise
class(mat[,1])

# b22) 
# make a data frame with 3 columns and 5 rows, make sure first column is sequence
# of numbers 1:5, and second column is a character vector
# Ex: df=data.frame(col1=1:3,col2=c("a","b","c"),col3=3:1) # 3x3 data frame
# Remember you need to make 3x5 data frame
df=data.frame(col1=1:5,col2=c("a","2","3","b","c"),col3=5:1)

# b23) 
# Extract first two columns and first two rows 
# HINT: Same notation as matrices
df[,1:2]

df[,1:2]

# b24) 
# Extract last two rows
# HINT: Same notation as matrices
df[,4:5]

# b25) 
# Extract last two columns using column names
# Ex: df[,c("col2","col3")]
df[,c("col2","col3")]

# b26) 
# Extract second column using column names
# you can use [] or $ as in lists, use both in two different answers
df$col2
df[,"col2"]
class(df["col1"])
class(df[,"col1"])

# b27)
# Extract rows where 1st column is larger than 3
# HINT: you can get a logical vector using > operator
# logical vectors can be used in [] when subsetting
df[df$col1 >3 , ]


# b28)
# Extract rows where 1st column is larger than or equal to 3
df[df$col1 >= 3 , ]


# b29)
# convert data frame to the matrix
# HINT: use as.matrix()
# Observe what happened to numeric values in the data.frame
class(df[,c(1,3)])
as.matrix(df[,c(1,3)])
as.matrix(df)


# b30)
# make a factor using factor(), with 5 elements
# Ex: fa=factor(c("a","a","b"))


# b31)
# convert a character vector to factor using as.factor()
# first make a character vector using c() then use as.factor()


# b32)
# convert the factor you made above to character using as.character()


#-------------------------------------------------------------------------------
### Reading in and writing data out in R
#-------------------------------------------------------------------------------

# c1)
# read CpG islands from ../data/CpGi.table.hg18.txt, this is a tab-separated file 
cpgi=read.table(file="../data/CpGi.table.hg18.txt",header=TRUE,sep="\t")
cpgi=read.table("../data/CpGi.table.hg18.txt",header=TRUE,sep="\t")

# c2)
# use head() on cpgi to see first few rows
head(cpgi)


# c3)
# why the following doesn't work? see sep argument at help(read.table)
cpgiSepComma=read.table("../data/CpGi.table.hg18.txt",header=TRUE,sep=",")
head(cpgiSepComma)


# c4)
# what happens when header=FALSE ?
cpgiHF=read.table("../data/CpGi.table.hg18.txt",header=FALSE,sep="\t")
head(cpgiHF)
head(cpgi)


# c5)
# read only first 10 rows
cpgi10row=read.table("../data/CpGi.table.hg18.txt",header=TRUE,sep="\t",nrow=10)
cpgi10row


# c6)
# use read.table("../data/CpGi.table.hg18.txt",... with header=FALSE
# do head() to see the results


# c7)
# write CpG islands to a text file
write.table(cpgi,file="my.cpgi.file.txt")


# c8)
# same as above but use quote=FALSE,sep="\t" and row.names=FALSE arguments 
# save the file to "my.cpgi.file2.txt" and compare it with "my.cpgi.file.txt"


# c9)
# write out the first 10 rows of 'cpgi'
# HINT: use subsetting for data frames we learned before


# c10)
# write the first 3 columns of 'cpgi'


# c11)
# write CpG islands only on chr1
# HINT: use subsetting with [], feed a logical vector using == operator


# c12)
# read two other data sets "../data/rn4.refseq.bed" and "../data/rn4.refseq2name.txt"
# with header=FALSE, assign them to df1 and df2 respectively.


# c13)
# use head() to see what is inside


# c14)
# merge data sets using merge()
new.df=merge(df1,df2,by.x="V4",by.y="V1")


# c15)
# use head() to see new.df


#-------------------------------------------------------------------------------
### Plotting in R
#-------------------------------------------------------------------------------

x1=1:100+rnorm(100,mean=0,sd=15)
y1=1:100
# d1)
# make a scatter plot using x1 and x2 generated above
# Answer: plot(x1,y1)


# d2)
# use main argument to give a title to plot() as in plot(x,y,main="title")


# d3)
# use xlab argument to set a label to x-axis
# Ex: plot(x,y,xlab="my label")

# d4)
# use ylab argument to set a label to y-axis

# d5)
# see what mtext(side=3,text="hi there") does
# HINT: mtext stands for margin text


# d6)
# see what mtext(side=2,text="hi there") does
# it stands for "margin text", look at your plot after execution

# d7)
# see what paste() is used for
paste("Text","here")
myText=paste("Text","here")
myText


# d8)
# You can use paste() as 'text' argument in mtext() try that, you need to re-plot
# your plot first. HINT: mtext(side=3,text=paste(...))


# d9)
# cor() calculates correlation between two vectors
# pearson correlation is a measure of the linear correlation (dependence) 
# between two variables X and Y
corxy=cor(x1,y1) # calculates pearson correlation


# d10)
# Can you use mtext(),cor() and paste() to display correlation coefficient on
# your scatterplot ?


# d11)
# change colors using col
# Ex: plot(x,y,col="red")


# d12)
# use pch=19 as an argument to your plot() command


# d13)
# use pch=18 as an argument to your plot() command


# d14)
# make histogram of x1 with hist() function
# histogram is a graphical representation of the data distribution 


# d15)
# you can change colors with 'col', add labels with 'xlab', 'ylab', and add a 'title'
# with 'main' arguments. Try all these in a histogram.


# d16)
# make boxplot of y1 with boxplot()


# d17)
# make boxplots of x1 and y1 in the same plot
# boxplot


# d18)
# in boxplot use horizontal = TRUE  argument


# d19)
# make multiple plots with par(mfrow=c(2,1))
# 1. run par(mfrow=c(2,1))
# 2. make a boxplot 
# 3. make a histogram


# d20)
# do the same as above but this time with par(mfrow=c(1,2))


# d21)
# save your plot using "Export" button


# d22)
# save your plot by running :
# dev.copy(pdf,filename="plot.file.pdf");dev.off()


# d23)
# save your plot running :
# dev.copy(png,filename="plot.file.png");dev.off()


# d24)
# Another way to save the plot is the following
# 1. Open a graphics device
# 2. Create the plot
# 3. Close the graphics device
pdf("myplot.pdf", width = 5, height = 5) # 1.
plot(x1, y1) # 2.
dev.off() # 3.


# d24)
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
# read CpG island data
cpgi=read.table("../data/CpGi.table.hg18.txt",header=TRUE,sep="\t")
head(cpgi)

# e2)
# check values at perGc column using a histogram
# perGc stands for GC percent => percentage of C+G nucleotides
hist(cpgi$perGc) # most values are between 60 and 70

# e3)
# also make a boxplot


# e4)
# use if/else structure to decide if given GC percent high, low or medium
# if it is low, high, or medium. low < 60, high>75, medium is between 60 and 75
# use greater or less than operators <  or  >
GCper=65
result=YOU_FILL_IN # set initial value

if(YOU_FILL_IN){ # check if GC value is lower than 60, assign "low" to result
  
}
else if(YOU_FILL_IN){  # check if GC value is higher than 75, assign "high" to result
  
}else{ # if those two conditions fail then it must be "medium"
  
}
result


# e5)
# write a function that takes a value of GC percent and decides
# if it is low, high, or medium. low < 60, high>75, medium is between 60 and 75
# use
GCclass<-function(my.gc){
  
  YOU_FILL_IN
  
  return(result)
}
GCclass(10) # should return "low"
GCclass(90) # should return "high"
GCclass(65) # should return "medium"


# e6)
# use a for loop to get GC percentage classes for gcValues below
gcValues=c(10,50,70,65,90)
for( i in YOU_FILL_IN){
  YOU_FILL_IN
}


# e7)
# use lapply to get to get GC percentage classes for gcValues
# Ex: vec=c(1,2,4,5)
#     power2=function(x){ return(x^2)  }
#     lapply(vec,power2)


# e8)
# use sapply to get values to get GC percentage classes for gcValues


# e9)
# Is there a way to decide on the GC percentage class of given vector of GCpercentages
# without using if/else structure ? if so, how can you do it?
# HINT: subsetting




