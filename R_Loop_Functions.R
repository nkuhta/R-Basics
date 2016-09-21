##  Loop Functions and Debugging in R
##  Refer to Coursera R Programming Course from John Hopkins


#  Looping on the command line

#  lapply:  Loop over a list and evaluate a function on each element
#  sapply:  like lapply, but try to simplify the result
#  apply:   Apply a function over the margins of an array
#  tapply:  Apply a function over subsets of a vector (table apply)
#  mapply:  Multivariate version of lapply

###############################################
#########  Loop Functions - lapply   ##########
###############################################

#  lappy takes three arguments (1) list, (2) function, (3) other arguments 

x <- list(a=1:5,b=rnorm(10))

    # > x
    # $a
    # [1] 1 2 3 4 5
    # 
    # $b
    # [1]  1.40286892  0.47780762 -1.08667582  0.06112912
    # [5]  1.56195329 -1.86918800  1.26944289 -1.29089401
    # [9]  0.29890341 -0.18840066

lapply(x,mean)  #  loop over both lists a and b and apply the mean function
  
  # $a
    # [1] 3
    # 
    # $b
    # [1] 0.06369467

#     More complecated list
x1 <- list(a=1:4,b=rnorm(10),c=rnorm(20,1),d=rnorm(100,5))

      # > x1
      # $a
      # [1] 1 2 3 4
      # 
      # $b
      # [1]  0.6766775  0.9755191  0.9370463 -0.4809437 -0.4265609
      # [6] -0.3239725 -0.9634996  1.0580333  2.2393277  0.8189251
      # 
      # $c
      # [1]  0.048215363  0.691531260  0.485592007  1.452999161
      # [5] -0.484060633 -0.128825008  1.372731026  0.578653511
      # [9]  1.292039075  0.016834623  1.056019216 -1.042683097
      # [13]  0.694241145 -0.005253283  1.088927508 -0.630167891
      # [17] -1.517845162  1.841058351  0.623531660  1.806444203
      # 
      # $d
      # [1] 5.328178 3.672391 4.184586 2.864647 3.118045 8.206033
      # [7] 4.812199 4.039582 3.236482 4.997735 4.467780 5.115716
      # [13] 4.521288 5.901212 5.387396 5.694851 5.185498 6.495512
      # [19] 4.804593 3.102208 5.610903 4.727742 6.461105 4.278474
      # [25] 5.933749 5.884556 5.946420 4.170350 5.251777 4.597127
      # [31] 3.939517 5.291460 6.520783 5.830186 3.868824 4.944769
      # [37] 6.095017 6.377332 6.822278 4.293101 4.974883 4.998027
      # [43] 3.911193 5.527443 3.314323 6.095541 6.240684 4.172141
      # [49] 4.406983 5.371821 6.898404 4.690454 4.788248 6.350215
      # [55] 4.113648 5.742402 5.029301 5.093443 4.873169 3.738946
      # [61] 4.517474 5.070168 6.409965 5.416304 5.308084 5.008457
      # [67] 4.548203 4.957080 5.872249 6.423428 3.615519 5.781747
      # [73] 4.417946 4.024634 3.225222 4.316827 3.092619 4.230204
      # [79] 4.904312 5.510850 6.508715 4.998290 4.976483 5.581101
      # [85] 5.059532 4.277640 4.432769 5.589066 4.734346 5.570940
      # [91] 4.333801 6.566807 5.908504 5.498951 6.141546 7.024143
      # [97] 5.901208 5.566035 5.045925 3.797175

lapply(x1,mean)
    # $a
    # [1] 2.5
    # 
    # $b
    # [1] 0.4510552
    # 
    # $c
    # [1] 0.4619992
    # 
    # $d
    # [1] 5.064769

x2 <- 1:4

lapply(x,runif)

      # [[1]]
      # [1] 0.450886
      # 
      # [[2]]
      # [1] 0.2502120 0.6775529
      # 
      # [[3]]
      # [1] 0.1717035 0.5998177 0.7396898
      # 
      # [[4]]
      # [1] 0.24115272 0.35309525 0.52702798 0.00301109

lapply(x,runif,min=0,max=10)

      # [[1]]
      # [1] 0.3773228
      # 
      # [[2]]
      # [1] 0.90932463 0.07316373
      # 
      # [[3]]
      # [1] 0.8352852 0.4634461 0.8656626
      # 
      # [[4]]
      # [1] 0.45296001 0.02082645 0.06476604 0.06567324

mat1 <- list(a=matrix(1:4,2,2),b=matrix(1:6,3,2))

      # > mat1
      # $a
      #       [,1] [,2]
      # [1,]    1    3
      # [2,]    2    4
      # 
      # $b
      #       [,1] [,2]
      # [1,]    1    4
      # [2,]    2    5
      # [3,]    3    6

