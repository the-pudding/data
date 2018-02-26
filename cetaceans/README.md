This folder contains all of the data used in The Pudding article [Free Willy and Flipper by the Numbers](https://pudding.cool/2017/07/cetaceans/) published in July 2017. 

Below you'll find metadata for each file. 

## acquisitionsOnly2.csv
*change to acquisitions.csv*

- 	**What is this?**: For a whale or dolphin to reside under human care, it must have been captured from the ocean, born in captivity, or rescued. This dataset provides aggregate counts of whales and dolphins that joined the US captive animal population, along with their acquisition methods, between 1938 and May 7, 2017. 
-   **Source(s)**: The data used to create this aggregated set came from the US National Marine Mammal Inventory (original data requested on June 15, 2015 via FOIA available [here](https://foiaonline.regulations.gov/foia/action/public/view/request?objectId=090004d28075988d)) and from [Ceta-Base](http://www.cetabase.org/). Data from Ceta-Base were downloaded May 7, 2017. The complete, cleaned, non-aggregated dataset can be found in `allCetaceanData.csv`. 
-   **Last Modified**: May 7, 2017
-   **Contact Information**: [Amber Thomas](mailto:amber@polygraph.cool)
-   **Variables (Columns)**:

| Header | Description | Data Type |
|---|---|---|
| `AcqYear` | The year that an animal joined the captive US community. For captive-born animals, the `AcqYear` is the year of birth, whereas for wild-caught or rescued animals, `AcqYear` is the year of capture or rescue. | number |
| `Born` | The aggregate number of cetaceans that were born in captivity during a calendar year. This number only includes live births (i.e., miscarriages and stillbirths are not included in this count). | number |
| `Capture` | The aggregate number of cetaceans that were captured and spent some period of time living in captivity in the US during a calendar year. | number |
| `Rescue` | The aggregate number of cetaceans that were rescued and were deemed unreleasable during a calendar year. It is possible (and even quite likely) that several more animals were rescued in the US each year and either died or were released. This count only includes the animals that survived but could not be released and thus joined the captive US community. | number |

- **Other Notes**: The 25 animals in the database that were transferred from non-US facilities to US facilities are not included in these counts. Of those 25 animals, the most-recently captured was caught in 1997, housed in Mexico for 7+ years and transferred to a US facility in 2005. 


## allCetaceanData.csv

- 	**What is this?**: A collection of all data that I could find on whales and dolphins that spent some period of time captive in the US between 1938 and May 7, 2017. 
-   **Source(s)**: The data used to create this aggregated set came from the US National Marine Mammal Inventory (original data requested on June 15, 2015 via FOIA available [here](https://foiaonline.regulations.gov/foia/action/public/view/request?objectId=090004d28075988d)) and from [Ceta-Base](http://www.cetabase.org/). Data from Ceta-Base were downloaded May 7, 2017. 
-   **Last Modified**: May 7, 2017
-   **Contact Information**: [Amber Thomas](mailto:amber@polygraph.cool)
-   **Variables (Columns)**:

| Header | Description | Data Type |
|---|---|---|
| `species` | The common name for an individual animal's species (e.g., `Bottlenose`, `Killer whale; orca` etc.) | text |
| `id` | One or more individual identification numbers assigned to an animal. **Note:** Not all individual animals have an ID number. If an animal has no number, it is denoted as `NA`. | text |
| `name` | An individual animal's name. Some animals have been known by more than one name. Where possible, the additional name(s) are noted in `Notes`. | text |
| `sex` | An individual animal's sex. <br/>&bull; `M` = male<br/>&bull; `F` = female<br/>`U` = unknown | text |
| `accuracy` | The accuracy of an animal's birth date (i.e., birth dates for wild-caught animals are estimated). <br/>&bull; `a` = actual date <br/> &bull; `e` = estimated date, `u` = unknown | text |
| `birthYear` | The year that an individual animal was born (see `Accuracy` to determine if that birth year is known or estimated). If a birth year is unknown and not estimated, it is coded as `NA`. | number |
| `acquisition` | The method through which an animal was acquired and brought into the captive cetacean group. <br/> &bull; `Born` = animal was born in captivity <br/> &bull; `Capture` = animal was captured from the ocean <br/> &bull;`Rescue` = animal was rescued (e.g., had stranded or required medical intervention) and was deemed unreleasable. <br/> **Note:** If the recorder was unsure how an animal was acquired, they may have included a `?` with the above code (e.g., `born?`). | text |
| `originDate` | The year that an animal entered captivity. For a wild-caught or rescued animal, this will be the year that they were rescued/captured. For captive-born animals, this will be the same as the birth year. Unknown dates are encoded as `NA`. | date | 
| `originLocation` | The location that an animal originated from. For captured/rescued animals this is an approximate location in the ocean (e.g., `Atlantic Ocean` or `Gulf of Mexico, MS, US`), but for animals born in captivity it will list the facility where the animal was born. | text |
| `mother` | The name of an animal's biological mother (if known). **Note:** Some names contain species scientific names (e.g., `Cindy (T.t. gilli)`). Unknown names are encoded as `NA`.| text |
| `father` | The name of an animal's biological father (if known). **Note:** Some names contain species scientific names (e.g., `Jethro (T.t. gilli)`). Unknown names are encoded as `NA`.| text |
| `transfers` | A list of facilities that an animal was transferred to, with the approximate dates that they were transferred (e.g., `SeaWorld Orlando to New England Aquarium (22-Feb-1982) to Dolphin Research Center (23-Oct-1991)`). If no transfers are known, this field is encoded as `NA`. | text | 
| `currently` | The location where a living animal currently resides (as of May 7, 2017) or the last location where an animal lived before it died. If an animal's last location is unknown it is encoded as `Unknown`. | text |
| `region` | The region of the world where the animal either currently or most-recently lived. | text |
| `status` | The current status of an animal. <br/> &bull;`Alive` = animal is still alive and living in captivity (as of May 7, 2017) <br/> &bull;`Died` = animal has been confirmed as dead. <br/> &bull;`Stillbirth` = Calf that died before birth. <br/>&bull;`Miscarriage` = Calf that was miscarried before full-term gestation. <br/>&bull;`Released` = Animal had lived in captivity for some period of time but has since been released to the ocean. <br/> &bull;`Unknown` or `---` = The animal's current status is unknown. <br/> **Note:** When the recorder of an animal's status wasn't sure exactly what happened to the animal, they may have included a `?` with the above code (e.g., `stillbirth?`). | text |
| `statusDate` | The date that an animal's status changed. For living animals, the status date is `NA`, but for animals that have died or been released, this is their date of death or release. | date |
| `COD` | The animal's reported cause of death. For living animals, this is `NA`. <br/>**Note:** Use these data with caution. COD is reported differently between facilities and are not always reported by a pathologist that can properly identify the cause of death. | text |
| `transferDate` | The date an animal was transferred into the US. For animals that were born in the US, this is `NA`. | date |
| `transfer` | The types of transfers that an animal has been involved with. <br/>&bull;`US` = The animal was only transferred between facilities in the US <br/>&bull;`Foreign` = The animal was transferred from outside of the US into the US. | text |
| `entryDate` | The date that an individual animal entered the US captive population. For captive-born animals, this is their birth date *or* the day they were transferred to a facility in the US. For captured or rescued animals, this is either the date that they were captured/rescued *or* the day that they were transferred from a foreign facility to a US one. | date | 

## survivalRates.csv

- 	**What is this?**: Calculated values of Annual and Daily Survival Rates of Bottlenose Dolphins, Killer Whales (orcas), Beluga Whales, and Pacific White-Sided Dolphins in Captivity between 1939 and 2017. 
-   **Source(s) & Methodology**: The data used to create this aggregated set came from the US National Marine Mammal Inventory (original data requested on June 15, 2015 via FOIA available [here](https://foiaonline.regulations.gov/foia/action/public/view/request?objectId=090004d28075988d)) and from [Ceta-Base](http://www.cetabase.org/). Data from Ceta-Base were downloaded May 7, 2017. The entire course of cetacean captivity has been equally split into three temporal groups (1939 - 1964, 1965 - 1990, 1991 - 2017) . Annual Survival Rate (ASR) was calculated for the entire population of animals that entered captivity during each group as described in [DeMaster and Drevenak (1988)](https://swfsc.noaa.gov/publications/CR/1988/8822.PDF). Due to small sample sizes and to compare to wild animal ASR, age-specific survival rates were not calculated. Animals that died at younger than 60 days of age (or within the first 60 days after capture) were excluded from analysis, to compare to similarly calculated wild values. Animals that were transferred from non-US facilities were included in these data, starting at the date that they joined the US population.
-   **Last Modified**: May 7, 2017
-   **Contact Information**: [Amber Thomas](mailto:amber@polygraph.cool)
-   **Variables (Columns)**:

| Header | Description | Data Type |
|---|---|---|
| `species` | The common name for a species (e.g., `Bottlenose`, `Killer whale; orca` etc.) | text |
| `yearGroup` | Denotes which of the 3 groups of years the following values have been calculated for. <br/> &bull;`A` = 1939 - 1964 <br/> &bull;`B` = 1965 - 1990 <br/> &bull;`C` = 1991 - 2017. | text | 
| `sumAnimalDays` | The total number of days that animals were alive and in captivity in the US between January 1st of the starting year and December 31st of the ending year (except for Group C, where total days were calculated between January 1st of 1965 and May 7, 2017). | number |
| `count` | Total number of animals living in captivity in the US during a group of years. | number |
| `DSR` | Daily Survival Rate. Calculated as `1 - (count / sumAnimalDays)` | number |
| `ASRLow` | Low estimate of Annual Survival Rate. Calculated as `(DSR - (1.96 * (sqrt(DSR * (1 - DSR) / sumAnimalDays)))) ^ 365.25`. | number |
| `ASRHigh` | High estimate of Annual Survival Rate. Calculated as `(DSR + (1.96 * (sqrt(DSR * (1 - DSR) / sumAnimalDays)))) ^ 365.25`. | number | 
| `ASR` | Estimate of Annual Survival Rate. Calculated as `DSR ^ 365.25`. | number | 

- **Calculations:** Using R, the above values can be calculated from the values within `allCetaceanData.csv` with the following script: 
```r
library(tidyverse)

years <- c(1939:1964, 1965:1990, 1991:2017)

yearGroups <- as.data.frame(years) %>% 
            mutate(group = ifelse(years < 1985, "A",
                ifelse(years > 1991, "C", "B")))

animalDays3 <- cetaceansUpdate5 %>% 
	filter(Status == "Alive" | Status == "Died",
         !(Status == "Died" & is.na(statusDate))) %>% 
	mutate(entryDate = ymd(entryDate),
        entryYear = year(entryDate),
        yearGroup = ifelse(entryYear <= 1964, "A",
                ifelse(entryYear > 1991, "C", "B")),
                max = ifelse(yearGroup == "A" & (statusDate < ymd("1964-12-31")), "Died", 
                ifelse(yearGroup == "B" & (statusDate < ymd("1991-12-31")), "Died", ifelse(yearGroup == "C" & (statusDate < ymd("2016-12-31")), "Died", "Survived")))) %>% 
	mutate(max = ifelse(is.na(max), "Survived", max)) %>% 
	mutate(minA = pmin(statusDate, ymd("1964-12-31"), na.rm = TRUE),
        minB = pmin(statusDate, ymd("1991-12-31"), na.rm = TRUE),
        minC = pmin(statusDate, ymd("2016-12-31"), na.rm = TRUE),
        min = if_else(yearGroup == "A", minA,
                if_else(yearGroup == "B", minB,
                    if_else(yearGroup == "C", minC, ymd("2017-05-01"))))) %>%
	select(-minA, -minB, -minC) %>% 
	mutate(animalDays = min - entryDate) %>% 
	filter(!animalDays < 60) %>% 
	filter(Species == "Bottlenose" | Species == "Beluga" | Species == "Killer Whale; Orca" | Species == "White-sided, Pacific") %>% 
	group_by(Species, yearGroup) %>% 
	mutate(totalAnimalDays = sum(animalDays, na.rm = TRUE)) %>% 
	group_by(Species, max, yearGroup) %>% 
	summarise(sumAnimalDays = mean(totalAnimalDays),
        count = n()) %>% 
	filter(max == "Died") %>% 
	mutate(sumAnimalDays = as.numeric(sumAnimalDays)) %>% 
	mutate(DSR = 1 - (count / sumAnimalDays),
         ASRlow = (DSR - (1.96 * (sqrt(DSR * (1-DSR) / sumAnimalDays)))) ^ 365.25,
         ASRhigh = (DSR + (1.96 * (sqrt(DSR * (1-DSR) / sumAnimalDays)))) ^ 365.25,
         ASR = DSR ^ 365.25) %>% 
	ungroup()
```