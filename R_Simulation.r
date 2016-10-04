##  Data Simulation in R 
##  Refer to Coursera R Programming Course from John Hopkins

###############################################
#######   Generating Random Numbers   #########
###############################################

#  rnorm - generate random normal varaites with give mean and standard deviation
#  dnorm - evaluate the normal probability density (with given mean/sd) at a point
#  pnorm - evaluate the cumulative distribution function for a normal distribution
#  rpois - generate random Poisson variates with a given rate.


#   Probability distribution function four functions (dnorm,rnorm,pnorm etc.)

#  d for density
#  r for random number generation
#  p for cummulative distribution
#  q for quantile function

#  always need to specify mean and sd
#  default values are mean = 0, and sd = 1.

x <- rnorm(10)
    # > x
    # [1]  0.9868821  0.9910127  0.1615737 -0.2617590 -0.9518042 -0.8336691  3.0822333
    # [8]  0.2530297 -0.4119152  1.2785745

x <- rnorm(10,20,2)  # rnorm(n,mean,sd)
    # > x
    # [1] 17.70279 19.76102 19.54674 21.32967 15.11096 20.74482 16.74194 21.11802
    # [9] 16.13291 21.27664
    # > summary(x)
    # Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
    # 15.11   16.98   19.65   18.95   21.02   21.33 

#  setting random number seed ensures reproducablility, use it! 

set.seed(1)

rnorm(5)
    # [1] -0.6264538  0.1836433 -0.8356286  1.5952808  0.3295078
rnorm(5)
    # [1] -0.8204684  0.4874291  0.7383247  0.5757814 -0.3053884

#  reset the seed to produce same values
set.seed(1)

rnorm(5)
    # [1] -0.6264538  0.1836433 -0.8356286  1.5952808  0.3295078

###############################################
#########   Generating Poisson Data   #########
###############################################

    # dpois(x, lambda, log = FALSE)
    # ppois(q, lambda, lower.tail = TRUE, log.p = FALSE)
    # qpois(p, lambda, lower.tail = TRUE, log.p = FALSE)
    # rpois(n, lambda)

rpois(10,1)   # rpois(n,lambda), p(x) = lambda^x exp(-lambda)/x!
    #[1] 0 0 1 1 2 1 1 4 1 2

rpois(10,2)
    #[1] 4 1 2 0 1 1 0 1 4 1

rpois(10,20)
    #[1] 24 16 17 18 17 21 19 13 24 18

#  Cummulative Distribution
ppois(2,2)
    # [1] 0.6766764  Probability (x<=2)

ppois(4,2)
    # [1] 0.947347  Probability (x<=4)

ppois(6,2)
    # [1] 0.9954662  Probability (x<=6)


###############################################
########   Simulating Linear Models   #########
###############################################

set.seed(20)

x <- rnorm(100)

e <- rnorm(100,0,2)

y <- 0.5 + 2*x + e

summary(y)
    #   Min.   1st Qu.  Median  Mean   3rd Qu.    Max. 
    # -6.4080 -1.5400  0.6789  0.6893  2.9300  6.5050 

plot(x,y)


#  what if x is a binary variable?  Such as male/female

set.seed(10)

x <- rbinom(100,1,0.5)

e <- rnorm(100,0,2)

y <- 0.5 + 2*x + e

summary(y)
    # Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
    # -3.4940 -0.1409  1.5770  1.4320  2.8400  6.9410 

plot(x,y)

###############################################
########   Simulating Poisson Models   ########
###############################################

#  Y~Poisson(mu)
#  Log(mu) = Beta_0 + Beta_1 *x 
#  and Beta_0 = 0.5, and Beta_1 = 0.3

set.seed(1)

x <- rnorm(100)

log.mu <- 0.5 + 0.3*x

y <- rpois(100,exp(log.mu))

summary(y)
    # Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
    # 0.00    1.00    1.00    1.55    2.00    6.00 

plot(x,y)

###############################################
#############   Random Sampling   #############
###############################################

#  sample function allows you to draw a random sample from a vector

set.seed(1)

sample(1:10,4)
    #[1] 3 4 5 7

#  try again without setting the seed variable
sample(1:10,4)
    #[1] 3 9 8 5

sample(letters,5)
    #[1] "q" "b" "e" "x" "p"

sample(1:10)  #  permutation (change the order)
    #[1]  4  7 10  6  9  2  8  3  1  5

sample(1:10)
    #[1]  2  3  4  1  9  5 10  8  6  7

sample(1:10,replace=T)  #  Sample with replacement (repeated entries allowed)
    #[1] 2 9 7 8 2 8 5 9 7 8







