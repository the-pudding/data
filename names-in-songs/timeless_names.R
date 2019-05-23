library(tidyverse)

# accessing data from github repo
data <- read.csv("https://raw.githubusercontent.com/the-pudding/data/master/names-in-songs/allNames.csv", stringsAsFactors = FALSE, header = TRUE)


# Find the most popular ten names per decade 
# (only names that refer to people)
byDecade <- justNames %>% 
  # make sure year is read as a number, not a character
  mutate(year = as.integer(year)) %>% 
  # calculate which decade the year fell into
  mutate(decade = year - year %% 10) %>% 
  # Find unique names in each decade, artist, song, combination
  group_by(decade, artist, song) %>% 
  distinct(name, .keep_all = TRUE) %>% 
  ungroup() %>% 
  # Count the number of songs include a name in each decade
  group_by(decade) %>% 
  count(name, sort = TRUE) %>% 
  # rank each name based on its count
  mutate(rank = row_number()) %>% 
  # Keep only the top 10
  filter(rank <= 10) %>% 
  filter(!is.na(decade)) %>% 
  # Remove any from 1950's since the Billboard Charts started in 1958
  filter(decade != "1950") %>% 
  mutate(person = TRUE)

# Find the most popular ten names per decade
# names referring to anything 
byDecadeAll <- proper %>% 
  mutate(year = as.integer(year)) %>% 
  mutate(decade = year - year %% 10) %>% 
  group_by(decade, artist, song) %>% 
  distinct(name, .keep_all = TRUE) %>% 
  ungroup() %>% 
  group_by(decade) %>% 
  count(name, sort = TRUE) %>% 
  mutate(rank = row_number()) %>% 
  filter(rank <= 10) %>% 
  filter(!is.na(decade)) %>% 
  filter(decade != "1950") %>% 
  mutate(person = FALSE)

# Combine the above data frames
decades <- rbind(byDecade, byDecadeAll)
