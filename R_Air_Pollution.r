##  Air Pollution Asssignment - use rprog_data_specdata.zip
##  Refer to Coursera R Programming Course from John Hopkins

###############################################
############  Global Calculations   ###########
###############################################

#  csv file path
dataDir <- "C:\\Users\\nkuhta\\Documents\\R\\rprog_data_specdata\\specdata\\"

#  Number of csv files in the dataDir file path (for the id variable)
fileNum <- length(list.files(dataDir))

fileNumTest <- 3   #  test with fewer files

nobs <- vector("numeric",length = fileNumTest)

#  Execute the data parsing globally (below) so it doesn't get redone every function call

#  Note the loops below take time for large fileNum (use FileNumTest for testing)

for(i in 1:fileNum){
  
  if(i<10){
    file <- paste("00",i,".csv",sep="")       #  i<10 file name -> 001.csv ... 009.csv etc.
  }
  else if(10<=i && i<100){
    file <- paste("0",i,".csv",sep="")      #  10<=i<100 file name -> 010.csv ... 099.csv
  }
  else{
    file <- paste(i,".csv",sep="")        #  100<=i<id+1 file name -> 100.csv ... 341.csv
  }
  
  
  myreadI <- read.csv(paste(dataDir,file,sep=""))     #  read the ith csv file
  
  nobs[i] <- nrow(na.omit(myreadI))     #  number of observable rows in the ith data file
  
  if(i==1){
    mydataI <- myreadI
  }
  else if(i==2){
    mydataFull <- rbind(mydataI,myreadI) 
  }
  else{
    mydataFull <- rbind(mydataFull,myreadI) 
  }
}

rm(mydataI)
mydata <- na.omit(mydataFull)     #  full data set with NAs gone

#  Calculate the Averages

sulfateAvg <- mean(mydata[,2])
nitrateAvg <- mean(mydata[,3])

###############################################
#########  Air Pollution Function   ###########
###############################################

pollutantmean <- function(directory,pollutant,id=1:fileNum){
  # "directory" is a character vector of length 1 indicating the csv data path
  directory <- dataDir
  # 'pollutant is the length 1 character vector indicating sulfate or nitrate means
  # "id" is an integer vector indicating the monitor IDs
  
  if(pollutant=="sulfate"){
    sulfateAvg
  }
  else if(pollutant=="nitrate"){
    nitrateAvg
  }
  else{
    print("No Data")
  }
}

#   pollutantmean Results

# > pollutantmean(dataDir,"sulfate",fileNum)
# [1] 3.194204

# > pollutantmean(dataDir,"nitrate",fileNum)
# [1] 1.707625

##################################################################
######  Number of Observable Data Points in ith File   ###########
##################################################################

#  complete is a function describing the number of complete data points in the ith data file

complete <- function(directory,id){
  directory <- dataDir
  nobs[id]
}

    # > complete(dataDir,1)
    # [1] 117
    # > complete(dataDir,2)
    # [1] 1041
    # > complete(dataDir,3)
    # [1] 243


###############################################
###########  Correlation Function   ###########
###############################################

#  corr finds the number of files with complete data above some threshold.

thresholdVal=300

Tarray <- vector("numeric",length = fileNum)      # threshold array (eventually 0's and 1's) 
Farray <- vector("character",length = fileNum)    # file name array

