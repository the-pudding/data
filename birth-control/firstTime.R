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

## Create a new data frame called firstTimeYear for our firstTime.csv dataset.
firstTimeYear <- allData %>% 
  # Remove any users that have never used contraception
  filter(EVERUSED == 1) %>% 
  # Keep the columns that indicate which method was their first and what year they started using contraceptives
  select(c("FIRSMETH1", "WNFSTUSE_Y")) %>% 
  # Create a new column called decade based on the year they started using contraceptives
  mutate(decade = case_when(
    WNFSTUSE_Y < 1980 ~ "70's",
    between(WNFSTUSE_Y, 1980, 1989) ~ "80's",
    between(WNFSTUSE_Y, 1990, 1999) ~ "90's",
    between(WNFSTUSE_Y, 2000, 2009) ~ "00's",
    WNFSTUSE_Y >= 2010 ~ "10's"
  )) %>% 
  group_by(decade) %>% 
  # calculate the total number of contraceptive users by decade
  mutate(total = n()) %>% 
  group_by(FIRSMETH1, decade, total) %>% 
  # calculate the count of users by decade
  summarise(count = n()) %>% 
  # calculate the percentage of users by method and decade
  mutate(percent = (count / total) * 100) %>% 
  # remove any NA values
  na.omit() %>% 
  # round the percentage to a single decimal point
  mutate(percent = round(percent, 1)) %>% 
  # rename the column
  rename(method = FIRSMETH1) %>% 
  # keep only the columns we need
  select(method, decade, percent) %>% 
  ungroup() %>% 
  group_by(method) %>% 
  # for graphing purposes, convert the decades to a factor in this specific order
  mutate(decade = factor(decade, levels = c("70's", "80's", "90's", "00's", "10's")), decade) %>% 
  # And arrange the data by decade
  arrange(decade) %>% 
  ungroup()