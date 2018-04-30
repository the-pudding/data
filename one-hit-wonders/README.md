This folder contains all of the data used in The Pudding article [One-Hit Wonders in Sports](https://pudding.cool/2018/04/one-hit-onders/) published in April 2018.

Below you'll find metadata for each file.

## data.csv

* **What is this?**: Data for 8 sport leagues in the last 30 years of players who finished in the top 20 in their respective sport at the end of a season.
* **Source(s)**: Data was collected from the following sources; NBA and WNBA: basketball-reference.com, MLB: FanGraphs, PGA: pgatour.com, LPGA: lpga.com, NHL: hockey-reference.com, ATP: github.com/serve-and-volley, WTA: github.com/JeffSackmann.
* **Last Modified**: April 26, 2018
* **Contact Information**: [Russell Goldenberg](mailto:russell@polygraph.cool)
* **Spatial Applicability**: United States
* **Temporal Applicability**: 1988 - 2017
* **Variables (Columns)**:

| Header            | Description                                                                | Data Type |
| ----------------- | -------------------------------------------------------------------------- | --------- |
| `id`              | unique player id                                                           | text      |
| `name`            | full player name                                                           | text      |
| `year`            | year of season (or last year if spanning two)                              | number    |
| `year_index`      | zero-based year of career                                                  | number    |
| `total_players`   | number of documented players that year                                     | number    |
| `peak_year_index` | the index of the year the player peaked                                    | number    |
| `rank`            | competition rank of the player according to stat_val                       | number    |
| `dnp`             | if they did not play                                                       | boolean   |
| `sport_name`      | name of sport                                                              | text      |
| `league`          | name of league                                                             | text      |
| `stat_prop`       | name of stat used to rank                                                  | text      |
| `stat_val`        | value of stat used to rank                                                 | number    |
| `played_prop`     | name of units (eg. games) played property in data                          | text      |
| `played_val`      | number of units (eg. games) played                                         | number    |
| `played_2_prop`   | name of units (eg. games) played property in data (secondary for baseball) | text      |
| `played_2_val`    | number of units (eg. games) played (secondary)                             | number    |
| `team`            | team name                                                                  | text      |
| `pos`             | position                                                                   | text      |
