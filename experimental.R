#install.packages("googleVis")
library(googleVis)
plot(gvisMotionChart(clean.sched8, idvar = "name", timevar = "week", xvar = "rank", yvar = "pts", 
                     colorvar = "outcome"))
plot(gvisMotionChart(clean.schedPTDIFF, idvar = "name", timevar = "week", xvar = "rank", yvar = "ptdiff", 
                     colorvar = "outcome"))