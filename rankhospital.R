rankhospital <- function(state, outcome , num) {
	library(plyr)
	data <- read.csv("outcome-of-care-measures.csv")
	check <- is.element(state , data$State)
	if(check == "FALSE")
	{ 
	stop('invalid state')
}	
	else
	{	
	mydata <- subset(data , State == state)
	
	func <- function(r)
	{
	mydata2 <- data.frame(mydata$Hospital.Name , mydata[ ,r])
	remove <- which(mydata[ ,r] == "Not Available" )
	removed <- mydata2[ -remove , ]
	f <- removed[ ,2]
	d <- as.numeric(levels(f))[f]
	newdata <- data.frame(removed[ ,1] , d)
	colnames(newdata) <- c("A" , "B")
	length <- length(f)
	if ( num == "best")
	{
	final <- newdata[order(newdata$B, newdata$A), ]
	final[1 , 1]
	}
	else if ( num == "worst" )
	{
	final <- newdata[order(newdata$B, newdata$A), ]
	final[length , 1]
	}
	else if ( num <= length)
	{
	final <- newdata[order(newdata$B, newdata$A), ]
	final[num , 1]
	}
	else 
	{ 
	print( "NA")
	}
 	}
	if( outcome == "Heart failure")
	{
	r <- 17
	func(r)
	}
	else if ( outcome == "Heart attack")
	{
	r <- 11
	func(r)
	}
	else if ( outcome == "Pneumonia")
	{
	r <- 23
	func(r)
	}
	else 
	{
	stop('invalid outcome')
	}
	}
	}
	
rankhospital("TX" , "Heart failure" , 198)

	

