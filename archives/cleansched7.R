# This file contains cleansched7, which is the addition of pre-season rankings and final rankings
# to the file cleansched6

week0rankings <- data.frame(game.id = rep(0, 25), week = rep(0, 25), outcome = rep(2, 25), 
                             abbrvs = rep("", 25), conference = rep("", 25), 
                             id = c(84, 18, 46, 75, 161, 172, 129, 127, 
                                    104, 190, 169, 33, 94, 202, 196, 10, 
                                    148, 93, 50, 55, 130, 128, 80, 3, 156),  
                             name = rep("", 25), ptdiff = rep(0, 25), pts = rep(0, 25), rank = 25:1)

week0rankings$abbrvs <- c("LOU", "BST", "UF", "KSU", "STAN", "TCU", "OKST", "OSU", 
                           "NEB", "VT", "TEX", "CLEM", "MSU", "WIS", "WV", "ARK", "SC", 
                           "MICH", "FSU", "UGA", "ORE", "OU", "LSU", "BAMA", "USC")

week0rankings$conference <- c("Big East", "Mountain West", "Southeastern", "Big 12", "Pac-12", 
                               "Big 12", "Big 12", "Big Ten", "Big Ten", "Atlantic Coastal", 
                               "Big 12", "Atlantic Coastal", "Big Ten", "Big Ten", "Big 12", 
                               "Southeastern", "Southeastern", "Big Ten", "Atlantic Coastal", 
                               "Southeastern", "Pac-12", "Big 12", "Southeastern", "Southeastern", 
                               "Pac-12")

week0rankings$name <- c("Lousiville", "Boise State", "Florida", "Kansas State", "Stanford", "Texas Christian", 
                         "Oklahoma State", "Ohio State", "Nebraska", "Virginia Tech", "Texas", "Clemson", 
                         "Michigan State", "Wisconsin", "West Virginia", "Arkansas", "South Carolina", 
                         "Michigan", "Florida State", "Georgia", "Oregon", "Oklahoma", "Louisiana State", 
                         "Alabama", "Southern California")

week17rankings <- data.frame(game.id = 841:865, week = rep(17, 25), outcome = rep(2, 25), 
                              abbrvs = rep("", 25), conference = rep(" ", 25), 
                              id = c(104, 93, 186, 120, 145, 131, 169, 18, 122, 185, 128, 80, 
                                     84, 75, 33, 50, 46, 148, 161, 170, 55, 125, 127, 130, 3), 
                              name = rep("", 25), ptdiff = rep(0, 25), pts = rep(0, 25), rank = 25:1)

week17rankings$abbrvs <- c("NEB", "MICH", "VAN", "NIU", "SJSU", "ORST", "TEX", "BST", "NU", "UTST", 
                            "OU", "LSU", "LOU", "KSU", "CLEM", "FSU", "UF", "SC", "STAN", "TAMU", "UGA", 
                            "ND", "OSU", "ORE", "BAMA")

week17rankings$conference <- c("Big Ten", "Big Ten", "Southeastern", "Mid-American", "Western Athletic", 
                                "Pac-12", "Big 12", "Mountain West", "Big Ten", "Western Athletic", 
                                "Big 12", "Southeastern", "Big East", "Big 12", "Atlantic Coastal", 
                                "Atlantic Coastal", "Southeastern", "Southeastern", "Pac-12", "Southeastern", 
                                "Southeastern", "Independent", "Big Ten", "Pac-12", "Southeastern")
week17rankings$name <- c("Nebraska", "Michigan", "Vanderbilt", "Northern Illinois", "San Jose State", 
                          "Oregon State", "Texas", "Boise State", "Northwestern", "Utah State", "Oklahoma", 
                          "Louisiana State", "Louisville", "Kansas State", "Clemson", "Florida State", 
                          "Florida", "South Carolina", "Stanford", "Texas A&M", "Georgia", "Notre Dame", 
                          "Ohio State", "Oregon", "Alabama")

cleansched7 <- tbl_df(rbind(week0rankings, cleansched6, week17rankings))



