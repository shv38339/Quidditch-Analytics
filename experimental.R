#install.packages("googleVis")
library(googleVis)
plot(gvisMotionChart(clean.sched8, idvar = "name", timevar = "week", xvar = "rank", yvar = "pts", 
                     colorvar = "outcome"))
plot(gvisMotionChart(clean.schedPTDIFF, idvar = "name", timevar = "week", xvar = "rank", yvar = "ptdiff", 
                     colorvar = "outcome"))

# Additionally, Jonathan's notes suggest we need an upset column, which could be easily computed if we 
# I make the ptdiff file soon enough.