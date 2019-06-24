
This folder contains all of the data used in The Pudding essay [My
Awesome Essay](https://pudding.cool) published in February 2018.

This file was last updated: June 24, 2019

## hipster.csv & hipster.R

  - **hipster.R**: The R code used to generate `hipster.csv` using the
    Seattle Public Library’s
    [checkout](https://data.seattle.gov/dataset/Checkouts-by-Title-Physical-Items-/3h5r-qv5w)
    and
    [inventory](https://data.seattle.gov/Community/Library-Collection-Inventory/6vkj-f5xf)
    datasets. The original datasets are too large to include here but
    can be accessed at the above links.

  - **hipster.csv**: Data file generated using `hipster.R` and with
    details as described below.
    
      - **What is this?**: Fiction books that are available for checkout
        in the Seattle Public Library but have not been checked out in
        the library’s data history (since 2005). This dataset includes
        data provided by the Seattle Public Library as well as manually
        collected details.
      - **Source(s) & Methods**: All books discussed in this article are
        fiction books that have appeared in the Seattle Public Library’s
        physical book inventory for the entire span of time between
        September 2017 and May 2019 (the earliest and latest dates
        available for these data) and are still available, but have not
        been checked out any time between September 2005 and May 2019.
        Since we don’t have inventory data from 2005 - 2017, there is a
        chance that some of these books may have entered the library’s
        collection during that time span. At the absolute minimum, all
        the books on our list have been in the inventory and have gone
        unchecked out since September 2017. Both
        [checkout](https://data.seattle.gov/dataset/Checkouts-by-Title-Physical-Items-/3h5r-qv5w)
        and
        [inventory](https://data.seattle.gov/Community/Library-Collection-Inventory/6vkj-f5xf)
        data are publicly available thanks to the Seattle Public
        Library. Any data indicated below as being manually collected,
        was from Goodreads or Worldcat databases.
      - **Last Modified**: June 24, 2019
      - **Contact Information**: [Amber
        Thomas](mailto:amber@pudding.cool)
      - **Spatial Applicability**: Seattle Public Library
      - **Temporal Applicability**: Books in inventory between September
        2017 and May 2019 that haven’t been checked out between
        September 2005 and May 2019.
      - **Observations (Rows)**: There are 304 rows in this dataset.
        Each row represents a single book.
      - **Variables (Columns)**: There are 13 columns in this dataset.
        They are described
below:

| Header           | Description                                                                                                                                                                                                                                                                         | Data Type |
| :--------------- | :---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | :-------- |
| Title            | The manually-cleaned book title                                                                                                                                                                                                                                                     | character |
| Author           | The manually-cleaned primary author’s name (as `last name, first name`)                                                                                                                                                                                                             | character |
| AuthorMore       | Any additional attributions (e.g., illustrator, translator etc) written as `(illustrator) last, first`                                                                                                                                                                              | character |
| Remove           | We removed any books from our final visualization that were published after 2005 or only appeared to be available in the Seattle region. Those books are indicated by a `TRUE` in this column. Blank in this column indicates that the book was included in our final visualization | logical   |
| Pages            | Number of pages (as specified by WorldCat)                                                                                                                                                                                                                                          | numeric   |
| WorldCatLink     | The (manually located) link to this book’s WorldCat page                                                                                                                                                                                                                            | character |
| GoodreadsLink    | The (manually located) link to this book’s Goodreads page (if it exists, otherwise blank)                                                                                                                                                                                           | character |
| GoodreadsRating  | The average rating for the book as indicated by Goodreads in June 2019 (if it exists, otherwise blank)                                                                                                                                                                              | numeric   |
| GoodreadsReviews | The total number of reviews on Goodreads at time of manual data collection (June 2019)                                                                                                                                                                                              | numeric   |
| PubYear          | The year of publication (according to the Seattle Public Library’s catalog data)                                                                                                                                                                                                    | numeric   |
| BibNum           | The Seattle Public Library’s Bibliographic number for each book                                                                                                                                                                                                                     | integer   |
| Subjects         | The combined subjects for each book of those found on WorldCat and in the library’s catalog                                                                                                                                                                                         | character |
| Parent           | Manually tagged “parent subject categories” (i.e. `pnw` for books that have one of the Pacific Northwest States or `Northwest` in their `Subjects` etc.)                                                                                                                            | character |

## Session Info

    ## Session info -------------------------------------------------------------

    ##  setting  value                       
    ##  version  R version 3.4.4 (2018-03-15)
    ##  system   x86_64, darwin15.6.0        
    ##  ui       RStudio (1.2.1335)          
    ##  language (EN)                        
    ##  collate  en_US.UTF-8                 
    ##  tz       America/Los_Angeles         
    ##  date     2019-06-24

    ## Packages -----------------------------------------------------------------

    ##  package     * version     date      
    ##  askpass       1.1         2019-01-13
    ##  assertthat    0.2.1       2019-03-21
    ##  backports     1.1.3       2018-12-14
    ##  base        * 3.4.4       2018-03-15
    ##  bit           1.1-14      2018-05-29
    ##  bit64         0.9-7       2017-05-08
    ##  blob          1.1.1       2018-03-25
    ##  broom         0.4.5       2018-07-03
    ##  cellranger    1.1.0       2016-07-27
    ##  chron         2.3-53      2018-09-09
    ##  cli           1.1.0       2019-03-19
    ##  colorspace    1.4-1       2019-03-18
    ##  compiler      3.4.4       2018-03-15
    ##  crayon        1.3.4       2017-09-16
    ##  curl          3.3         2019-01-10
    ##  data.table  * 1.12.0      2019-01-13
    ##  datasets    * 3.4.4       2018-03-15
    ##  DBI           1.0.0       2018-05-02
    ##  desc          1.2.0       2018-05-01
    ##  devtools      1.13.6      2018-06-27
    ##  digest        0.6.18      2018-10-10
    ##  dplyr       * 0.8.0.1     2019-02-15
    ##  DT          * 0.5         2018-11-05
    ##  ellipsis      0.1.0.9000  2019-06-18
    ##  evaluate      0.13        2019-02-12
    ##  forcats     * 0.4.0       2019-02-17
    ##  foreign       0.8-69      2017-06-22
    ##  fs            1.2.7       2019-03-19
    ##  ggplot2     * 3.1.0       2018-10-25
    ##  git2r         0.25.2      2019-03-19
    ##  glue        * 1.3.1       2019-03-12
    ##  googledrive * 0.1.3       2019-01-24
    ##  graphics    * 3.4.4       2018-03-15
    ##  grDevices   * 3.4.4       2018-03-15
    ##  grid          3.4.4       2018-03-15
    ##  gsubfn      * 0.7         2018-03-16
    ##  gtable        0.3.0       2019-03-25
    ##  haven         2.1.0       2019-02-19
    ##  here        * 0.1         2017-05-28
    ##  hms           0.4.2       2018-03-10
    ##  htmltools     0.3.6       2017-04-28
    ##  htmlwidgets   1.3         2018-09-30
    ##  httr          1.4.0       2018-12-11
    ##  jsonlite      1.6         2018-12-07
    ##  knitr         1.23.3      2019-06-24
    ##  lattice       0.20-35     2017-03-25
    ##  lazyeval      0.2.2       2019-03-15
    ##  lubridate   * 1.7.4       2018-04-11
    ##  magrittr      1.5         2014-11-22
    ##  memoise       1.1.0       2017-04-21
    ##  methods     * 3.4.4       2018-03-15
    ##  mnormt        1.5-5       2016-10-15
    ##  modelr        0.1.4       2019-02-18
    ##  munsell       0.5.0       2018-06-12
    ##  nlme          3.1-131.1   2018-02-16
    ##  openssl       1.3         2019-03-22
    ##  packrat       0.5.0       2018-11-14
    ##  parallel      3.4.4       2018-03-15
    ##  pillar        1.3.1       2018-12-15
    ##  pkgconfig     2.0.2       2018-08-16
    ##  plyr          1.8.4       2016-06-08
    ##  proto       * 1.0.0       2016-10-29
    ##  psych         1.8.12      2019-01-12
    ##  puddingR    * 0.0.0.9000  2019-06-24
    ##  purrr       * 0.3.2       2019-03-15
    ##  R6            2.4.0       2019-02-14
    ##  Rcpp          1.0.1       2019-03-17
    ##  readr       * 1.3.1       2018-12-21
    ##  readxl        1.3.1       2019-03-13
    ##  reshape2      1.4.3       2017-12-11
    ##  rlang       * 0.3.99.9003 2019-06-18
    ##  rmarkdown     1.12        2019-03-14
    ##  rprojroot     1.3-2       2018-01-03
    ##  RSQLite     * 2.1.1       2018-05-06
    ##  rstudioapi    0.10        2019-03-19
    ##  rvest         0.3.2       2016-06-17
    ##  scales        1.0.0       2018-08-09
    ##  sqldf       * 0.4-11      2017-06-28
    ##  stats       * 3.4.4       2018-03-15
    ##  stringi       1.4.3       2019-03-12
    ##  stringr     * 1.4.0       2019-02-10
    ##  tcltk         3.4.4       2018-03-15
    ##  tibble      * 2.1.1       2019-03-16
    ##  tidyr       * 0.8.3.9000  2019-06-18
    ##  tidyselect    0.2.5       2018-10-11
    ##  tidyverse   * 1.2.1       2017-11-14
    ##  tools         3.4.4       2018-03-15
    ##  usethis       1.4.0       2018-08-14
    ##  utils       * 3.4.4       2018-03-15
    ##  vctrs         0.1.0.9004  2019-06-18
    ##  withr         2.1.2       2018-03-15
    ##  xfun          0.5         2019-02-20
    ##  xml2          1.2.0       2018-01-24
    ##  yaml          2.2.0       2018-07-25
    ##  zeallot       0.1.0       2018-01-28
    ##  source                               
    ##  CRAN (R 3.4.4)                       
    ##  CRAN (R 3.4.4)                       
    ##  CRAN (R 3.4.4)                       
    ##  local                                
    ##  CRAN (R 3.4.4)                       
    ##  CRAN (R 3.4.0)                       
    ##  CRAN (R 3.4.4)                       
    ##  CRAN (R 3.4.4)                       
    ##  CRAN (R 3.4.0)                       
    ##  CRAN (R 3.4.4)                       
    ##  CRAN (R 3.4.4)                       
    ##  CRAN (R 3.4.4)                       
    ##  local                                
    ##  CRAN (R 3.4.1)                       
    ##  CRAN (R 3.4.4)                       
    ##  CRAN (R 3.4.4)                       
    ##  local                                
    ##  CRAN (R 3.4.4)                       
    ##  cran (@1.2.0)                        
    ##  CRAN (R 3.4.4)                       
    ##  CRAN (R 3.4.4)                       
    ##  CRAN (R 3.4.4)                       
    ##  CRAN (R 3.4.4)                       
    ##  Github (r-lib/ellipsis@d8bf8a3)      
    ##  CRAN (R 3.4.4)                       
    ##  CRAN (R 3.4.4)                       
    ##  CRAN (R 3.4.4)                       
    ##  CRAN (R 3.4.4)                       
    ##  CRAN (R 3.4.4)                       
    ##  CRAN (R 3.4.4)                       
    ##  CRAN (R 3.4.4)                       
    ##  CRAN (R 3.4.4)                       
    ##  local                                
    ##  local                                
    ##  local                                
    ##  CRAN (R 3.4.4)                       
    ##  CRAN (R 3.4.4)                       
    ##  CRAN (R 3.4.4)                       
    ##  CRAN (R 3.4.0)                       
    ##  CRAN (R 3.4.4)                       
    ##  CRAN (R 3.4.0)                       
    ##  CRAN (R 3.4.4)                       
    ##  CRAN (R 3.4.4)                       
    ##  CRAN (R 3.4.4)                       
    ##  Github (yihui/knitr@7660d59)         
    ##  CRAN (R 3.4.4)                       
    ##  CRAN (R 3.4.4)                       
    ##  CRAN (R 3.4.4)                       
    ##  CRAN (R 3.4.0)                       
    ##  CRAN (R 3.4.0)                       
    ##  local                                
    ##  CRAN (R 3.4.0)                       
    ##  CRAN (R 3.4.4)                       
    ##  CRAN (R 3.4.4)                       
    ##  CRAN (R 3.4.4)                       
    ##  CRAN (R 3.4.4)                       
    ##  CRAN (R 3.4.4)                       
    ##  local                                
    ##  CRAN (R 3.4.4)                       
    ##  CRAN (R 3.4.4)                       
    ##  CRAN (R 3.4.0)                       
    ##  CRAN (R 3.4.0)                       
    ##  CRAN (R 3.4.4)                       
    ##  Github (the-pudding/puddingR@3e26a08)
    ##  CRAN (R 3.4.4)                       
    ##  CRAN (R 3.4.4)                       
    ##  CRAN (R 3.4.4)                       
    ##  CRAN (R 3.4.4)                       
    ##  CRAN (R 3.4.4)                       
    ##  CRAN (R 3.4.3)                       
    ##  Github (r-lib/rlang@96a69a2)         
    ##  CRAN (R 3.4.4)                       
    ##  CRAN (R 3.4.3)                       
    ##  CRAN (R 3.4.4)                       
    ##  CRAN (R 3.4.4)                       
    ##  CRAN (R 3.4.0)                       
    ##  CRAN (R 3.4.4)                       
    ##  CRAN (R 3.4.1)                       
    ##  local                                
    ##  CRAN (R 3.4.4)                       
    ##  CRAN (R 3.4.4)                       
    ##  local                                
    ##  CRAN (R 3.4.4)                       
    ##  Github (tidyverse/tidyr@7a2b843)     
    ##  CRAN (R 3.4.4)                       
    ##  CRAN (R 3.4.2)                       
    ##  local                                
    ##  cran (@1.4.0)                        
    ##  local                                
    ##  Github (r-lib/vctrs@ad48310)         
    ##  CRAN (R 3.4.4)                       
    ##  CRAN (R 3.4.4)                       
    ##  CRAN (R 3.4.3)                       
    ##  CRAN (R 3.4.4)                       
    ##  cran (@0.1.0)
