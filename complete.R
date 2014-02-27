complete <- function(directory, id=1:332) {
	rdf<-data.frame(id=id,nobs=id)
	for (i in id){
	if(i<10){id1<-paste("00",i,sep="")}
	else if(i<100){id1<-paste("0",i,sep="")}
	else {id1<-i}
	path<-paste(directory,"/",id1,".","csv",sep="")
	data<- read.csv(path)
	comp<- complete.cases(data)
	rdf[rdf["id"]==i,]["nobs"]=nrow(data[comp,])
	}
	rdf
}