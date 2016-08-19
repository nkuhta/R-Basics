##  R Subsetting
##  Refer to Coursera R Programming Course from John Hopkins

###############################################
############  Subsetting []   #################
###############################################

#  Single square bracket "[]" gives you an object of the same class back

x <- c("a","b","c","d","a")

#   x[1]
#   [1] "a"

#   array indexing

#   x[1:4]
#   [1] "a" "b" "c" "d"

#   Logical indexing

#   x[x > "a"]
#   [1] "b" "c" "d"

u <- x > "a"

#   u
#   [1] FALSE  TRUE  TRUE  TRUE FALSE

#   x[u]
#   [1] "b" "c" "d"

###############################################
##########  Subsetting Lists [[]] or $  #######
###############################################

#  Double bracket operator "[[]]" is used to extract list or data frame elements, and the class may change
#  the $ operator is used to extract data frame or list elements by name

L1 <- list(cool=1:4,dude=0.6)

#   L1[1]
#   $cool
#   [1] 1 2 3 4

#   L1[[1]]
#   [1] 1 2 3 4

#   L1$dude 
#   [1] 0.6

#   L1[2]
#   $dude
#   [1] 0.6

#   L1[["dude"]]
#   [1] 0.6

L2 <- list(cool=1:4,dude=0.6,say="hello")

    # > L2[1]
    # $cool
    # [1] 1 2 3 4
    # 
    # > L2[2]
    # $dude
    # [1] 0.6
    # 
    # > L2[3]
    # $say
    # [1] "hello"

name <- "cool"

#   L2[[name]]
#   [1] 1 2 3 4

#   L2$name (looks for the elemenet "name" in L2)
#   NULL

#   L2$cool 
#   [1] 1 2 3 4 


##    Extracting multiple elements of a list

L2[c(1,3)]    #  Extract the first and third L2 list elements.  

#   $cool
#   [1] 1 2 3 4

#   $say
#   [1] "hello"


###  More [[]] advantages over $ include passing a computed index name

L3 <- list(radical=2:5,dude=2.718,mystr='awesome!')

name <- 'radical'

L3[[name]]      # this works
#   [1] 2 3 4 5

L3$name         #  this does not work
#   NULL

L3$radical      #  you have the call the element name directly with $
#   [1] 2 3 4 5

###############################################
##########  Subsetting Nested Lists  ##########
###############################################

L4 <- list(a=list(10,12,14), b = c(3.14,2.81))

L4[[c(1,3)]]  #  Take the 3rd entry of the first element
#     [1] 14

L4[[1]][[3]]  #  same thing, take the 3rd entry of the first element
#     [1] 14

L4[[2]][[1]]  #  get the 1st entry of the 2nd element
#     [1] 3.14

###############################################
##########  Subsetting Matrices  ##############
###############################################

#  Matrices can be indexed in the typical (row,column)=(i,j) formalism

Mat1=matrix(1:6,2,3)

#       [,1] [,2] [,3]
# [1,]    1    3    5
# [2,]    2    4    6


Mat1[1,2]
#   [1] 3

Mat1[2,3]
#   [1] 6

#   Indices can also be missing to print out entire rows or columns

Mat1[1,]
#   [1] 1 3 5 

Mat1[,2]
#   [1] 3 4 

#  Get a two dimensional object back using the "drop" command 

Mat1[1,2,drop=FALSE]
#       [,1]
# [1,]    3

#  drop can also be used on a single column or row

Mat1[1,,drop=FALSE]
#       [,1] [,2] [,3]
# [1,]    1    3    5


###############################################
########  Subsetting Partial Matching  ########
###############################################

PM1 <- list(aardvark=1:5)

#   You just need to use the first letter of the element "a" with the $ oper
PM1$a
#   [1] 1 2 3 4 5 

PM1[["a"]]
#   NULL

#     By default [[]] does not do partial matching, but you can make it work with the exact=F command
PM1[["a",exact=FALSE]]
#   [1] 1 2 3 4 5 

###############################################
######  Subsetting Removing NA Values  ########
###############################################






















