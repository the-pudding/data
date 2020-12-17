# Importing libraries

# For file structures
library(here)

# For tidying data
library(tidyverse)

# Importing Data
# Assuming that both files have been downloaded and kept in a folder called `raw_data` within the current working directory.
# Download banned_items.csv from https://github.com/the-pudding/data/tree/master/dress_codes/banned_items.csv
bannedItems <- read.csv(here::here("raw_data", "banned_items.csv"), stringsAsFactors = FALSE, header = TRUE)
# Download school_metadata.csv from https://github.com/the-pudding/data/tree/master/dress_codes/clothesDetails.csv
clothesDetails <- read.csv(here::here("raw_data", "clothesDetails.csv"), stringsAsFactors = FALSE, header = TRUE, na.strings = c("", " ")) 

# Calculate how many schools are in the dataset
nSchools <- bannedItems %>% 
  # remove any duplicates by looking for distinct state/school name combinations
  distinct(state, schoolName) %>% 
  # count the remaining items
  count(.)

# Make a list of terms to remove from the dataset
remove <- c("sexually provocative suggestive", "revealing", "dirty", "immodest")

# Define a helper function that will find things *not* in a list
'%notin%' <- Negate('%in%')

# Find the percentages of schools that ban each clothing item
clothingItems <- bannedItems %>% 
  # Remove items that aren't "clothing"
  filter(type != "promotion",
         type != "rationale", 
         type != "body",
         type != "footwear",
         type != "headwear", 
         type != "grooming",
         type != "accessories",
         # Also keep any that are in our "remove" list
         item %notin% remove) %>% 
  # Combine both types of prohibited leggings and rename visible bra straps
  mutate(item = case_when(
    grepl("leggings", item) ~ "leggings",
    grepl("bras and or bra straps", item) ~ "visible bra straps",
    TRUE ~ item
  )) %>% 
  # Trim any excess white space around the item names
  mutate(item = trimws(item)) %>% 
  # Group by Type of item, and then Item itself
  group_by(type, item) %>% 
  # Count how many times each item is banned
  count(., sort = TRUE)

# Combining our item counts with details about each item
detailedClothingItems <- clothingItems %>% 
  # Combine two data frames
  left_join(clothesDetails) %>%
  # Remove any entries where the `market` field is NA
  filter(!is.na(market)) %>% 
  ungroup() %>% 
  # Calculate the percentage of schools (out of all that were measured) that ban a particular item 
  # and round that percentage
  mutate(per = round(n / nSchools$n * 100, 0)) %>% 
  # Keep only percentages greater than or equal to 5%
  filter(per >= 5) %>% 
  # Remove unneeded columns
  dplyr::select(c(slug, market, reveal_body, n, per)) %>% 
  # Split items into percentage groups
  mutate(group = per - (per %% 10)) 
