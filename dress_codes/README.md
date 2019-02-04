This folder contains all of the data used in The Pudding article [The Messages Dress Codes are Sending](https://pudding.cool/2018/11/dress_codes/) published in February 2019.

Below you'll find metadata for each file.

## banned_items.csv

- 	**What is this?**: This file contains a list of all of the items banned in 481 high schools across the US.
-   **Source(s) & Methods**: Using the National Center for Education Statistic’s (NCES) [search function for public schools](https://nces.ed.gov/ccd/schoolsearch), I collected a list of over 8,000 public high schools in the US. I limited the resulting schools to just those that had a web address listed in NCES. Accessing the homepage web content from each site, I searched for words like “handbook”, “dress code”, and “code of conduct”, filtering my list of schools to just those that contain one of the above phrases. Then, I manually visited the resulting (2,000+) websites in an attempt to find the dress code. Dress codes were disqualified from analysis if they: had a uniform policy, were not from the 2018-2019 school year, or represented magnet or boarding schools (according to the NCES). Once the list of dress codes was compiled, I and two data assistants (Kait Thomas and Anna Houston) manually recorded every rule listed in each dress code using a Google Form. Only items and body parts that were explicitly listed were included in this analysis. Some minor subjectivity came into play when combining similar phrases from different handbooks (ex. “midriff shirt” = “crop top”, “shirt with open sides” = “muscle shirt” etc.).
-   **Last Modified**: February 2, 2019
-   **Contact Information**: [Amber Thomas](mailto:amber@pudding.cool)
-   **Spatial Applicability**: United States
-   **Temporal Applicability**: All data was collected for high schools' 2018-2019 school year.
-   **Observations (Rows)**: Each row represents data on a single rule.
-   **Variables (Columns)**:

| Header | Description | Data Type |
|---|---|---|
| `schoolName` | The NCES listed name of the school. | text |
| `state` | The two-letter state abbreviation for each school. | text |
| `type` | General category for grouping rules. They are as follows: <br>&bull; **accessories** <br>&bull; **body** <br>&bull; **clothing**: Specific clothing attributes that don't fit in other categories <br>&bull; **footwear** <br>&bull; **grooming**: Includes rules about hair styles, colors, and general grooming prohibitions <br>&bull; **headwear**: Includes all sorts of items worn on the head (e.g., `hats`, `caps`, `bandanas`, `head scarves` etc.) <br>&bull; **length**: Items restricted specifically due to their length (e.g. `short shorts`, `short skirts` etc.) <br>&bull; **pants** <br>&bull; **promotion**: Items that promote items in this category are prohibited (e.g., `alcohol`, `tobacco`, `drugs` etc.) <br>&bull; **rationale**: Words/phrases used to describe why the dress code exists or why a specific item is prohibited <br>&bull; **shirt** <br>&bull; **shorts** <br>&bull; **skirt.dress** <br>&bull; **undergarment** | text |
| `item` | The specific item that is banned within each category (e.g., `tank top` in the `shirt` type, `sagging resting below waist` in the `pants` type etc.) | text |
| `prohibited` | Some schools prohibit items for only female students or only male students. This column can contain 4 values: <br>&bull; **female**: Banned only for female students <br>&bull; **male**: Banned only for male students <br>&bull; **none**: No specific gender banned from wearing item <br>&bull; **NA**: Not collected for this type| text |


---
## body_by_school.json & body_by_school.R

- `body_by_school.json`: The data as described below
- `body_by_school.R`: The script used to process banned_items.csv to create `body_by_school.json`. To run this script, you'll also need the `school_metadata.csv` file (also located in this repository). The data was then used for the graphics in the section of The Messages Dress Codes Are Sending labelled "Body Parts Banned by Each School". This script was written in the R programming language. All details describing the R session environment during processing are available [here](#Session-info).


- 	**What is this?**: The `.json` file contains the body parts prohibited from visibility in each school.
-   **Source(s)**: Since this is processed data from `banned_items.csv`, refer to the `Source` section of `banned_items.csv`.
-   **Last Modified**: February 2, 2019
-   **Contact Information**: [Amber Thomas](mailto:amber@pudding.cool)
-   **Spatial Applicability**: United States
-   **Temporal Applicability**: All data was collected for high schools' 2018-2019 school year.
-   **Observations (Rows)**: Each row represents data on a single school.
-   **Variables (Columns)**:

| Header | Description | Data Type |
|---|---|---|
| `schoolName` | The cleaned and formatted school name. | text |
| `state` | The two-letter state abbreviation for each school. | text |
| `countGroup` | Counts of students in each school (as described by the NCES) and grouped (e.g., `< 200`, `200-499` etc.) | text |
| `localeGroup` | Summarized version of the NCES [locale](https://nces.ed.gov/pubs2007/ruraled/exhibit_a.asp) variable (`rural`, `suburb`, `town`, `city`) | text |
| `bodyParts` | A nested array of body parts banned by an individual school. | array |

---
## body_percentages.csv & body_percentages.R

- `body_percentages.csv`: The data as described below
- `body_percentages.R`: The script used to process banned_items.csv to create `body_percentages.csv`. The data was then used for the graphics in the section of The Messages Dress Codes Are Sending labelled "The Most Commonly Banned Visible Body Parts". This script was written in the R programming language. All details describing the R session environment during processing are available [here](#Session-info).


- 	**What is this?**: The `.csv` file contains the percentage of schools that prohibit particular body parts from being visible.
-   **Source(s)**: Since this is processed data from `banned_items.csv`, refer to the `Source` section of `banned_items.csv`.
-   **Last Modified**: February 2, 2019
-   **Contact Information**: [Amber Thomas](mailto:amber@pudding.cool)
-   **Spatial Applicability**: United States
-   **Temporal Applicability**: All data was collected for high schools' 2018-2019 school year.
-   **Observations (Rows)**: Each row represents data on a single body part.
-   **Variables (Columns)**:

| Header | Description | Data Type |
|---|---|---|
| `item` | The body part banned. | text |
| `n` | Count of schools that explicitly prohibit this body part. | number |
| `per` | Percentage of schools in dataset that explicitly prohibit this body part. | number |

---
## clothes_percentages.csv & clothes_percentages.R

- `clothes_percentages.csv`: The data as described below
- `clothes_percentages.R`: The script used to process banned_items.csv to create `clothes_percentages.csv`. To run this script, you'll also need the `clothesDetails.csv` file (also located in this repository). The data was then used for the graphics in the section of The Messages Dress Codes Are Sending labelled "Percentage of High Schools Which Prohibit Clothing Items". This script was written in the R programming language. All details describing the R session environment during processing are available [here](#Session-info).


- 	**What is this?**: The `.csv` file contains the body parts prohibited from visibility in each school.
-   **Source(s)**: Since this is processed data from `banned_items.csv`, refer to the `Source` section of `banned_items.csv`.
-   **Last Modified**: February 2, 2019
-   **Contact Information**: [Amber Thomas](mailto:amber@pudding.cool)
-   **Spatial Applicability**: United States
-   **Temporal Applicability**: All data was collected for high schools' 2018-2019 school year.
-   **Observations (Rows)**: Each row represents data on a single clothing item.
-   **Variables (Columns)**:

| Header | Description | Data Type |
|---|---|---|
| `slug` | The cleaned and formatted item name for presentation. | text |
| `market` | The group of students that this clothing item/style is typically marketed to. <br>&bull; **f**: female students <br>&bull; **m**: male students <br>&bull; **n**: any students | text |
| `reveal_body` | Whether or not the clothing item is likely banned because it reveals or accentuates banned parts of the body. <br>&bull; **y**: yes <br>&bull; **n**: no | text |
| `n` | Count of schools that prohibit this particular clothing item. | number |
| `per` | The percentage of schools (out of the total number surveyed) that prohibit this item. | number |
| `group` | Each item was split into one of 7 groups based on what percentage of schools prohibited the item. Items in group `60` are prohibited between 60 and 70% of schools, items in group `50` are prohibited in between 50 and 60% of schools etc. | `number` |

---
## clothesDetails.csv

- 	**What is this?**: This file contains manually-entered details about the most commonly prohibited clothing items and styles.
-   **Source(s)**: These data were collected by searching for items in major clothing retailers to find if items are primary marketed to male, female, or any student.
-   **Last Modified**: February 2, 2019
-   **Contact Information**: [Amber Thomas](mailto:amber@pudding.cool)
-   **Spatial Applicability**: United States
-   **Temporal Applicability**: All data was collected in January 2019.
-   **Observations (Rows)**: Each row represents data on a single clothing item.
-   **Variables (Columns)**:

| Header | Description | Data Type |
|---|---|---|
|`type` | General category for grouping rules. See `banned_items.csv` for more details | text |
| `item` | The clothing item prohibited. | text |
| `market` | The group of students that this clothing item/style is typically marketed to. <br>&bull; **f**: female students <br>&bull; **m**: male students <br>&bull; **n**: any students  | text |
| `reveal_body` | Whether or not the clothing item is likely banned because it reveals or accentuates banned parts of the body. <br>&bull; **y**: yes <br>&bull; **n**: no | text |
| `slug` | A formatted version of the item name | text |

---

## full_text.csv
- 	**What is this?**: This file contains the entire dress code text for each school.
-   **Source(s)**: These data were collected in the same way as `banned_items` and are presented without further processing.
-   **Last Modified**: February 2, 2019
-   **Contact Information**: [Amber Thomas](mailto:amber@pudding.cool)
-   **Spatial Applicability**: United States
-   **Temporal Applicability**: All data was collected for high schools' 2018-2019 school year.
-   **Observations (Rows)**: Each row represents one school.
-   **Variables (Columns)**:

| Header | Description | Data Type |
|---|---|---|
|`schoolName` |  The NCES-formatted school name. | text |
| `state` | The two-letter state abbreviation for each school. | text |
| `link` | The URL link to the student handbook or dress code policy (as of November 2018 - February 2019) | text |
| `text` | The full text of the dress code policy. This was often copied/pasted from PDF files so may have `/t` type notation for formatting purposes.  | text |

---
## length_restrictions.csv

- 	**What is this?**: This file contains specific data about any length restrictions on `shorts`, `skirts`, `dresses` etc.
-   **Source(s)**: These data were collected in the same way as `banned_items` and are presented without further processing.
-   **Last Modified**: February 2, 2019
-   **Contact Information**: [Amber Thomas](mailto:amber@pudding.cool)
-   **Spatial Applicability**: United States
-   **Temporal Applicability**: All data was collected for high schools' 2018-2019 school year.
-   **Observations (Rows)**: Each row represents data on a item rule.
-   **Variables (Columns)**:

| Header | Description | Data Type |
|---|---|---|
|`schoolName` |  The NCES-formatted school name. | text |
| `state` | The two-letter state abbreviation for each school. | text |
| `limits` | Item for which the length restriction applies (`shorts`, `skirts`, etc.) | text |
| `length` | The length restriction for each specific object (e.g., `shorter than fingertips`, `shorter than x inches from the knee`) | text |
| `inches` | If the `length` variable contains an `x` (e.g., `shorter than x inches from the knee`) the number in this column represents the x. For some schools, this is not a number, but an item used for reference (e.g., `width of a dollar bill`) | text |

---
## sanctions.csv
- 	**What is this?**: This file contains specific data about any sanctions for dress code violations listed directly in the `Dress Code` section of the Student Handbook or Code of Conduct.
-   **Source(s)**: These data were collected in the same way as `banned_items.csv` and are presented without further processing.
-   **Last Modified**: February 2, 2019
-   **Contact Information**: [Amber Thomas](mailto:amber@pudding.cool)
-   **Spatial Applicability**: United States
-   **Temporal Applicability**: All data was collected for high schools' 2018-2019 school year.
-   **Observations (Rows)**: Each row represents data on a single sanction.
-   **Variables (Columns)**:

| Header | Description | Data Type |
|---|---|---|
|`schoolName` |  The NCES-formatted school name. | text |
| `state` | The two-letter state abbreviation for each school. | text |
| `sanction` | The sanction/punishment for breaking the school dress code. | text |
| `offense` | Some schools listed specific sanctions for the first offense (`1st`), second offense (`2nd`) etc. If no specific offense number was listed, it is entered in this column as `Any`. | text |

**Notes**: Some schools did not appear to list sanctions within the dress code policy, or referenced sanctions specified elsewhere. The sanctions listed here are **only** those that were listed within the text of the dress code policy so they may not indicate all possible sanctions for each school.

---

## school_metadata.csv

- 	**What is this?**: This file contains some relevant information from the National Center for Education Statistics (NCES) about the schools whose dress code policies were analyzed here.
-   **Source(s)**: National Center for Education Statistics [public school search function]((https://nces.ed.gov/ccd/schoolsearch)).
-   **Last Modified**: Downloaded November 9, 2018
-   **Contact Information**: [Amber Thomas](mailto:amber@pudding.cool)
-   **Spatial Applicability**: United States
-   **Temporal Applicability**: According to the NCES, these data were accurate in the 2015-2016 year.
-   **Observations (Rows)**: Each row represents data for one school.
-   **Variables (Columns)**:

| Header | Description | Data Type |
|---|---|---|
|`schoolName` |  The NCES-formatted school name. | text |
| `stateAbb` | The two-letter state abbreviation for each school. | text |
| `locale` | The NCES [locale](https://nces.ed.gov/pubs2007/ruraled/exhibit_a.asp) variable (e.g., `21-Suburb: Large`, `41-Rural: Fringe`)| text |
| `totalStudents` | The number of students attending the school (according to the NCES) | number |

---
## strap_restrictions.csv

- 	**What is this?**: This file contains specific data about any strap-width restrictions for shirts/dresses.
-   **Source(s)**: These data were collected in the same way as `banned_items.csv` and are presented without further processing.
-   **Last Modified**: February 2, 2019
-   **Contact Information**: [Amber Thomas](mailto:amber@pudding.cool)
-   **Spatial Applicability**: United States
-   **Temporal Applicability**: All data was collected for high schools' 2018-2019 school year.
-   **Observations (Rows)**: Each row represents data on a single item rule.
-   **Variables (Columns)**:

| Header | Description | Data Type |
|---|---|---|
|`schoolName` |  The NCES-formatted school name. | text |
| `state` | The two-letter state abbreviation for each school. | text |
| `limits` | The width restriction for each strap (e.g., `to the edge of the shoulder`, `less than x inches`) | text |
| `number` | If the `limits` variable contains an `x` (e.g., `less than x inches`) the number in this column represents the x. For some schools, this is not a number, but an item used for reference (e.g., `width of a dollar bill`) | text |

---

## words_percentages.csv & words_percentages.R


- `words_percentages.csv`: The data as described below
- `words_percentages.R`: The script used to process  `banned_items.csv` to create `words_percentages.csv`. The data was then used for the graphics in the section of The Messages Dress Codes Are Sending labelled "Most Common Words in the Rationale for Dress Codes". This script was written in the R programming language. All details describing the R session environment during processing are available [here](#Session-info).


- 	**What is this?**: The `.csv` file contains the words manually tagged from the dress code that were used to describe the rationale that the dress code exists or that a specific item is prohibited.
-   **Source(s)**: Since this is processed data from `banned_items.csv`, refer to the `Source` section of `banned_items.csv`.
-   **Last Modified**: February 2, 2019
-   **Contact Information**: [Amber Thomas](mailto:amber@pudding.cool)
-   **Spatial Applicability**: United States
-   **Temporal Applicability**: All data was collected for high schools' 2018-2019 school year.
-   **Observations (Rows)**: Each row represents data on a word/phrase.
-   **Variables (Columns)**:

| Header | Description | Data Type |
|---|---|---|
| `item` | The general word/phrase tagged as being present in the dress code. | text |
| `n` | The count of schools that use that word/phrase. | number |
| `percent` | The percentage of schools (out of all schools analyzed), that include that word/phrase in their dress code policy. | number |
| `display` | A cleaned version of the `item` for graphical display. | text |




---

## Session Info

    ##  setting  value                       
    ##  version  R version 3.4.4 (2018-03-15)
    ##  system   x86_64, darwin15.6.0        
    ##  ui       X11                         
    ##  language (EN)                        
    ##  collate  en_US.UTF-8                 
    ##  tz       America/Los_Angeles         
    ##  date     2019-02-03

    ## Packages -----------------------------------------------------------------

    ##  package   * version date       source        
    ##  backports   1.1.2   2017-12-13 CRAN (R 3.4.3)
    ##  base      * 3.4.4   2018-03-15 local         
    ##  compiler    3.4.4   2018-03-15 local         
    ##  datasets  * 3.4.4   2018-03-15 local         
    ##  devtools    1.13.6  2018-06-27 CRAN (R 3.4.4)
    ##  digest      0.6.15  2018-01-28 CRAN (R 3.4.3)
    ##  evaluate    0.10.1  2017-06-24 CRAN (R 3.4.1)
    ##  graphics  * 3.4.4   2018-03-15 local         
    ##  grDevices * 3.4.4   2018-03-15 local         
    ##  htmltools   0.3.6   2017-04-28 CRAN (R 3.4.0)
    ##  knitr       1.20    2018-02-20 CRAN (R 3.4.3)
    ##  magrittr    1.5     2014-11-22 CRAN (R 3.4.0)
    ##  memoise     1.1.0   2017-04-21 CRAN (R 3.4.0)
    ##  methods   * 3.4.4   2018-03-15 local         
    ##  Rcpp        1.0.0   2018-11-07 cran (@1.0.0)
    ##  rmarkdown   1.9     2018-03-01 CRAN (R 3.4.3)
    ##  rprojroot   1.3-2   2018-01-03 CRAN (R 3.4.3)
    ##  stats     * 3.4.4   2018-03-15 local         
    ##  stringi     1.1.7   2018-03-12 CRAN (R 3.4.4)
    ##  stringr     1.3.1   2018-05-10 CRAN (R 3.4.4)
    ##  tools       3.4.4   2018-03-15 local         
    ##  utils     * 3.4.4   2018-03-15 local         
    ##  withr       2.1.2   2018-03-15 CRAN (R 3.4.4)
    ##  yaml        2.1.18  2018-03-08 CRAN (R 3.4.4)
