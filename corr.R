corr <- function(directory, threshold = 0) {
    rv=vector()
    inst<-1
    for (i in 1:332) {
	if(i<10){id1<-paste("00",i,sep="")}
	else if(i<100){id1<-paste("0",i,sep="")}
	else {id1<-i}
	path<-paste(directory,"/",id1,".","csv",sep="")
	data<- read.csv(path)
	comp<- complete.cases(data)
	y<-data[comp,]
	if(nrow(y)>threshold)
	{
		rv[inst]=cor(y[,'sulfate'],y[,'nitrate'])
		inst<-inst+1
	}
    }
	rv
}