#  Extract the first column of each mat1 matrix
#  elt is a locally defined function for the lapply condition below

lapply(mat1,function(elt) elt[,1])  #  defined the "anonymous" elt function locally

    # > lapply(mat1,function(elt) elt[,1])
    # $a
    # [1] 1 2
    # 
    # $b
    # [1] 1 2 3

###############################################
#########  Loop Functions - sapply   ##########
###############################################

#  same as lapply, but tries to simplify the result (ie. simplifies the result list object)

x3 <- list(a=1:4,b=rnorm(10),c=rnorm(20,1),d=rnorm(100,5))

sapply(x3,mean)

    # > sapply(x3,mean)
    # a           b           c           d 
    # 2.500000000 0.001054853 1.061199393 4.986805547 


#   Note you can't do mean(x3) because mean doesn't work on a list

    # > mean(x3)
    # [1] NA
    # Warning message:
    #   In mean.default(x3) : argument is not numeric or logical: returning 

###############################################
##########  Loop Functions - apply   ##########
###############################################

#  apply is used to evaluate a function over the margins of an array
#  often used to apply functions to matrix rows/columns

#  str(apply)
#  function(x,margin,fun,....)
#  x is an array
#  margin is an integer vector indication which margins should be retained
#  fun is a function being applied


#  20 row and 10 column matrix
mat2 <- matrix(rnorm(200),20,10)

#  calculate the mean of each mat2 column below
#  keep the second dimension (margin = 2) 
#  preserve column dimension

apply(mat2,2,mean)
    # > apply(mat2,2,mean)
    # [1] -0.23584839  0.08198559
    # [3]  0.04249788 -0.29753607
    # [5]  0.15093164  0.25497603
    # [7] -0.27791766  0.33635249
    # [9] -0.07298604 -0.66202514


#  calculate the sum of each mat2 row
#  preserve the rows and collapse the columns (margin=1)

apply(mat2,1,sum)
    # > apply(mat2,1,sum)
    # [1]  1.1612163 -5.2185268 -1.7923839
    # [4] -1.1990302  0.3714623 -1.7416536
    # [7]  3.4907329  1.2145968 -1.0960054
    # [10] -4.0241692  2.5540929  6.7294694
    # [13] -1.9892115  3.1852571  1.9436405
    # [16]  1.4584447 -0.1918675 -2.9921653
    # [19]  3.9101429  2.0759127

#  20 row by 10 column matrix 
mat3 <- matrix(rnorm(200),20,10)

#  find the 25% and 75% quantile for all rows
#  preserve rows(margin=1)

apply(mat3,1,quantile,probs=c(0.25,0.75))

    # > apply(mat3,1,quantile,probs=c(0.25,0.75))
    #         [,1]        [,2]      [,3]
    # 25% -0.6202251 -0.09483808 0.1326458
    # 75%  0.6407977  0.91001101 1.1755463
    #         [,4]       [,5]       [,6]
    # 25% -0.5493731 -0.1937111 -1.1281029
    # 75%  0.7629214  0.7278643  0.3682864
    #         [,7]       [,8]       [,9]
    # 25% -0.1424416 -0.6631389 -1.1132967
    # 75%  0.7547032  0.5313239  0.1697918
    #         [,10]      [,11]       [,12]
    # 25% -0.6778005 -0.9491277 -0.02151141
    # 75%  0.4122747 -0.3836483  0.59114163
    #         [,13]     [,14]      [,15]
    # 25% -0.4594067 -0.640499 -0.8985811
    # 75%  0.5221985  0.474820  0.2525587
    #         [,16]      [,17]       [,18]
    # 25% -0.3074792 -0.5783589 -0.84032675
    # 75%  0.4696802  0.7554075 -0.07797778
    #         [,19]      [,20]
    # 25% -0.9830281 -0.4291576
    # 75%  0.2047099  0.3804082

#  3D array
a1 <- array(rnorm(2*2*10),c(2,2,10))

#  average over the third dimension
apply(a1,c(1,2),mean)
    # > apply(a1,c(1,2),mean)
    #         [,1]       [,2]
    # [1,] 0.1934985 -0.4210859
    # [2,] 0.7498806 -0.2764574

rowMeans(a1,dims = 2)
    # > rowMeans(a1,dims = 2)
    #         [,1]       [,2]
    # [1,] 0.1934985 -0.4210859
    # [2,] 0.7498806 -0.2764574

###############################################
#######  Optimized Col/Row Sums/Means   #######
###############################################

