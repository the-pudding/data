
This folder contains all of the data used in The Pudding essay [Finding Forever  Homes](https://pudding.cool/2019/10/shelters) published in October 2019.

This file was last updated: September 29, 2019

## allDogDescriptions.csv & allDogDescriptions.R

  - `allDogDescriptions.R`: The script used to access the PetFinder API
    and collect data for all of the adoptable dogs in the US on a single
    day.

  - allDogDescriptions.csv: The data, as described below
    
      - **What is this?**: Data collected from the [PetFinder
        API](https://www.petfinder.com/developers/) for all adoptable
        dogs in each state on September 20, 2019.
      - **Source(s) & Methods**: All data except for `description` was
        collected using PetFinder’s V2 API method `get-animals` as
        described in their
        [documentation](https://www.petfinder.com/developers/v2/docs/#get-animals).
        Since the V2 API doesn’t return the full animal description, I
        was encouraged by the API maintainers to query the same animal
        profiles using the V1 API to acquire that information. Thus, I
        used all of the shelter ID’s returned from the V2 API calls to
        find all descriptions of dogs in each shelter and combine the
        two results by the animal’s unique ID.
      - **Last Modified**: September 29, 2019
      - **Contact Information**: [Amber
        Thomas](mailto:amber@pudding.cool)
      - **Spatial Applicability**: All data was collected for querying
        the API for adoptable dogs in each of the US states and the
        District of Columbia.
      - **Temporal Applicability**: This data represents *a single day*
        of data. It was all collected on September 20, 2019.
      - **Observations (Rows)**: There are 58,180 rows in this dataset.
        Each row represents an individual adoptable dog in the US on
        September 20, 2019. Each dog has a unique ID number. Unless
        otherwise noted, all of the data is exactly is reported by the
        shelter or rescue that posted an individual animal for adoption
        on PetFinder.
      - **Variables (Columns)**: There are 36 columns in this dataset.
        They are described
below:

| Header           | Description                                                                                                                                                  | Data Type |
| :--------------- | :----------------------------------------------------------------------------------------------------------------------------------------------------------- | :-------- |
| id               | The unique PetFinder identification number for each animal                                                                                                   | integer   |
| org\_id          | The unique identification number for each shelter or rescue                                                                                                  | character |
| url              | The URL for each animal’s listing                                                                                                                            | character |
| species          | Species of animal                                                                                                                                            | character |
| breed\_primary   | The primary (assumed) breed assigned by the shelter or rescue                                                                                                | character |
| breed\_secondary | The secondary (assumed) breed assigned by the shelter or rescue                                                                                              | character |
| breed\_mixed     | Whether or not an animal is presumed to be mixed breed                                                                                                       | logical   |
| breed\_unknown   | Whether or not the animal’s breed is completely unknown                                                                                                      | logical   |
| color\_primary   | The most prevalent color of an animal                                                                                                                        | character |
| color\_secondary | The second most prevalent color of an animal                                                                                                                 | character |
| color\_tertiary  | The third most prevalent color of an animal                                                                                                                  | character |
| age              | The assumed age class of an animal (`Baby`, `Young`, `Adult`, or `Senior`)                                                                                   | character |
| sex              | The sex of an animal (`Female`, `Male`, or `Unknown`)                                                                                                        | character |
| size             | The general size class of an animal (`Small`, `Medium`, `Large`, `Extra Large`)                                                                              | character |
| coat             | Coat Length for each animal (`Curly`, `Hairless`, `Long`, `Medium`, `Short`, `Wire`)                                                                         | character |
| fixed            | Whether or not an animal has been spayed/neutered                                                                                                            | logical   |
| house\_trained   | Whether or not an animal is trained to not go to the bathroom in the house                                                                                   | logical   |
| declawed         | Whether or not the animal has had its dewclaws removed                                                                                                       | logical   |
| special\_needs   | Whether or not the animal is considered to have special needs (this can be a long-term medical condition or particular temperament that requires extra care) | logical   |
| shots\_current   | Whether or not the animal is up to date on all of their vaccines and other shots                                                                             | logical   |
| env\_children    | Whether or not the animal is recommended for a home with children                                                                                            | logical   |
| env\_dogs        | Whether or not the animal is recommended for a home with other dogs                                                                                          | logical   |
| env\_cats        | Whether or not the animal is recommended for a home with cats                                                                                                | logical   |
| name             | The animal’s name (as given by the shelter/rescue)                                                                                                           | character |
| tags             | Any tags given to the dog by the shelter rescue (pipe `\|` separated)                                                                                        | character |
| photo            | The URL to the animal’s primary photo                                                                                                                        | character |
| status           | Whether the animal is `adoptable` or not                                                                                                                     | character |
| posted           | The date that this animal was first listed on PetFinder                                                                                                      | character |
| contact\_city    | The rescue/shelter’s listed city                                                                                                                             | character |
| contact\_state   | The rescue/shelter’s listed state                                                                                                                            | character |
| contact\_zip     | The rescue/shelter’s listed zip code                                                                                                                         | character |
| contact\_country | The rescue/shelter’s listed country                                                                                                                          | character |
| stateQ           | The state abbreviation queried in the API to return this result                                                                                              | character |
| accessed         | The date that this data was acquired from the PetFinder API                                                                                                  | character |
| type             | The type of animal                                                                                                                                           | character |
| description      | The full description of an animal, as entered by the rescue or shelter. This is the only field returned by the V1 API                                        | character |

  - *Other Notes*: Due to a bug in the PetFinder API, dogs in the state
    of Nevada had to be accessed by searching for individual zip codes
    instead of the state abbreviation (as suggested to me by the API
    maintainers).

## dogTravel.csv & dogTravel.R

  - `dogTravel.R`: The script used to process a file of adoptable dogs
    (`allDogDescriptions.csv`) to find if they originated in a different
    location than where they are listed as available. This dataset was
    derived from `allDogDescriptions.csv`, so refer to that file’s
    Source field for more information on how this data was collected.

  - dogTravel.csv: The data, as described below
    
      - **What is this?**: Unlike `allDogDescriptions`, this file only
        includes information on dogs whose `description` indicates that
        they did not originate in the state where they were made
        available for adoption. This file aims to show where those dogs
        are available and where they came from.
      - **Source(s) & Methods**: All dog data was obtained in the same
        manor as `allDogDescriptions`. Regex was used to identify any
        phrases after the words `from` or `located in` until either the
        word `to` or the end of the sentence. The R package `spacyR` was
        then used to identify any entities in the extracted phrases. The
        data was manually reviewed and cleaned to remove any original
        locations that contained only a vague location (e.g., `the
        south`, `the Carolinas`) in favor of those explicitly described.
      - **Last Modified**: September 29, 2019
      - **Contact Information**: [Amber
        Thomas](mailto:amber@pudding.cool)
      - **Spatial Applicability**: All data was collected for querying
        the API for adoptable dogs in each of the US states and the
        District of Columbia.
      - **Temporal Applicability**: This data represents *a single day*
        of data. It was all collected on September 20, 2019.
      - **Observations (Rows)**: There are 2,460 rows in this dataset.
        Each row represents a single dog that was available for adoption
        somewhere in the US. Each of these dogs is described as having
        been moved from another location to their current location.
      - **Variables (Columns)**: There are 8 columns in this dataset.
        They are described
below:

| Header       | Description                                                                                                                         | Data Type |
| :----------- | :---------------------------------------------------------------------------------------------------------------------------------- | :-------- |
| id           | The unique PetFinder identification number for each animal                                                                          | numeric   |
| description  | The full description of each animal as entered by the rescue/shelter                                                                | character |
| shelterLoc   | The state where the shelter/rescue is located and thus where the animal is available for adoption                                   | character |
| origin       | The state or country where the animal has been described as originating from                                                        | character |
| still\_there | Whether the animal is still located in their origin location and will be transported to their final destination **after** adoption. | logical   |

  - *Other Notes*: We assume that this is an underestimate since not all
    shelters or rescues will include this information in an animal’s
    PetFinder description. Any animals that were described as
    transported by their previous owners instead of by the rescue or
    shelter were also removed from our data. Some dogs were listed as
    being from several places. For example, one was described as
    “rescued from the euthanasia list at a tiny Alabama shelter and
    brought to a rescue in Georgia”, but the dog was listed as available
    for adoption in Massachussetts. In this case, the earliest location
    is the one reported. In 238 (9.7% of) cases, the dogs were shown as
    available for adoption in one state, but they still resided in
    another. For instance, a dog that was available for adoption in
    Washington had the disclaimer “Dogs will be transported from Texas
    upon approved match.” We still considered these to be “imports”
    since they are listed as available for adoption upon searching
    PetFinder for dogs in that state.

## movesByLocation.csv & movesByLocation.R

  - `movesByLocation.R`: The script used to process a file of adoptable
    dogs (`allDogDescriptions.csv`) and their origin and destination
    locations (`dogTravel.csv`) to find the total numbers of imports and
    exports for each location. This dataset was derived from
    `allDogDescriptions.csv` and `dogTravel.csv`, so refer to those
    file’s Source field for more information on how this data was
    collected.

  - `movesByLocation.csv`: The data, as described below.
    
      - **What is this?**: A file depicting the number of animals
        imported and exported from each location for adoption.
      - **Source(s) & Methods**: This dataset was derived from
        `allDogDescriptions.csv` and `dogTravel.csv`, so refer to those
        file’s Source field for more information on how this data was
        collected.
      - **Last Modified**: September 29, 2019
      - **Contact Information**: [Amber
        Thomas](mailto:amber@pudding.cool)
      - **Contact Information**: [Amber
        Thomas](mailto:amber@pudding.cool)
      - **Spatial Applicability**: All data was collected for querying
        the API for adoptable dogs in each of the US states and the
        District of Columbia.
      - **Temporal Applicability**: This data represents *a single day*
        of data. It was all collected on September 20, 2019.
      - **Observations (Rows)**: There are 90 rows in this dataset. Each
        row represents a specific US state or country.
      - **Variables (Columns)**: There are 5 columns in this dataset.
        They are described
below:

| Header   | Description                                                                                                                           | Data Type |
| :------- | :------------------------------------------------------------------------------------------------------------------------------------ | :-------- |
| location | The full name of the US state or country                                                                                              | character |
| exported | The number of adoptable dogs available in the US that originated in this location but were available for adoption in another location | integer   |
| imported | The number of adoptable dogs available in this state that originated in a different location                                          | integer   |
| total    | The total number of adoptable dogs availabe in a given state.                                                                         | integer   |
| inUS     | Whether or not a location is in the US or not. Here, US territories will return `FALSE`                                               | character |

## Session Info

    ## Session info -------------------------------------------------------------

    ##  setting  value                       
    ##  version  R version 3.4.4 (2018-03-15)
    ##  system   x86_64, darwin15.6.0        
    ##  ui       RStudio (1.2.1335)          
    ##  language (EN)                        
    ##  collate  en_US.UTF-8                 
    ##  tz       America/Los_Angeles         
    ##  date     2019-09-29

    ## Packages -----------------------------------------------------------------

    ##  package     * version    date       source                               
    ##  assertthat    0.2.1      2019-03-21 CRAN (R 3.4.4)                       
    ##  backports     1.1.3      2018-12-14 CRAN (R 3.4.4)                       
    ##  base        * 3.4.4      2018-03-15 local                                
    ##  broom         0.4.5      2018-07-03 CRAN (R 3.4.4)                       
    ##  cellranger    1.1.0      2016-07-27 CRAN (R 3.4.0)                       
    ##  cleanNLP    * 2.3.0      2018-11-18 CRAN (R 3.4.4)                       
    ##  cli           1.1.0      2019-03-19 CRAN (R 3.4.4)                       
    ##  colorspace    1.4-1      2019-03-18 CRAN (R 3.4.4)                       
    ##  compiler      3.4.4      2018-03-15 local                                
    ##  crayon        1.3.4      2017-09-16 CRAN (R 3.4.1)                       
    ##  data.table  * 1.12.0     2019-01-13 CRAN (R 3.4.4)                       
    ##  datasets    * 3.4.4      2018-03-15 local                                
    ##  desc          1.2.0      2018-05-01 cran (@1.2.0)                        
    ##  devtools      1.13.6     2018-06-27 CRAN (R 3.4.4)                       
    ##  digest        0.6.18     2018-10-10 CRAN (R 3.4.4)                       
    ##  dplyr       * 0.8.0.1    2019-02-15 CRAN (R 3.4.4)                       
    ##  evaluate      0.13       2019-02-12 CRAN (R 3.4.4)                       
    ##  forcats     * 0.4.0      2019-02-17 CRAN (R 3.4.4)                       
    ##  foreign       0.8-69     2017-06-22 CRAN (R 3.4.4)                       
    ##  fs            1.2.7      2019-03-19 CRAN (R 3.4.4)                       
    ##  ggplot2     * 3.1.0      2018-10-25 CRAN (R 3.4.4)                       
    ##  glue        * 1.3.1      2019-03-12 CRAN (R 3.4.4)                       
    ##  googledrive * 0.1.3      2019-01-24 CRAN (R 3.4.4)                       
    ##  graphics    * 3.4.4      2018-03-15 local                                
    ##  grDevices   * 3.4.4      2018-03-15 local                                
    ##  grid          3.4.4      2018-03-15 local                                
    ##  gtable        0.3.0      2019-03-25 CRAN (R 3.4.4)                       
    ##  haven         2.1.0      2019-02-19 CRAN (R 3.4.4)                       
    ##  here        * 0.1        2017-05-28 CRAN (R 3.4.0)                       
    ##  highr         0.8        2019-03-20 CRAN (R 3.4.4)                       
    ##  hms           0.4.2      2018-03-10 CRAN (R 3.4.4)                       
    ##  htmltools     0.3.6      2017-04-28 CRAN (R 3.4.0)                       
    ##  httr        * 1.4.0      2018-12-11 CRAN (R 3.4.4)                       
    ##  jsonlite    * 1.6        2018-12-07 CRAN (R 3.4.4)                       
    ##  knitr         1.23.3     2019-06-27 Github (yihui/knitr@7660d59)         
    ##  lattice       0.20-35    2017-03-25 CRAN (R 3.4.4)                       
    ##  lazyeval      0.2.2      2019-03-15 CRAN (R 3.4.4)                       
    ##  lubridate   * 1.7.4      2018-04-11 CRAN (R 3.4.4)                       
    ##  magrittr      1.5        2014-11-22 CRAN (R 3.4.0)                       
    ##  Matrix        1.2-12     2017-11-30 CRAN (R 3.4.4)                       
    ##  memoise       1.1.0      2017-04-21 CRAN (R 3.4.0)                       
    ##  methods     * 3.4.4      2018-03-15 local                                
    ##  mnormt        1.5-5      2016-10-15 CRAN (R 3.4.0)                       
    ##  modelr        0.1.4      2019-02-18 CRAN (R 3.4.4)                       
    ##  munsell       0.5.0      2018-06-12 CRAN (R 3.4.4)                       
    ##  nlme          3.1-131.1  2018-02-16 CRAN (R 3.4.4)                       
    ##  packrat       0.5.0      2018-11-14 CRAN (R 3.4.4)                       
    ##  parallel      3.4.4      2018-03-15 local                                
    ##  pillar        1.3.1      2018-12-15 CRAN (R 3.4.4)                       
    ##  pkgconfig     2.0.2      2018-08-16 CRAN (R 3.4.4)                       
    ##  plyr          1.8.4      2016-06-08 CRAN (R 3.4.0)                       
    ##  psych         1.8.12     2019-01-12 CRAN (R 3.4.4)                       
    ##  puddingR    * 0.0.0.9000 2019-06-27 Github (the-pudding/puddingR@3e26a08)
    ##  purrr       * 0.3.2      2019-03-15 CRAN (R 3.4.4)                       
    ##  R6            2.4.0      2019-02-14 CRAN (R 3.4.4)                       
    ##  Rcpp          1.0.1      2019-03-17 CRAN (R 3.4.4)                       
    ##  readr       * 1.3.1      2018-12-21 CRAN (R 3.4.4)                       
    ##  readxl        1.3.1      2019-03-13 CRAN (R 3.4.4)                       
    ##  reshape2      1.4.3      2017-12-11 CRAN (R 3.4.3)                       
    ##  reticulate  * 1.11.1     2019-03-06 CRAN (R 3.4.4)                       
    ##  rlang         0.3.1      2019-01-08 CRAN (R 3.4.4)                       
    ##  rmarkdown     1.12       2019-03-14 CRAN (R 3.4.4)                       
    ##  rprojroot     1.3-2      2018-01-03 CRAN (R 3.4.3)                       
    ##  rstudioapi    0.10       2019-03-19 CRAN (R 3.4.4)                       
    ##  rvest         0.3.2      2016-06-17 CRAN (R 3.4.0)                       
    ##  scales        1.0.0      2018-08-09 CRAN (R 3.4.4)                       
    ##  spacyr      * 1.2        2019-07-02 Github (quanteda/spacyr@04fa7fd)     
    ##  stats       * 3.4.4      2018-03-15 local                                
    ##  stringi       1.4.3      2019-03-12 CRAN (R 3.4.4)                       
    ##  stringr     * 1.4.0      2019-02-10 CRAN (R 3.4.4)                       
    ##  tibble      * 2.1.1      2019-03-16 CRAN (R 3.4.4)                       
    ##  tidyr       * 0.8.3      2019-03-01 CRAN (R 3.4.4)                       
    ##  tidyselect    0.2.5      2018-10-11 CRAN (R 3.4.4)                       
    ##  tidyverse   * 1.2.1      2017-11-14 CRAN (R 3.4.2)                       
    ##  tools         3.4.4      2018-03-15 local                                
    ##  usethis       1.4.0      2018-08-14 cran (@1.4.0)                        
    ##  utils       * 3.4.4      2018-03-15 local                                
    ##  withr         2.1.2      2018-03-15 CRAN (R 3.4.4)                       
    ##  xfun          0.5        2019-02-20 CRAN (R 3.4.4)                       
    ##  xml2        * 1.2.0      2018-01-24 CRAN (R 3.4.3)                       
    ##  yaml          2.2.0      2018-07-25 CRAN (R 3.4.4)
