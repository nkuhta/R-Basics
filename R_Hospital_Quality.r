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
    
    StateVector <- data$State==state    #  big vector of logical values that are T for state of interest
    
    StateOrdered <- order(data[StateVector,2])  #  state of interest hospitals in alphabetical order
    
    StateData <- data[StateVector,]    #  data for only state of interest
    
    if(event=="heart attack"){
      DataOfInterest <- as.numeric(StateData[StateOrdered,11])   #  30 day heart attack mortality rates in the chosen state
    }
    else if(event=="heart failure"){
      DataOfInterest <- as.numeric(StateData[StateOrdered,17])   #  30 day heart failure mortality rates in the chosen state
    }
    else if(event=="pneumonia"){
      DataOfInterest <- as.numeric(StateData[StateOrdered,23])   #  30 day heart failure mortality rates in the chosen state
    }
    else{
      print("Not a Valid Medical Audit Condition")   #  Medical Condition error handling
    }
    #   Sort the Data of Interest and find "best" Hospital
    
    result <- StateData[StateOrdered,2]   #  list of hospitals in state of interest in alphabetical order
    
    rankings <- order(DataOfInterest,decreasing = F)  #  order the hospitals by rate of interest
    
      if(number=="worst"){
        print(tail(result[rankings],n=1))    
    
      }else{
        print(result[rankings][number])    #  order hospitals by the mortality rate of interest and print out "best" hosptial
      }
    #  note due to the StateOrdered lists above tie results are listed in alphabetical order
    
  }
  
  else{
    
    print("Not a Valid State")  #  Error handling for incorrect State choice 
    
  }
  
}   #  end of rankhospital function 


####  Sample Output   ####

#  Top 10 lowest mortality rate hospitals in TX for heart failure

# > rankhospital("TX","heart failure",1:10)
# [1] "FORT DUNCAN MEDICAL CENTER"            
# [2] "TOMBALL REGIONAL MEDICAL CENTER"       
# [3] "CYPRESS FAIRBANKS MEDICAL CENTER"      
# [4] "DETAR HOSPITAL NAVARRO"                
# [5] "METHODIST HOSPITAL,THE"                
# [6] "MISSION REGIONAL MEDICAL CENTER"       
# [7] "BAYLOR ALL SAINTS MEDICAL CENTER AT FW"
# [8] "SCOTT & WHITE HOSPITAL-ROUND ROCK"     
# [9] "THE HEART HOSPITAL BAYLOR PLANO"       
# [10] "UT SOUTHWESTERN UNIVERSITY HOSPITAL" 

#  Worst Hospital in Oregon for heart attack mortality

# > rankhospital("OR","heart attack","worst")
# [1] "WEST VALLEY HOSPITAL"

###########################################################
###########  Ranking hospitals in all States   ############
###########################################################

rankall <- function(event,number){
  
  #  Read the data
  fileread <- read.csv("outcome-of-care-measures.csv",colClasses = "character")
  
  HospitalOrder <- order(fileread[,2])
  
  #  data in alphabetical order by Hospital
  data <- fileread[HospitalOrder,]  
  #print(head(data[,2]))
  
  if(event=="heart attack"){
    element <- 11
    bad <- is.na(as.numeric(data[,element]))
    TrueData <- data[!bad,]
    DataOfInterest <- as.numeric(TrueData[,element])   #  30 day heart attack mortality rates in the chosen state
  }
  else if(event=="heart failure"){
    element <- 17
    bad <- is.na(as.numeric(data[,element]))
    TrueData <- data[!bad,]  
    DataOfInterest <- as.numeric(TrueData[,element])   #  30 day heart failure mortality rates in the chosen state
  }
  else if(event=="pneumonia"){
    element <- 23
    bad <- is.na(as.numeric(data[,element]))
    TrueData <- data[!bad,]
    DataOfInterest <- as.numeric(TrueData[,element])   #  30 day heart failure mortality rates in the chosen state
  }
  else{
    print("Not a Valid Medical Audit Condition")   #  Medical Condition error handling
  }
  
    #  list rank order of choosen medical event
    rank <- order(as.numeric(DataOfInterest))
    
    #print(DataOfInterest[rank])
    
    DataOrder <- TrueData[rank,]
    #print(head(DataOrder[,11]))
  
      if(number=="worst"){

          result <- data.frame(Hospital=1,State=1,Mortality_Rate=1)
          
          result[1,1] <- tail(DataOrder[,2],n=1)
          result[1,2] <- tail(DataOrder[,7],n=1)
          result[1,3] <- tail(DataOrder[,element],n=1)

          print(result)   
          
      }
      else if(number=="best"){
          result <- data.frame(Hospital=1,State=1,Mortality_Rate=1)
        
          result[1,1] <- DataOrder[1,2]
          result[1,2] <- DataOrder[1,7]
          result[1,3] <- DataOrder[1,element]
        
          print(result)   
      }
    
      else{
          
          result <- data.frame(Hospital=rep(1,number),State=rep(1,number),Mortality_Rate=rep(1,number))
          
          for (i in 1:number){
              
              result[i,1] <- DataOrder[i,2]
              result[i,2] <- DataOrder[i,7]
              result[i,3] <- DataOrder[i,element]
        
          }
            
          print(result)  
        
      }
  
}  # end of rankall function


####   Example rankall() Output  ##### 

    # > rankall("pneumonia","worst")
    #   Hospital                   State        Mortality_Rate
    # 1 CALDWELL MEDICAL CENTER    KY           21.2
    # > rankall("heart failure","worst")
    #    Hospital                   State        Mortality_Rate
    # 1 ADVENTIST MEDICAL CENTER    OR           18.1

# > rankall("heart attack",20)
#                                   Hospital    State      Mortality_Rate
# 1                      NYU HOSPITALS CENTER    NY           10.1
# 2                       DOYLESTOWN HOSPITAL    PA           10.4
# 3  AVERA HEART HOSPITAL OF SOUTH DAKOTA LLC    SD           10.5
# 4         GLENDALE ADVENTIST MEDICAL CENTER    CA           10.5
# 5                        WATERBURY HOSPITAL    CT           10.6
# 6               MAIN LINE HOSPITAL LANKENAU    PA           10.7
# 7                 MAIMONIDES MEDICAL CENTER    NY           11.0
# 8                     SAINT JOSEPH HOSPITAL    IL           11.0
# 9                    OLYMPIA MEDICAL CENTER    CA           11.2
# 10           NEW YORK-PRESBYTERIAN HOSPITAL    NY           11.4
# 11              ST FRANCIS HOSPITAL, ROSLYN    NY           11.4
# 12          ALEXIAN BROTHERS MEDICAL CENTER    IL           11.5
# 13   ST VINCENT HEART CENTER OF INDIANA LLC    IN           11.5
# 14                    BELLIN MEMORIAL HSPTL    WI           11.8
# 15             EAST ORANGE GENERAL HOSPITAL    NJ           11.8
# 16                    MUNSON MEDICAL CENTER    MI           11.8
# 17                  ARKANSAS HEART HOSPITAL    AR           11.9
# 18     HACKENSACK UNIVERSITY MEDICAL CENTER    NJ           11.9
# 19                          MIRIAM HOSPITAL    RI           11.9
# 20           NORTHWESTERN MEMORIAL HOSPITAL    IL           11.9


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





