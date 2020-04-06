This folder contains the primary dataset used in The Pudding article ["Just how does Kidz Bop censor songs?"](https://pudding.cool/2020/04/kidz-bop/) published in April 2020. Data analysis was done using the [Genuis API](https://docs.genius.com/), the [Spotify API](https://developer.spotify.com/d), and [R](https://www.r-project.org/), plus *A LOT* of manual wrangling.

The data will never be updated.

Below you'll find metadata for the dataset.

## KB_censored-lyrics.csv

- **What is this?**: Censored lyrics in Kidz Bop Songs
- **Source(s) & Methodology**: [Genuis API](https://docs.genius.com/), [Spotify API](https://developer.spotify.com/d), [R](https://www.r-project.org/)
- **Last Modified**: April 2020
- **Contact Information**: [Jan Diehm](mailto:jan@pudding.cool)
- **Temporal Applicability**: 2001 through 2019
- **Observations (Rows)**: Each row represents a censored lyric
- **Variables (Columns)**:

| Header                    | Description                                            | Data Type                   |
| ------------------------- | ------------------------------------------------------ | --------------------------- |
| `ogArtist`                | original artist                                        | text                        |
| `songName`                | song name                                              | text                        |
| `badword`                 | word being censored                                    | text                        |
| `count`                   | the number of times the badword appears                | number                      |
| `category`                | the type of badword                                    | text                        |
| `year`                    | release year of the Kidz Bop album with the song       | number                      |
| `isCensored`              | 1 = the word is censored (all values will be 1)        | binary                      |
| `isPresent`               | 1 = the word is present (all values will be 1)         | binary                      |
| `ogLyric`                 | original lyric                                         | text                        |
| `kbLyric`                 | Kidz Bop lyric                                         | text                        |


## KB_proportions.csv

- **What is this?**: Porportion of bad words that were censored when present
- **Source(s) & Methodology**: [Genuis API](https://docs.genius.com/), [Spotify API](https://developer.spotify.com/d), [R](https://www.r-project.org/)
- **Last Modified**: April 2020
- **Contact Information**: [Jan Diehm](mailto:jan@pudding.cool)
- **Temporal Applicability**: 2001 through 2019
- **Observations (Rows)**: Each row represents a year
- **Variables (Columns)**:

| Header                    | Description                                            | Data Type                   |
| ------------------------- | ------------------------------------------------------ | --------------------------- |
| `year`                    | year                                                   | number                      |
| `alcohol`                 | proportion of badwords categorized as 'alcohol & drugs'| number                      |
| `sexual`                  | proportion of badwords categorized as 'sexual'         | number                      |
| `profanity`               | proportion of badwords categorized as 'profanity'      | number                      |
| `identity`                | proportion of badwords categorized as 'identity'       | number                      |
| `other`                   | proportion of badwords categorized as 'other'          | number                      |
| `violence`                | proportion of badwords categorized as 'violence'       | number                      |

_Note: badwords were manually categorized (examples below)._

| Category                  | Example words                                          |
| ------------------------- | ------------------------------------------------------ |
| `alcohol`                 | 'beer', 'champagne', 'cigarette'                       |
| `sexual`                  | 'bang', 'kiss', 'touch'                                |
| `profanity`               | 'ass', 'damn', 'shit'                                  |
| `identity`                | 'gay', 'man', 'woman'                                  |
| `other`                   | 'ballin', 'god', 'tattoo'                              |
| `violence`                | 'cut', 'fight', 'kill',                                |


## KB_group-overview.csv

- **What is this?**: Count of badwords and censorship by category
- **Source(s) & Methodology**: [Genuis API](https://docs.genius.com/), [Spotify API](https://developer.spotify.com/d), [R](https://www.r-project.org/)
- **Last Modified**: April 2020
- **Contact Information**: [Jan Diehm](mailto:jan@pudding.cool)
- **Temporal Applicability**: none
- **Observations (Rows)**: Each row represents a category
- **Variables (Columns)**:

| Header                    | Description                                                               | Data Type                   |
| ------------------------- | ------------------------------------------------------------------------- | --------------------------- |
| `category`                | badword category as detailed above                                        | text                        |
| `inSongs`                 | number of original songs where a word in this category is present         | number                      |
| `censored`                | number of Kidz Bop songs where a word in this category is censored        | number                      |
| `pctCensored`             | rate of censorship by category                                            | number                      |


## KB_word-overview.csv

- **What is this?**: Count of badwords and censorship
- **Source(s) & Methodology**: [Genuis API](https://docs.genius.com/), [Spotify API](https://developer.spotify.com/d), [R](https://www.r-project.org/)
- **Last Modified**: April 2020
- **Contact Information**: [Jan Diehm](mailto:jan@pudding.cool)
- **Temporal Applicability**: none
- **Observations (Rows)**: Each row represents a word
- **Variables (Columns)**:

| Header                    | Description                                                               | Data Type                   |
| ------------------------- | ------------------------------------------------------------------------- | --------------------------- |
| `category`                | badword category as detailed above                                        | text                        |
| `badword`                 | badword                                                                   | text                        |
| `inSongs`                 | number of original songs where the badword is present                     | number                      |
| `censored`                | number of Kidz Bop songs where the badword  is censored                   | number                      |
| `pctCensored`             | rate of censorship by badword                                             | number                      |
