
This folder contains all of the data used in The Pudding essay [The Naked Truth](https://pudding.cool/2021/03/foundation-names) published in March 2021.

This file was last updated: March 17, 2021

## scrape-sephora.js & scrape-ulta.js

These are the scripts used to scrape the foundation data from both Sephora and Ulta's websites. They use [Microsoft Playwright](https://github.com/microsoft/playwright). 

Data from Sephora is collected in a single file, whereas data from Ulta is collected in a single file per product.

## sephora.csv & sephora.R

  - `sephora.R`: The script used to process the collected data and
    programmatically extract the foundation name from the alt text.

  - `sephora.csv`: The data, as described below
    
      - **What is this?**: A dataset containing all foundations from on
        the store Sephora’s [US
        Website](https://www.sephora.com/shop/foundation-makeup)
      - **Source(s) & Methods**: This data was scraped from Sephora’s
        website using Microsoft Playwright. See `scrape.js` files for
        more information.
      - **Last Modified**: January 11, 2021
      - **Contact Information**: [Amber
        Thomas](mailto:amber@pudding.cool)
      - **Spatial Applicability**: United States
      - **Temporal Applicability**: Shades available on Sephora’s
        website on January 11, 2021 (includes shades that were out of
        stock at the time).
      - **Observations (Rows)**: There are 4371 rows in this dataset.
        Each row represents a single foundation shade.
      - **Variables (Columns)**: There are 8 columns in this dataset.
        They are described
below:

| Header      | Description                                                                                                                                                                        | Data Type |
| :---------- | :--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | :-------- |
| brand       | The brand of foundation                                                                                                                                                            | character |
| product     | The product name                                                                                                                                                                   | character |
| url         | URL to the product page                                                                                                                                                            | character |
| description | The description associated with a particular swatch (e.g., “Shade 1 (fair cool)”) as displayed on the product page                                                                 | character |
| imgSrc      | The incomplete url to the image displaying a swatch of this particular foundation shade (*note*: to complete the url, `https://sephora.com` needs to be appended to the beginning) | character |
| imgAlt      | The alt text attribute for a particular swatch, as is made available to assistive technology                                                                                       | character |
| name        | The programmatically extracted word-based name of this particular shade                                                                                                            | character |
| specific    | The number or number/letter combination (e.g., “12CN”) used to label a particular shade                                                                                            | character |

## ulta.csv & ulta.R

  - `ulta.R`: The script used to process the collected data and
    programmatically extract the foundation name from the alt text.

  - `ulta.csv`: The data, as described below
    
      - **What is this?**: A dataset containing all foundations from on
        the store Ulta’s [US
        Website](https://www.ulta.com/makeup-face-foundation?N=26y5&Nrpp=200)
      - **Source(s) & Methods**: This data was scraped from Ulta’s
        website using Microsoft Playwright. See `scrape.js` files for
        more information.
      - **Last Modified**: January 18, 2021
      - **Contact Information**: [Amber
        Thomas](mailto:amber@pudding.cool)
      - **Spatial Applicability**: United States
      - **Temporal Applicability**: Shades available on Ulta’s website
        on January 18, 2021 (includes shades that were out of stock at
        the time).
      - **Observations (Rows)**: There are 4004 rows in this dataset.
        Each row represents a single foundation shade.
      - **Variables (Columns)**: There are 8 columns in this dataset.
        They are described
below:

| Header      | Description                                                                                                        | Data Type |
| :---------- | :----------------------------------------------------------------------------------------------------------------- | :-------- |
| brand       | The brand of foundation                                                                                            | character |
| product     | The product name                                                                                                   | character |
| url         | URL to the product page                                                                                            | character |
| description | The description associated with a particular swatch (e.g., “Shade 1 (fair cool)”) as displayed on the product page | character |
| imgSrc      | The complete url to the image displaying a swatch of this particular foundation shade                              | character |
| imgAlt      | The alt text attribute for a particular swatch, as is made available to assistive technology                       | character |
| name        | The programmatically extracted word-based name of this particular shade                                            | character |
| specific    | The number or number/letter combination (e.g., “12CN”) used to label a particular shade                            | character |


## allShades.csv & allShades.R

  - `allShades.R`: The script used to combine the raw ulta and sephora
    data and to extract color information from each foundation swatch.

  - `allShades.csv`: The data, as described below
    
      - **What is this?**: The 6,816 foundation shades available from
        either Sephora or Ulta’s US websites.
      - **Source(s) & Methods**: See `scrape.js` for information on how
        the data were collected. Any products available on both Sephora
        and Ulta’s website were consolidated and Ulta’s version of the
        product was kept. (Ulta’s product descriptions were more
        consistent and thus extracting the name information was
        simpler). Color information was extracted using the `jpeg`,
        `magick`, and `imager` packages in R. See `allShades.R` for more
        information.
      - **Last Modified**: March 17, 2021
      - **Contact Information**: [Amber
        Thomas](mailto:amber@pudding.cool)
      - **Spatial Applicability**: United States
      - **Temporal Applicability**: Sephora data was collected on
        January 11, 2021. Ulta data was collected on January 18, 2021.
        The data includes products that were out of stock on either day.
      - **Observations (Rows)**: There are 6816 rows in this dataset.
        Each row represents a single foundation shade.
      - **Variables (Columns)**: There are 13 columns in this dataset.
        They are described
below:

| Header      | Description                                                                                                                                                                      | Data Type |
| :---------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | :-------- |
| brand       | The brand of foundation                                                                                                                                                          | character |
| product     | The product name                                                                                                                                                                 | character |
| url         | URL to the product page                                                                                                                                                          | character |
| description | The description associated with a particular swatch (e.g., “Shade 1 (fair cool)”) as displayed on the product page                                                               | character |
| imgSrc      | The url to the image displaying a swatch of this particular foundation shade                                                                                                     | character |
| imgAlt      | The alt text attribute for a particular swatch, as is made available to assistive technology                                                                                     | character |
| name        | The programmatically extracted word-based name of this particular shade                                                                                                          | character |
| specific    | The number or number/letter combination (e.g., “12CN”) used to label this particular shade                                                                                       | character |
| colorspace  | The colorspace used to analyze the shade (e.g., “RGB”)                                                                                                                           | character |
| hex         | The hexadecimal color code for the most prevalent color in the `imgSrc` swatch image (e.g., `#4F322C`)                                                                           | character |
| hue         | The `hue` value from the HSL color space. This is represented as a number from 0 to 360 degrees around the color wheel                                                           | numeric   |
| sat         | The `saturuation` value from the HSL color space. This represents the amount of gray in a color from 0 to 100 percent (*Note*: here, it is represented as a decimal from 0 to 1) | numeric   |
| lightness   | The `lightness` value from the HSL color space. This is represented as a decimal from 0 to 1 where 0 is pure black and 1 is pure white                                           | numeric   |

  - *Other Notes*: There may be some variation in the `name` column
    between the `ulta.csv` and `sephora.csv` files and `allShades.csv`
    because additional, manual extraction of names was incorporated into
    the `allShades.csv` file for products or shades whose names couldn’t
    be programmatically extracted.


## allCategories.csv & allCategories.R

  - `allCategories.R`: The script used to combine manually assigned
    categories with data from `allShades.csv`.

  - `allCategories.csv`: The data, as described below

  - **What is this?**: The 5,307 foundation shades that used a
    word-based labelling system

  - **Source(s) & Methods**: Categories were assigned manually and as
    follows:
    
      - *animal*: labels that refer to names of animals (e.g., `sable`
        or `fawn`)
      - *color*: labels that include a known color (e.g, `beige`, `tan`,
        `brown` etc.)
      - *compliment*: labels that contain words that are often used as
        compliments (e.g., `pure`, `beautiful`, `radiant`, `classic`
        etc.)
      - *descriptor*: labels that include a word typically used as an
        adjective (e.g., `dark`, `light`, `medium` etc.)
      - *drink*: labels that refer to a beverage or liquid (e.g.,
        `espresso`, `mocha`, `milkshake` etc.)
      - *food*: labels that refer to a food (e.g., `chocolate`, `honey`,
        `almond`, `bisque` etc.)
      - *gem*: labels that refer to a mineral that is considered a gem
        (e.g., `amber`, `pearl`, `ivory`, `alabaster` etc.)
      - *location*: labels that specifically reference a city or country
        (e.g., `gobi`, `yukon`, `mali`, `sudan` etc.)
      - *metal*: labels that reference metals (e.g., `bronze`, `copper`,
        `gold` etc.)
      - *misc*: labels that didn’t seem to fit the other categories
        (e.g., `porcelain`, `breeze`, `sunny` etc.)
      - *name*: labels that refer to people (e.g., `terese`, `carolina`,
        `jessica`, `xia` etc.)
      - *plant*: labels that reference non-tree plants (e.g., `rose`,
        `petal`, `coffee bean` etc.)
      - *rock*: labels that reference rocks or minerals that aren’t gems
        (e.g., `sand`, `dune`, `sienna` etc.)
      - *skin*: labels that reference the user’s actual skin (e.g.,
        `nude`, `natural`, `tan` etc.)
      - *textile*: labels that reference fabrics (e.g., `silk`, `linen`,
        `cashmere` etc.)
      - *wood*: labels that reference wood or trees (e.g., `cedar`,
        `mahogany`, `birch` etc.)
    
    Categories were manually assigned and thus are subject to
    interpretation. Some words that often have multiple meanings (e.g.,
    “tan” can be referring to a color or can be shorthand for a
    “suntan”, “olive” can be a food or a color etc.) are grouped in
    multiple categories and thus may appear more than once. Some words
    may be categorized differently based on the context of the entire
    product line. While most lines don’t seem to have a consistent
    naming scheme, some provide context. Estée Lauder has a shade called
    “dawn” and another called “dusk”, presumably referring to the time
    of day and thus both were categorized “miscellaneous”. EXA also has
    a shade called “dawn”, but the entire line of products contains the
    names of people, so in this context “dawn” is presumably referring
    to a name as opposed to the time of day and is categorized as
    “name”.

  - **Last Modified**: March 17, 2021

  - **Contact Information**: [Amber Thomas](mailto:amber@pudding.cool)

  - **Spatial Applicability**: United States
    
      - **Temporal Applicability**: Sephora data was collected on
        January 11, 2021. Ulta data was collected on January 18, 2021.
        The data includes products that were out of stock on either day.

  - **Observations (Rows)**: There are 5307 rows in this dataset. Each
    row represents a single foundation shade.

  - **Variables (Columns)**: There are 9 columns in this dataset. They
    are described
below:

| Header     | Description                                                                                                                            | Data Type |
| :--------- | :------------------------------------------------------------------------------------------------------------------------------------- | :-------- |
| brand      | The brand of foundation                                                                                                                | character |
| product    | The product name                                                                                                                       | character |
| url        | URL to the product page                                                                                                                | character |
| imgSrc     | The url to the image displaying a swatch of this particular foundation shade                                                           | character |
| name       | The programmatically extracted word-based name of this particular shade                                                                | character |
| categories | Comma separated categories that were assigned to a given label (e.g., `food, color`)                                                   | character |
| specific   | The number or number/letter combination (e.g., “12CN”) used to label this particular shade                                             | character |
| hex        | The hexadecimal color code for the most prevalent color in the `imgSrc` swatch image (e.g., `#4F322C`)                                 | character |
| lightness  | The `lightness` value from the HSL color space. This is represented as a decimal from 0 to 1 where 0 is pure black and 1 is pure white | numeric   |

## allNumbers.csv & allNumbers.R

  - `allNumbers.R`: The script used to analyze the foundations from
    Sephora and Ulta’s websites, extract those that use a number-based
    labelling system, and determine if those products organize their
    shades from light to dark or dark to light.

  - `allNumbers.csv`: The data, as described below
    
      - **What is this?**: A dataset of all of the foundation products
        from Sephora and Ulta’s US websites that use a number-based
        labelling system.
      - **Source(s) & Methods**: Shade descriptions or alt text was used
        to extract the label for each product. Labels that utilized a
        number-based naming system were retained in this file. Using all
        of the number labels in a single product line, we determined if
        the numbers were sequential (i.e., there were no repeated
        numbers), or if the same number could be used for multiple
        shades in the same line. Of the products that were sequential,
        we compared the lightness of the first product in the sequential
        order to the last to determine if the shades were organized from
        light to dark or dark to light.

  - **Last Modified**: March 17, 2021
    
      - **Contact Information**: [Amber
        Thomas](mailto:amber@pudding.cool)
      - **Spatial Applicability**: United States
      - **Temporal Applicability**: Sephora data was collected on
        January 11, 2021. Ulta data was collected on January 18, 2021.
        The data includes products that were out of stock on either day.
      - **Observations (Rows)**: There are 3117 rows in this dataset.
        Each row represents an individual foundation shade.
      - **Variables (Columns)**: There are 9 columns in this dataset.
        They are described
below:

| Header      | Description                                                                                                                                                                                         | Data Type |
| :---------- | :-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | :-------- |
| brand       | The brand of foundation                                                                                                                                                                             | character |
| product     | The product name                                                                                                                                                                                    | character |
| name        | The programmatically extracted word-based name of this particular shade                                                                                                                             | character |
| specific    | The number or number/letter combination (e.g., “12CN”) used to label a particular shade                                                                                                             | character |
| lightness   | The `lightness` value from the HSL color space. This is represented as a decimal from 0 to 1                                                                                                        | numeric   |
| hex         | The hexadecimal color code for the most prevalent color in the `imgSrc` swatch image (e.g., `#4F322C`)                                                                                              | character |
| lightToDark | Whether this product line organizes their colors from light to dark (*Note*: a value of `NA` indicates that a product uses a number-based naming system, but **not** a sequential numbering system) | logical   |
| numbers     | The numbers associated with a particular shade                                                                                                                                                      | numeric   |
| id          | A generated ID number assigned to each individual product                                                                                                                                           | numeric   |


## Session Info

    ## ─ Session info ───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
    ##  setting  value                       
    ##  version  R version 4.0.0 (2020-04-24)
    ##  os       macOS Catalina 10.15.7      
    ##  system   x86_64, darwin17.0          
    ##  ui       RStudio                     
    ##  language (EN)                        
    ##  collate  en_US.UTF-8                 
    ##  ctype    en_US.UTF-8                 
    ##  tz       America/Los_Angeles         
    ##  date     2021-03-17                  
    ## 
    ## ─ Packages ───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
    ##  package     * version    date       lib source                               
    ##  assertthat    0.2.1      2019-03-21 [1] CRAN (R 4.0.0)                       
    ##  backports     1.1.7      2020-05-13 [1] CRAN (R 4.0.0)                       
    ##  bmp           0.3        2017-09-11 [1] CRAN (R 4.0.2)                       
    ##  broom         0.5.6      2020-04-20 [1] CRAN (R 4.0.0)                       
    ##  callr         3.5.1      2020-10-13 [1] CRAN (R 4.0.2)                       
    ##  cellranger    1.1.0      2016-07-27 [1] CRAN (R 4.0.0)                       
    ##  cli           2.2.0      2020-11-20 [1] CRAN (R 4.0.2)                       
    ##  colorspace    2.0-0      2020-11-11 [1] CRAN (R 4.0.2)                       
    ##  crayon        1.3.4      2017-09-16 [1] CRAN (R 4.0.0)                       
    ##  data.table    1.12.8     2019-12-09 [1] CRAN (R 4.0.0)                       
    ##  DBI           1.1.0      2019-12-15 [1] CRAN (R 4.0.0)                       
    ##  dbplyr        1.4.3      2020-04-19 [1] CRAN (R 4.0.0)                       
    ##  desc          1.2.0      2018-05-01 [1] CRAN (R 4.0.0)                       
    ##  devtools      2.3.2      2020-09-18 [1] CRAN (R 4.0.2)                       
    ##  digest        0.6.27     2020-10-24 [1] CRAN (R 4.0.2)                       
    ##  dplyr       * 1.0.2      2020-08-18 [1] CRAN (R 4.0.2)                       
    ##  ellipsis      0.3.1      2020-05-15 [1] CRAN (R 4.0.0)                       
    ##  evaluate      0.14       2019-05-28 [1] CRAN (R 4.0.0)                       
    ##  fansi         0.4.1      2020-01-08 [1] CRAN (R 4.0.0)                       
    ##  forcats     * 0.5.0      2020-03-01 [1] CRAN (R 4.0.0)                       
    ##  fs            1.4.1      2020-04-04 [1] CRAN (R 4.0.0)                       
    ##  generics      0.0.2      2018-11-29 [1] CRAN (R 4.0.0)                       
    ##  ggplot2     * 3.3.3      2020-12-30 [1] CRAN (R 4.0.2)                       
    ##  glue        * 1.4.2      2020-08-27 [1] CRAN (R 4.0.2)                       
    ##  googledrive * 1.0.1      2020-05-05 [1] CRAN (R 4.0.0)                       
    ##  gtable        0.3.0      2019-03-25 [1] CRAN (R 4.0.0)                       
    ##  haven         2.3.0      2020-05-24 [1] CRAN (R 4.0.0)                       
    ##  here        * 0.1        2017-05-28 [1] CRAN (R 4.0.0)                       
    ##  highr         0.8        2019-03-20 [1] CRAN (R 4.0.0)                       
    ##  hms           0.5.3      2020-01-08 [1] CRAN (R 4.0.0)                       
    ##  htmltools     0.4.0      2019-10-04 [1] CRAN (R 4.0.0)                       
    ##  htmlwidgets   1.5.1      2019-10-08 [1] CRAN (R 4.0.0)                       
    ##  httr          1.4.2      2020-07-20 [1] CRAN (R 4.0.2)                       
    ##  igraph        1.2.6      2020-10-06 [1] CRAN (R 4.0.2)                       
    ##  imager      * 0.42.3     2020-05-11 [1] CRAN (R 4.0.2)                       
    ##  jpeg        * 0.1-8.1    2019-10-24 [1] CRAN (R 4.0.2)                       
    ##  jsonlite    * 1.7.2      2020-12-09 [1] CRAN (R 4.0.2)                       
    ##  knitr         1.28       2020-02-06 [1] CRAN (R 4.0.0)                       
    ##  lattice       0.20-41    2020-04-02 [1] CRAN (R 4.0.0)                       
    ##  lazyeval      0.2.2      2019-03-15 [1] CRAN (R 4.0.0)                       
    ##  lifecycle     0.2.0      2020-03-06 [1] CRAN (R 4.0.0)                       
    ##  lubridate     1.7.8      2020-04-06 [1] CRAN (R 4.0.0)                       
    ##  magick      * 2.5.2      2020-11-10 [1] CRAN (R 4.0.2)                       
    ##  magrittr    * 2.0.1      2020-11-17 [1] CRAN (R 4.0.2)                       
    ##  memoise       1.1.0      2017-04-21 [1] CRAN (R 4.0.0)                       
    ##  modelr        0.1.8      2020-05-19 [1] CRAN (R 4.0.0)                       
    ##  munsell       0.5.0      2018-06-12 [1] CRAN (R 4.0.0)                       
    ##  nlme          3.1-147    2020-04-13 [1] CRAN (R 4.0.0)                       
    ##  packrat       0.5.0      2018-11-14 [1] CRAN (R 4.0.0)                       
    ##  pillar        1.4.7      2020-11-20 [1] CRAN (R 4.0.2)                       
    ##  pkgbuild      1.2.0      2020-12-15 [1] CRAN (R 4.0.2)                       
    ##  pkgconfig     2.0.3      2019-09-22 [1] CRAN (R 4.0.0)                       
    ##  pkgload       1.1.0      2020-05-29 [1] CRAN (R 4.0.2)                       
    ##  plotly      * 4.9.2.2    2020-12-19 [1] CRAN (R 4.0.2)                       
    ##  png           0.1-7      2013-12-03 [1] CRAN (R 4.0.2)                       
    ##  prettyunits   1.1.1      2020-01-24 [1] CRAN (R 4.0.0)                       
    ##  processx      3.4.5      2020-11-30 [1] CRAN (R 4.0.2)                       
    ##  ps            1.5.0      2020-12-05 [1] CRAN (R 4.0.2)                       
    ##  puddingR      0.0.0.9000 2020-06-14 [1] Github (the-pudding/puddingR@3e26a08)
    ##  purrr       * 0.3.4      2020-04-17 [1] CRAN (R 4.0.0)                       
    ##  R6            2.5.0      2020-10-28 [1] CRAN (R 4.0.2)                       
    ##  Rcpp          1.0.4.6    2020-04-09 [1] CRAN (R 4.0.0)                       
    ##  readbitmap    0.1.5      2018-06-27 [1] CRAN (R 4.0.2)                       
    ##  readr       * 1.3.1      2018-12-21 [1] CRAN (R 4.0.0)                       
    ##  readxl        1.3.1      2019-03-13 [1] CRAN (R 4.0.0)                       
    ##  remotes       2.2.0      2020-07-21 [1] CRAN (R 4.0.2)                       
    ##  reprex        0.3.0      2019-05-16 [1] CRAN (R 4.0.0)                       
    ##  rlang         0.4.10     2020-12-30 [1] CRAN (R 4.0.2)                       
    ##  rmarkdown     2.1        2020-01-20 [1] CRAN (R 4.0.0)                       
    ##  rprojroot     2.0.2      2020-11-15 [1] CRAN (R 4.0.2)                       
    ##  rstudioapi    0.13       2020-11-12 [1] CRAN (R 4.0.2)                       
    ##  rvest         0.3.6      2020-07-25 [1] CRAN (R 4.0.2)                       
    ##  scales      * 1.1.1      2020-05-11 [1] CRAN (R 4.0.2)                       
    ##  sessioninfo   1.1.1      2018-11-05 [1] CRAN (R 4.0.0)                       
    ##  stringi       1.4.6      2020-02-17 [1] CRAN (R 4.0.0)                       
    ##  stringr     * 1.4.0      2019-02-10 [1] CRAN (R 4.0.0)                       
    ##  testthat      3.0.1      2020-12-17 [1] CRAN (R 4.0.2)                       
    ##  tibble      * 3.0.4      2020-10-12 [1] CRAN (R 4.0.2)                       
    ##  tidyr       * 1.1.0      2020-05-20 [1] CRAN (R 4.0.0)                       
    ##  tidyselect    1.1.0      2020-05-11 [1] CRAN (R 4.0.0)                       
    ##  tidyverse   * 1.3.0      2019-11-21 [1] CRAN (R 4.0.0)                       
    ##  tiff          0.1-6      2020-11-17 [1] CRAN (R 4.0.2)                       
    ##  usethis       2.0.0      2020-12-10 [1] CRAN (R 4.0.2)                       
    ##  utf8          1.1.4      2018-05-24 [1] CRAN (R 4.0.0)                       
    ##  vctrs         0.3.6      2020-12-17 [1] CRAN (R 4.0.2)                       
    ##  viridisLite   0.3.0      2018-02-01 [1] CRAN (R 4.0.0)                       
    ##  withr         2.3.0      2020-09-22 [1] CRAN (R 4.0.2)                       
    ##  xfun          0.14       2020-05-20 [1] CRAN (R 4.0.0)                       
    ##  xml2          1.3.2      2020-04-23 [1] CRAN (R 4.0.0)                       
    ##  yaml          2.2.1      2020-02-01 [1] CRAN (R 4.0.0)                       
    ## 
    ## [1] /Library/Frameworks/R.framework/Versions/4.0/Resources/library
