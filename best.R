best <- function(state, outcome) {
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
	
	mydata1 <- mydata[ ,r]
 	levels <- levels(factor(mydata1))
	levels1 <- as.numeric(levels)
	levels2 <- na.omit(levels1)
	min <- min(levels2)
	hospital <- sort(subset(mydata$Hospital.Name , mydata[ , r] == min ))
	hospital[1]
	
	}
	
	if( outcome == "Heart attack")
	{
	r <- 13
	func(r)
	}
	else if( outcome == "Heart failure")
	{
	r <- 17
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
	
best("TX" , "Heart failure")

	

