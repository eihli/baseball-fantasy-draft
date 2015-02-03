# Fantasy Baseball League Draft Analysis

Update: 2015-01-29-21:16
The rules of this league are the same as Yahoo's Head to Head.
There are 5 hitting categories and 5 pitching categories.
You are competing head to head against a different team each week and you
get a point for each category you beat your opponent.

My ranking system will be to simulate each player against each other player using
projected 2015 stats. Each win is worth a point.
Players will then be ranked by points.

Probably going to do this with Python/Pandas.
Started off with an IPython Notebook.
[Second Draft Analysis](http://nbviewer.ipython.org/github/eihli/baseball-fantasy-draft/blob/master/Simulated-Rankings.ipynb)

That ended up being really easy.
Create a function that compares a players stats in the form of a Pandas Series to
the entire dataframe. You will get a boolean dataframe returned.
Sum the boolean dataframe and you get the number of wins.

The next step is going to be to figure out a way to weight picks based off positions.

For example:

If the top ranked positions are:

* CF
* 1B
* CF
* LF
* CF
* 3B
* SS
* 2B
* LF
* LF
* P

Then you would want to take the 1st baseman instead of the center fielder, since there are plenty of other high-ranking center
fielders to choose from but the next highest ranking 1st baseman is a long ways down.

Proposed solution:
Create a "priority rank" for each position. This will be the sum of the distance between the highest ranked player of such position and the second highest ranked player of such position, and between the 2nd highest and 3rd highest, etc...
