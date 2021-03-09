This folder contains all of the data used in The Pudding essay [Where will you need your umbrella?](https://pudding.cool/2020/02/rain/) published in February 2020.

This file was last updated: February 24, 2020

## annual_precipitation.csv & annual_precipitation.R

- **What is this?**: The R scripts and resulting data documenting
  average annual rainfall and total rainfall for 2019 for 640 weather
  stations across the US.
- **Source(s) & Methods**: All of the data used in this story came
  from the Global Historical Climatology Network (GHCN)-Daily
  [database](https://www.ncdc.noaa.gov/ghcn-daily-description) and was
  acquired from the National Oceanic and Atmospheric Administration’s
  (NOAA) [open data
  server](ftp://ftp.ncdc.noaa.gov/pub/data/ghcn/daily/by_year/). While
  this database contains data from thousands of weather stations
  worldwide, we filtered the data down to only include weather
  stations with consistent daily precipitation recordings from January
  1, 2010 - December 31, 2019. Further, some of these stations were
  located in mountain ranges or other areas away from cities. To make
  the comparison to cities like Seattle more relevant, we used
  [Geocod.io](https://geocod.io/) to find the nearest city or town to
  the latitude and longitude of each weather station. If no city or
  town could be located with an Accuracy Score of 0.8 that weather
  station was excluded. Ultimately, 640 weather stations remained in
  our analysis and the data for those weather stations is included
  here, along with the R script to download and filter all of the
  data.
- **Last Modified**: February 23, 2020
- **Contact Information**: [Amber Thomas](mailto:amber@pudding.cool)
- **Spatial Applicability**: These data represent weather stations
  within the US.
- **Temporal Applicability**: January 1, 2010 - December 31, 2019.
- **Observations (Rows)**: There are 640 rows in this dataset. Each
  row represents an individual weather station.
- **Variables (Columns)**: There are 10 columns in this dataset. They
  are described
  below:

| Header    | Description                                                                                                                              | Data Type |
| :-------- | :--------------------------------------------------------------------------------------------------------------------------------------- | :-------- |
| id        | The GHCN ID for each weather station                                                                                                     | character |
| city      | The closest city to the weather station (as determined by [Geocod.io](https://geocod.io), based on the station’s latitude and longitude) | character |
| station   | The name of each weather station                                                                                                         | character |
| average   | The mean annual rainfall (in inches) per year at each weather station from 2010 - 2019                                                   | numeric   |
| latitude  | The latitude of the weather station                                                                                                      | numeric   |
| longitude | The longitude of the weather station                                                                                                     | numeric   |
| state     | The state that the weather station is located in                                                                                         | character |
| total19   | Total annual rainfall (in inches) for each weather station in 2019 only                                                                  | numeric   |

## daily_precipitation.csv & daily_precipitation.R

- **What is this?**: The R scripts and resulting data documenting
  total daily precipitation in 2019 for 640 weather stations across
  the US.
- **Source(s) & Methods**: All of the data used in this story came
  from the Global Historical Climatology Network (GHCN)-Daily
  [database](https://www.ncdc.noaa.gov/ghcn-daily-description) and was
  acquired from the National Oceanic and Atmospheric Administration’s
  (NOAA) [open data
  server](ftp://ftp.ncdc.noaa.gov/pub/data/ghcn/daily/by_year/). While
  this database contains data from thousands of weather stations
  worldwide, we filtered the data down to only include weather
  stations with consistent daily precipitation recordings from January
  1, 2010 - December 31, 2019. Further, some of these stations were
  located in mountain ranges or other areas away from cities. To make
  the comparison to cities like Seattle more relevant, we used
  [Geocod.io](https://geocod.io/) to find the nearest city or town to
  the latitude and longitude of each weather station. If no city or
  town could be located with an Accuracy Score of 0.8 that weather
  station was excluded. Ultimately, 640 weather stations remained in
  our analysis and the data for those weather stations is included
  here, along with the R script to download and filter all of the
  data.
- **Last Modified**: February 23, 2020
- **Contact Information**: [Amber
  Thomas](mailto:YOUR-EMAIL@pudding.cool)
- **Spatial Applicability**: These data represent weather stations
  within the US.
- **Temporal Applicability**: January 1, 2019 - December 31, 2019
- **Observations (Rows)**: There are 233,600 rows in this dataset.
  Each row represents a single day for a single weather station.
- **Variables (Columns)**: There are 10 columns in this dataset. They
  are described
  below:

| Header    | Description                                                                                                                              | Data Type |
| :-------- | :--------------------------------------------------------------------------------------------------------------------------------------- | :-------- |
| id        | The GHCN ID for each weather station                                                                                                     | character |
| city      | The closest city to the weather station (as determined by [Geocod.io](https://geocod.io), based on the station’s latitude and longitude) | character |
| station   | The name of each weather station                                                                                                         | character |
| date      | Date of data collection (in mm/dd/yyyy format)                                                                                           | Date      |
| value     | Amount of precipitation (in inches)                                                                                                      | numeric   |
| latitude  | The latitude of the weather station                                                                                                      | numeric   |
| longitude | The longitude of the weather station                                                                                                     | numeric   |
| state     | The state that the weather station is located in                                                                                         | character |

## Session Info

    ## ─ Session info ────────────────────────────────────────────────────────────────────────────────────────
    ##  setting  value
    ##  version  R version 3.6.2 (2019-12-12)
    ##  os       macOS Mojave 10.14.6
    ##  system   x86_64, darwin15.6.0
    ##  ui       RStudio
    ##  language (EN)
    ##  collate  en_US.UTF-8
    ##  ctype    en_US.UTF-8
    ##  tz       America/Los_Angeles
    ##  date     2020-02-24
    ##
    ## ─ Packages ────────────────────────────────────────────────────────────────────────────────────────────
    ##  package     * version    date       lib source
    ##  assertthat    0.2.1      2019-03-21 [1] CRAN (R 3.6.0)
    ##  backports     1.1.5      2019-10-02 [1] CRAN (R 3.6.0)
    ##  broom         0.5.3      2019-12-14 [1] CRAN (R 3.6.0)
    ##  callr         3.4.0      2019-12-09 [1] CRAN (R 3.6.0)
    ##  cellranger    1.1.0      2016-07-27 [1] CRAN (R 3.6.0)
    ##  cli           2.0.1      2020-01-08 [1] CRAN (R 3.6.0)
    ##  colorspace    1.4-1      2019-03-18 [1] CRAN (R 3.6.0)
    ##  crayon        1.3.4      2017-09-16 [1] CRAN (R 3.6.0)
    ##  curl          4.3        2019-12-02 [1] CRAN (R 3.6.0)
    ##  DBI           1.1.0      2019-12-15 [1] CRAN (R 3.6.0)
    ##  dbplyr        1.4.2      2019-06-17 [1] CRAN (R 3.6.0)
    ##  desc          1.2.0      2018-05-01 [1] CRAN (R 3.6.0)
    ##  devtools      2.2.1      2019-09-24 [1] CRAN (R 3.6.0)
    ##  digest        0.6.23     2019-11-23 [1] CRAN (R 3.6.0)
    ##  dplyr       * 0.8.3      2019-07-04 [1] CRAN (R 3.6.0)
    ##  ellipsis      0.3.0      2019-09-20 [1] CRAN (R 3.6.0)
    ##  evaluate      0.14       2019-05-28 [1] CRAN (R 3.6.0)
    ##  fansi         0.4.1      2020-01-08 [1] CRAN (R 3.6.0)
    ##  forcats     * 0.4.0      2019-02-17 [1] CRAN (R 3.6.0)
    ##  fs            1.3.1      2019-05-06 [1] CRAN (R 3.6.0)
    ##  generics      0.0.2      2018-11-29 [1] CRAN (R 3.6.0)
    ##  ggplot2     * 3.2.1      2019-08-10 [1] CRAN (R 3.6.0)
    ##  glue          1.3.1      2019-03-12 [1] CRAN (R 3.6.0)
    ##  gtable        0.3.0      2019-03-25 [1] CRAN (R 3.6.0)
    ##  haven         2.2.0      2019-11-08 [1] CRAN (R 3.6.0)
    ##  here        * 0.1        2017-05-28 [1] CRAN (R 3.6.0)
    ##  highr         0.8        2019-03-20 [1] CRAN (R 3.6.0)
    ##  hms           0.5.3      2020-01-08 [1] CRAN (R 3.6.0)
    ##  htmltools     0.4.0      2019-10-04 [1] CRAN (R 3.6.0)
    ##  httr          1.4.1      2019-08-05 [1] CRAN (R 3.6.0)
    ##  jsonlite      1.6        2018-12-07 [1] CRAN (R 3.6.0)
    ##  knitr         1.26       2019-11-12 [1] CRAN (R 3.6.0)
    ##  lattice       0.20-38    2018-11-04 [1] CRAN (R 3.6.2)
    ##  lazyeval      0.2.2      2019-03-15 [1] CRAN (R 3.6.0)
    ##  lifecycle     0.1.0      2019-08-01 [1] CRAN (R 3.6.0)
    ##  lubridate   * 1.7.4      2018-04-11 [1] CRAN (R 3.6.0)
    ##  magrittr      1.5        2014-11-22 [1] CRAN (R 3.6.0)
    ##  memoise       1.1.0      2017-04-21 [1] CRAN (R 3.6.0)
    ##  modelr        0.1.5      2019-08-08 [1] CRAN (R 3.6.0)
    ##  munsell       0.5.0      2018-06-12 [1] CRAN (R 3.6.0)
    ##  nlme          3.1-143    2019-12-10 [1] CRAN (R 3.6.0)
    ##  packrat       0.5.0      2018-11-14 [1] CRAN (R 3.6.0)
    ##  pillar        1.4.3      2019-12-20 [1] CRAN (R 3.6.0)
    ##  pkgbuild      1.0.6      2019-10-09 [1] CRAN (R 3.6.0)
    ##  pkgconfig     2.0.3      2019-09-22 [1] CRAN (R 3.6.0)
    ##  pkgload       1.0.2      2018-10-29 [1] CRAN (R 3.6.0)
    ##  prettyunits   1.1.0      2020-01-09 [1] CRAN (R 3.6.0)
    ##  processx      3.4.1      2019-07-18 [1] CRAN (R 3.6.0)
    ##  ps            1.3.0      2018-12-21 [1] CRAN (R 3.6.0)
    ##  puddingR    * 0.0.0.9000 2020-01-12 [1] Github (the-pudding/puddingR@3e26a08)
    ##  purrr       * 0.3.3      2019-10-18 [1] CRAN (R 3.6.0)
    ##  R6            2.4.1      2019-11-12 [1] CRAN (R 3.6.0)
    ##  Rcpp          1.0.3      2019-11-08 [1] CRAN (R 3.6.0)
    ##  readr       * 1.3.1      2018-12-21 [1] CRAN (R 3.6.0)
    ##  readxl        1.3.1      2019-03-13 [1] CRAN (R 3.6.0)
    ##  remotes       2.1.0      2019-06-24 [1] CRAN (R 3.6.0)
    ##  reprex        0.3.0      2019-05-16 [1] CRAN (R 3.6.0)
    ##  rlang         0.4.2      2019-11-23 [1] CRAN (R 3.6.0)
    ##  rmarkdown     2.0        2019-12-12 [1] CRAN (R 3.6.0)
    ##  rprojroot     1.3-2      2018-01-03 [1] CRAN (R 3.6.0)
    ##  rstudioapi    0.10       2019-03-19 [1] CRAN (R 3.6.0)
    ##  rvest         0.3.5      2019-11-08 [1] CRAN (R 3.6.0)
    ##  scales        1.1.0      2019-11-18 [1] CRAN (R 3.6.0)
    ##  sessioninfo   1.1.1      2018-11-05 [1] CRAN (R 3.6.0)
    ##  stringi       1.4.5      2020-01-11 [1] CRAN (R 3.6.2)
    ##  stringr     * 1.4.0      2019-02-10 [1] CRAN (R 3.6.0)
    ##  testthat      2.3.1      2019-12-01 [1] CRAN (R 3.6.0)
    ##  tibble      * 2.1.3      2019-06-06 [1] CRAN (R 3.6.0)
    ##  tidyr       * 1.0.0      2019-09-11 [1] CRAN (R 3.6.0)
    ##  tidyselect    0.2.5      2018-10-11 [1] CRAN (R 3.6.0)
    ##  tidyverse   * 1.3.0      2019-11-21 [1] CRAN (R 3.6.0)
    ##  usethis       1.5.1      2019-07-04 [1] CRAN (R 3.6.0)
    ##  vctrs         0.2.1      2019-12-17 [1] CRAN (R 3.6.0)
    ##  withr         2.1.2      2018-03-15 [1] CRAN (R 3.6.0)
    ##  xfun          0.11       2019-11-12 [1] CRAN (R 3.6.0)
    ##  xml2          1.2.2      2019-08-09 [1] CRAN (R 3.6.0)
    ##  yaml          2.2.0      2018-07-25 [1] CRAN (R 3.6.0)
    ##  zeallot       0.1.0      2018-01-28 [1] CRAN (R 3.6.0)
    ##
    ## [1] /Library/Frameworks/R.framework/Versions/3.6/Resources/library
