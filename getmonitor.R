getmonitor <- function(id, directory, summarize=FALSE) {
	if(id<10){id<-paste("00",id,sep="")}
	else if(id<100){id<-paste("0",id,sep="")}
	path<-paste(directory,"/",id,".","csv",sep="")
	data<- read.csv(path)
	if(summarize==TRUE) {
		print(summary(data))
	}
	data
}