# Importing libraries

# For file structures
library(here)

# For tidying data
library(tidyverse)
library(tools)

# Importing Data
# Assuming that both files have been downloaded and kept in a folder called `raw_data` within the current working directory.
# Download banned_items.csv from https://github.com/the-pudding/data/tree/master/dress_codes/banned_items.csv
bannedItems <- read.csv(here::here("raw_data", "banned_items.csv"), stringsAsFactors = FALSE, header = TRUE)
# Download school_metadata.csv from https://github.com/the-pudding/data/tree/master/dress_codes/school_metadata.csv
schoolMetaData <- read.csv(here::here("raw_data", "school_metadata.csv"), stringsAsFactors = FALSE, header = TRUE) 

# Calculate how many schools are in the dataset
nSchools <- bannedItems %>% 
  # remove any duplicates by looking for distinct state/school name combinations
  distinct(state, schoolName) %>% 
  # count the remaining items
  count(.)

# List which body parts are the most commonly banned
bodyButtons <- c("midsection midriff", "cleavage", "back", "breasts chest", "buttocks", "stomach", "torso")

## Check which schools ban body parts
body <- bannedItems %>% 
  # Keep only banned body parts
  filter(type == "body") %>% 
  # Remove duplicate schools
  distinct(schoolName)


bodyBySchool <- bannedItems %>% 
  # Keep only schools that ban body parts
  filter(schoolName %in% body$schoolName) %>% 
  # Keep only the body parts that are most commonly banned (and in our list above)
  filter(type == "body",
         item %in% bodyButtons) %>% 
  # Rename midsection midriff and breasts chest
  mutate(item = case_when(
    item == "midsection midriff" ~ "midriff",
    item == "breasts chest" ~ "chest",
    TRUE ~ item 
  )) %>% 
  # Add school metadata to data frame
  right_join(schoolMetaData) %>% 
  # Change the number of students to a numeric
  mutate(totalStudents = as.numeric(totalStudents)) %>% 
  # Convert raw student counts into larger groups
  mutate(countGroup = case_when(
    totalStudents < 200 ~ "< 200",
    between(totalStudents, 200, 499) ~ "200-499",
    between(totalStudents, 500, 999) ~ "500-999",
    between(totalStudents, 1000, 1500) ~ "1000-1500",
    totalStudents >= 1500 ~ "1500+",
    TRUE ~ NA_character_
  )) %>% 
  # Convert raw locale counts into 4 groups
  mutate(localeGroup = case_when(
    grepl("Rural", locale) ~ "rural",
    grepl("City", locale) ~ "city", 
    grepl("Suburb", locale) ~ "suburb",
    grepl("Town", locale) ~ "town",
    TRUE ~ NA_character_
  )) %>% 
  # Trim white space around state abbreviation
  mutate(state = trimws(stateAbb)) %>% 
  # Remove unneeded columns
  select(-c("locale", "totalStudents", "stateAbb", "type")) %>%
  # Clean up school names by changing "h s" or "hs" to "High School"
  mutate(schoolName = gsub("[[:space:]]h s|[[:space:]]hs", " High School", tolower(schoolName)),
         # Change school names to title case
         schoolName = toTitleCase(schoolName)) %>% 
  ungroup() %>% 
  # Group the data by state and then school name
  group_by(state, schoolName) %>% 
  # Convert the items into a list for processing 
  mutate(bodyParts = list(item)) %>% 
  # Remove unneeded column
  select(-item) %>% 
  #Keep only unique state/school name combos
  distinct(state, schoolName, .keep_all = TRUE)

# If you want to output the data, it needs to be in a JSON format because it contains a list
bodySchoolJSON <- jsonlite::toJSON(bodyBySchool, pretty = TRUE, flatten = TRUE)