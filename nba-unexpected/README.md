This folder contains the processed data for the story The Greatest Unexpected NBA Performances published in February 2023.

The data will never be updated.

Below you'll find the metadata for each file.

## nba.csv and wnba.csv

- **What is this?**: Data for each player's most unexpected performance between 1985-2022.
- **Source(s) & Methodology**: basketball-reference.com. More methods below.
- **Last Modified**: February 2023
- **Contact Information**: [Russell Samora](mailto:russell@pudding.cool)
- **Spatial Applicability**: N/A
- **Temporal Applicability**: 1985 - 2022
- **Observations (Rows)**: Each row represents one player and their top unexpected performance.
- **Variables (Columns)**:

| Header       | Description                              | Data Type |
| ------------ | ---------------------------------------- | --------- |
| `bbrID` | basketball-reference player id | text |
| `Date` | date of game | text |
| `Tm` | player's team during game | text |
| `Opp` | opponent team during game | text |
| `TRB` | total rebounds | number |
| `AST` | assists | number |
| `STL` | steals | number |
| `BLK` | blocks | number |
| `PTS` | points | number |
| `GmSc` | Gamescore | number |
| `Season` | season | text |
| `Playoffs` | was playoffs | boolean |
| `Year` | year | number |
| `GameIndex` | game number in career | number |
| `GmScMovingZ` | z-score of game from moving average | number |
| `GmScMovingZTop2Delta` | difference between top 2 games' z-scores | number |
| `Date2` | date of second game | text |
| `GmSc2` | Gamescore of second game | number |
| `GmScMovingZ2` | z-score of second game from moving average  | number |

## Method
* Only players that started their careers on or after the 84-85 season, when Gamescore was avaiable.
* Minimum season length is one season (NBA = 82, WNBA = 36)
* Moving average calculated using a centered-window with +/- a season's-worth of games on either side (window: NBA = 164, WNBA = 72)
