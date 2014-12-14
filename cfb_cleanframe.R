library(XML)
library(stringr)
library(plyr)

# Emergency Functions -----------------------------------------------------
rm(list=ls())


# Data URL --------------------------------------------------------

raw.2012 <- readHTMLTable('http://www.sports-reference.com/cfb/years/2012-schedule.html')

# Let's put it in a dataframe -------------------------------------------------

origin.frame <- data.frame(raw.2012)

head(origin.frame); tail(origin.frame) # Everything looks good

# Let’s delete the blank rows ---------------------------------------------

origin.frame[77,] # There are x amount of these columns and they're being removed in the next line
origin.frame.1 <- origin.frame[c(-77,-150,-219,-280,-335,-391,-447,-504,
                               -563,-620,-678,-740,-798,-818,-820,-823,-829,-842,-847),]

origin.frame.2 <- origin.frame.1[,-1] # Unsure of the fact if I should keep this ## Yep getting rid of it


# Column Names ------------------------------------------------------------
names(origin.frame.2)
colnames(origin.frame.2) <- c("week", "date", "day", "winner", "wpts", "location", "loser", "lpts", "notes")

origin.frame.2[1:100,] # just checking in

# Extracted Ranks ------------------------------------------

?gsub # I don't remember this code at all (10/23/14)

w.rank <- gsub("\\D", "", origin.frame.2$winner)
w.rank
str(w.rank) # We see that it is a CHR vector

Winner.Rank <- as.numeric(as.character(w.rank)) # b/c it's a character vector, we need the following nested f(x)
Winner.Rank # Nice. Now for all of the blanks we have NAs. Let's change all of the NAs to "Unranked"

Winner.Rank[is.na(Winner.Rank)] <- "Unranked" # Voila. NAs have a strange syntax. Duly noted, Steele.
head(Winner.Rank); tail(Winner.Rank)

# Same shindig for Loser Rank below
l.rank <- gsub("\\D", "", origin.frame.2$loser)
l.rank
Loser.Rank <- as.numeric(as.character(l.rank))
Loser.Rank[is.na(Loser.Rank)] <- "Unranked"
head(Loser.Rank); tail(Loser.Rank)

# Miami (OH) & (FL) -------------------------------------------------------
## To me, what's risky about this function is I have to keep it in the same column, so I only get...
## ...one chance at this. Sooooooo, don't assign the column yet until you figure it out. I hope that...
## makes sense, Steele

origin.frame.2$winner <- str_replace_all(origin.frame.2$winner, "\\(FL)", "FL")
origin.frame.2$winner <- str_replace_all(origin.frame.2$winner, "\\(OH)", "OH")

origin.frame.2$loser <- str_replace_all(origin.frame.2$loser, "\\(FL)", "FL")
origin.frame.2$loser <- str_replace_all(origin.frame.2$loser, "\\(OH)", "OH") 

origin.frame.2[42:53,] # Miami FL is on row 42 and Miami OH is on row 53

# Extracted Team Names ----------------------------------------------------

detect.winner <- str_detect(origin.frame.2$winner, "[)]") # TRUE FALSE of detecting right parentheses
detect.winner # the first argument of str_detect is the data and the second argument finds what you're
              # you're looking for. I may be going about this in a round about way, but whatever.

locate.parenthesis.winner <- str_locate(origin.frame.2$winner, "[)]") # let's rename this
locate.parenthesis.winner # I'm not sure why there are 2 columns...AH, we have a 'start' and 'end'. 
locate.parenthesis.winner[,1] # Let's use 'start', the first column

w.length <- str_length(origin.frame.2$winner) # length of each row of CHR, including ranks if present

# So now, what I'm setting up is capturing the team names with only ranks and putting them in a vector

w.length.parenthesis.name <- str_sub(origin.frame.2$winner, start = locate.parenthesis.winner[,1]+2, 
                                                            end = w.length)
w.length.parenthesis.name
# The arguments are as follows, data, start, and end. Start is where I had previously located...
#...the end parenthesis, added 2 because that's where the team name would start. End is length...
#...which I had previously used.
## So, w.length.parenthesis.name extracted team names from those that had ranks by them

# Now, for rows that did not have an end parenthesis or a rank, they are empty/NA points. Then, we're...
# ...we're going to start over and extract from the beginning to the end. 

w.length.name <- str_sub(origin.frame.2$winner, start = 1, end = w.length)
w.length.name # We see that for all team names that aren't ranked, we have them (as well as ranks...
# ...but that's the next step)

# Here's the tricky part. Let's pull the extracted team names from both vectors with only the names. 
# Here we go. Cross your fingers. And your toes.

Final.Winner <- ifelse(detect.winner==TRUE, w.length.parenthesis.name, w.length.name)
Final.Winner # FINAL PRODUCT AND IT'S FUCKING SWEET


## Now, let's do the same in one swift sweep for the losing team

detect.loser <- str_detect(origin.frame.2$loser, "[)]")

locate.parenthesis.loser <- str_locate(origin.frame.2$loser, "[)]")

l.length <- str_length(origin.frame.2$loser)

l.length.parenthesis.name <- str_sub(origin.frame.2$loser, start = locate.parenthesis.loser[,1]+2, 
                                                         end = l.length)
l.length.name <- str_sub(origin.frame.2$loser, 1, l.length)

Final.Loser <- ifelse(detect.loser==T, l.length.parenthesis.name, l.length.name)
Final.Loser

## FUCKING SWEEEEEEEEEEEEEEEEEEOEIEIUEOIEUEOIUEPYEPEPYIOUEEHETTTTTTTTTTTTTTTTTTTTTTTT

# cbind of ranks and individual team names --------------------------------
## We're going to try to make a simple data frame. Frame will consist of week, team name, and ranks
dat.ff <- data.frame(week = origin.frame.2$week, 
                     winner = Final.Winner, 
                     w.rank = Winner.Rank, 
                     loser = Final.Loser, 
                     l.rank = Loser.Rank,
                     stringsAsFactors = FALSE)

# I betcha week, being a factor, changed the rest of the variables to factors...
# Nope, it was the command 'stringsAsFactors'. I learned something new.

dim(dat.ff)
names(dat.ff)
head(dat.ff) # beautiful...almost. We have an issue with levels in week. 
View(dat.ff) # Since we changed it to a data.frame, we don't have an issue with week (10/30/14)


# Debugging factor levels in variable week --------------------------------

levels(origin.frame.2$week)
origin.frame.2$week <- ordered(origin.frame.2$week, levels = 1:20)
levels(origin.frame.2$week)
View(origin.frame.2)

# Now, we're going to throw the rest of the variables from the online table back into...
# ...the data frame and work from it from there. I'm going to have to learn ID #'s ...
# ...soon to learn how to reference between data frames.

# I think I'm doing this to add attributes to the network frames.

dat.ff.1 <- data.frame(week = origin.frame.2$week, 
                       w.rank = Winner.Rank, 
                       winner = Final.Winner,
                       w.pts = origin.frame.2$wpts,
                       location = origin.frame.2$location,
                       l.rank = Loser.Rank,
                       loser = Final.Loser, 
                       l.pts = origin.frame.2$lpts,
                       stringsAsFactors = FALSE)


