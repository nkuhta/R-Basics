##  R Textual Formats
##  Refer to Coursera R Programming Course from John Hopkins

# Load this in R Console with source=("R_Textual_Formats.r")

###############################################
############  Textual Formats  ################
###############################################

#  dump and dput preserve metadata, so another user doesn't have to specify again

y<-data.frame(a=1,b="a")
dput(y)

#	y output
#	  a b
#	1 1 a

###############################################
############  Dumping R Objects  ##############
###############################################

x<-"foo"

#  dump x and y variables to "data.r" file
dump(c("x","y"),file="data.r")

#	remove x,y definitions
rm(x,y)

# 	call the dump
source("data.r")








