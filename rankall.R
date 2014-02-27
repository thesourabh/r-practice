rankall <- function(outcome, num = "best") {
	out <- read.csv("outcome-of-care-measures.csv")
	state<-levels(out[,"State"])
	if (length(out["State"][out["State"]==state])==0){
	stop("invalid state")
	}
	
	if(outcome=="heart attack") o<-11
	else if(outcome=="heart failure") o<-17
	else if(outcome=="pneumonia") o<-23
	else stop("invalid outcome")

	
	dd<-data.frame("hospital"="","state"=state)
	dd[1]<-""
	for (i in 1:54){
	st<-state[i]
	rddd<-data.frame("Death"=out[o][out["State"]==st],"Hospital"=out["Hospital.Name"][out["State"]==st])
	rddd[,1]<-as.numeric(as.character(rddd[,1]))
	rddd<-rddd[ order(rddd[,1], rddd[,2]), ]
	k<-""
	if(num=="best")	 k<-as.character(rddd[1,2])
	else if(num=="worst") k<-as.character(rddd[nrow(rddd[complete.cases(rddd),]),2])
	else k<-as.character(rddd[num,2])

	dd[1][i,]<-k
	}
	return (dd)
	
}