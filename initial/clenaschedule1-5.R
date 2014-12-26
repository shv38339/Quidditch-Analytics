## As the name of the title suggests, let's get the team names and write abbreviations for them. 
## Notes for myself to create the file 'teamcharacteristics.csv'. 
## PLEASE DISREGARD THE NEXT SEVERAL LINES.
# team.names <- c(dat.ff$winner, dat.ff$loser) # Let's concatenate all of the team names
# unique.team.names <- unique(team.names) # Let's make them unique b/c we know they repeat
# unique.team.names1 <- sort(unique(team.names))
# write.csv(unique.team.names, file = "teamnames.csv") # Let's write a CSV file
# write.csv(unique.team.names1, file = "teamnames")
## Opened the CSV file in Numbers, in which Numbers screwed it up, hence the name below.
## Writing files in R is a bit difficult. More practice on that in the future.

teamchr <- read.delim("teamcharacteristics.csv", header = TRUE)
# Checks for variable names and uniqueness and duplicates of abbreviations and conferences
#names(teamchr): id name conference abbrvs
#unique(teamchr$abbrvs) # 205
#sum(duplicated(teamchr$abbrvs)) # 0 FUCK YEAH, WE'RE READY TO ROLL
#table(teamchr$conference)

# Fixed the duplicates and loaded it back in. Will comment out the commands. 

## Let's attempt to merge the files. I hate doing this. Eeeekkk!
## Before we do that, let's create id's for the games, as merge is messing up the order.

clean.sched$game.id <- 1:nrow(clean.sched)
head(clean.sched); tail(clean.sched)

clean.sched1<- merge(x = teamchr, y = clean.sched, by.x = "name", by.y = "winner")
names(clean.sched1)
names(clean.sched1)[c(1:4)] <- c("w.name", "w.id", "w.conference", "w.abbrvs")
head(clean.sched1)
head(clean.sched1[order(clean.sched1$game.id),])
clean.sched2 <- clean.sched1[order(clean.sched1$game.id),]
# arrange(dat.wmerge, game.id) # Pain in the @$$ to switch back and forth between dplyr object and R object

clean.sched3 <- merge(x = teamchr, y = clean.sched2, by.x = "name", by.y = "loser")
names(clean.sched3)
names(clean.sched3)[c(1:4)] <- c("l.name", "l.id", "l.conference", "l.abbrvs")
head(clean.sched3)
clean.sched4 <- clean.sched3[order(clean.sched3$game.id),]

#length(clean.sched4) # 15 variables
clean.sched5 <- clean.sched4[c(15, 6, 2, 9, 7, 8, 10, 5, 11, 12, 14, 1, 13, 4, 3)] # Reorder as such.

# Forgot about w.pts and l.pts are factors. Change to numeric. Harder than I thought.
# From stackoverflow, the format is as such: as.numeric(levels(f))[f]
clean.sched5$w.pts <- as.numeric(levels(clean.sched5$w.pts)[clean.sched5$w.pts])
clean.sched5$l.pts <- as.numeric(levels(clean.sched5$l.pts)[clean.sched5$l.pts])
clean.sched5$week <- as.numeric(levels(clean.sched5$week)[clean.sched5$week])

# let's change w.rank and l.rank to numbers for googleVis to read
clean.sched5$w.rank <- ifelse(clean.sched5$w.rank == "Unranked", "26", clean.sched5$w.rank)
clean.sched5$w.rank <- as.numeric(clean.sched5$w.rank)
clean.sched5$l.rank <- ifelse(clean.sched5$l.rank == "Unranked", "26", clean.sched5$l.rank)
clean.sched5$l.rank <- as.numeric(clean.sched5$l.rank)

#str(clean.sched5); head(clean.sched5); View(clean.sched5)

# Let's write the final product into a csv file in fear of losing it.
# write.csv(clean.sched5, file = "cleanschedule5.csv")

