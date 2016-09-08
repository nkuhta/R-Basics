##  Dates in R
##  Refer to Coursera R Programming Course from John Hopkins

###############################################
###############  Dates in R   #################
###############################################

#  R caculates days and seconds since 1970-01-01


x <- as.Date("1970-01-01")

#  output prints like a character

    # > x
    # [1] "1970-01-01"

#  unclass gives the days since 1970-01-01

  # > unclass(x)
  # [1] 0
  # > unclass(as.Date("1970-01-02"))
  # [1] 1

###############################################
###############  Times in R   #################
###############################################

#  POSIXct - stores very large integer
#  POSIXlt - stores as a list with lots of useful information

t <- Sys.time()

  # > t
  # [1] "2016-09-01 11:22:35 PDT"

p <- as.POSIXlt(t)

  # > names(unclass(p))
  # [1] "sec"    "min"    "hour"   "mday"   "mon"    "year"  
  # [7] "wday"   "yday"   "isdst"  "zone"   "gmtoff"

  # > p$sec
  # [1] 29.13939

#   already in POSIXct format
t1 <- Sys.time()

  # > t1
  # [1] "2016-09-01 11:49:26 PDT"
  # > unclass(t1)
  # [1] 1472755767   # NUMBER of seconds since 1970

  # > t1$sec
  # Error in t1$sec : $ operator is invalid for atomic vectors

  # > print(as.POSIXlt(t1)$sec)
  # [1] 26.93587

###############################################
#################  strptime   #################
###############################################

datestring <- c("January 10, 2012 10:40","December 9, 2011 9:10")

d1 <- strptime(datestring,"%B %d, %Y %H:%M")   # "%B %d, %Y %H:%M" = "%Month %day, %Year %Hour:%Minute"

  # > d1
  # [1] "2012-01-10 10:40:00 PST" "2011-12-09 09:10:00 PST"

  # > class(d1)
  # [1] "POSIXlt" "POSIXt" 

###############################################
############  Time Arithmetic   ###############
###############################################

m <- as.Date("2012-01-01")
n <- strptime("9 January 2011 11:34:21","%d %b %Y %H:%M:%S")

  # > m-n
  # Error in m - n : non-numeric argument to binary operator
  # In addition: Warning message:
  #   Incompatible methods ("-.Date", "-.POSIXt") for "-" 

m <- as.POSIXlt(m)

  # > m-n
  # Time difference of 356.1845 days

#  Even leap year, leap seconds, daylight savings, and time zones are tracked.

f <- as.Date("2012-03-01")
u <- as.Date("2012-02-28")

  # > f-u
  # Time difference of 2 days

g <- as.POSIXct("2012-10-25 01:00:00")
q <- as.POSIXct("2012-10-25 06:00:00",tz="GMT")

  # > g-q
  # Time difference of 2 hours


