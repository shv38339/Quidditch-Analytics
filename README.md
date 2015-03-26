Quidditch-Analytics - Steele H. Valenzuela & Jonathan Chiang
===================
<small> *Disclaimer: I'm horrible at naming objects.* </small>  

Theory of advanced wizardry for optimized broom vu and snitch graph networks.

### Real Purpose of Quidditch-Analytics

Hopeful ambitions of displaying college football 2012 schedule in networks with the help of the `d3` library. You don't want to know how much cleaning and collecting went into this project. You really don't. 

### Final Product

Please follow the instructions of the file *Networks.R* to view just that, the entire 2012 season. Additionally, follow the instructions of *Network_runthrough.Rmd* for additional visualizations.

### Coming Soon (3/21/15)

If I ever find the time, we'd like to create the following:

    * Shiny app for many other options, such as team's road to their respective bowl game (big maybe)

#### File information and their respective CSVs

*teamchr.csv* - manual input of team characteristics, which were recorded from Wikipedia and various sites to gather respective conferences and abbreviations. Note: team names are in alphabetical order

*cleanschedule.R* & *cleanschedule.csv* - data frame which consists of the variables: week, winner rank, winner, winnter points, location, loser rank, loser, and loser points

*cleansched5.R* & *cleansched5.csv* - data frame which consists of the merging of the files *teamchr.R* and *cleanschedule.R* as well as various cleaning of the data.

*cleansched5pt1.R* & *cleansched5pt1.csv* - code which consists of adding a point differential column transforming the file of *cleansched5.R*.

*cleansched6.R* & *cleansched6.csv* - data frame which transformed *cleansched5pt1.R* into a tidy data set, using the library `tidyr`.

*cleansched7.R* & *cleansched7.csv* - data frame which altered *cleansched6.R/cleansched6.csv* by adding pre-season and end-of-season rankings. 

*cleanscheduleSANStidy.R* & *cleanscheduleSANStidy.csv* - data frame which Jonathan transformed *cleansched5* into a **tidy** data set WITHOUT USING THE TIDYR PACKAGE. Quite impressive if you ask me. Also note: these files are located in the **fun** folder. 

### Contact Info

**eleetsvalenzuela@gmail.com** & **jichiang@umass.edu**


