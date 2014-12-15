## This files cleans the csv file 'cleanschedule5.csv' and makes it nice and tidy. 
## Tidy data is the unoriginal, yet super obvious, but we're too lazy to do, idea
## coined by Hadley Wickham (in writing and in the 'tidyr' package) to create data
## that follows two conditions: EACH COLUMN IS A VARIABLE and EACH ROW IS AN OBSERVATION
## In 6 lines of code, using the packages tidyr and dplyr, we have tidy data.

library(tidyr)
library(dplyr)
??tidyr; ??dplyr
ls("package:tidyr")
ls("package:dplyr")

clean.sched6 <- tbl_df(read.csv("cleanschedule5.csv", stringsAsFactors = F))

# At first glance, I will probably not need the variables, X, w.id, and l.id. We'll worry about that later.

clean.sched7 <- clean.sched6 %>%
                  select(-c(X, w.id, l.id), game.id, w.conference, w.rank, w.name, w.abbrvs, w.pts, 
                                                     l.conference, l.rank, l.name, l.abbrvs, l.pts) %>%
                    gather(key, value, w.conference:l.pts) %>% 
                      separate(key, c("outcome", "type")) %>%
                        spread(type, value, convert = TRUE)







  

