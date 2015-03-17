Quidditch-Analytics
===================

Theory of advanced wizardry for optimized broom vu and snitch graph networks  

Let's start cleaning up this repo, Johnny.

#### File information and their respective CSVs

*teamcharacteristics.csv* - manual input of team characteristics were recorded from Wikipedia and various sites to gather conference and abbreviations. 

*cleanschedule.R* & *cleanschedule.csv* - data frame which consists of the variables: week, winner rank, winner, winnter points, location, loser rank, loser, and loser points

*cleanschedule1-5.R* & *cleanschedule5.csv* - data frame which consists of the merging of the files *teamcharacteristics.csv* and *cleanschedule.R* as well as various cleaning of the data. Also, from now on (3/16/15), *cleanschedule1-5.R* will be named *cleanschedule5.R*. 

*cleanschedulePTDIFF.R* - code which consists of adding a pt differential column transforming the file of *cleanschedule5.R*. 

*cleanscheduleWITHtidyr.R* & *cleanscheduleWITHtidyr.csv* - data frame which transformed *cleanschedule5.csv/cleanschedule.R* into a **tidy** data set.

*cleanscheduleSANStidy.R* & *cleanscheduleSANStidy.csv* - data frame which Jonathan transformed *cleanschedule5.csv/cleanschedule.R* into a **tidy** data set WITHOUT USING THE TIDYR PACKAGE. 

*cleanschedule8.R* & *cleanschedule8.csv* - data frame which altered *cleanscheduleWITHtidyr.R/cleanscheduleWITHtidyr.csv* by adding pre-season and end-of-season rankings. 




