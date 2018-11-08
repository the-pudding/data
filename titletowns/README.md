This folder contains all of the data used in The Pudding article [The Winningest Cities in North American Sports](https://pudding.cool/2018/11/titletowns/) published in November 2018.

Below you'll find metadata for each file.

## titles.csv

- 	**What is this?**: Data for every championship win in six pro sports leagues and six college sports, 1870-2018
-   **Source(s)**: Data was collected from the following sources: **MLB**: baseball-reference.com; **NBA**: basketball-reference.com; **NFL**: pro-football-reference.com; **NHL**: hockey-reference.com; **MLS**: worldfootball.net; **CFL**: cfhof.ca; **NCAA**: ncaa.com, sports-reference.com/cbb, sports-reference.com/cfb
-   **Last Modified**: November 7, 2018
-   **Contact Information**: [Sam Vickars](mailto:sam.vickars@gmail.com)
-   **Spatial Applicability**: United States and Canada
-   **Temporal Applicability**: 1870-November 2018
-   **Observations (Rows)**: Each row represents data from a single championship. Each year may have more than one year.
-   **Variables (Columns)**:

| Header | Description | Data Type |
|---|---|---|
| `index` | Index of championship. | number |
| `year` | Year of championship (year the title was actually won). | date |
| `level` | Level of competition title was won at, `pro` or `college`. | text |
| `sport` | Sport or league in which title was won (e.g., `Football (M)` or `NFL`). | text |
| `winner` | Winning team name. | text |
| `winner_metro` | Winning team metro area (e.g. `New York Metro Area`), based on United States MSAs | text |
| `runner_up` | Runner up team name. | text |
| `runner_up_metro` | Runner up metro area. | text |
| `final_four3` | Name of the third team in the final four (*Not available in college football*). | text |
| `final_four3_metro` | Metro area of the third team in the final four (*Not available in college football*). | text |
| `final_four4` | Name of the remaining team in the final four (*Not available in college football*). | text |
| `final_four4_metro` | Metro area of the remaining team in the final four (*Not available in college football*). | text |

## metros.json

- 	**What is this?**: Data for every metro area to field a pro or div 1 NCAA sports team, 1870-2018
-   **Source(s)**: Data was collected from the following sources: MLB: baseball-reference.com; NBA: basketball-reference.com; NFL: pro-football-reference.com; NHL: hockey-reference.com; MLS: worldfootball.net; CFL: cfhof.ca; NCAA: ncaa.com, sports-reference.com/cbb, sports-reference.com/cfb
-   **Last Modified**: November 7, 2018
-   **Contact Information**: [Sam Vickars](mailto:sam.vickars@gmail.com)
-   **Spatial Applicability**: United States and Canada
-   **Temporal Applicability**: 1870-November 2018
-   **Variables (Columns)**:

| Header | Description | Data Type |
|---|---|---|
| `metro` | Metro area. | text |
| `population` | Most recent population estimate for metro area. | text |
| `seasonArray` | Array of seasons in which at least one team representing this metro area played at least one game | date array |
| `teamArray` | Array of teams representing this metro area (see nested items below). | object array |

> *Data objects inside `teamArray` field above*

| Header | Description | Data Type |
|---|---|---|
| `team` | Team name. | text |
| `sport` | Sport or league the team plays/played (e.g. `Football (M)` or `NFL`). | text |
| `titles` | Array of years in which team won a title. | date array |
| `finals` | Array of years in which team won appeared in the finals. | date array |
| `finalFours` | Array of years in which team made a final four appearance. | date array |
| `seasons` | Array of years in which team played at least one game. | date array |

## case1.json

- 	**What is this?**: Data used in the first and third cases (title counts and titles vs population)
-   **Source(s)**: Data was collected from the following sources: MLB: baseball-reference.com; NBA: basketball-reference.com; NFL: pro-football-reference.com; NHL: hockey-reference.com; MLS: worldfootball.net; CFL: cfhof.ca; NCAA: ncaa.com, sports-reference.com/cbb, sports-reference.com/cfb
-   **Last Modified**: November 7, 2018
-   **Contact Information**: [Sam Vickars](mailto:sam.vickars@gmail.com)
-   **Spatial Applicability**: United States and Canada
-   **Temporal Applicability**: 1870-November 2018
-   **Variables (Columns)**:

| Header | Description | Data Type |
|---|---|---|
| `key` | Metro area. | text |
| `values` | Array of championship winning teams (see nested items below). | object array |
| `population` | Most recent population estimate for metro area. | text |
| `seasons` | Number of seasons played by teams representing this metro area in each sport (see nested items below). | nested values |

> *Data objects inside `values` field above*

| Header | Description | Data Type |
|---|---|---|
| `year` | Title season. | date |
| `team` | Title-winning team. | text |
| `sport` | Sport or league (e.g. `Football (M)` or `NFL`). | text |

> *Values inside `seasons` field above*

| Header | Description | Data Type |
|---|---|---|
| `mlb` | Number of seasons played by city in the MLB. | number |
| `nba` | Number of seasons played by city in the NBA. | number |
| `nfl` | Number of seasons played by city in the NFL. | number |
| `nhl` | Number of seasons played by city in the NHL. | number |
| `mls` | Number of seasons played by city in the MLS. | number |
| `cfl` | Number of seasons played by city in the CFL. | number |
| `baseball_m` | Number of seasons played by city in NCAA div 1 men's baseball. | number |
| `basketball_m` | Number of seasons played by city in NCAA div 1 men's basketball. | number |
| `basketball_w` | Number of seasons played by city in NCAA div 1 women's basketball. | number |
| `football_m` | Number of seasons played by city in NCAA div 1 men's football. | number |
| `soccer_w` | Number of seasons played by city in NCAA div 1 women's soccer. | number |
| `volleyball_w` | Number of seasons played by city in NCAA div 1 women's volleyball. | number |

## case2.json

- 	**What is this?**: Data used in the second case (timeline)
-   **Source(s)**: Data was collected from the following sources: MLB: baseball-reference.com; NBA: basketball-reference.com; NFL: pro-football-reference.com; NHL: hockey-reference.com; MLS: worldfootball.net; CFL: cfhof.ca; NCAA: ncaa.com, sports-reference.com/cbb, sports-reference.com/cfb
-   **Last Modified**: November 7, 2018
-   **Contact Information**: [Sam Vickars](mailto:sam.vickars@gmail.com)
-   **Spatial Applicability**: United States and Canada
-   **Temporal Applicability**: 1870-November 2018
-   **Variables (Columns)**:

| Header | Description | Data Type |
|---|---|---|
| `metro` | Metro area. | text |
| `seasons` | Array of all seasons in which at least one team representing this metro area played at least one game (see nested items below). | object array |

> *Data objects inside `seasons` field above*

| Header | Description | Data Type |
|---|---|---|
| `season` | Season year. | date |
| `teams` | Array of competing teams for this season. | object array |

> *Data objects inside `teams` field above*

| Header | Description | Data Type |
|---|---|---|
| `team` | Competing team. | text |
| `sport` | Sport or league (e.g. `Football (M)` or `NFL`). | text |
| `result` | Season result, `title`, `finals`, `finalFour`, or `season`. | text |
