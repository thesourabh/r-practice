rankhospital <- function(state, outcome, num) {
	out <- read.csv("outcome-of-care-measures.csv")
	st<-state
	if (length(out["State"][out["State"]==state])==0){
	stop("invalid state")
	}
	
	if(outcome=="heart attack") o<-11
	else if(outcome=="heart failure") o<-17
	else if(outcome=="pneumonia") o<-23
	else stop("invalid outcome")


	
	rddd<-data.frame("Death"=out[o][out["State"]==st],"Hospital"=out["Hospital.Name"][out["State"]==st])
	rddd[,1]<-as.numeric(as.character(rddd[,1]))
	rddd<-rddd[ order(rddd[,1], rddd[,2]), ]

	if(num=="best")	print (as.character(rddd[1,2]))
	else if(num=="worst") print (as.character(rddd[nrow(rddd[complete.cases(rddd),]),2]))
	else print (as.character(rddd[num,2]))
	
}