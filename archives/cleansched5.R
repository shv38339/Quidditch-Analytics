# Let's load the following data sets

teamchr <- tbl_df(read.csv("teamchr.csv", stringsAsFactors = FALSE, header = TRUE))
cleansched <- tbl_df(read.csv("cleanschedule.csv", stringsAsFactors = FALSE, header = TRUE))

# quick edit to the first column
colnames(cleansched)[1] <- "game.id" # something about csvs loading the first column...
teamchr <- teamchr[-1] # same comment as previous line

# let's merge teamchr and cleansched, adding winner variables
cleansched1 <- merge(x = teamchr, y = cleansched, by.x = "name", by.y = "winner")
# names(cleansched1) check on names
names(cleansched1)[c(1:4)] <- c("w.name", "w.id", "w.conference", "w.abbrvs")
# head(cleansched1) check on names and columns
cleansched2 <- cleansched1[order(cleansched1$game.id),]

# let's merge teamchr and cleansched2, adding loser variables
cleansched3 <- merge(x = teamchr, y = cleansched2, by.x = "name", by.y = "loser")
# names(cleansched3) check on names
names(cleansched3)[c(1:4)] <- c("l.name", "l.id", "l.conference", "l.abbrvs")
# head(cleansched3) check on names and columns
cleansched4 <- cleansched3[order(cleansched3$game.id),]

# Reorder as such
cleansched5 <- cleansched4[c(9, 10, 6, 7, 5, 8, 11, 12, 13, 15, 14, 4, 1, 3, 2)]

# let's change w.rank and l.rank to integers
cleansched5$w.rank <- ifelse(cleansched5$w.rank == "Unranked", "26", cleansched5$w.rank)
cleansched5$w.rank <- as.integer(cleansched5$w.rank)
cleansched5$l.rank <- ifelse(cleansched5$l.rank == "Unranked", "26", cleansched5$l.rank)
cleansched5$l.rank <- as.integer(cleansched5$l.rank)