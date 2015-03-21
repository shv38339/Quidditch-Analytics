## This files cleans the csv file 'cleansched5pt1.csv' and makes it nice and tidy.

## Tidy data is the unoriginal, yet super obvious, but we're too lazy to do, idea
## coined by Hadley Wickham (in writing and in the 'tidyr' package) to create data
## that follows two conditions: EACH COLUMN IS A VARIABLE and EACH ROW IS AN OBSERVATION

## In 7 lines of code, using the packages tidyr and dplyr, we have tidy data.

# cleansched5.1 <- tbl_df(read.csv("cleansched5pt1.csv", stringsAsFactors = F))

library(tidyr)
library(dplyr) 

cleansched6 <- cleansched5.1 %>%
                    select(game.id, week, 
                           w.id, w.conference, w.rank, w.name, w.abbrvs, w.pts, w.ptdiff,
                           l.id, l.conference, l.rank, l.name, l.abbrvs, l.pts, l.ptdiff) %>%
                    gather(key, value, w.id:l.ptdiff) %>%  # review command
                    separate(key, c("outcome", "type")) %>% # review command
                    spread(type, value, convert = TRUE) # review command