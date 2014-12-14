## As the name of the title suggests, let's get the team names and write abbreviations for them. 
#team.names <- c(dat.ff$winner, dat.ff$loser) # Let's concatenate all of the team names
#unique.team.names <- unique(team.names) # Let's make them unique b/c we know they repeat
#unique.team.names1 <- sort(unique(team.names))
#write.csv(unique.team.names, file = "teamnames.csv") # Let's write a CSV file
#write.csv(unique.team.names1, file = "teamnames")
## Opened the CSV file in Numbers, in which Numbers screwed it up, hence the name below.
## Writing files in R is a bit difficult. More practice on that in the future.

teamchr <- read.delim("teamchr.csv", header = TRUE)
names(teamchr)
unique(teamchr$abbrvs) # 205
sum(duplicated(teamchr$abbrvs)) # 0 FUCK YEAH, WE'RE READY TO ROLL
table(teamchr$conference)

# Fixed the duplicates and loaded it back in. Will comment out the commands. 

## Let's attempt to merge the files. I hate doing this. Eeeekkk!
## Before we do that, let's create id's for the games, as merge is messing up the order.

dat.ff.1$game.id <- 1:nrow(dat.ff.1)
head(dat.ff.1); tail(dat.ff.1)

dat.wmerge <- merge(x = teamchr, y = dat.ff.1, by.x = "name", by.y = "winner")
names(dat.wmerge)
names(dat.wmerge)[c(1:4)] <- c("w.name", "w.id", "w.conference", "w.abbrvs")
head(dat.wmerge)
head(dat.wmerge[order(dat.wmerge$game.id),])
dat.wmerge.order <- dat.wmerge[order(dat.wmerge$game.id),]
# arrange(dat.wmerge, game.id) # Pain in the @$$ to switch back and forth between dplyr object and R object

dat.lmerge <- merge(x = teamchr, y = dat.wmerge.order, by.x = "name", by.y = "loser")
names(dat.lmerge)
names(dat.lmerge)[c(1:4)] <- c("l.name", "l.id", "l.conference", "l.abbrvs")
head(dat.lmerge)
dat.lmerge.order <- dat.lmerge[order(dat.lmerge$game.id),]

length(dat.lmerge.order) # 15 variables
dat.merge <- dat.lmerge.order[c(15, 6, 2, 9, 7, 8, 10, 5, 11, 12, 14, 1, 13, 4, 3)] # Reorder as such.

# Forgot about w.pts and l.pts are factors. Change to numeric. Harder than I thought.
# From stackoverflow: as.numeric(levels(f))[f]
dat.merge$w.pts <- as.numeric(levels(dat.merge$w.pts)[dat.merge$w.pts])
dat.merge$l.pts <- as.numeric(levels(dat.merge$l.pts)[dat.merge$l.pts])
dat.merge$week <- as.numeric(levels(dat.merge$week)[dat.merge$week])

# let's change w.rank and l.rank to numbers for googleVis to read
dat.merge$w.rank <- ifelse(dat.merge$w.rank == "Unranked", "26", dat.merge$w.rank)
dat.merge$w.rank <- as.numeric(dat.merge$w.rank)
dat.merge$l.rank <- ifelse(dat.merge$l.rank == "Unranked", "26", dat.merge$l.rank)
dat.merge$l.rank <- as.numeric(dat.merge$l.rank)

str(dat.merge); head(dat.merge)

goog.1 <- dat.merge

###***###
#install.packages("googleVis")
library(googleVis)
plot(gvisMotionChart(goog.1, idvar = "w.name", timevar = "week"))

#write.csv(goog.1, file= "goog.1.csv")

