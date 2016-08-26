##  Vectorized Operations
##  Refer to Coursera R Programming Course from John Hopkins

###############################################
###########  R Control Structures   ###########
###############################################

#  if,else: testing a condition
#  for:     execute a loop for a fixed number of times
#  while:   execute a loop while a condition is true
#  repeat:  execute an infinite loop
#  break:   break the execution of a loop
#  next:    skip an iteration of a loop
#  return:  exit a function

###############################################
##############    if, else    #################
###############################################

#  General if, else structure

#     if(condition1) {
#       do something if condition1 is true
#     } else if(condition2) {
#       do something if condition2 is true
#     } else{
#       do something different
#     }

#  y Variable Assignment Example

x <- 1

if(x>3) {
  y <- 10
} else {
  y <- 0
}

#  Equivalently y can be equal to the if statement below

y <- if(x>3) {
  10
} else {
  0
}

#  Note the "else" is not necessary, you could just do nothing for the negative condition

###############################################
##############    for loops    ################
###############################################

for(i in 1:10){
  print(i)
}

    # [1] 1
    # [1] 2
    # [1] 3
    # [1] 4
    # [1] 5
    # [1] 6
    # [1] 7
    # [1] 8
    # [1] 9
    # [1] 10

myStr <- c("a","b","c","d")

for(i in 1:4){
  print(myStr[i])
}
  # [1] "a"
  # [1] "b"
  # [1] "c"
  # [1] "d"

#   you can also use the seq_along function

  #   seq_along(myStr)
  #   [1] 1 2 3 4 

for(k in seq_along(myStr)){
  print(myStr[k])
}
  # [1] "a"
  # [1] "b"
  # [1] "c"
  # [1] "d"

for(letter in myStr) {
  print(letter)
}
  # [1] "a"
  # [1] "b"
  # [1] "c"
  # [1] "d"

#  if you stay on one line you can omit the {}

for(i in 1:4) print(myStr[i])

  # [1] "a"
  # [1] "b"
  # [1] "c"
  # [1] "d"

###############################################
###########    Nested for loops    ############
###############################################

mat1 <- matrix(1:6,2,3)

      # > mat1
      #       [,1] [,2] [,3]
      # [1,]    1    3    5
      # [2,]    2    4    6

for(i in seq_len(nrow(mat1))){
  for(j in seq_len(ncol(mat1))){
    print(mat1[i,j])
  }
}

#  first row all columns is printed first, then second row all columns
  # [1] 1
  # [1] 3
  # [1] 5
  # [1] 2
  # [1] 4
  # [1] 6

#  Be very careful looping beyond 2-3 levels is very hard to read/understand.

###############################################
#############    while loops    ###############
###############################################

count <- 0
  
while(count<10){
    print(count)
    count <- count+1
}
    # [1] 0
    # [1] 1
    # [1] 2
    # [1] 3
    # [1] 4
    # [1] 5
    # [1] 6
    # [1] 7
    # [1] 8
    # [1] 9

#  Easy to get into infinite while loops, need to be careful! 

#  Testing multiple condition

z <- 5

while(z>=3  && z<=7){
  print(c("z=",z))
  coin <- rbinom(1,1,0.5)   #  0 = Tails, 1 = Heads (Random)
  print("coin flip")
  
  if(coin==1){
    print("heads")
  }else{
    print("tails")
  }
  
  
  if(coin==1){  ##  Random walk
        z <- z+1  #  If Heads then add 1 to z
  } else{
          z <- z-1  #  If Tails then subtract 1 from z
  }
}

    #  Example output for three tails flipped in a row
    # [1] 5
    # [1] "coin flip"
    # [1] "tails"
    # [1] 4
    # [1] "coin flip"
    # [1] "tails"
    # [1] 3
    # [1] "coin flip"
    # [1] "tails"







