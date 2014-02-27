reddit <- function() {
    while(1){
	writeLines("\n\n\n\n\n        Reddit Karma")
	writeLines("1. Confirm total")
	writeLines("2. Pie chart")
	writeLines("3. View as table")
	writeLines("4. Write to file as table")
	writeLines("\n0. Exit\n\n?")
	ch<-as.integer(readline())
	path<-paste(getwd(),"/redditkarma/input.txt",sep="")
	a<-read.csv(path)
	columnnames<-strsplit(names(a),"\\.")
	b<-strsplit(as.character(a$subreddit),'\t')
	c<-do.call('rbind',b)
	d<-data.frame(c)
	names(d)=columnnames[[1]]
	if(ch==0) break
	else if(ch==1) {
		comsum<-sum(as.integer(as.vector(d[,"comment"])))
		linksum<-sum(as.integer(as.vector(d[,"link"])))
		op<-paste("\n\n    Total\nLink: ",linksum,"\nComment: ",comsum,sep="")
		writeLines(op)
	}
	else if(ch==2) {
		ivect<-as.integer(as.vector(d[,"comment"]))
		names(ivect)<-d[,1]
		ivect<-ivect[ivect>0]
		others<-sum(ivect[ivect<200])
		ivect<-ivect[ivect>=200]
		ivect[length(ivect)+1]=others
		names(ivect)[length(ivect)]="Others"
		pie(ivect,names(ivect))
	}
	else if(ch==3)	print(d)
	else if(ch==4) 	{
		write.table(d,paste(getwd(),"/redditkarma/output.txt",sep=""))
	writeLines("Saved as output.txt")
	}
    readline("Press any key to continue...")	
    }
}