#  Below are the optimized matrix operations

rowSums(mat2)
rowMeans(mat2)
colSums(mat2)
colMeans(mat2)

#  Speed increase only noticed on large matrices.  


###############################################
#########  Loop Functions - mapply   ##########
###############################################

#  mapply(function,funVar1,funVar2,funVar3.....)

#  mapply is a multivariate apply of sorts which applies functions in parallel over a set of arguments

list1 <- list(rep(1,4),rep(2,3),rep(3,2),rep(4,1))

    # > list1
    # [[1]]
    # [1] 1 1 1 1
    # 
    # [[2]]
    # [1] 2 2 2
    # 
    # [[3]]
    # [1] 3 3
    # 
    # [[4]]
    # [1] 4

#  This repeats 1 through 4 with repitition values of 4 through 1 (same as above with less typing)
mapply(rep,1:4,4:1)

    # > mapply(rep,1:4,4:1)
    # [[1]]
    # [1] 1 1 1 1
    # 
    # [[2]]
    # [1] 2 2 2
    # 
    # [[3]]
    # [1] 3 3
    # 
    # [[4]]
    # [1] 4

#  Vectorizing a function

noise <- function(n,mean,sd){
  rnorm(n,mean,sd)
}

    # > noise(5,1,2)
    # [1] -0.5233484  0.4071114  0.1403199  1.1146798  1.2155810

noise(1:5,1:5,2)    #  This doesn't work to evaluate 5 different n and mean values
    # > noise(1:5,1:5,2)
    # [1] 1.807665 3.694665 4.342261 2.080330 4.335575

#  use mapply to apply noise for different n and mean values

mapply(noise,1:5,1:5,2)

    # > mapply(noise,1:5,1:5,2)
    # [[1]]
    # [1] 2.974097
    # 
    # [[2]]
    # [1] 0.7125130 0.6755669
    # 
    # [[3]]
    # [1] 6.704663 6.277056 2.558085
    # 
    # [[4]]
    # [1] 3.653960 5.503145 5.103054 6.114904
    # 
    # [[5]]
    # [1] 6.193651 5.779878 2.343682 8.463079 6.592264


###############################################
#########  Loop Functions - tapply   ##########
###############################################

#  tapply is used to apply a function over the subsets of a vector

#  tapply(vector,index,function,...)

vec1 <- c(rnorm(10),runif(10),rnorm(10,1))

fac <- gl(3,10)

    # > fac
    # [1] 1 1 1 1 1 1 1 1 1 1 2 2 2 2 2 2 2 2 2 2 3 3 3 3 3 3 3 3 3
    # [30] 3
    # Levels: 1 2 3

#  Calculate the mean of all three fac groups 
tapply(vec1,fac,mean)

    # > tapply(vec1,fac,mean)
    # 1           2           3 
    # -0.08577949  0.47774700  1.27636466 

tapply(vec1,fac,mean,simplify = F)
    # > tapply(vec1,fac,mean,simplify = F)
    # $`1`
    # [1] -0.08577949
    # 
    # $`2`
    # [1] 0.477747
    # 
    # $`3`
    # [1] 1.276365

#  Calculate the range for all three fac groups 
tapply(vec1,fac,range)

    # > tapply(vec1,fac,range)
    # $`1`
    # [1] -1.416011  1.322816
    # 
    # $`2`
    # [1] 0.01465886 0.94086473
    # 
    # $`3`
    # [1] -0.1650597  3.1933749


###############################################
#########  Loop Functions - split   ###########
###############################################

#  takes a vecotr or other object and splits it into groups determined by a factor

s1 <- c(rnorm(10),runif(10),rnorm(10,1))
    # > s1
    # [1] -0.16201171  0.72274101 -1.54178564  0.97181485
    # [5]  1.10118954  1.42619912 -1.38375414  0.02334852
    # [9] -0.27396882 -0.41370668  0.71787436  0.66934959
    # [13]  0.95637725  0.87766709  0.23320849  0.17743706
    # [17]  0.03335671  0.89703810  0.48664717  0.53479945
    # [21]  0.83043081  2.02515349  1.63715103  2.17970831
    # [25]  2.33325907  2.51791315  0.66429470  0.52935607
    # [29]  1.71571596  0.65282190

f <- gl(3,10)
    # > f
    # [1] 1 1 1 1 1 1 1 1 1 1 2 2 2 2 2 2 2 2 2 2 3 3 3 3 3 3 3 3 3
    # [30] 3
    # Levels: 1 2 3

