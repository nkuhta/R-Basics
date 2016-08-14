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

u <- x>"a"

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




















