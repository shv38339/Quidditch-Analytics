library(dplyr) # necessary to read function tbl_df
library(networkD3)

# download these files from the CSVs folder 
# cleansched7 <- tbl_df(read.csv("cleansched7.csv", header = T)[-1])
# teamchr <- tbl_df(read.csv("teamchr.csv", header = TRUE)[-1])

odd_index <- seq(27, 1705, 2) # winner/source
even_index <- seq(26, 1704, 2) # loser/target

Source <- cleansched7$id[odd_index] - 1 # Source and Target must start at zero. A bit confusing.
Target <- cleansched7$id[even_index] - 1 # Source and Target must start at zero. A bit confusing.
value <- cleansched7$ptdiff[odd_index] # winner's pt differential for how wide the links are

name <- as.factor(teamchr$name) # names need to be factored
group <- as.integer(as.factor(teamchr$conference)) # groups must be integers

schedLinks <- tbl_df(data.frame(Source, Target, value))
schedNodes <- tbl_df(data.frame(name, group))


# base forcenetwork - super messy
forceNetwork(Links = schedLinks, Nodes = schedNodes, 
             Source = "Source", Target = "Target", 
             Value = "value", NodeID = "name", Group = "group", 
             fontsize = 15, opacity = .6)

# simple network - messy again and not that useful, but kind of cool
simpleNetwork(Data = schedLinks, Source = "Source", Target = "Target")

### Non-Conference Network
# Majority of non-conference games start week 1 and end week 4 (keyword: majority)
ncf <- cleansched7 %>% filter(week <= 4 & week != 0) %>% select(id, ptdiff)

ncf_even_index <- seq(2, 552, 2) # winner/Source
ncf_odd_index <- seq(1, 551, 2) # loser/Target

ncfSource <- ncf$id[ncf_even_index] - 1; ncfTarget <- ncf$id[ncf_odd_index] - 1 
ncfValue <- ncf$ptdiff[ncf_even_index]
ncfLinks <- tbl_df(data.frame(ncfSource, ncfTarget, ncfValue))

forceNetwork(Links = ncfLinks, Nodes = schedNodes, 
             Source = "ncfSource", Target = "ncfTarget", Value = "ncfValue", 
             NodeID = "name", Group = "group", 
             fontsize = 15, opacity = 1)
# floating nodes indicate non-conference games that aren't played in the first four weeks of the season

### Conference Network
# last game before bowl games is Army vs Navy, which is lone game in Week 15
cf <- cleansched7 %>% filter(week > 4 & week <= 15) %>% select(id, ptdiff)

cf_even_index <- seq(2, 1058, 2) # winner/Source
cf_odd_index <- seq(1, 1057, 2) # loser/Target

cfSource <- cf$id[cf_even_index] - 1; cfTarget <- cf$id[cf_odd_index] - 1
cfValue <- cf$ptdiff[cf_even_index]
cfLinks <- tbl_df(data.frame(cfSource, cfTarget, cfValue))

forceNetwork(Links = cfLinks, Nodes = schedNodes, 
             Source = "cfSource", Target = "cfTarget", Value = "cfValue", 
             NodeID = "name", Group = "group", 
             fontsize = 15, opacity = 1, charge = -100)
# this one is actually interesting and insightful

### Display of conferences and their respective teams

# re-factored data frame to display names
confNodes <- tbl_df(data.frame(name = as.factor(teamchr$name), 
                               group = as.factor(teamchr$conference)))

# charge set to -100 to instead of default -200. Easier to fit all teams in one frame
simpleNetwork(Data = confNodes, Source = "name", Target = "group", 
              fontSize = 15, opacity = 1, charge = -100)
