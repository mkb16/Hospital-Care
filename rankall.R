rankall <- function(outcome , num = "best")
{
library(dplyr)
data <- read.csv("outcome-of-care-measures.csv")
mydata <- data.frame(data[ ,2] , data[ ,7], data[ ,11],data[ ,17],data[ ,23])
colnames(mydata) <- c("Hospital.Name" , "State" , "Heart.attack" , "Heart.failure" , "Pneumonia")
if (outcome == "Heart attack")
{
r <- 3
}
else if (outcome == "Heart failure")
{ 
r <- 4
}
else if (outcome == "Pneumonia")
{
r <- 5
}
else
{ 
stop('invalid outcome')
}
mydata2 <- data.frame(mydata$Hospital.Name , mydata$State , mydata[ ,r])
remove <- which(mydata[ ,r] == "Not Available" )
removed <- mydata2[ -remove , ]
f <- removed[ ,3]
d <- as.numeric(levels(f))[f]
newdata <- data.frame(removed[ ,1:2] , d)
colnames(newdata) <- c("A" , "B" , "C")
final <- newdata[order(newdata$C, newdata$A), ]
split <- split(final , final$B)
if ( num == "best")
{
bind_rows(lapply(split , function(x) x[1 ,c(1,2) ]))
}
else if ( num == "worst")
{
bind_rows(lapply(split , function(x)   x[ nrow(x) ,c(1,2) ]))
}
else
{
bind_rows(lapply(split , function(x) x[num ,c(1,2) ]))
}
}






