split(s1,f)
    #> split(s1,f)
    # $`1`
    # [1]  0.98226297 -2.33396211  0.04265917 -0.36871830
    # [5] -0.71700138 -0.49123241 -0.46410325 -0.24526421
    # [9] -0.46837159  0.44391457
    # 
    # $`2`
    # [1] 0.62514051 0.70269055 0.99223478 0.70438839 0.39650570
    # [6] 0.26548087 0.96654424 0.73818679 0.08111033 0.05944235
    # 
    # $`3`
    # [1]  1.7404766  0.6736383  0.1566843 -1.0837754  1.4610655
    # [6]  0.7121365 -0.5673216  1.3172378  3.1959661  0.1041254

#  It's common to split then use lapply (see means of each f group below)

lapply(split(s1,f),mean)
    # > lapply(split(s1,f),mean)
    # $`1`
    # [1] -0.3619817
    # 
    # $`2`
    # [1] 0.5531725
    # 
    # $`3`
    # [1] 0.7710233

#  Splitting a Data Frame

library(datasets)
    # > head(airquality)
    # Ozone Solar.R Wind Temp Month Day
    # 1    41     190  7.4   67     5   1
    # 2    36     118  8.0   72     5   2
    # 3    12     149 12.6   74     5   3
    # 4    18     313 11.5   62     5   4
    # 5    NA      NA 14.3   56     5   5
    # 6    28      NA 14.9   66     5   6

#  how to calculate mean values for every month?  

#  s2 = split airquality data by month

s2 <- split(airquality,airquality$Month)

lapply(s2,function(x) colMeans(x[,c("Ozone","Solar.R","Wind")]))
    # $`5`
    # Ozone  Solar.R     Wind 
    # NA       NA 11.62258 
    # 
    # $`6`
    # Ozone   Solar.R      Wind 
    # NA 190.16667  10.26667 
    # 
    # $`7`
    # Ozone    Solar.R       Wind 
    # NA 216.483871   8.941935 
    # 
    # $`8`
    # Ozone  Solar.R     Wind 
    # NA       NA 8.793548 
    # 
    # $`9`
    # Ozone  Solar.R     Wind 
    # NA 167.4333  10.1800

sapply(s2,function(x) colMeans(x[,c("Ozone","Solar.R","Wind")]))
    #               5         6          7        8        9
    # Ozone         NA        NA         NA       NA       NA
    # Solar.R       NA 190.16667 216.483871       NA 167.4333
    # Wind    11.62258  10.26667   8.941935 8.793548  10.1800

#  now remove NA values and calculate the means
sapply(s2,function(x) colMeans(x[,c("Ozone","Solar.R","Wind")],na.rm = T))
    #             5         6          7          8         9
    # Ozone    23.61538  29.44444  59.115385  59.961538  31.44828
    # Solar.R 181.29630 190.16667 216.483871 171.857143 167.43333
    # Wind     11.62258  10.26667   8.941935   8.793548  10.18000

###############################################
########  Splitting Multiple Levels   #########
###############################################

xx <- rnorm(10)
f1 <- gl(2,5)
    # [1] 1 1 1 1 1 2 2 2 2 2
    # Levels: 1 2
f2 <- gl(5,2)
    # [1] 1 1 2 2 3 3 4 4 5 5
    # Levels: 1 2 3 4 5

#  combine 
interaction(f1,f2)
    # [1] 1.1 1.1 1.2 1.2 1.3 2.3 2.4 2.4 2.5 2.5
    # Levels: 1.1 2.1 1.2 2.2 1.3 2.3 1.4 2.4 1.5 2.5

#  now split xx into more than one level

split(xx,list(f1,f2))
    # $`1.1`
    # [1]  0.7939899 -0.7320681
    # 
    # $`2.1`
    # numeric(0)
    # 
    # $`1.2`
    # [1] -1.21568522  0.04265627
    # 
    # $`2.2`
    # numeric(0)
    # 
    # $`1.3`
    # [1] 0.4826069
    # 
    # $`2.3`
    # [1] 0.7667554
    # 
    # $`1.4`
    # numeric(0)
    # 
    # $`2.4`
    # [1] 0.2637543 1.1883782
    # 
    # $`1.5`
    # numeric(0)
    # 
    # $`2.5`
    # [1]  1.3960042 -0.2237613

#  get rid of the empty levels

split(xx,list(f1,f2),drop=T)
    # $`1.1`
    # [1]  0.7939899 -0.7320681
    # 
    # $`1.2`
    # [1] -1.21568522  0.04265627
    # 
    # $`1.3`
    # [1] 0.4826069
    # 
    # $`2.3`
    # [1] 0.7667554
    # 
    # $`2.4`
    # [1] 0.2637543 1.1883782
    # 
    # $`2.5`
    # [1]  1.3960042 -0.2237613










