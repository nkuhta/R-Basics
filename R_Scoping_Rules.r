##  Scoping Rules in R
##  Refer to Coursera R Programming Course from John Hopkins

###############################################
######  Scoping Rules - Symbol Binding   ######
###############################################

#   lm <- function(x){x*x}

#   When lm is defined as above as a global env above it overwrites the stats package

    # > search()
    # [1] ".GlobalEnv"        "tools:rstudio"     "package:stats"    
    # [4] "package:graphics"  "package:grDevices" "package:utils"    
    # [7] "package:datasets"  "package:methods"   "Autoloads"        
    # [10] "package:base" 

#   Note global is first and base is last


#   What value would be assigned to z in the function f below?  

f <- function(x,y){
  x^2+y/z             #  z is undefined
}

#   In lexical scoping free variable values are search for in the environment it was defined. 

###############################################
#############  R Scoping Rules   ##############
###############################################

#   See function within function below

make.power <- function(n){
  pow <- function(x){
    x^n
  }
  pow
}

#   The return function is power, where n is a free variable that's defined in make.power

cube <- make.power(3)
square <- make.power(2)

    # > cube(3)
    # [1] 27
    # > square(3)
    # [1] 9

#   How do you know what's in a functions environment ?  (see below, "ls" then "get" environment)

  # > ls(environment(cube))
  # [1] "n"   "pow"
  # > get("n",environment(cube))
  # [1] 3
  # > get("n",environment(square))
  # [1] 2

###############################################
######  Lexical vs. Dynamic Scoping   #########
###############################################

y <- 10       #  global y variable

f1 <- function(x){
  y <- 2      #  local y variable inside f1
  y^2+g(x)
}

g <- function(x){
  x*y         #  y is called from the global variable 
}

#   what is the value of f1(2)

    # > f1(2)
    # [1] 24

#   g takes the y value of 10 from the global and y = 2 is used inside f1.  

g1 <- function(x){
  a <- 3  # a = local variable and cannot be used outside g1
  x+a+y   # y is not defined in g1 and is therefore 10 due to global definition
}
    # > g1(2)
    # [1] 15

#   Consequences of Lexical Scoping in R is everything must be stored in memory.

###############################################
##########  Optimization Example   ############
###############################################

#  Constructor function (Negative log likelihood)

make.NegLogLik <- function(data,fixed=c(F,F)){
  params <- fixed
  function(p){
   params[!fixed] <- p
   mu <- params[1]
   sigma <- params[2]
   a <- -0.5*length(data)*log(2*pi*sigma^2)
   b <- -0.5*sum((data-mu)^2/(sigma^2))
    -(a+b)
  }
}

set.seed(1)

normals <- rnorm(100,1,2)

nLL <- make.NegLogLik(normals)

    # > nLL
    # function(p){
    #   params[!fixed] <- p
    #   mu <- params[1]
    #   sigma <- params[2]
    #   a <- -0.5*length(data)*log(2*pi*sigma^2)
    #   b <- -0.5*sum((data-mu)^2/(sigma^2))
    #   -(a+b)
    # }
    # <environment: 0x0000000014989518>  (memory address)

    # > ls(environment(nLL))
    # [1] "data"   "fixed"  "params"












