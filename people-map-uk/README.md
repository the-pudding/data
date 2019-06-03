This folder contains all of the data used in The Pudding essay A People Map of the UK published in June 2019.

The data will never be updated.

Below you'll find the metadata for each file.

## people-map-uk.csv

-   **What is this?**: Data of the most visited person(s) Wikipedia page for each city with a "People from X town or city..." (~ 2,500) in the UK
-   **Source(s) & Methodology**: [English Wikipedia](https://en.wikipedia.org)
-   **Last Modified**: June 2019
-   **Contact Information**: [Russell Goldenberg](mailto:russell@pudding.cool)
-   **Spatial Applicability**: United Kingdom
-   **Temporal Applicability**: July 2015 through May 2019
-   **Observations (Rows)**: Each row represents one person.
-   **Variables (Columns)**:

| Header | Description | Data Type |
| --- | --- | --- |
| `name_clean` | name of person | text |
| `city_clean` | abridged city/town name | text |
| `link` | link to wiki page | text |
| `country` | country name | text |
| `city` | city/town name | text |
| `views_median` | average number of pageviews per day | number |
| `views_sum` | total number of pageviews | number |
| `lat` | latitude of place | number |
| `lng` | longitude of place | number |
| `extract` | 200 character description of person | text |