count <- function(cause = NULL) {
## Check that "cause" is non-NULL; else throw error
if (length(cause)==0) stop("Cause of death not specified")
cod<-c("asphyxiation", "blunt force", "other", "shooting","stabbing", "unknown")
cods<-c("[Aa]sphyxiation","[Bb]lunt force","[Oo]ther","[Ss]hooting","[Ss]tabbing", "[Uu]nknown")
## Check that specific "cause" is allowed; else throw error
if (cause %in% cod) { p=grep(cause,cod) }
else {stop("Cause of death not valid")}
## Read "homicides.txt" data file
homicides <- readLines("homicides.txt")
e<-paste("<dd>[Cc]ause: ",cods[p],"</dd>",sep="")
length(grep(e,homicides))
## Extract causes of death
## Return integer containing count of homicides for that cause
}