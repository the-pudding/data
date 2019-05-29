This folder contains all of the data used in The Pudding essay The NBA Has a Defensive Three Seconds Problem published in May 2019.

The data will never be updated.

Below you'll find the metadata for each file.

## three-seconds.csv

-   **What is this?**: Data of every defensive three seconds call in the NBA between 2015-2018 (including playoffs).
-   **Source(s) & Methodology**: NBA.com play-by-play data.
-   **Last Modified**: May 2019
-   **Contact Information**: [Owen Phillips](mailto:owenlhjphillips@gmail.com)
-   **Spatial Applicability**: United States
-   **Temporal Applicability**: NBA Seasons of 2015-16 through 2018-19 (not including playoffs for the last season)
-   **Observations (Rows)**: Each row represents one foul call.
-   **Variables (Columns)**:

| Header | Description | Data Type |
| --- | --- | --- |
| `gameid` | unique game identifier | number |
| `quarter` | quarter in which foul occured | number |
| `clock` | time on clock | text |
| `season` | years of season | text |
| `season.type` | regular or playoff | text | 
| `description` | notes about the foul including players involved | text |
