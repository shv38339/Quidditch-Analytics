library(dplyr) # necessary to read function tbl_df
library(networkD3)

# download these files from the CSVs folder 
# cleansched7 <- tbl_df(read.csv("cleansched7.csv", header = T)[-1])
# teamchr <- tbl_df(read.csv("teamchr.csv", header = TRUE)[-1])

even_index <- seq(26, 1704, 2) # loser/target
odd_index <- seq(27, 1705, 2) # winner/source

Source <- cleansched7$id[odd_index] - 1 # Source and Target must start at zero. A bit confusing.
Target <- cleansched7$id[even_index] - 1 # Source and Target must start at zero. A bit confusing.
value <- cleansched7$ptdiff[odd_index] # winner's pt differential for how wide the links are

name <- as.factor(teamchr$name) # names need to be factored
group <- as.integer(as.factor(teamchr$conference)) # groups must be integers

schedLinks <- data.frame(Source, Target, value)
schedNodes <- data.frame(name, group)


# base forcenetwork - super messy
forceNetwork(Links = schedLinks, Nodes = schedNodes, 
             Source = "Source", Target = "Target", 
             Value = "value", NodeID = "name", Group = "group", 
             fontsize = 15, opacity = .6)

# simple network - messy again and not that useful, but kind of cool
simpleNetwork(Data = schedLinks, Source = "Source", Target = "Target")
