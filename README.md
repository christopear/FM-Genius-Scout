# FM Genius Scout

#### An expansion on [FM Genie Scout](https://www.fmscout.com/a-fm-genie-scout-18.html) This piece of code is for the data analysts/FM lovers.

## Introduction

In Football Manager, one of the most important things is finding good players. Using the in-game scouts is more "traditional", but for data analysts and min/maxers that's not enough. FM Genie Scout allows players to view an actual spreadsheet of all player data, allowing a much finer granularity for picking up key players.

This piece of work takes it a step further. By exporting all the players from FM Genie Scout to .CSV and cleaning it up, we can perform some basic analysis. While FM Genie Scout allows some basic filtering, this analysis allows us to find undervalued players more quickly. By pre-baking in some basic requirements, we can save time setting filters in FM Genie Scout and instead re-run the analysis.

## Methods

Unfortunately not much in the way of price modelling can be done: since FM Genie Scout has been inaccurate in its pricing predictions for many years now. However, rating and potential rating can still be used to find coups.

#### [clean.R](https://github.com/cajpearce/FM-Genius-Scout/blob/master/clean.R)

Simply processes the data and gets it into a consistent format. Long term goals of this would be to allow filtering by the only positions that the player is interested in.

#### [model.R](https://github.com/cajpearce/FM-Genius-Scout/blob/master/model.R)

The only analysis that is done is grouping by age and selecting the top players in a few key metrics. This is important to make sure that we're not ignoring young players when they're still not skilled in favour of older players with more skills but less potential.

## Results

The following table can be easily created in Excel that allows for quickly visualising who to target:

![FM wonderkids](https://raw.githubusercontent.com/cajpearce/FM-Genius-Scout/master/images/best%20players.PNG)

## Shortfalls

The major downside, however, is getting the names of players back into Football Manager. Currently you have to get your list of players - preferably in Excel - then go back into FM Genie Scout or FM and add them to a shortlist.
