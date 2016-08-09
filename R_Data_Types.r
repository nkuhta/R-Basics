## R Data Types Examples
##  Refer to Coursera R Programming Course from John Hopkins

# Load this in R Console with source=("R_Data_Types.r")

#  Assign the value 5 to x, note this is a 1D vector ie. x[1]=5
x<-5
#  uncomment line below to print the variable x
# print(x)

#  character vector hello with first entry hello
#  all other entries of msg must also be characters
msg<- "hello"

#  create a sequence of 1,2,3.....20
y=1:20

###############################################
############  R Objects  ######################
###############################################

#  Every vector has to have the same object class except a list

#  Character
#  Numeric (real numbers) - These are double by default
#  Integer - Note 1 = Double, 1L = Integer
#  Complex
#  Logical (True/False)

###############################################
##############  Attributes ####################
###############################################

# names,dimnames
# dimensions (eg. matrices, arrays)
# class
# length
# other user defined data/metadata

###############################################
#############  Vectors and Lists  #############
###############################################

#  Note c is the concatenate operator  

v1<-c(0.5,0.6)  	##  numeric vector of length 2 with values 0.5 and 0.6
v2<-c(TRUE,FALSE)  	##  logical vector
v3<-c(T,F)			##	shorthand logical symbols T and F
v4<-c("a","b","c")	## 	character vector
v5<-c(9:29)			## 	integer vector from 9,10,.....29
v6<-c(1+0i,2+4i)	##  complex vector

##	Initiate numeric vector with 10 (length) zero elements 
v7<-vector("numeric",length=10)

##  Mixing Objects - Coercion into the lowest common class  ## 

y1<-c(1.7,"a")	##  character vector
y2<-c(TRUE,2)	##  numeric
y3<-c("a",TRUE)	##  character 

##  Explicit Coercion - using the as.*
x1<-0:3 				##  class(x1) = integer
x2<-as.numeric(x1)		##  array of double 
x3<-as.logical(x1)  	##  FALSE,TRUE,TRUE,TRUE ie. Everything > 0 is TRUE
x4<-as.character(x1)	## 	"0","1","2","3"
x5<-as.complex(x1)		## 	Complex vector with 0i for all values
	
##  Nonsensical Coercion
##	Warning Message: NAs introduced by coercion 
a1<-c("a","b","c")		## 	character vector
a2<-as.numeric(a1)		## 	[1] NA NA NA
a3<-as.logical(a1)		## 	[1] NA NA NA
a4<-as.complex(a1)		##	[1] NA NA NA

###############################################
###############  	Lists      ################
###############################################

#	Like a vector, but can contain different class elements

L1<-list(1,"a",TRUE,1+4i)	##  (mumeric,character,logical,complex)

##	Note auto-printing lists shows their entries have double brackets
##	ie. L1[[1]]=1, L1[[2]]="a" and so on  
##	elements of lists are indexed with double brackets

###############################################
###############  	Matrices      #############
###############################################

#  2 row and 3 column matrix with NA values
m1<-matrix(nrow=2,ncol=3)
	#	m1 output
	#      [,1] [,2] [,3]
	#[1,]   NA   NA   NA
	#[2,]   NA   NA   NA
	
DimM1<-dim(m1)
	#	DimM1 output
	#	[1] 2 3
	
AttM1<-attributes(m1)
	#	AttM1 output
	#	$dim
	#	[1] 2 3 

#  Matrices are constucted column-wise (see below)

m2<-matrix(1:6,nrow=2,ncol=3)
	# 	m2 output
	#		[,1] [,2] [,3]
	#[1,]    1    3    5
	#[2,]    2    4    6

#  	Create matrices by adding dimension to vectors
m3<-1:10
	# 	m3 output
	# [1] 1 2 3 4 5 6 7 8 9 10
	
dim(m3)<-c(2,5)
	#	new m3 output
	#		[,1] [,2] [,3] [,4] [,5]
	#[1,]    1    3    5    7    9
	#[2,]    2    4    6    8   10

#  Column Binding and Row Binding
r1<-1:3
c1<-10:12

# column bind
print(cbind(r1,c1))
	#	output
	#	     r1 c1
	#	[1,]  1 10
	#	[2,]  2 11
	#	[3,]  3 12
# row bind
print(rbind(r1,c1))
	#	output
	#	   [,1] [,2] [,3]
	#  r1    1    2    3
	#  c1    10   11   12

###############################################
###############  	Factors      ##############
###############################################

#  Factors are special labeled vectors (some can be ordered)
#  treated specially by linear modeling function.  

#  f1 is a 2 level factor
f1<-factor(c("yes","yes","no","yes","no"))
	#	f1 output (with Levels attribute)
	#	[1] yes yes no  yes no 
	#	Levels: no yes

f2<-table(f1)
	#	f2 table output below
	#	f1
	#	no yes 
	#	2   3 
	
#  f3 removes classes and makes integer entries, but retains the level information
f3<-unclass(f1)	
	#	output
	#	[1] 2 2 1 2 1	
	#	attr(,"levels")
	#	[1] "no"  "yes"

#  Explicitly spell out the levels order (not default alphabetical)
f4<-factor(f1,levels=c("yes","no"))
	#	[1] yes yes no  yes no 
	#	Levels: yes no

	
	
###############################################
###############   Missing Data      ###########
###############################################




