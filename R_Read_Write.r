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


















