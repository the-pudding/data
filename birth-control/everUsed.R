
# Importing Packages

## For folder structure
library(here)

## For data import/cleaning
library(tidyverse)
library(purrr)
library(rlang)

# Importing Data
# Assuming that allData.csv has been downloaded from allData.zip and kept in a folder called `raw_data` within the current working directory.
# Download allData.zip from https://github.com/the-pudding/data/tree/master/birth_control/allData.zip
allData <- read.csv(here("raw_data", "allData.csv"))

## Define the possible types of contraception by their column names
possibleTypes <- c("CONDOM", "VASECTMY", "DEPOPROV", "WIDRAWAL", "RHYTHM", "SDAYCBDS", "TEMPSAFE", "PATCH", "PILL", "RING", "MORNPILL", "EVIUDTYP1", "EVIUDTYP2", "STRLOPER")

## IUDs and Sterilization are coded differently
IUDTypes <- c(1, 2, 3, 9)
IUDMethods <- c("EVIUDTYP1", "EVIUDTYP2")
tubalMethods <- "STRLOPER"

## Define a helper function to find values that are not present in a list 
`%not_in%` <- negate(`%in%`)

## Create a new data frame called typeUsed
typeUsed <- allData %>% 
  # Remove any users that have never used contraception
  filter(EVERUSED == 1) %>% 
  # Select all column names in our possibleTypes list
  select(one_of(possibleTypes)) %>% 
  # combine all possible types into a single column
  gather(method, usage) %>% 
  # Convert numeric responses to either Yes, No, or NA
  mutate(usage = case_when(
    method %in% IUDMethods & (usage %in% IUDTypes) ~ "Yes",
    method %in% IUDMethods & usage %not_in% IUDTypes ~ "No",
    method %in% tubalMethods & usage == 1 ~ "Yes",
    method %in% tubalMethods & usage > 1 ~ "No",
    method %not_in% IUDMethods & method %not_in% tubalMethods & usage == 1 ~ "Yes",
    method %not_in% IUDMethods & method %not_in% tubalMethods & usage == 5 ~ "No",
    method %not_in% IUDMethods & method %not_in% tubalMethods & usage != 1 & usage != 5 ~ "NA"
  )) %>% 
  # Remove any responses where the usage was NA
  filter(!usage == "NA") %>% 
  # Combine the two IUD types
  mutate(cleanMethod = ifelse(method == "EVIUDTYP1" | method == "EVIUDTYP2", "IUD", method)) %>% 
  # Group by the method type and then usage (Yes or No)
  group_by(cleanMethod, usage) %>% 
  # Calculate the total number of responses in each method type and calculate the percentage of each usage (Yes or No)
  summarise(count = n(),
            percent = (count / 20759) * 100) 

# Extract only the positive responses to get our everUsed dataset.
everUsed <- typeUsed %>% 
  filter(usage == "Yes") %>% 
  # for graphing purposes, round the percent to 0 decimals
  mutate(percent = round(percent, 0))
