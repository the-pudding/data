# Importing libraries

# For file structures
library(here)

# For tidying data
library(tidyverse)

# Importing Data
# Assuming that both files have been downloaded and kept in a folder called `raw_data` within the current working directory.
# Download banned_items.csv from https://github.com/the-pudding/data/tree/master/dress_codes/banned_items.csv
bannedItems <- read.csv(here::here("raw_data", "banned_items.csv"), stringsAsFactors = FALSE, header = TRUE)

# Calculate how many schools are in the dataset
nSchools <- bannedItems %>% 
  # remove any duplicates by looking for distinct state/school name combinations
  distinct(state, schoolName) %>% 
  # count the remaining items
  count(.)

# Calculate percentage of schools that use each word/phrase
wordsPercentages <- bannedItems %>% 
  # Keep only the "rationale" items
  filter(type == "rationale") %>% 
  # Group the same items together
  group_by(item) %>% 
  # Count each item and sort from biggest to smallest
  count(., sort = TRUE) %>% 
  # Calculate the percentage of schools that use each word/phrase
  mutate(percent = round(n / nSchools$n * 100, 0)) %>% 
  # Keep only percentages greater than or equal to 10%
  filter(percent >= 10) %>% 
  # Create a "display" name for graphs
  mutate(display = case_when(
    item == "disruption/distraction" ~ "Distract or Disrupt",
    item == "appropriate/inappropriate" ~ "Appropriate",
    item == "safe/safety" ~ "Safe",
    item == "health" ~ "Health",
    item == "interfere with learning" ~ "Interfere with Learning",
    item == "clean" ~ "Clean",
    item == "modest/modesty" ~ "Modest",
    item == "neat" ~ "Neat",
    item == "respect/disrespect" ~ "Respect",
    TRUE ~ item
  )) 