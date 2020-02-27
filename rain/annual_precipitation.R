# For general data cleaning and analysis
library(tidyverse)
library(readr)
library(lubridate)

# For keeping your files in relative directories
library(here)
# load stations from fixed width format
stationStarts <- c(1, 13, 22, 32, 39, 42, 73, 77, 81)
stationEnds <- c(11, 20, 30, 37, 40, 71, 75, 79, 85)
stationNames <- c("id", "latitude", "longitude", "elevation", "state", "name", "gsn", "hcn", "wmo")
stations <- readr::read_fwf(here::here("assets", "data", "raw_data", "ghcnd-stations.txt"),
                            fwf_positions(stationStarts, stationEnds, stationNames),
                            cols("id" = col_character(),
                                 "latitude" = col_number(),
                                 "longitude" = col_number(),
                                 "elevation" = col_number(),
                                 "state" = col_character(),
                                 "name" = col_character(),
                                 "gsn" = col_character(),
                                 "hcn" = col_character(),
                                 "wmo" = col_character()
                                 ))
# a function to filter precipitation data from full dataset
filterPrecip <- function(fileYear, .pb = NULL){
  # progress bar
  if ((!is.null(.pb)) && inherits(.pb, "Progress") && (.pb$i < .pb$n)) .pb$tick()$print()
  Sys.sleep(0.001)
  
  # find file, download, import, filter to US & Canada precipitation data, export new file
  fileURL <- glue::glue("ftp://ftp.ncdc.noaa.gov/pub/data/ghcn/daily/by_year/{fileYear}.csv.gz")
  df <- read_csv(fileURL,col_names = c("id", "date", "element", "value", "mflag", "qflag", "sflag", "obstime"),
                   col_types = c("cdcncccc")) %>% 
    filter(element == "PRCP") 
  
  # find the unique station id's with at least 365 days' worth of data for the year
  unique <- df %>% 
    group_by(id) %>% 
    summarise(count = n()) %>% 
    filter(count >= 365) 
  
  # keep only the station ids with data for the full year that are also in the US or Canada
  nonMissing <- df %>%
    filter(id %in% unique$id) %>% 
    # combine with station information to keep US & Canada stations
    left_join(stations) %>% 
    # remove any not in the US or Canada
    filter(!is.na(state))
  
  # define the location and filename for the new file
  fileName = here::here("assets", "data", "raw_data", "precip_full_unique.csv")

  # export the data to a csv
	write.table(nonMissing, file = fileName, row.names = FALSE, append = TRUE, sep = ",", col.names = !file.exists(fileName))
}
years <- seq(2010, 2019, by = 1)
pb <- progress_estimated(length(years))
map_df(years, filterPrecip, .pb = pb)
# import data from location where it had been exported
allPrecip <- read_csv(here::here("assets", "data", "raw_data", "precip_full_unique.csv"),
                   col_types = c("cdcncccc"))

# find station ids that have data for all 10 years
all10Unique <- allPrecip %>% 
  group_by(id) %>% 
  summarise(count = n()) %>% 
  # keep stations with daily records over 10 years (including leap years)
  filter(count == 3652)

# Combine with the station data
all10Stations <- all10Unique %>% 
  left_join(stations)

# keep only the stations that have 10 years of data
all10 <- allPrecip %>% 
  filter(id %in% all10Unique$id) %>% 
  left_join(stations)
# Calculate total annual rainfall for each station
tenYearTotals <- all10 %>% 
  # remove any with missing date field
  filter(!is.na(date)) %>% 
  # convert to a date object and create a new column for the year
  mutate(date = lubridate::ymd(date),
         year = year(date)) %>% 
  # find the total amount of rain per station per year
  group_by(id,  year) %>% 
  summarise(total = sum(value))

# Find the average annual rainfall per station
tenYearAvg <- tenYearTotals %>% 
  # calculate the mean annual rainfall per station
  group_by(id) %>% 
  summarise(average = mean(total)) %>% 
  # sort in descending order
  arrange(desc(average)) %>% 
  # add a column ranking the stations by average annual rainfall
  mutate(rank = row_number()) %>% 
  # combine with the station data
  left_join(stations)

# Find annual rainfall data for only 2019
lastYearOnly <- all10 %>% 
  filter(!is.na(date)) %>% 
  # convert to a date object and create a separate column for the year
  mutate(date = lubridate::ymd(date),
         year = year(date)) %>% 
  # keep only data from 2019
  filter(year == 2019) %>% 
  # calculate the total amount of rainfall per station in 2019
  group_by(id) %>% 
  summarise(total = sum(value))

# Prepare data for export
exportAnnual <- tenYearAvg %>% 
  # combine average annual rainfall and 2019's total rainfall in the same data frame
  left_join(lastYearOnly) %>% 
  # rename the column with 2019's data to 'total19'
  rename(total19 = total) %>% 
  # remove unnecessary columns
  select(-c("gsn", "hcn", "wmo")) %>% 
  # convert from tenths of a mm to 1 mm
  mutate(total19 = total19 / 10,
         average = average / 10) %>% 
  # convert to inches
  mutate(total19 = round(total19 / 25.4, 1),
         average = round(average / 25.4, 1))

# write the dataframe to a csv file
write.csv(exportAnnual, here::here("assets", "data", "processed_data", "annual_precip.csv"), row.names = FALSE, na = "")
geocodedIDs <- read_csv('https://github.com/the-pudding/data/blob/master/rain/locations.csv')
annualGeo <- geocodedIDs %>% 
  select(-c("latitude", "longitude", "state")) %>% 
  left_join(exportAnnual, by = "id") %>% 
  select(-rank)
