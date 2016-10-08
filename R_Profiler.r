##  R profiling 
##  Refer to Coursera R Programming Course from John Hopkins

###############################################
################  R Profiler   ################
###############################################

#  How to tell how to optimize parts of your code - Profiling

#  Profiling is better than guessing how much time is spent in certain areas

#  First get the code done, then after you're done worry about optimization

#  Design first, then optimize

###############################################
################  system.time()   #############
###############################################

#  user time = time charged to the CPU(s) for an expression

#  elapsed time = wall clock time

#  elapsed time > system time
time1 <- system.time(readLines("http://www.jhsph.edu"))

    # user  system elapsed 
    # 0.50    0.26    0.95 

#  elapsed time ~ user time
hilbert <- function(n){
  i <- 1:n
  1/outer(i-1,i,"+")
}

x <- hilbert(1000)

time2 <- system.time(svd(x))    #  single value decomposition
    # user  system elapsed 
    # 3.01    0.02    3.03

#  you can have loops within system.time expressions

time3 <- system.time(
  {
    n <- 1000
    r <- numeric(n)
    
      for (i in 1:n){
        x <- rnorm(n)
        r[i] <- mean(x)
      }
  }
)

    # user  system elapsed 
    # 0.08    0.01    0.09 

#  problem with system.time() is you have to know where to look (use Rprof)


###############################################
###################  Rprof()   ################
###############################################

#  summaryRprof()  makes the output readable

#  don't use Rprof() with system.time()

sample.interval=10000

































