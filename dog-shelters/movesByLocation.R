# For general data cleaning and analysis
library(tidyverse)
library(glue)
library(tibble)
library(googledrive)

# For keeping your files in relative directories
library(here)

# For dates
library(lubridate)

# For downloading data
library(jsonlite)
library(httr)
library(data.table)
library(xml2)

# For NLP
library(reticulate)
library(cleanNLP)
library(spacyr)

# accessing all dog data from github repo
dogDescriptions <- read.csv("https://raw.githubusercontent.com/the-pudding/data/master/dog-shelters/dogDescriptions.csv", stringsAsFactors = FALSE, header = TRUE)
# accessing moved dog data from github repo
dogTravel <- read.csv("https://raw.githubusercontent.com/the-pudding/data/master/dog-shelters/dogTravel.csv", stringsAsFactors = FALSE, header = TRUE)

most_exported <- dogTravel %>%
  count(origin, sort = TRUE) %>%
  rename(location = origin) %>%
  rename(exported = n)

most_imported <- dogTravel %>%
  count(shelterLoc, sort = TRUE) %>%
  rename(imported = n, location = shelterLoc)

totalAvailable <- dogDescriptions %>%
  mutate(shelterLoc = case_when(
    !is.na(state.name[match(contact_state, state.abb)]) ~ state.name[match(contact_state, state.abb)],
    contact_state == "DC" ~ "Washington DC",
    TRUE ~ contact_state
  )) %>%
  count(shelterLoc, sort = TRUE) %>%
  mutate(remove = case_when(
    grepl("[[:digit:]]", shelterLoc) ~ TRUE,
    shelterLoc == "NB" | shelterLoc == "QC" ~ TRUE,
    TRUE ~ FALSE
  )) %>%
  filter(remove == FALSE) %>%
  select(-remove)

movesByLocation <- most_exported %>%
  full_join(most_imported, by = "location") %>%
  full_join(totalAvailable, by = c("location" = "shelterLoc")) %>%
  rename(total = n) %>%
  mutate(inUS = case_when(
    location %in% state.name ~ TRUE,
    location == "Washington DC" ~ TRUE,
    #location == "Puerto Rico" ~ TRUE,
    TRUE ~ FALSE
  )) %>%
  mutate(inUS = tolower(inUS))

