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









