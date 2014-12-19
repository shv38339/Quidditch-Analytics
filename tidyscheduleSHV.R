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

# At first glance, I will probably not need the variables, X, w.id, and l.id. 

clean.sched7 <- clean.sched6 %>%
                  select(-c(X, w.id, l.id), game.id, week, w.conference, w.rank, w.name, w.abbrvs, w.pts, 
                                                           l.conference, l.rank, l.name, l.abbrvs, l.pts) %>%
                    gather(key, value, w.conference:l.pts) %>% 
                      separate(key, c("outcome", "type")) %>%
                        spread(type, value, convert = TRUE)

clean.sched7$week <- ifelse(clean.sched7$week > 15, 16, clean.sched7$week) # big oops
clean.sched7$outcome <- ifelse(clean.sched7$outcome == "w", 1, 0)

# need to add week 17, which are the final rankings
week17.rankings <- data.frame(game.id = 841:865, week = rep(17, 25), outcome = rep(2, 25), 
                             abbrvs = rep("", 25), conference = rep(" ", 25), name = rep("", 25), 
                             pts = rep(0, 25), rank = 25:1)
week17.rankings$abbrvs <- c("NEB", "MICH", "VAND", "NIU", "SJSU", "ORST", "TEX", "BST", "NU", "UTST", 
                            "OU", "LSU", "LOU", "KSU", "CLEM", "FSU", "UF", "SC", "STAN", "TAMU", "UGA", 
                            "ND", "OSU", "ORE", "BAMA")
week17.rankings$conference <- c("Big Ten", "Big Ten", "Southeastern", "Mid-American", "Western Athletic", 
                                "Pac-12", "Big 12", "Mountain West", "Big Ten", "Western Athletic", 
                                "Big 12", "Southeastern", "Big East", "Big 12", "Atlantic Coast", 
                                "Atlantic Coast", "Southeastern", "Southeastern", "Pac-12", "Southeastern", 
                                "Southeastern", "Independent", "Big Ten", "Pac-12", "Southeastern")
week17.rankings$name <- c("Nebraska", "Michigan", "Vanderbilt", "Northern Illinois", "San Jose State", 
                          "Oregon State", "Texas", "Boise State", "Northwestern", "Utah State", "Oklahoma", 
                          "Louisiana State", "Louisville", "Kansas State", "Clemson", "Florida State", 
                          "Florida", "South Carolina", "Stanford", "Texas A&M", "Georgia", "Notre Dame", 
                          "Ohio State", "Oregon", "Alabama")

clean.sched8 <- tbl_df(rbind(clean.sched7, week17.rankings))






  

