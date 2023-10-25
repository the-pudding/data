This folder contains data from [inpredictable](https://www.inpredictable.com/) on clutch shooting in the NBA and WNBA. We have stopped working on this project, but would welcome [story pitches](https://pudding.cool/pitch/) using this data!

Below you'll find metadata for each file.

## nba.csv

This file contains all NBA players who took shots who took clutch shots going back throught the 1996-97 season. Read more about quantifying clutchness [here](https://www.inpredictable.com/2014/03/measuring-clutch-play-in-nba.html). We started with a list of the most clutch shots (~64,000 total) and aggregated it by player.

| Header                | Description                                                                                                                                            | Data Type |
| --------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------ | --------- |
| `pid`                 | Player id                                                                                                                                              | integer   |
| `bbrid`               | [Basketball Reference](https://www.basketball-reference.com/) id                                                                                       | text      |
| `name`                | Player name                                                                                                                                            | text      |
| `fta_clutch`          | Number of clutch free throws attempted                                                                                                                 | integer   |
| `ft_pct_clutch`       | Percent of clutch free throws made                                                                                                                     | float     |
| `total_clutch_shots`  | Number of clutch shots taken                                                                                                                           | integer   |
| `pct_clutch`          | Percent of clutch shots made                                                                                                                           | float     |
| `ft_pct_all`          | Percent of all free throws made                                                                                                                        | float     |
| `gp_all`              | Number of games played (including playoffs)                                                                                                            | integer   |
| `pct_clutch_adjusted` | Percent of clutch shots made, normalized for distance/difficulty of the shots                                                                          | float     |
| `swg_made_per_game`   | Cummulative swing of all made clutch shots divided by games played. Swing is the difference between the team's win probability if the shot is made vs. if it was missed. The size of that gap is the swing value (greater values represent more clutch / high stakes moments). `swg_made_per_game` be thought of the player's average impact (on the team's win probability), normalized for games played. | float     |

## wnba.csv

Same thing, but for the WNBA.

| Header              | Description                                                                                                                                            | Data Type |
| ------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------ | --------- |
| `pid`               | Player ID                                                                                                                                              | integer   |
| `name`              | Player's name                                                                                                                                          | text      |
| `bbrid`             | Basketball Reference ID                                                                                                                                | text      |
| `pct_adjusted`      | Percent of clutch shots made, normalized for distance/difficulty of the shots                                                                          | float     |
| `gp_all`            | Total games played                                                                                                                                     | integer   |
| `ft_pct_all`        | Percent of all free throws made                                                                                                                        | float     |
| `swg_made_per_game` | Cummulative swing of all made clutch shots divided by games played. Swing is the difference between the team's win probability if the shot is made vs. if it was missed. The size of that gap is the swing value (greater values represent more clutch / high stakes moments). `swg_made_per_game` be thought of the player's average impact (on the team's win probability), normalized for games played. | float     |
