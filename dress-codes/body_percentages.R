# Importing libraries

# For file structures
library(here)

# For tidying data
library(tidyverse)

# Importing Data
# Assuming that banned_items.csv has been downloaded from allData.zip and kept in a folder called `raw_data` within the current working directory.
# Download banned_items.csv from https://github.com/the-pudding/data/tree/master/dress_codes/banned_items.csv
bannedItems <- read.csv(here::here("raw_data", "banned_items.csv"), stringsAsFactors = FALSE, header = TRUE)

# Calculate how many schools are in the dataset
nSchools <- bannedItems %>% 
  # remove any duplicates by looking for distinct state/school name combinations
  distinct(state, schoolName) %>% 
  # count the remaining items
  count(.)

# Check which schools ban body parts
body <- bannedItems %>% 
  # keep only banned body parts
  filter(type == "body") %>% 
  # keep only distinct school names
  distinct(schoolName)

# Percentage of schools that ban specific body parts
bodyPercent <- bannedItems %>% 
  # Keep only the schools that ban body parts
  filter(schoolName %in% body$schoolName) %>% 
  # Keep only the banned body parts
  filter(type == "body") %>% 
  # Count how many times each body part was banned
  count(item, sort = TRUE) %>% 
  # Calculate the percentage (compared to total number of dress codes analyzed)
  mutate(per = n/nSchools$n * 100) %>% 
  # Round the percentage to a whole number
  mutate(per = round(per, 0)) %>% 
  # Keep only the percentages greater than or equal to 5%
  filter(per >= 5)