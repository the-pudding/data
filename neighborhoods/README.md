This folder contains all of the data used in The Pudding essay [A Tale of Two Cities](https://pudding.cool/2018/03/neighborhoods) published in March 2018. 

Below you'll find metadata for each file. 

## top5_Seattle.csv & top5_NewYork.csv

- 	**What is this?**: Data representing the 5 business types that over-index the most in each of Seattle's and New York City's neighborhoods (respectively). 
-   **Source(s) & Methods**: Each of Seattle and New York City's neighborhoods were identified using Zillow's [neighborhood-level shapefiles](http://www.zillow.com/howto/api/neighborhood-boundaries.htm). We then used thesed neighborhood names to query the [Yelp API](https://www.yelp.com/developers/documentation/v3/business_search) for any available Yelp [business categories](https://www.yelp.ca/developers/documentation/v3/category_list) using a radius of 2 miles (3210m). Using the latitude/longitude coordinates, we mapped each business to a neighborhood, and compared the ratio of businesses from each category in each neighborhood to their ratio in the city as a whole (e.g., if hairdressers made up 10% of a particular neighborhood's businesses but only 5% of the businesses in the city overall, they were judged to "over-index" in that neighborhood). If a single business had more than one category (e.g., `Outdoor Wear`, `Sports Wear`, and `Bikes`) that business would be repeated three times, once for each category. Thus, a single business could be counted in more than one category, but never more than once in the same category.
-   **Last Modified**: Seattle - February 15, 2018. New York City - March 10, 2018.
-   **Contact Information**: [Amber Thomas](mailto:amber@polygraph.cool)
-   **Spatial Applicability**: These data apply to businesses inside of the Seattle and New York City limits, as defined by Zillow's [neighborhood-level shapefiles](http://www.zillow.com/howto/api/neighborhood-boundaries.htm). 
-   **Temporal Applicability**: These data represent a collection of all operating businesses with at least one review on Yelp at the time of collection (Seattle: February 13, 2018 - February 15, 2018, New York City: March 6, 2018 - March 10, 2018).
-   **Observations (Rows)**: Each row represents a single category within a single neighborhood.
-   **Variables (Columns)**:

| Header | Description | Data Type |
|---|---|---|
| `neighborhood` | The plain text name of a neighborhood (as defined by [Zillow](http://www.zillow.com/howto/api/neighborhood-boundaries.htm)) | text | 
| `yelpAlias` | The Yelp-specified string to denote a specific category. These strings contain no spaces or special characters. [Full list](https://www.yelp.com/developers/documentation/v3/business_search)| text | 
| `yelpTitle` | The cleaned and human-readable version of the `yelpAlias`. [Full list](https://www.yelp.com/developers/documentation/v3/business_search) | text | 
| `nCount` | The number of businesses in a specific neighborhood that match a specific `yelpAlias`. | number | 
| `neighborhoodTotal` | The total number of businesses operating in that neighborhood. | number | 
| `cCount` | The number of businesses in the entire city that match a specific `yelpAlias`. | number | 
| `cityTotal` | The total number of businesses operating in the entire city.  | number | 
| `incidence` | The amount that a business-type over-indexes in a neighborhood compared to the city. This is calculated as (`nCount` / `cCount`) * (`cityTotal` / `neighborhoodTotal`). *Note: Any business-type that did not make up at least 1% of the neighborhood's businesses was removed from the analysis.* | number | 
| `rank` | A ranking of the businesses that over-index the most in a specific neighborhood. The business that over-indexes the most has `rank` = `1`.| number |

- **Other Notes**: Any use of these data needs to include a link back to [Yelp](https://www.yelp.com/) as attribution. 
