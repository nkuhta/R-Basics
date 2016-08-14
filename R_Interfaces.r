##  R Interfaces
##  Refer to Coursera R Programming Course from John Hopkins

# Load this in R Console with source=("R_Interfaces.r")

###############################################
############  Connections  ####################
###############################################

#   Read lines from a website
con <- url("http://jhsph.edu","r")
x <- readLines(con)
head(x)

#	read example.txt
con<-file("example.txt","r")

#	r = read
#	w = write
#	a = append

data<-read.csv(con)

close(con)

#	is the same as 

data<-read.csv("example.txt")

#  read the first 10 lines of the "words.gz" file
con <- gzfile("words.gz")
x <- readLines(con,10)


