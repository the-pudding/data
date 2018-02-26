This folder contains all of the data used in The Pudding essay [The Timing of Baby Making](https://pudding.cool/2017/05/births/) published in May 2017. 

Below you'll find metadata for each file. 

## allBirthData.csv

- 	**What is this?**: Data representing the births of babies in the US from 1985 - 2015.
-   **Source(s) & Methodology**: Data from 1985 - 2002 were downloaded from the [National Bureau for Economic Research](http://www.nber.org/data/vital-statistics-natality-data.html). They obtained the data through the National Center for Health Statistics' National Vital Statistics System (available [here](https://www.cdc.gov/nchs/data_access/vitalstatsonline.htm#Births)). Data from 2003 - 2015 were downloaded using the Year, Month, State, and County aggregators from the CDC's [WONDER tool](https://wonder.cdc.gov/natality.html). For privacy reasons, NCHC doesn't release geolocation information for individual babies born after 2005, so all data is aggregated by month of birth. All data were downloaded on April 5, 2017. 
-   **Last Modified**: April 5, 2017
-   **Contact Information**: [Amber Thomas](mailto:amber@polygraph.cool)
-   **Observations (Rows)**: Each row represents the aggregate number of births within a county for a specific month and year.
-   **Variables (Columns)**:

| Header | Description | Data Type |
|---|---|---|
| `State` | The state (including District of Columbia) where the mother lives (states are listed as numbers in alphabetical order such that `01` = Alabama and `51` = Wyoming) | number | 
| `County` | The county where the mother lives (this is coded using the [FIPS County Code](https://en.wikipedia.org/wiki/FIPS_county_code)) | number | 
| `Month` | The month in which the birth took place (`1` = January and `12` = December) | number | 
| `Year` | The four-digit year of the birth (e.g., `2015`) | number | 
| `countyBirths` | The calculated sum of births that occurred to mothers living in a county for a given month (if the sum was less than 9, the sum is listed as `NA` as per NCHS reporting guidelines). | number | 
| `stateBirths` | The calculated sum of births that occurred to mothers living in a state for a given month (includes all birth counts, including those from counties with fewer than 9 births in a month). | number | 

- **Other Notes:**
    - In the article [The Timing of Baby Making](https://pudding.cool/2017/05/births/), only data from 1995 to 2015 was displayed. This file contains an extra 10 years of birth data. 
    - Any non-US residents have been removed from this dataset.