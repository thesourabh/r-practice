agecount <- function(age = NULL) {
## Check that "cause" is non-NULL; else throw error
if (length(age)==0) stop("Age not specified")

homicides <- readLines("homicides.txt")
e<-paste(age,"( )*years*",sep="")
length(grep(e,homicides))
## Extract causes of death
## Return integer containing count of homicides for that cause
}