This folder contains all of the data used in The Pudding article [Men are from Chelsea, Women are from Park Slope: How “gayborhoods” in 15 major American cities are divided by gender](https://pudding.cool/2018/06/gayborhoods/) published in June 2018.

Below you'll find metadata for each file.

## data.csv

* **What is this?**: Data for 2,328 ZIP codes within 10 miles of 15 major American cities including Atlanta, Austin, Boston, Chicago, Denver, Houston, Los Angeles, Miami, New Orleans, New York, Philadelphia, Portland, San Francisco, Seattle, and Washington DC.
* **Source(s)**: Data was collected from the following sources; Pride pride and march routes: individual city Pride organizations (i.e. [NYC Pride](https://www.nycpride.org/)), Gay bars: queried the [Yelp API](https://www.yelp.com/developers/documentation/v3/business_search) for "gay bars" with a 10-mile radius for each city, same-sex married joint tax filers by ZIP code: [US Treasury Department Office of Tax Analysis and Brookings](https://www.brookings.edu/research/gay-marriage-in-america-after-windsor-and-obergefell/), same-sex unmarried partner households by ZIP Code: queried the [Census API](https://www.census.gov/data/developers/data-sets.html) to return data included in table B11009 from the 2015 American Community Survey (ASC) 5-year estimates, ZIP Code Tabulation Areas (ZCTAs) shapefiles: [US Census](https://www.census.gov/geo/maps-data/data/cbf/cbf_zcta.html)
* **Last Modified**: June 28, 2018
* **Contact Information**: [Jan Diehm](mailto:jan@polygraph.cool)
* **Spatial Applicability**: United States (Atlanta, Austin, Boston, Chicago, Denver, Houston, Los Angeles, Miami, New Orleans, New York, Philadelphia, Portland, San Francisco, Seattle, and Washington DC)
* **Temporal Applicability**: 2015
* **Other calculations**: the following calculations were made on all US ZIP codes, but only ZIP Codes within 10 miles of the 15 cities are included in data.csv

| Name            | Description                                                                | Value | Data Type |
| ----------------- | -------------------------------------------------------------------------- | --------- |
| `MAXTax`              | the max rate of same-sex married joint tax filers per 1000                                                            | 412.96      | number |
| `MAXCns`              | the max rate of same-sex unmarried partner households per 1000                                                            | 112.58      | number |
| `MAX_SS_Index`              | the max same-sex index value                                                           | 97.66      | number |
| `MAX_Bars`              | the max number of businesses tagged "gay bar" on Yelp                                                           | 17      | number |

* **Variables (columns in data.csv)**:

| Header            | Description                                                                | Data Type |
| ----------------- | -------------------------------------------------------------------------- | --------- |
| `GEOID10`              | unique five-digit ZIP code (used as text to avoid losing leading zeros in ZIP Codes)                                                          | text      |
| `Tax_Mjoint`            | married joint tax filers     | number      |                                                   
| `Mjoint_MF`      | male-female married joint tax filers                                                  | number    |
| `Mjoint_SS`   | all same-sex married joint tax filers number                                     | number    |
| `Mjoint_FF` | same-sex female married joint tax filers                                  | number    |
| `Mjoint_MM`            | same-sex male married joint tax filers                       | number    |
| `TaxRate_SS`             | rate of same-sex married joint tax filers per 1000 (`Mjoint_SS` / `Tax_Mjoint` * 1000)                                                      | number   |
| `TaxRate_FF`      | rate of same-sex female married joint tax filers per 1000 (`Mjoint_FF` / `Tax_Mjoint` * 1000)                                                              | number      |
| `TaxRate_MM`          | rate of same-sex male married joint tax filers per 1000 (`Mjoint_MM` / `Tax_Mjoint` * 1000)                                                          | number      |
| `Cns_TotHH`       | total households from US Census                                                | number      |
| `Cns_UPSS`        | unmarried partner same-sex households                                                 | number    |
| `Cns_UPFF`     | unmarried partner same-sex female households                          | number      |
| `Cns_UPMM`      | unmarried partner same-sex male households                                         | number    |
| `Cns_RateSS`   | rate of unmarried partner same-sex households per 1000 (`Cns_UPSS` / `Cns_TotHH` * 1000)  | number      |
| `Cns_RateFF`    | rate of unmarried partner same-sex female households per 1000 (`Cns_UPFF` / `Cns_TotHH` * 1000)                            | number    |
| `Cns_RateMM`            | rate of unmarried partner same-sex male households per 1000 (`Cns_UPMM` / `Cns_TotHH` * 1000)                                                                 | number      |
| `ParadeFlag`             | 1 = Pride parade/march runs through ZIP code, 0 = Pride parade/march does NOT run through ZIP code                                                                   | boolean      |
| `CountBars`             | businesses tagged "gay bar" on Yelp                                                                  | number      |
| `FF_Tax`             |  weight (70) applied to the rate of same-sex female married joint tax filers per 1000 (`TaxRate_FF` / `MAXTax` * 70)                                                                | number      |
| `FF_Cns`             |  weight (30) applied the rate of unmarried partner same-sex female households per 1000 (`Cns_RateFF` / `MAXCns` * 30)                                                                | number      |
| `FF_Index`             |  index for same-sex female (`FF_Tax` + `FF_Cns`)                                                                | number      |
| `MM_Tax`             |  weight (70) applied to the rate of same-sex male married joint tax filers per 1000 (`TaxRate_MM` / `MAXTax` * 70)                                                                | number      |
| `MM_Cns`             |  weight (30) applied the rate of unmarried partner same-sex male households per 1000 (`Cns_RateMM` / `MAXCns * 30`)                                                                | number      |
| `MM_Index`             |  index for same-sex male (`MM_Tax` + `MM_Cns`)                                                                | number      |
| `SS_Index`             |  index for same-sex  (`FF_Index` + `MM_Index`)                                                                | number      |
| `SS_Index_Weight`             |  weight (70) applied to the index for same-sex  (`SS_Index` / `MAX_SS_Index` * 70)                                                                | number      |
| `Parade_Weight`             |  weight (10) applied to the parade flag (`ParadeFlag` * 10)                                                              | number      |
| `Bars_Weight`             |  weight (20) applied to the number of "gay bars" (`CountBars` / `MAXBars` * 20)                                                              | number      |
| `TOTINDEX`             |  complete gayborhood index (`SS_Index_Weight` + `Parade_Weight` + `Bars_Weight`)                                                              | number      |
