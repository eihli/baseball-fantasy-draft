Batting <- read.csv('lahman/batting.csv')
Batting$AVG <- Batting$H / Batting$AB

df <- Batting[,c('yearID', 'playerID', 'HR', 'SB', 'RBI', 'AVG', 'R')]
df <- subset(df, yearID >=2012)
df <- replace(df, is.na(df), 0)
year_averages <- aggregate(df[,3:7], list(df$yearID), mean)

# What I want to do here is:
# For each row in df
# Subtract the vector of year_averages
# Where the yearID are equal.

# But I cannot figure out a concise way of doing it.
# So I process each year individually and then combine
# them with rbind at the end.

year2012 <- subset(df, yearID == 2012)
year2013 <- subset(df, yearID == 2013)
year2014 <- subset(df, yearID == 2014)

year2012diff <- sweep(year2012[,3:7], 2, as.numeric(year_averages[1,2:6]))
year2012res <- year2012
year2012res[,3:7] <- year2012diff

year2013diff <- sweep(year2013[,3:7], 2, as.numeric(year_averages[2,2:6]))
year2013res <- year2013
year2013res[,3:7] <- year2013diff

year2014diff <- sweep(year2014[,3:7], 2, as.numeric(year_averages[3,2:6]))
year2014res <- year2014
year2014res[,3:7] <- year2014diff

allyears <- rbind(year2012res, year2013res)
allyears <- rbind(allyears, year2014res)

# TODO:
# The above code should give you a data frame for all players
# for each year between 2012 and 2014 with stats for
# HR, SB, RBI, AVG, and R. The values of each stat should
# be the difference between each players actual stat and the
# yearly average. A positive stat means they outperformed the
# average. A negative stat means they underperformed.

# Group the dataframe by player. Calculate the difference between
# the 2013 year and the 2012 year, and the 2014 year and the
# 2013 year. Take the average of that difference.
# Create a vector of this number.  A postive number
# means a player's stats are on the rise.

# Add that vector to each players 2014 stats to create
# a vector of predicted 2015 stats.

# Sort the dataframe by players 2015 stats. 
# Pick players that are high on this list who also have a high
# average yearly increase.
