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

# Download part of the codebook available at: https://github.com/the-pudding/data/tree/master/birth_control/stop_reasons.csv
stop_reasons <- read.csv(here("raw_data", "stop_reasons.csv")) %>% 
  mutate(method = toupper(method))

## Calculating percent of complaints out of total number of complaints
whyDis <- allData %>% 
  select(CASEID, contains("REAS")) %>% 
  gather(stopMethod, reason, -CASEID) %>% 
  na.omit() %>% 
  # Remove last 2 characters from method names (the numbers) 
  mutate(stopMethod = str_sub(stopMethod, 1, str_length(stopMethod)-2)) %>% 
  group_by(stopMethod) %>% 
  mutate(total = n()) %>% 
  group_by(stopMethod, reason, total) %>% 
  summarise(count = n()) %>% 
  mutate(percent = (count / total) * 100) %>% 
  arrange(desc(count)) %>% 
  group_by(stopMethod, reason) %>% 
  mutate(rank = row_number()) %>% 
  filter(rank <= 5) %>% 
  mutate(label = case_when(
    reason == 1 ~ "too expensive",
    reason == 2 ~ "insurance didn't cover it",
    reason == 3 ~ "too difficult to use",
    reason == 4 ~ "too messy",
    reason == 5 ~ "partner did not like it",
    reason == 6 ~ "you had side effects",
    reason == 7 ~ "you were worried you might have side effects",
    reason == 8 ~ "worried the method would not work",
    reason == 9 ~ "method failed and you became pregnant",
    reason == 10 ~ "the method did not protect against disease",
    reason == 11 ~ "Doctor told you that you should not use method again",
    reason == 12 ~ "method decreased sexual pleasure",
    reason == 13 ~ "too difficult to obtain",
    reason == 14 ~ "did not like changes to menstrual cycle",
    reason == 15 ~ "other",
    reason == 99 ~ "do not know"
  )) %>% 
  filter(reason < 25)

## Calculating percent of complaints out of total users that discontinued use
whyDisUsers <- allData %>% 
  select(CASEID, contains("REAS")) %>% 
  gather(stopMethod, reason, -CASEID) %>% 
  na.omit() %>% 
  # Remove last 2 characters from method names (the numbers) 
  mutate(stopMethod = str_sub(stopMethod, 1, str_length(stopMethod)-2)) %>% 
  group_by(stopMethod) %>% 
  mutate(total = n_distinct(CASEID)) %>% 
  group_by(stopMethod, reason, total) %>% 
  summarise(count = n()) %>% 
  mutate(percent = (count / total) * 100) %>% 
  arrange(desc(count)) %>% 
  group_by(stopMethod, reason) %>% 
  mutate(rank = row_number()) %>% 
  filter(rank <= 5) %>% 
  mutate(label = case_when(
    reason == 1 ~ "too expensive",
    reason == 2 ~ "insurance didn't cover it",
    reason == 3 ~ "too difficult to use",
    reason == 4 ~ "too messy",
    reason == 5 ~ "partner did not like it",
    reason == 6 ~ "you had side effects",
    reason == 7 ~ "you were worried you might have side effects",
    reason == 8 ~ "worried the method would not work",
    reason == 9 ~ "method failed and you became pregnant",
    reason == 10 ~ "the method did not protect against disease",
    reason == 11 ~ "Doctor told you that you should not use method again",
    reason == 12 ~ "method decreased sexual pleasure",
    reason == 13 ~ "too difficult to obtain",
    reason == 14 ~ "did not like changes to menstrual cycle",
    reason == 15 ~ "other",
    reason == 99 ~ "do not know"
  )) %>% 
  filter(reason < 25) %>% 
  group_by(stopMethod) %>% 
  arrange(desc(percent)) %>% 
  mutate(rank = row_number()) %>% 
  filter(rank <= 5) %>% 
  select(stopMethod, reason, total, percent) %>%
  mutate(percent = round(percent, 1)) %>% 
  mutate(type = "general")



whyStopUsers <- allData %>% 
  select(CASEID, contains("STOP")) %>% 
  gather(stopMethod, reason, -CASEID) %>% 
  na.omit() %>% 
  # Remove last character from method names (the number) 
  mutate(stopMethod = str_sub(stopMethod, 1, str_length(stopMethod)-1)) %>% 
  group_by(stopMethod) %>% 
  mutate(total = n_distinct(CASEID)) %>% 
  group_by(stopMethod, reason, total) %>% 
  summarise(count = n()) %>% 
  mutate(percent = (count / total) * 100) %>% 
  arrange(desc(count)) %>% 
  group_by(stopMethod, reason) %>% 
  mutate(rank = row_number()) %>% 
  filter(rank <= 5) %>% 
  left_join(stop_reasons, by = c("stopMethod" = "method", "reason" = "value")) %>% 
  filter(stopMethod != "METHSTOP1",
         stopMethod != "METHSTOP2") %>% 
  filter(reason < 25) %>% 
  group_by(stopMethod) %>% 
  arrange(desc(percent)) %>% 
  mutate(rank = row_number()) %>% 
  filter(rank <= 5) %>% 
  select(stopMethod, reason, total, percent) %>%
  mutate(percent = round(percent, 1)) %>%
  mutate(type = "specific")

userSideEffects <- bind_rows(whyDisUsers, whyStopUsers) %>% 
  ungroup() %>% 
  mutate(stopMethod = gsub("STOPPILL|REASPILL", "The Pill", stopMethod),
         stopMethod =  gsub("STOPIUD|REASIUD", "IUD", stopMethod),
         stopMethod = gsub("STOPCOND|REASCOND", "Condom", stopMethod),
         stopMethod = gsub("STOPDEPO|REASDEPO", "Depo-Provera", stopMethod))