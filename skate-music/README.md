
This folder contains all of the data used in The Pudding essay [The Good, the Rad, and the Gnarly](https://pudding.cool/2018/06/skate-music/) published in June 2018.

Below you'll find metadata for each file.

## time_series.tsv

-   **What is this?**: This is the data set for the first chart (the 'joy plot') in the skateboard-music article. It represents the ingredient lists from 211 chocolate chip cookie recipes, all scaled to yield 48 servings and with the units standardized.
-   **Source(s) & Methodology**: Skate videos uploaded to <a href="http://skatevideosite.com">skatevideosite</a> were scraped, genre was classified via Spotify's API (then by hand), and a moving average of genre popularity was computed (see example <a href="https://github.com/halhen/viz-pub/blob/master/sports-time-of-day/2_gen_chart.R">here</a>.
-   **Last Modified**: December 10, 2017.
-   **Contact Information**: Please contact [Jared Wilber](mailto:jdwlbr@gmail.com). 
-   **Spatial Applicability**: NA
-   **Temporal Applicability**: The time range that is represented is skateboard videos released prior to December 2017.

| Header | Description | Data Type |
|---|---|---|
| `genre` | Genre of music. The genres come from my broad genre bins: 'Classic Rock', 'Indie/Alternative', 'Hip Hop', 'Other', 'Rock', 'Metal', 'Electronic', 'Punk', or 'Jazz/Soul'.|text|
| `time` | Year.| number |
| `p` | Percentage used, corresponding to a particular genre for a particular year. | number |
| `maxp` | The maximum percentage across all genres and years.| number |
| `p_peak` | Same as `p` (whoops). I forgot to delete it. | number |
| `p_smooth` | Moving average percentage use. | number |
    
## waffle.csv

-   **What is this?**: This is the data for the second chart (the 'waffle chart'). It represents the genre-usage distribution for 32 skateboard companies.
-   **Source(s) & Methodology**: Skate videos uploaded to <a href="http://skatevideosite.com">skatevideosite</a> were scraped, genre was classified via Spotify's API, then binned into broader genres by hand.
-   **Last Modified**: December 10, 2017.
-   **Contact Information**: Please contact [Jared Wilber](mailto:jdwlbr@gmail.com). 
-   **Spatial Applicability**: NA
-   **Temporal Applicability**: The time range that is represented is skateboard videos released prior to December 2017..

| Header | Description | Data Type |
|---|---|---|
| `source` | Genre of music. The genres come from my broad genre bins: 'Classic Rock', 'Indie/Alternative', 'Hip Hop', 'Other', 'Metal', 'Electronic', 'Punk', or 'Jazz/Soul'.|text|
| `value` | Percentage of associated genre used in skate-videos by corresponding company, multiplied by 1000.| number |
| `company` | Skateboard company. | text |

## soundtrack_data.csv

-   **What is this?**: This is the data for the third chart (the 'bubble chart'). It represents the genre-usage distribution for 32 skateboard companies.
-   **Source(s) & Methodology**: Skate videos uploaded to <a href="http://skatevideosite.com">skatevideosite</a> were scraped, genre was classified via Spotify's API, then binned into broader genres by hand.
-   **Last Modified**: December 10, 2017.
-   **Contact Information**: Please contact [Jared Wilber](mailto:jdwlbr@gmail.com). 
-   **Spatial Applicability**: NA
-   **Temporal Applicability**: The time range that is represented is skateboard videos released prior to December 2017..

| Header | Description | Data Type |
|---|---|---|
| `artist` | Name of musical artist/group.|text|
| `tote` | Total number of times artist is used across skate-videos.| number |
| `group` | Popularity group for toggle option. Either 'high', 'medium', or 'low'. | text |
| `genre_fake` | Fake genre column for testing purposes. I should have deleted this - don't use it. | text |
| `year` | Most popular year for artist. This is from a toggle option we didn't end up using in the final version of the chart. | text |
| `genre` | Genre of music. The genres come from my broad genre bins: 'Classic Rock', 'Indie/Alternative', 'Hip Hop', 'Other', 'Metal', 'Electronic', 'Punk', or 'Jazz/Soul'. | text |
| `id` | Index. Think of this as a key for unique artists. | number |


