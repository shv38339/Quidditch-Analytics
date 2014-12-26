# Code containing PTDIFF, which is much easier to see loser and winner.

# Also note, the CSV file cleanschedule5.csv is our core data set we will work with.
# And by core data set, I mean the LONG data set, with all the variable names, before we
# transformed/tidied up the data set into a short/tidy format. 

# As for what clean.sched6, that's the CORE dplyr data set to work with. Just type the following command:

# clean.sched6 <- tbl_df(read.csv("cleanschedule5.csv", stringsAsFactors = F))

# and voila! 

# I'll be writing this is in the README.md file as well. 

clean.schedPTDIFF <- clean.sched6 %>% mutate(w.ptdiff = w.pts - l.pts, l.ptdiff = l.pts - w.pts) %>%
  select(-c(X, w.id, l.id), game.id, week, 
         w.conference, w.rank, w.name, w.abbrvs, w.pts, w.ptdiff, 
         l.conference, l.rank, l.name, l.abbrvs, l.pts, l.ptdiff) %>%
  gather(key, value, w.conference:l.ptdiff) %>% 
  separate(key, c("outcome", "type")) %>%
  spread(type, value, convert = TRUE)