##  Hospital Quality - use rprog_data_ProgAssignment3-data.zip
##  Refer to Coursera R Programming Course from John Hopkins

###########################################################
#######  30-day mortality rates for Heart Attack   ########
###########################################################

outcome <- read.csv("outcome-of-care-measures.csv",colClasses = "character")

    # > ncol(outcome)
    # [1] 46
    # > nrow(outcome)
    # [1] 4706


#   This needs to be done because we originally read the outcome csv data above as "character"
outcome[,11] <- as.numeric(outcome[,11])

#  Histogram of the 30-day death rates 
hist(outcome[,11])

###########################################################
########  Finding the best hospital in a state   ##########
###########################################################

#  state is 2 letter abbreviation ie. "NY"
#  event is "heart attack" (column 11), "heart failure" (column 17), or "pneumonia" (column 23)

best <- function(state,event){
  
  #  Read the data
  data <- read.csv("outcome-of-care-measures.csv",colClasses = "character")
    
  #  Valid state inputs
  ValidStates <- unique(data$State)
  
    if(state %in% ValidStates==TRUE){   #  Is the state variable valid? 
    
      #print("Valid State")
    
      StateVector <- data$State==state    #  big vector of logical values that are T for state of interest
    
      #print(StateVector)
    
      if(event=="heart attack"){
        DataOfInterest <- as.numeric(data[StateVector,11])   #  30 day heart attack mortality rates in the chosen state
      }
      else if(event=="heart failure"){
        DataOfInterest <- as.numeric(data[StateVector,17])   #  30 day heart failure mortality rates in the chosen state
      }
      else if(event=="pneumonia"){
        DataOfInterest <- as.numeric(data[StateVector,23])   #  30 day heart failure mortality rates in the chosen state
      }
      else{
        print("Not a Valid Medical Audit Condition")   #  Medical Condition error handling
      }
      #   Sort the Data of Interest and find "best" Hospital
      
      result <- data[StateVector,2]   #  list of hospitals in state of interest
      
      rankings <- order(DataOfInterest,decreasing = F)  #  order the hospitals by rate of interest
  
      print(result[rankings][1])    #  order hospitals by the mortality rate of interest and print out "best" hosptial
       
    }
  
    else{
      
    print("Not a Valid State")  #  Error handling for incorrect State choice 
    
    }
  
  
}

###  Example best function output  ###

# > source("R_Hospital_Quality.r")
# Warning message:
#   In eval(expr, envir, enclos) : NAs introduced by coercion
#
# > best("TX","heart attack")
# [1] "CYPRESS FAIRBANKS MEDICAL CENTER"
# 
# > best("TX","heart failure")
# [1] "FORT DUNCAN MEDICAL CENTER"
# 
# > best("MD","heart attack")
# [1] "JOHNS HOPKINS HOSPITAL, THE"
# 
# > best("MD","pneumonia")
# [1] "GREATER BALTIMORE MEDICAL CENTER"
# 
# > best("DD","pneumonia")
# [1] "Not a Valid State"
# 
# > best("WA","heart attacl")
# [1] "Not a Valid Medical Audit Condition"
# 
# > best("OR","heart attack")
# [1] "PORTLAND VA MEDICAL CENTER"


###########################################################
#######  Ranking hospitals by outcome in a State   ########
###########################################################

rankhospital <- function(state,event,number){
  
  #  Read the data
  data <- read.csv("outcome-of-care-measures.csv",colClasses = "character")
  
  #  Valid state inputs
  ValidStates <- unique(data$State)
  
  if(state %in% ValidStates==TRUE){   #  Is the state variable valid? 
    
    #print("Valid State")
    
    StateVector <- data$State==state    #  big vector of logical values that are T for state of interest
    
    #print(StateVector)
    
    if(event=="heart attack"){
      DataOfInterest <- as.numeric(data[StateVector,11])   #  30 day heart attack mortality rates in the chosen state
    }
    else if(event=="heart failure"){
      DataOfInterest <- as.numeric(data[StateVector,17])   #  30 day heart failure mortality rates in the chosen state
    }
    else if(event=="pneumonia"){
      DataOfInterest <- as.numeric(data[StateVector,23])   #  30 day heart failure mortality rates in the chosen state
    }
    else{
      print("Not a Valid Medical Audit Condition")   #  Medical Condition error handling
    }
    #   Sort the Data of Interest and find "best" Hospital
    
    result <- data[StateVector,2]   #  list of hospitals in state of interest
    
    print(order(result))
    
    rankings <- order(DataOfInterest,decreasing = F)  #  order the hospitals by rate of interest
    
    print(result[rankings][number])    #  order hospitals by the mortality rate of interest and print out "best" hosptial
    
  }
  
  else{
    
    print("Not a Valid State")  #  Error handling for incorrect State choice 
    
  }
  
}   #  end of rankhospital function 












#############################################
############  troubleshooting   #############
#############################################


logic1 <- c(TRUE,TRUE,TRUE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE)

vals1 <- c(1,2,3,4,5,6,7,8,9,10)

#print(vals1[logic1])

A <- 1:10
B <- (A-5)^2

mydata=data.frame(A,B)

#     A  B
# 1   1 16
# 2   2  9
# 3   3  4
# 4   4  1
# 5   5  0
# 6   6  1
# 7   7  4
# 8   8  9
# 9   9 16
# 10 10 25

#  order sorts the rows of the dataframe by the B values
mydata[order(mydata$B),]

#     A  B
# 5   5  0
# 4   4  1
# 6   6  1
# 3   3  4
# 7   7  4
# 2   2  9
# 8   8  9
# 1   1 16
# 9   9 16
# 10 10 25





