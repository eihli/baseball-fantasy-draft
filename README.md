# Fantasy Baseball League Draft Analysis

Probably going to do this with Python/Pandas.
Started off with an IPython Notebook.
[First Draft Analysis](http://nbviewer.ipython.org/github/eihli/baseball-fantasy-draft/blob/master/First.ipynb)

##Strategy

Here is a quick rundown of ideas.
TODO: Clean up this readme with simple, precise, actionable steps

So here’s what I’m thinking…

We use the Lahman database to get a table with relevant stats
that look like this:
<table>
	<tr>
		<td>year</td>
		<td>player</td>
		<td>HR<</td>
		<td>Stolen</td>
		<td>RBI</td>
		<td>AVG</td>
	</tr>
	<tr>
		<td>2012</td>
		<td>john doe</td>
		<td>80</td>
		<td>5</td>
		<td>130</td>
		<td>.289</td>
	</tr>
	<tr>
		<td>2013</td>
		<td>john doe</td>
		<td>95</td>
		<td>6</td>
		<td>120</td>
		<td>.311</td>
	</tr>
</table>

2014  john doe 102 8 145 .315

2012 jim smith 75 4 120 .255

2013 jim smith 65 4 111 .249

etc…

Each year I get the average stat for all players. Like this:
AvgHR AvgStolen AvgRBI AvgAVG

2012 82.5 6.7 115 .298

2013 84.2 7.0 114 .302

etc…

I then compute the difference between each players stat and the average for all players.
So I would have a table that looks like this:

year player HR Stolen RBI AVG

2012 john doe -2.5 +1.7 +15 -0.09  (John doe is hitting 2.5 fewer home runs than average. Etc…)

2013 john doe +10.8 -1 +6 +0.09 (He improved in 2013 though and was above average.)

Then I compute what percentile each player is in for each stat and get a new table that looks like this:

year player HR Stolen RBI AVG

2012 john doe 51% 48% 60% 52%

2013 john doe 58% 47% 58% 54%

etc…

Then I can add up the percentiles for each player for each year. Players with a high total mean they do better than average in
all the relevant stats.

year player Total Percentile

2012 john doe 203

2013 john doe 217

etc…

Then I can calculate the average difference between each players stats for each year between 2012 and 2014, add that difference to their 2014 year, and get a prediction for their stats in the 2015 year.

Rank the players by this new prediction. Weight the ranking by Yahoo’s ADP. Adjust the ranking based off of position, keepers, etc…

How does it sound so far? Any suggestions?
