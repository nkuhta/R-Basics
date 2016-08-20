##  Vectorized Operations
##  Refer to Coursera R Programming Course from John Hopkins

###############################################
#######  Vectorized Aritmetic/Logic   #########
###############################################

x <- 1:4; y <- 6:9
    # > x
    # [1] 1 2 3 4
    # > y
    # [1] 6 7 8 9


#  Add x and y vectors pair wise (element by element added to each other)
x+y
    #[1]  7  9 11 13

x>2
    #[1] FALSE FALSE  TRUE  TRUE

y==8
    #[1] FALSE FALSE  TRUE FALSE

#   Multiply vectors also multplies pair (element) wise (look at x,y above)
x*y
    #[1]  6 14 24 36

#   
x/y
    #[1] 0.1666667 0.2857143 0.3750000 0.4444444

###############################################
#######  Vectorized Matrix Operations   #######
###############################################

m1 <- matrix(1:4,2,2)
m2 <- matrix(rep(10,4), 2,2)
    # > m1
    #       [,1] [,2]
    # [1,]    1    3
    # [2,]    2    4
    # > m2
    #       [,1] [,2]
    # [1,]   10   10
    # [2,]   10   10

#  Element Wise Matrix Multiplication
m1*m2
    # > m1*m2
    #       [,1] [,2]
    # [1,]   10   30
    # [2,]   20   40

#  Element Wise Matrix Division
m1/m2
    # > m1/m2
    #       [,1] [,2]
    # [1,]  0.1  0.3
    # [2,]  0.2  0.4


##  TRUE MATRIX MULTIPLICATION
m1 %*% m2
    # > m1 %*% m2
    #       [,1] [,2]
    # [1,]   40   40
    # [2,]   60   60






















