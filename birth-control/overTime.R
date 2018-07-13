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

# Create list of variables that we'll need
ageVar <- c("EVERUSED", "CASEID", "AGE_R")

## Create a new data frame called ageCurrent
ageCurrent <- allData %>% 
  # select all possible mentions of methods the respondent is currently on
  # and the other columns we designated in ageVar
  select(num_range("CONSTAT", 1:4), one_of(ageVar)) %>% 
  # remove any respondents that have never used contraception
  filter(EVERUSED == 1) %>% 
  # eliminate the everused column since we are done with it
  select(-EVERUSED) %>% 
  # collect all of the current methods into a single column
  gather(variable, method, c("CONSTAT1":"CONSTAT4")) %>% 
  # remove any where the method was 88 (no response)
  filter(method != 88) %>% 
  group_by(method, AGE_R) %>%
  # count the number of unique Case ID numbers in each method and age combination
  summarise(methodR = n_distinct(CASEID))


# Create a separate calculation for total calculations
fullAgeCurrent <- allData %>% 
  # select just our ageVar list of columns
  select(one_of(ageVar)) %>% 
  # remove any respondents that have never used contraception
  filter(EVERUSED == 1) %>% 
  select(-EVERUSED) %>% 
  group_by(AGE_R) %>% 
  # Calculate the total number of respondents at a given age
  summarise(total = n())

# Create a list of "methods" to remove. These included states like "currently pregnant" or "post-partum"
# also included rarely used methods like "sponge" that aren't used elsewhere in this story.
currentRemove <- c(4, 13, 14, 16, 17, 18, 22, 30, 31, 32, 33, 34, 35, 36, 38, 40, 41, 42)

# create our final overTime.csv data
overTime <- ageCurrent %>% 
  # combine our ageCurrent and fullAgeCurrent data frames
  left_join(fullAgeCurrent, by = "AGE_R") %>% 
  # calculate the percentage of users of each method
  mutate(percent = (methodR / total) * 100) %>% 
  # filter out any methods that are in our list to exclude
  filter(!method %in% currentRemove) %>% 
  # rename a column
  mutate(calcAge = AGE_R) %>% 
  select(-AGE_R) %>% 
  # only keep ages where the total was over 100 
  filter(total >= 100)