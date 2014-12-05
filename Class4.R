# functions
a = 1
a + 1
a + 1
a + 1

addone = function(x){
  
  res = x + 1
  
  return(res)
}

addone(a)
addone(a)
addone(a)


addn = function(x, n){
  
  res = x + n
  
  return(res)
}

addn(a, 1)
addn(a, 2)
addn(a)


addn = function(x, n=1){
  
  res = x + n
  
  return(res)
}

addn(a, 2)
addn(a,0)

x = 1:100
y = x + rnorm(100,0,5)
plot(x,y)

plot(x, y, pch=20, axes=FALSE)
axis(1, lwd=2)
axis(2, lwd=2)
l = lm(y~x)
abline(l, lwd=2, col='red')

my.plot = function(x,y,){
    
  plot(x, y, pch=20, axes=FALSE)
  axis(1, lwd=2)
  axis(2, lwd=2)
  l = lm(y~x)
  abline(l, lwd=2, col='red')
}

x1 = 100:1
y1 = x1 + rnorm(100,0,10)
my.plot(x1, y1)

# control structures
# for loop

for(i in 1:10){
  
  print(addn(a, i))
}
addn(a, 1:10)


for(i in c('a','b','c')){
  
  print(i)
}


v = sample(c(1,0), 10, replace=TRUE)
r = 0
for(i in 2:10){
  r = c(r, r[i-1]+v[i])
}
v
r 
cumsum(v)


add.if = function(x, n=1){
  
  if(n > 0){
    res = x + n
  }else{
    res = x - n    
  }
  
  return(res)
}

add.if = function(x, n=1){
  
  if(n > 0){
    res = x + n
  }else if(n == 0){
    res = 0  
  }else if(n < 0){
    res = x - n
  }
  return(res)
}

my.plot.col = function(x,y,k){
    
    if(length(unique(k)>1)){
      col = rainbow(length(unique(k)))[k]
    }else{
      col = 'black'
    }
  
    plot(x, y, pch=20, axes=FALSE, col=col)
    axis(1, lwd=2)
    axis(2, lwd=2)
    l = lm(y~x)
    #abline(l, lwd=2, col='red')
}
  
x1 = c(1:100, 1:100)
y1 = c(x1[1:100] + rnorm(100,0,3),x1[101:200] +rnorm(100,30,10))
plot(x1,y1)
my.plot.col(x1, y1, k=rep(c(1,2), each=100))


my.plot.col.for = function(x,y,k){
  
  if(length(unique(k)>1)){
    col = rainbow(length(unique(k)))[k]
  }else{
    col = 'black'
  }
  
  plot(x, y, pch=20, axes=FALSE, col=col)
  axis(1, lwd=2)
  axis(2, lwd=2)
  
  for(i in unique(k)){
    ind = k==i
    l = lm(y[ind]~x[ind])  
    abline(l, lwd=3)
  }
}

my.plot.col.for(x1, y1, k=rep(c(1,2), each=100))


x
y
plot(x,y)
plot(y ~ x)


rnorm(10)
hist(rpois(1000,4), breaks=20)
hist(runif(100000), breaks=50)

m = matrix(rnorm(30), ncol=6)
m = matrix(1:30, ncol=6)
rowSums(m)
rowMeans(m)

my.sd = vector()
for(i in 1:nrow(m)){
  my.sd = c(my.sd, sd(m[i,]))
}
my.sd

apply(m, 1, sd)
apply(m, 1, sum)
apply(m, 2, sum)

library(scatterplot3d)
scatterplot3d(1:100, 1:100, 1:100 + rnorm(100,0,10))


p = list(ta=c('p1','p2','p3'), tb=c('p1','p2'), tc=c('p1'))
unlist(lapply(p, length))



