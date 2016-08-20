##  R Data Reading and Writing
##  Refer to Coursera R Programming Course from John Hopkins

# Load this in R Console with source=("R_Read_Write.r")

###############################################
############  Reading Data  ###################
###############################################

#	read.table and read.csv are for reading tabular data. 

#	readLines is for reading a text file

data<-read.table("file.txt")

###############################################
############  Reading Large Data  #############
###############################################

#  Read help page for read.table

#  specifying nrows helps with memory usage

initial<-read.table("file.txt",nrows=100)

classes<-sapply(initial,class)

tabAll<-read.table("file.txt",colClasses=classes)

#	Calculating Memory Usage

#	Data Frame with 1.5 million rows and 120 columns, how much memory

#  	Number of elements = 1,500,000*120*8(bytes/numeric)

#  	= 1440000000

#	= 1440000000/2^20 bytes/MB

#	= ~ 1,373 MB = 1.34 GB (plan for twice this value)

#   General equation ->  #MB = #numeric_elements * 8 / 2^20

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
