corr <- function(directory,threshold=thresholdVal){
  
  for(i in 1:fileNum){
    
    if(nobs[i]>threshold){
        Tarray[i]=1     #  Tarry = 1 when the number of complete observables is above a threshold 
    }
    else{
        Tarray[i]=0
    }
    
  }  #  end Tarray for loop

  
  for(i in 1:fileNum){
    
    if(Tarray[i]==1){
    
    if(i<10){
      Farray[i] <- paste("00",i,".csv",sep="")       #  i<10 file name -> 001.csv ... 009.csv etc.
    }
    else if(10<=i && i<100){
      Farray[i] <- paste("0",i,".csv",sep="")      #  10<=i<100 file name -> 010.csv ... 099.csv
    }
    else{
      Farray[i] <- paste(i,".csv",sep="")        #  100<=i<id+1 file name -> 100.csv ... 341.csv
    }
      
    }
    else{
      Farray[i]=NA      #   Farray = NA when the number of complete observables < threshold
    }
    
    
  }   #  End of file array for loop
  
  bad <- is.na(Farray)      #  which Files do not meet the threshold (and are NA)
  result <- Farray[!bad]    #  the list of files the have complete data above the threshold
  result
}

      # corr(dataDir,thresholdVal)
      # [1] "002.csv" "004.csv" "005.csv" "007.csv" "011.csv"
      # [6] "017.csv" "019.csv" "021.csv" "023.csv" "024.csv"
      # [11] "025.csv" "026.csv" "027.csv" "028.csv" "029.csv"
      # [16] "030.csv" "031.csv" "032.csv" "033.csv" "035.csv"
      # [21] "036.csv" "037.csv" "038.csv" "039.csv" "045.csv"
      # [26] "047.csv" "049.csv" "050.csv" "052.csv" "053.csv"
      # [31] "055.csv" "056.csv" "057.csv" "058.csv" "059.csv"
      # [36] "060.csv" "062.csv" "063.csv" "064.csv" "066.csv"
      # [41] "067.csv" "068.csv" "071.csv" "072.csv" "074.csv"
      # [46] "075.csv" "076.csv" "077.csv" "080.csv" "086.csv"
      # [51] "087.csv" "088.csv" "089.csv" "091.csv" "093.csv"
      # [56] "094.csv" "096.csv" "098.csv" "099.csv" "103.csv"
      # [61] "104.csv" "108.csv" "111.csv" "113.csv" "114.csv"
      # [66] "116.csv" "120.csv" "121.csv" "123.csv" "125.csv"
      # [71] "127.csv" "128.csv" "133.csv" "136.csv" "138.csv"
      # [76] "140.csv" "144.csv" "147.csv" "148.csv" "150.csv"
      # [81] "152.csv" "154.csv" "158.csv" "160.csv" "165.csv"
      # [86] "167.csv" "168.csv" "170.csv" "171.csv" "172.csv"
      # [91] "176.csv" "177.csv" "178.csv" "179.csv" "180.csv"
      # [96] "182.csv" "183.csv" "184.csv" "185.csv" "186.csv"
      # [101] "188.csv" "190.csv" "191.csv" "193.csv" "194.csv"
      # [106] "195.csv" "196.csv" "197.csv" "198.csv" "200.csv"
      # [111] "201.csv" "202.csv" "203.csv" "205.csv" "210.csv"
      # [116] "213.csv" "214.csv" "215.csv" "220.csv" "222.csv"
      # [121] "223.csv" "225.csv" "228.csv" "229.csv" "231.csv"
      # [126] "232.csv" "239.csv" "240.csv" "241.csv" "242.csv"
      # [131] "243.csv" "244.csv" "245.csv" "246.csv" "248.csv"
      # [136] "252.csv" "253.csv" "254.csv" "255.csv" "257.csv"
      # [141] "258.csv" "260.csv" "263.csv" "265.csv" "266.csv"
      # [146] "267.csv" "268.csv" "270.csv" "271.csv" "277.csv"
      # [151] "279.csv" "287.csv" "299.csv" "300.csv" "301.csv"
      # [156] "302.csv" "303.csv" "313.csv" "314.csv" "320.csv"
      # [161] "321.csv" "322.csv" "325.csv" "328.csv" "329.csv"
      # [166] "330.csv"

###############################################
##############  Troubleshooting   #############
###############################################


#  warning this taking several minutes for large id values.  
id <- 3  #332

for(i in 1:id){
  
  if(i<10){
    file <- paste("00",i,".csv",sep="")       #  i<10 file name -> 001.csv ... 009.csv etc.
  }
    else if(10<=i && i<100){
      file <- paste("0",i,".csv",sep="")      #  10<=i<100 file name -> 010.csv ... 099.csv
        }
      else{
        file <- paste(i,".csv",sep="")        #  100<=i<id+1 file name -> 100.csv ... 341.csv
      }
  
  
    myreadI <- read.csv(paste(dataDir,file,sep=""))     #  read the ith csv file
  
    if(i==1){
      mydataI <- myreadI
    }
      else if(i==2){
        mydataFull <- rbind(mydataI,myreadI) 
      }
        else{
          mydataFull <- rbind(mydataFull,myreadI) 
        }
}

rm(mydataI)
MyDataTest <- na.omit(mydataFull)


#   average calculation

myDF <- data.frame(value1=c(2.2,2.3,2.4),value2=c(3,6,17))

  # > myDF
  #   value1 value2
  # 1    2.2      3
  # 2    2.3      6
  # 3    2.4     17

#  Calculate myDF average for columns 1 and 2

  # > mean(myDF[,1])
  # [1] 2.3
  # > mean(myDF[,2])
  # [1] 8.666667
  # > (3+6+17)/3
  # [1] 8.666667








