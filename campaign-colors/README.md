This folder contains the primary datasets used in The Pudding article ["How candidate diversity impacts color diversity"](https://pudding.cool/2020/08/campaign-colors/) published in August 2020. 

The data will never be updated.

Below you'll find metadata.

## colors.csv

- **What is this?**: 271 presidential candidate logo designs tagged by if they use a red, white, and blue (RWB) color scheme
- **Source(s) & Methodology**: [Georgetown University](https://repository.library.georgetown.edu/bitstream/handle/10822/1041823/gnovis_Spring2016_BibleCrainDaizoviAlHabsiZhao_PoliticalBrandingInUSElections.pdf?sequence=1&isAllowed=y), [4President.org](http://4president.org/), [methodology explained at the bottom of the article](https://pudding.cool/2020/08/campaign-colors/), [images found here](https://github.com/the-pudding/campaign-colors/tree/master/src/assets/images)
- **Last Modified**: August 2020
- **Contact Information**: [Jan Diehm](mailto:jan@pudding.cool)
- **Temporal Applicability**: ever 4 years between 1968–2020
- **Observations (Rows)**: Each row represents a presidential candidate
- **Variables (Columns)**:

| Header                    | Description                                            | Data Type                   |
| ------------------------- | ------------------------------------------------------ | --------------------------- |
| `name`                    | candidate name                                         | text                        |
| `year`                    | election year                                          | number                      |
| `party`                   | political party (i.e. Democratic, Republican, etc.)    | text                        |
| `white`                   | Y = white candidate, N = candidate of color            | binary                      |
| `male`                    | Y = male candidate, N = female candidate               | binary                      |
| `whiteMale`               | TRUE = white male candidate, FALSE = not               | boolean                     |
| `RWB`                     | Y = logo uses RWB colors, N = logo use non-RWB colors  | binary                      |
| `redHex`                  | the hexidecimal value for the red color                | text                        |
| `whiteHex`                | the hexidecimal value for the white color              | text                        |
| `blueHex`                 | the hexidecimal value for the blue color               | text                        |
| `other1Hex`               | the hexidecimal value for the first other color        | text                        |
| `other2Hex`               | the hexidecimal value for the second other color       | text                        |
| `other3Hex`               | the hexidecimal value for the third other color        | text                        |
| `image`                   | jpg of the candidate logo                              | jpg                         |


## years.csv

- **What is this?**: Percentage of non-RWB and RWB color schemes by year
- **Source(s) & Methodology**: Compiled from colors.csv
- **Last Modified**: August 2020
- **Contact Information**: [Jan Diehm](mailto:jan@pudding.cool)
- **Temporal Applicability**: ever 4 years between 1968–2020
- **Observations (Rows)**: Each row represents a year
- **Variables (Columns)**:

| Header                    | Description                                                      | Data Type                   |
| ------------------------- | ---------------------------------------------------------------- | --------------------------- |
| `year`                    | year                                                             | number                      |
| `rwb_n`                   | number of non-RWB logos                                          | number                      |
| `rwb_y`                   | number of RWB logos                                              | number                      |
| `total`                   | number of totallogos                                             | number                      |
| `percent_n`               | percentage of non-RWB logos                                      | number                      |
| `percent_y`               | percentage of RWB logos                                          | number                      |

