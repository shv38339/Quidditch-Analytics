library(tidyr)
library(reshape)

clean <- read.csv("cleanschedule5.csv")

clean.sub1 <- clean[1:76,]
head(clean.sub1)

#myvars <- c("v1", "v2", "v3")
#newdata <- mydata[myvars]

vars.win <- c("game.id", "week", "w.name","w.pts")
winners.sub.1 <- clean.sub1[vars.win]
vars.loss <- c("game.id", "week", "l.name","l.pts")
losers.sub.1<- clean.sub1[vars.loss]

#adding new column with result
winners.1<-winners.sub.1
winners.1$results<-"W"
losers.1<-losers.sub.1
losers.1$results<-"L"

#renaming variables
#library(reshape)
#mydata <- rename(mydata, c(oldname="newname"))

winners.1<-rename(winners.1,c(w.name="team"))
winners.1<-rename(winners.1,c(w.pts="points"))

losers.1<-rename(losers.1,c(l.name="team"))
losers.1<-rename(losers.1,c(l.pts="points"))


# rbinding winners and losers

result.1<-rbind(winners.1,losers.1)

#sort by week id
#newdata <- mtcars[order(mtcars$mpg),]  

result.1<-result.1[order(result.1$game.id),]
