# Code containing point differential of loser and winner

# using cleansched5 as our core data set

# cleansched5 <- tbl_df(read.csv("cleansched5.csv", stringsAsFactors = F))

cleansched5.1 <- cleansched5 %>% mutate(w.ptdiff = w.pts - l.pts, l.ptdiff = l.pts - w.pts) %>%
  select(game.id, w.id, l.id, week, 
         w.conference, w.rank, w.name, w.abbrvs, w.pts, w.ptdiff, 
         l.conference, l.rank, l.name, l.abbrvs, l.pts, l.ptdiff)