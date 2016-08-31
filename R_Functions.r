##  Functions in R
##  Refer to Coursera R Programming Course from John Hopkins

###############################################
###########  R Function Examples   ############
###############################################

#  Add function 

add2 <- function(x,y){
  x+y
}
    # > add2(1,2)
    # [1] 3

#  function which gives vector elements > 10

above10 <- function(v){
  use <- v>10
  v[use]
}

#  function which gives vector elements > N

above <- function(v,N){
  use <- v>N
  v[use]
}

    # > x <- 1:20
    # > above10(x)
    # [1] 11 12 13 14 15 16 17 18 19 20
    # > above(x,3)
    # [1]  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20

#   compute the mean of columns of dataset y (with NAs removed)

columnmean <- function(y,removeNA=TRUE){
  nc <- ncol(y)               #  number of y columns
  means <- numeric(nc)        #  a numeric vector with ncol length
  for(i in 1:nc){
    means[i] <- mean(y[,i])   #  means[i] is the ith column average 
  }
means
}

###############################################
###########  R Functions Part 1   #############
###############################################

#  Basic Syntax

f <- function(args){
  #  Do something with args
}

#  functions are first class object, so you can pass them to other functions

# standard deviation example

mydata <- rnorm(100)

sd(mydata)
    # > sd(mydata)
    # [1] 1.033867

sd(x=mydata)
    # > sd(x=mydata)
    # [1] 1.033867

sd(x=mydata,na.rm = FALSE)
    # > sd(x=mydata,na.rm = FALSE)
    # [1] 1.033867

sd(na.rm = F,x=mydata)
    # > sd(na.rm = FALSE,x=mydata)
    # [1] 1.033867

sd(na.rm = F,mydata)
    # > sd(na.rm = FALSE,mydata)
    # [1] 1.033867

##  In general the argument order doesn't matter
##  BUT It's not recommended to minimize confusion

#  Linear model example 

    # > args(lm)
    # function (formula, data, subset, weights, na.action, method = "qr", 
    #           model = TRUE, x = FALSE, y = FALSE, qr = TRUE, singular.ok = TRUE, 
    #           contrasts = NULL, offset, ...) 

#lm(data=mydata,y ~ x,model = F,1:100)

#  is equivalent to

#lm(y ~ x,mydata,1:100,model=F)

###############################################
###########  R Functions Part 2   #############
###############################################

#   Specifying function arguments and values, including NULL

f1 <- function(a,b=1,c=2,d=NULL){
  
}

#   Lazy Evaluation, b is specified or used

f2 <- function(a, b){
    a^2
}
    # > f2(2)
    # [1] 4

#   See output below commands are all executed until the error.

f3 <- function(a,b){
  print(a)
  print(b)
}

    # > f3(45)
    # [1] 45
    # Error in print(b) : argument "b" is missing, with no default

#   The ... Argument

#   The ... absorbs all the other functions in the data set

myplot <- function(x,y,type="l",...){
  plot(x,y,type=type,...)
}

# > args(paste)
# function (..., sep = " ", collapse = NULL) 

# > args(cat)
# function (..., file = "", sep = " ", fill = FALSE, labels = NULL, 
#           append = FALSE) 

paste("a","b",sep = ":")
    # [1] "a:b"
paste("a","b",se = ":")
    #[1] "a b :"

#   Be careful that any arguments coming after the ... are stated in full









