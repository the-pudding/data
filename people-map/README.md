This folder contains all of the data used in The Pudding essay A People Map of the US published in May 2019.

The data will never be updated.

Below you'll find the metadata for each file.

## people-map.csv

-   **What is this?**: Data of the most visited person(s) Wikipedia page for each city with a "List of People from..." (~ 10,000) in the US
-   **Source(s) & Methodology**: [https://en.wikipedia.org](English Wikipedia)
-   **Last Modified**: May 2019
-   **Contact Information**: [Russell Goldenberg](mailto:russell@pudding.cool)
-   **Spatial Applicability**: United States
-   **Temporal Applicability**: July 2015 through May 2019
-   **Observations (Rows)**: Each row represents one person.
-   **Variables (Columns)**:

| Header | Description | Data Type |
| --- | --- | --- |
| `name` | name of person | text |
| `city` | city/town name | text |
| `neighborhood` | neighborhood name (if applicable) | text |
| `place` | neighborhood or city | text |
| `views_median` | average number of pageviews per day | number |
| `views_sum` | total number of pageviews | number |
| `name_clean` | display name (removed items in parenthesis) | text |
| `lat` | latitude of place | number |
| `lng` | longitude of place | number |
| `extract` | 200 character description of person | text |