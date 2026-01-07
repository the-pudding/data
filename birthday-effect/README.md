This folder contains the raw data for the story Are you more likely to die on your birthday? published in April 2025.

The data will never be updated.

Below you'll find the metadata for each file.

## birthdays.csv

- **What is this?**: Data for each individual's birth and death dates in Massachusetts with deaths from 1999 through 2024.
- **Source(s) & Methodology**: Registry of Vital Records and Statistics of Massachusetts. More methods below.
- **Last Modified**: January 2026
- **Contact Information**: [Russell Samora](mailto:russell@pudding.cool)
- **Spatial Applicability**: N/A
- **Temporal Applicability**: 1999 - 2024
- **Observations (Rows)**: Each row represents one person and their birth and death dates.
- **Variables (Columns)**:

| Header       | Description                              | Data Type |
| ------------ | ---------------------------------------- | --------- |
| `birth` | birth date (format: YYYY-MM-DD) | text |
| `death` | death date (format: YYYY-MM-DD) | text |
| `age_floor` | age (rounded down) at death | number |
| `days_from_birthday` | the nearest number of days of death date from birth date on a circular calendar | number |
| `sex` | sex of person | text |
| `marital` | marital status | text |
| `manner` | manner of death | text |

## Method
Massachusetts death data was obtained via FOIA from the Registry of Vital Records and Statistics (RVRS). Data excludes deaths where the age is under one and half years old, birth or death dates on February 29, and missing birth or death dates.

Note: a circular calendar was used to compare dates on 365 days and excluded leap days. This approach was standard across studies in order to simplify calculations.

## Dictionary
### sex
note: this is missing for many entries
* m: male
* f: female
* u: unknown

### marital
* m: married
* s: single
* d: divorced
* w: widowed

### manner
* n: natural
* a: accident
* s: suicide
* h: homicide

