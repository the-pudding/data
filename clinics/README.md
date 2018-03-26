This folder contains all of the data used in The Pudding essay [How far is too far? An analysis of driving times to abortion clinics in the US.](https://pudding.cool/2017/09/clinics/) published in September 2017.

Below you'll find metadata for each file.

## cities.csv

* **What is this?**: Data representing the duration from cities to abortion clinics.
* **Source(s) & Methods**: Data for this story excluded hospitals and physicians because clinics account for about 95% of annual abortions in the US. All clinic locations were obtained from Safe Place Project and current operating status of each clinic was obtained manually. Detailed information regarding timing cut-offs on procedures (i.e., the maximum number of weeks into a pregnancy that the clinic will provide abortion services) were found on a clinic’s website or by calling the clinic directly. We used the maximum number of weeks that either a medical or a surgical abortion procedure will be performed at each clinic. Out of the 623 operating clinics included in our dataset, we were unable to obtain detailed timing information for just two. However, both of these clinics were found within large cities where other clinics also operate, so we do not believe that these missing data have a significant impact on our findings. Since these data are focused on driving duration from various locations to clinics, Alaska and Hawaii (which frequently require air travel) were excluded from this dataset. We broke down the timing of abortion procedures into four equally-spaced categories: 8 weeks, 12 weeks, 16 weeks, and 20 weeks. The first two groups fall within the first trimester and the last two fall within the second trimester. To determine driving times, we divided the contiguous US into approximately 4,500 equidistant points. We found the nearest clinic to each point and found the driving times for the six nearest clinics. If no roads existed within a 20 mile radius of the point (three instances), the clinic distance from a neighboring point was used. Round-trip driving times were rounded down to the nearest hour, and binned into one-hour increments to account for variation in departure location. For city-specific data, only cities with >50,000 population (via 2015 data) were included.
* **Last Modified**: August 30, 2017.
* **Contact Information**: [Russell Goldenberg](mailto:russel@polygraph.cool)
* **Spatial Applicability**: Contiguous US
* **Temporal Applicability**: Snapshot as of August 2017
* **Observations (Rows)**: Each row represents a single city and the driving duration to the nearest clinic at various stages of pregnancy.
* **Variables (Columns)**:

| Header                       | Description                                                     | Data Type |
| ---------------------------- | --------------------------------------------------------------- | --------- |
| id                           | unique city id                                                  | text      |
| city                         | city name                                                       | text      |
| state                        | state name                                                      | text      |
| population                   | city population (2015)                                          | number    |
| latitude                     | latitude                                                        | number    |
| longitude                    | longitude                                                       | number    |
| gestation_8_duration         | driving time in minutes (max 8 weeks)                           | number    |
| gestation_8_duration_closed  | driving time in minutes if closest clinic closed (max 8 weeks)  | number    |
| gestation_12_duration        | driving time in minutes (max 12 weeks)                          | number    |
| gestation_12_duration_closed | driving time in minutes if closest clinic closed (max 12 weeks) | number    |
| gestation_16_duration        | driving time in minutes (max 16 weeks)                          | number    |
| gestation_16_duration_closed | driving time in minutes if closest clinic closed (max 16 weeks) | number    |
| gestation_20_duration        | driving time in minutes (20 weeks+)                             | number    |
| gestation_20_duration_closed | driving time in minutes if closest clinic closed (20 weeks+)    | number    |
