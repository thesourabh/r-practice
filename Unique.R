Unique <- function(n){
	y<-list(n[[1]])
	for (i in 1:length(n))
	{
		flag<-0
		print(n[[i]])
		for ( j in 1:length(y))	{if(n[[i]]==y[[j]]) {flag<-1}	}
		if(flag==0){y<-c(y,n[[i]])}
	}
	y
}