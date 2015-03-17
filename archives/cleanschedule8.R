# This file contains clean schedule 8, which is the addition of pre-season rankings and final rankings. 

week0.rankings <- data.frame(game.id = rep(0, 25), week = rep(0, 25), outcome = rep(2, 25), 
                             abbrvs = rep("", 25), conference = rep("", 25), name = rep("", 25), 
                             pts = rep(0, 25), rank = 25:1)
week0.rankings$abbrvs <- c("LOU", "BST", "UF", "KST", "STAN", "TCU", "OKST", "OSU", "NEB", "VT", "TEX", "CLEM", 
                           "MSU", "WIS", "WV", "ARK", "SC", "MICH", "FSU", "UGA", "ORE", "OU", "LSU", 
                           "BAMA", "USC")
week0.rankings$conference <- c("Big East", "Mountain West", "Southeastern", "Big 12", "Pac-12", 
                               "Big 12", "Big 12", "Big Ten", "Big Ten", "Atlantic Coastal", 
                               "Big 12", "Atlantic Coastal", "Big Ten", "Big Ten", "Big 12", 
                               "Southeastern", "Southeastern", "Big Ten", "Atlantic Coastal", "Southeastern", 
                               "Pac-12", "Big 12", "Southeastern", "Southeastern", "Pac-12")
week0.rankings$name <- c("Lousiville", "Boise State", "Florida", "Kansas State", "Stanford", "Texas Christian", 
                         "Oklahoma State", "Ohio State", "Nebraska", "Virginia Tech", "Texas", "Clemson", 
                         "Michigan State", "Wisconsin", "West Virginia", "Arkansas", "South Carolina", 
                         "Michigan", "Florida State", "Georgia", "Oregon", "Oklahoma", "Louisiana State", 
                         "Alabama", "Southern California")

week17.rankings <- data.frame(game.id = 841:865, week = rep(17, 25), outcome = rep(2, 25), 
                              abbrvs = rep("", 25), conference = rep(" ", 25), name = rep("", 25), 
                              pts = rep(0, 25), rank = 25:1)
week17.rankings$abbrvs <- c("NEB", "MICH", "VAND", "NIU", "SJSU", "ORST", "TEX", "BST", "NU", "UTST", 
                            "OU", "LSU", "LOU", "KSU", "CLEM", "FSU", "UF", "SC", "STAN", "TAMU", "UGA", 
                            "ND", "OSU", "ORE", "BAMA")
week17.rankings$conference <- c("Big Ten", "Big Ten", "Southeastern", "Mid-American", "Western Athletic", 
                                "Pac-12", "Big 12", "Mountain West", "Big Ten", "Western Athletic", 
                                "Big 12", "Southeastern", "Big East", "Big 12", "Atlantic Coastal", 
                                "Atlantic Coastal", "Southeastern", "Southeastern", "Pac-12", "Southeastern", 
                                "Southeastern", "Independent", "Big Ten", "Pac-12", "Southeastern")
week17.rankings$name <- c("Nebraska", "Michigan", "Vanderbilt", "Northern Illinois", "San Jose State", 
                          "Oregon State", "Texas", "Boise State", "Northwestern", "Utah State", "Oklahoma", 
                          "Louisiana State", "Louisville", "Kansas State", "Clemson", "Florida State", 
                          "Florida", "South Carolina", "Stanford", "Texas A&M", "Georgia", "Notre Dame", 
                          "Ohio State", "Oregon", "Alabama")

clean.sched8 <- tbl_df(rbind(week0.rankings, clean.sched7, week17.rankings))

# write.csv(clean.sched8, file = "cleanschedule8.csv")



