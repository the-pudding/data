
This folder contains all of the data used in The Pudding essay [Sing My Name](https://pudding.cool/2019/05/names-in-songs) published in May 2019.

This file was last updated: May 16, 2019

## allNames.csv & allNames.R

  - `allNames.R`: The script used to process a file of song lyrics
    (that, due to copyright issues we can’t release), to create
    `allNames.csv`. Some manual cleaning was conducted on the data, as
    described below.

  - `allNames.csv`: The data, as described below
    
      - **What is this?**: A file containing each line of song lyrics in
        which a name was found
      - **Source(s) & Methods**: All songs used in this analysis were on
        the US Billboard Hot 100 list at least once since the chart’s
        inception in 1958. Song lyrics were obtained primarily through
        MetroLyrics. Many thanks to Colin Morris for providing lyric
        data for songs popular prior to 2017 (used in his project on
        repetition in pop music). Since these lyrics are user submitted,
        it is possibly (and even likely) that there are spelling errors
        that I was unable to compensate for. Over 15,000 songs that met
        the above criteria were analyzed, and of those, 5,195 contained
        a name (as defined below). To identify names in song lyrics, I
        used US national-level baby name data from the Social Security
        Administration (downloaded from Kaggle). Since there were over
        93,000 names in this dataset, I limited my search to just those
        names that have been used as names at least 5,000 times since
        the 1950’s. This resulted in 3,607 names. I then searched
        through the song lyrics for any instance of any name in this
        dataset. Using the R package udpipe, I tagged each name with a
        part of speech to eliminate uses of words that were used as
        verbs (e.g., Will the person vs. “I will do something”) or
        adjectives (e.g., “baby girl”). I intended to retain only names
        tagged as proper nouns, but since song lyrics are not always
        grammatically correct, part of speech tagging can be inaccurate.
        Thus, I also manually checked the data, removing instances of
        names that were not being used as proper nouns. There were a few
        other manual corrections made. Last names presented as surnames
        (e.g., “Kennedy” in “John F. Kennedy”) were removed, but if the
        surname stood on its own (e.g. “I am the realest since Kennedy”)
        it could have been referring to a first name, so it was
        retained. Names that appeared to refer to a non-person (e.g.,
        places, brands, drug references, colors, seasons, etc.) have
        been denoted in the `nonPerson` column. Double word names (e.g.,
        Barbara Ann) were adjusted manually to count as a single entity
        rather than counting as “Barbara” and “Ann”.
      - **Last Modified**: May 16, 2019
      - **Contact Information**: [Amber
        Thomas](mailto:amber@pudding.cool)
      - **Spatial Applicability**: Based on United States Billboard
        Rankings
      - **Temporal Applicability**: Songs that made it to Billboard Hot
        100 between 1958 and April 2019.
      - **Observations (Rows)**: There are 20626 rows in this dataset.
        Each row represents a single line in a song.
      - **Variables (Columns)**: There are 8 columns in this dataset.
        They are described
below:

| Header      | Description                                                                                                                                                                                                       | Data Type |
| :---------- | :---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | :-------- |
| artist      | The name of the artist (including featured artists)                                                                                                                                                               | character |
| song        | Song Title                                                                                                                                                                                                        | character |
| sentence    | The line of song lyrics that contained a name                                                                                                                                                                     | character |
| highestRank | The highest rank this song hit on the Billboard Hot 100 Charts                                                                                                                                                    | character |
| year        | The earliest year that this song was on the charts                                                                                                                                                                | character |
| nonPerson   | Whether or not this name likely refers to a non-person (for instance, “Molly” is a name, but often also a drug reference). `NA` indicates that the name was manually determined to most likely refer to a person. | character |
| name        | Name detected in the lyrics                                                                                                                                                                                       | character |

## letters.csv

  - `letters.R`: The script used to process a file of lyrics
    (`allNames.csv`) that include a name. This dataset was derived from
    `allNames.csv`, so refer to that file’s `Source` field for more
    information on how this data was collected. These data were used in
    the “Lettering” section of the “Sing My Name” Pudding story.

  - `letters.csv`: The data, as described below
    
      - **What is this?**: The difference between usage of the first and
        last letters of names as used in song lyrics and in society.

  - **Source(s) & Methods**: See the `Source(s) & Methods` section of
    `allNames.csv` for more information. Calculated as the difference
    between the percentage of names mentioned in at least one song that
    starts or ends with a letter and the percentage of names that have
    been used as names in the US at least 5,000 times since 1950 that
    start or end with that letter.

  - **Last Modified**: May 16, 2019

  - **Contact Information**: [Amber Thomas](mailto:amber@pudding.cool)

  - **Spatial Applicability**: Based on United States Billboard Rankings

  - **Temporal Applicability**: Songs that made it to Billboard Hot 100
    between 1958 and April 2019.

  - **Observations (Rows)**: There are 102 rows in this dataset. Each
    row represents a letter and associated condition, both as a first or
    last letter in a name, and when names are only those that refer to
    people vs. when they could refer to brands, seasons, cars, etc.

  - **Variables (Columns)**: There are 4 columns in this dataset. They
    are described
below:

| Header   | Description                                                                                                                                                                  | Data Type |
| :------- | :--------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | :-------- |
| letter   | A single letter of the alphabet                                                                                                                                              | character |
| dif      | The difference between the percentage of names that start or end with this letter in songs as compared to society. A negative value is more common in society than in songs. | numeric   |
| position | Whether the letter is the first or last letter in a name                                                                                                                     | character |
| person   | Whether or not the name refers to a person (if `FALSE` could refer to a brand, drug, month, season, etc.)                                                                    | logical   |

## onlyNames.csv

  - **What is this?**: Names that, according to the Social Security
    Administration, have been used in the US at least 5,000 times since
    the 1950’s.
  - **Source(s) & Methods**: Data was accessed from
    [Kaggle](https://www.kaggle.com/kaggle/us-baby-names), and filtered
    to only include years after 1950.
  - **Last Modified**: May 16, 2019
  - **Contact Information**: [Amber Thomas](mailto:amber@pudding.cool)
  - **Spatial Applicability**: United States
  - **Temporal Applicability**: 1950 - 2014
  - **Observations (Rows)**: There are 3607 rows in this dataset.Each
    row represents a single name.
  - **Variables (Columns)**: There are 2 columns in this dataset. They
    are described
below:

| Header | Description                                                | Data Type |
| :----- | :--------------------------------------------------------- | :-------- |
| name   | The name as spelled by the Social Security Administration  | character |
| count  | The number of babies born and given that name (since 1950) | integer   |

## repeats.csv & repeats.R

  - `repeats.R`: The script used to process a file of lyrics
    (`allNames.csv`) that include a name. This dataset was derived from
    `allNames.csv`, so refer to that file’s `Source` field for more
    information on how this data was collected. These data were used in
    the “Repeat Names” section of the “Sing My Name” Pudding story.

  - `repeats.csv`: The data, as described below
    
      - **What is this?**: A dataset of the most popular name mentioned
        in over 15,000 top songs
      - **Source(s) & Methods**: See the `Source(s) & Methods` section
        of `allNames.csv` for more information.
      - **Last Modified**: May 16, 2019
      - **Contact Information**: [Amber
        Thomas](mailto:amber@pudding.cool)
      - **Spatial Applicability**: Based on United States Billboard
        Rankings
      - **Temporal Applicability**: Songs that made it to Billboard Hot
        100 between 1958 and April 2019.
      - **Observations (Rows)**: There are 5946 rows in this dataset.
        Each row represents a single song.
      - **Variables (Columns)**: There are 5 columns in this dataset.
        They are described
below:

| Header | Description                                                                                                         | Data Type |
| :----- | :------------------------------------------------------------------------------------------------------------------ | :-------- |
| artist | The artist of the song                                                                                              | character |
| song   | Song title                                                                                                          | character |
| person | Whether or not a name likely represents a person (if `FALSE` the name may be referencing a drug, brand, month etc.) | logical   |
| name   | The most popular name detected in the song                                                                          | character |
| n      | The count of times that the name is used in the song                                                                | integer   |

## timeless\_names.csv

  - `timeless_names.R`: The script used to process a file of lyrics
    (`allNames.csv`) that include a name. This dataset was derived from
    `allNames.csv`, so refer to that file’s `Source` field for more
    information on how this data was collected. These data were used in
    the “Timeless Names” section of the “Sing My Name” Pudding story.

  - `timeless_names.csv`: The data, as described below
    
      - **What is this?**: Dataset giving the top 10 names per decade
        (based on number of songs that use the name)
      - **Source(s) & Methods**: See the `Source(s) & Methods` section
        of `allNames.csv` for more information.
      - **Last Modified**: May 16, 2019
      - **Contact Information**: [Amber
        Thomas](mailto:amber@pudding.cool)
      - **Spatial Applicability**: Based on United States Billboard
        Rankings
      - **Temporal Applicability**: Songs that made it to Billboard Hot
        100 between 1958 and April 2019.
      - **Observations (Rows)**: There are 120 rows in this dataset.
        Each row represents a single name & condition. That is, “Molly”,
        may show up twice in a single decade if it is used at least once
        to refer to a person and also to refer to a drug. The usage is
        distinguishable by the `person` column.
      - **Variables (Columns)**: There are 5 columns in this dataset.
        They are described
below:

| Header | Description                                                                                               | Data Type |
| :----- | :-------------------------------------------------------------------------------------------------------- | :-------- |
| decade | The earlist decade that the song appeared on the Billboard Hot 100 (starting in the 1960’s)               | numeric   |
| name   | The name identified in the song lyrics                                                                    | character |
| n      | The count of songs that included each name in a decade                                                    | integer   |
| rank   | The numeric rank (1-10) of this name’s popularity per decade                                              | integer   |
| person | Whether or not the name refers to a person (if `FALSE` could refer to a brand, drug, month, season, etc.) | logical   |

## unique\_by\_artist.csv & unique\_by\_artist.R

  - `unique_by_artist.R`: The script used to process a file of lyrics
    (`allNames.csv`) that include a name. This dataset was derived from
    `allNames.csv`, so refer to that file’s `Source` field for more
    information on how this data was collected. These data were used in
    the “Unique Names” section of the “Sing My Name” Pudding story.

  - `unique_by_artist.csv`: The data, as described below
    
      - **What is this?**: A dataset showing the count of unique names
        used by each artist
      - **Source(s) & Methods**: See the `Source(s) & Methods` section
        of `allNames.csv` for more information.
      - **Last Modified**: May 16, 2019
      - **Contact Information**: [Amber
        Thomas](mailto:amber@pudding.cool)
      - **Spatial Applicability**: Based on United States Billboard
        Rankings
      - **Temporal Applicability**: Songs that made it to Billboard Hot
        100 between 1958 and April 2019.
      - **Observations (Rows)**: There are 8771 rows in this dataset.
        Each row represents one name, usage, and artist combination.
        That is, “Molly”, may show up twice in a single artist’s
        repertoire if it is used at least once to refer to a person and
        also to refer to a drug.
      - **Variables (Columns)**: There are 5 columns in this dataset.
        They are described
below:

| Header | Description                                                                                               | Data Type |
| :----- | :-------------------------------------------------------------------------------------------------------- | :-------- |
| artist | Name of the song’s artist                                                                                 | character |
| person | Whether or not the name refers to a person (if `FALSE` could refer to a brand, drug, month, season, etc.) | logical   |
| name   | The name of the person identified in a song                                                               | character |
| names  | The count of songs that use this name (by a specific artist)                                              | integer   |
| songs  | The total number of songs by that artist in our database.                                                 | integer   |

## unique.csv & unique.R

  - `unique.R`: The script used to process a file of lyrics
    (`allNames.csv`) that include a name. This dataset was derived from
    `allNames.csv`, so refer to that file’s `Source` field for more
    information on how this data was collected. These data were used in
    the “Unique Names” & “Popular Names” sections of the “Sing My Name”
    Pudding story.

  - `unique.csv`: The data, as described below
    
      - **What is this?**: Dataset representing the unique names used in
        each song.
      - **Source(s) & Methods**: See the `Source(s) & Methods` section
        of `allNames.csv` for more information.
      - **Last Modified**: May 16, 2019
      - **Contact Information**: [Amber
        Thomas](mailto:amber@pudding.cool)
      - **Spatial Applicability**: Based on United States Billboard
        Rankings
      - **Temporal Applicability**: Songs that made it to Billboard Hot
        100 between 1958 and April 2019.
      - **Observations (Rows)**: There are 9785 rows in this dataset.
        Each row represents one name & usage combination in each
        individual song. That is, “Molly”, may show up twice in a single
        song if it is used at least once to refer to a person and also
        to refer to a drug.
      - **Variables (Columns)**: There are 7 columns in this dataset.
        They are described
below:

| Header      | Description                                                                                                | Data Type |
| :---------- | :--------------------------------------------------------------------------------------------------------- | :-------- |
| artist      | Name of the song’s artist                                                                                  | character |
| name        | The person’s name identified in the song                                                                   | character |
| song        | Song title                                                                                                 | character |
| person      | Whether or not the name likely refers to a person (if `FALSE` may refer to a drug, month, brand, car etc.) | logical   |
| sentence    | An example of the lyrics used in a song when mentioning the name                                           | character |
| year        | The earliest year that the song appeared on the Billboard Hot 100                                          | numeric   |
| highestRank | The highest rank that the song reached on the Billboard Hot 100                                            | numeric   |

## Session Info

    ## ─ Session info ──────────────────────────────────────────────────────────
    ##  setting  value                       
    ##  version  R version 3.4.4 (2018-03-15)
    ##  os       macOS  10.14.4              
    ##  system   x86_64, darwin15.6.0        
    ##  ui       RStudio                     
    ##  language (EN)                        
    ##  collate  en_US.UTF-8                 
    ##  ctype    en_US.UTF-8                 
    ##  tz       America/Los_Angeles         
    ##  date     2019-05-16                  
    ## 
    ## ─ Packages ──────────────────────────────────────────────────────────────
    ##  package     * version    date       lib
    ##  assertthat    0.2.1      2019-03-21 [1]
    ##  backports     1.1.4      2019-04-10 [1]
    ##  callr         3.1.1      2018-12-21 [1]
    ##  cli           1.1.0      2019-03-19 [1]
    ##  crayon        1.3.4      2017-09-16 [1]
    ##  curl          3.3        2019-01-10 [1]
    ##  desc          1.2.0      2019-05-08 [1]
    ##  devtools      2.0.2      2019-04-08 [1]
    ##  digest        0.6.18     2018-10-10 [1]
    ##  dplyr         0.8.0.1    2019-02-15 [1]
    ##  evaluate      0.13       2019-02-12 [1]
    ##  fs            1.3.1      2019-05-06 [1]
    ##  glue          1.3.1.9000 2019-05-09 [1]
    ##  here          0.1        2017-05-28 [1]
    ##  htmltools     0.3.6      2017-04-28 [1]
    ##  knitr         1.22.10    2019-05-16 [1]
    ##  magrittr      1.5        2014-11-22 [1]
    ##  memoise       1.1.0      2017-04-21 [1]
    ##  packrat       0.5.0      2018-11-14 [1]
    ##  pillar        1.4.0      2019-05-11 [1]
    ##  pkgbuild      1.0.2      2018-10-16 [1]
    ##  pkgconfig     2.0.2      2018-08-16 [1]
    ##  pkgload       1.0.2      2018-10-29 [1]
    ##  prettyunits   1.0.2      2015-07-13 [1]
    ##  processx      3.3.0      2019-03-10 [1]
    ##  ps            1.3.0      2018-12-21 [1]
    ##  puddingR    * 0.0.0.9000 2019-05-17 [1]
    ##  purrr         0.3.2      2019-03-15 [1]
    ##  R6            2.4.0      2019-02-14 [1]
    ##  Rcpp          1.0.1      2019-03-17 [1]
    ##  remotes       2.0.2      2018-10-30 [1]
    ##  rlang         0.3.4      2019-04-07 [1]
    ##  rmarkdown     1.12       2019-03-14 [1]
    ##  rprojroot     1.3-2      2018-01-03 [1]
    ##  rstudioapi    0.10       2019-03-19 [1]
    ##  sessioninfo   1.1.1      2018-11-05 [1]
    ##  stringi       1.4.3      2019-03-12 [1]
    ##  stringr       1.4.0      2019-02-10 [1]
    ##  testthat      2.0.0      2017-12-13 [1]
    ##  tibble        2.1.1      2019-03-16 [1]
    ##  tidyselect    0.2.5      2018-10-11 [1]
    ##  usethis       1.5.0      2019-04-07 [1]
    ##  withr         2.1.2      2018-03-15 [1]
    ##  xfun          0.7        2019-05-14 [1]
    ##  yaml          2.2.0      2018-07-25 [1]
    ##  source                               
    ##  CRAN (R 3.4.4)                       
    ##  CRAN (R 3.4.4)                       
    ##  CRAN (R 3.4.4)                       
    ##  CRAN (R 3.4.4)                       
    ##  CRAN (R 3.4.1)                       
    ##  CRAN (R 3.4.4)                       
    ##  Github (r-lib/desc@c860e7b)          
    ##  CRAN (R 3.4.4)                       
    ##  CRAN (R 3.4.4)                       
    ##  CRAN (R 3.4.4)                       
    ##  CRAN (R 3.4.4)                       
    ##  CRAN (R 3.4.4)                       
    ##  Github (tidyverse/glue@ea0edcb)      
    ##  CRAN (R 3.4.0)                       
    ##  CRAN (R 3.4.0)                       
    ##  Github (yihui/knitr@97e3d80)         
    ##  CRAN (R 3.4.0)                       
    ##  CRAN (R 3.4.0)                       
    ##  CRAN (R 3.4.4)                       
    ##  CRAN (R 3.4.4)                       
    ##  CRAN (R 3.4.4)                       
    ##  CRAN (R 3.4.4)                       
    ##  CRAN (R 3.4.4)                       
    ##  CRAN (R 3.4.0)                       
    ##  CRAN (R 3.4.4)                       
    ##  CRAN (R 3.4.4)                       
    ##  Github (the-pudding/puddingR@63e3315)
    ##  CRAN (R 3.4.4)                       
    ##  CRAN (R 3.4.4)                       
    ##  CRAN (R 3.4.4)                       
    ##  CRAN (R 3.4.4)                       
    ##  CRAN (R 3.4.4)                       
    ##  CRAN (R 3.4.4)                       
    ##  CRAN (R 3.4.3)                       
    ##  CRAN (R 3.4.4)                       
    ##  CRAN (R 3.4.4)                       
    ##  CRAN (R 3.4.4)                       
    ##  CRAN (R 3.4.4)                       
    ##  CRAN (R 3.4.3)                       
    ##  CRAN (R 3.4.4)                       
    ##  CRAN (R 3.4.4)                       
    ##  CRAN (R 3.4.4)                       
    ##  CRAN (R 3.4.4)                       
    ##  CRAN (R 3.4.4)                       
    ##  CRAN (R 3.4.4)                       
    ## 
    ## [1] /Library/Frameworks/R.framework/Versions/3.4/Resources/library
