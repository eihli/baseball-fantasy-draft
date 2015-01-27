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

year2013diff <- sweep(year2013[,3:7], 2, as.numeric(year_averages[1,2:6]))
year2013res <- year2013
year2013res[,3:7] <- year2013diff

year2014diff <- sweep(year2014[,3:7], 2, as.numeric(year_averages[1,2:6]))
year2014res <- year2014
year2014res[,3:7] <- year2014diff

allyears <- rbind(year2012res, year2013res)
allyears <- rbind(allyears, year2014res)

