best <- function(state, outcome) {
	out <- read.csv("outcome-of-care-measures.csv")
	st<-state
	if (length(out["State"][out["State"]==state])==0){
	stop("invalid state")
	}
	
	if(outcome=="heart attack") o<-11
	else if(outcome=="heart failure") o<-17
	else if(outcome=="pneumonia") o<-23
	else stop("invalid outcome")
	options (warn=-1)
	out[, o]<-as.numeric(as.character(out[, o]))
	ha<-out[o][out["State"]==st]
	m<-min(ha,na.rm=T)
	min(out["Hospital.Name"][out[o]==m & is.na(out[o])==F & out["State"]==st])
}