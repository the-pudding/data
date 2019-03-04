# Importing libraries

# For file structures
library(here)

# For tidying data
library(tidyverse)

# Importing Data
# Assuming that both files have been downloaded and kept in a folder called `raw_data` within the current working directory.
# Download players.csv from https://github.com/the-pudding/data/tree/master/hype/players.csv
players <- read.csv(here::here("raw_data", "players.csv"), stringsAsFactors = FALSE, header = TRUE)

# Find which colleges were the schools for the most number of players in our dataset
colleges <- players %>% 
  # Remove any players that weren't ranked in high school (and are thus missing college data)
  filter(!is.na(rank)) %>%
  # count the number of players from each college
  count(college, sort = TRUE) %>%
  # filter any blanks, and keep only colleges with more than 20 players
  filter(college != "",
         n >= 20)

# Generate data for graphics
paths <- players %>%
  # calculate the average of the top mean vorp rank and top mean wa rank for each player
  rowwise() %>%
  mutate(avgRank = mean(c(top_mean_vorp_rank, top_mean_wa_rank))) %>%
  ungroup() %>%
  # if the player had a recruit year, then they were ranked in high school (and get a 1)
  # otherwise, they were unranked in high school and get a 0
  mutate(top = ifelse(is.na(recruit_year), 0, 1),
         # Check to see if the player's college is in our list of "Top Basketball Colleges"
         smallMult = ifelse(college %in% colleges$college & !is.na(rank), 1, 0),
         highSchool = case_when(
           # did they play beyond hs?
           college != "" | link != "" | draft_year != "" ~ 1,
           TRUE ~ 0
         ),
         coll = case_when(
           # if they didn't make it past hs, they'll get an NA here
           highSchool == 0 ~ NA_real_,
           # if they skipped college, they'll get a 2 here
           draft_year == recruit_year ~ 2,
           # if they definitely played past hs and have a draft year, then they made it past college
           (highSchool == 1 & draft_year != "") | (highSchool == 1 & valid_seasons > 0)  ~ 1,
           # otherwise they stopped in college
           TRUE ~ 0
         ),
         draft = case_when(
           # if they didn't make it past college, they'll get an NA here
           is.na(coll) | coll == 0 ~ NA_real_,
           # if they were drafted, did they have any valid seasons?
           coll >= 1 & total_seasons > 0 ~ 1,
           # otherwise, they didn't make it past being drafted
           TRUE ~ 0
         ),
         rookie = case_when(
           # if they didn't make it past the draft, they'll get an NA here
           is.na(draft) | draft == 0 ~ NA_real_,
           # did they make it past the first 2 years?
           draft == 1 & total_seasons >= 2 ~ 1,
           # otherwise, they didn't make it past their rookie contract
           TRUE ~ 0
         ),
         success = case_when(
           # if they didn't make it past their rookie year, they'll get an NA here
           is.na(rookie) | rookie == 0 ~ NA_character_,
           # if they made it this far, how good are they (based on avg. vorp score?)
           # allstars
           avgRank <= 30 ~ "allstar",
           # great players
           between(avgRank, 30, 60) ~ "great",
           # good players
           between(avgRank, 60, 120) ~ "good",
           # bad players
           (rookie == 1 & is.na(avgRank)) | avgRank > 120  ~ "bad",
           TRUE ~ NA_character_
         )) %>%
  # select only the necessary columns
  select(c(name, college, link, smallMult, rank, draft_year, draft_rd, draft_pk, recruit_year, avgRank, top, highSchool, coll, draft, rookie, success, valid_seasons))  %>%
  mutate(val = 1) %>%
  # spread the levels of success to make each possible value into its own column
  spread(success, val, fill = NA_real_) %>%
  select(-"<NA>") %>%
  # calculate which level was the highest reached by each player
  mutate(highest = case_when(
    !is.na(rank) & highSchool == 0 ~ "highSchool",
    coll == 0 ~ "college",
    draft == 0 ~ "draft",
    rookie == 0 ~ "rookie",
    bad > 0 ~ "bad",
    good > 0 ~ "good",
    great > 0 ~ "great",
    allstar > 0 ~ "allstar",
    TRUE ~ "other"
  ))
