library(tidyverse)

# accessing data from github repo
data <- read.csv("https://raw.githubusercontent.com/the-pudding/data/master/names-in-songs/allNames.csv", stringsAsFactors = FALSE, header = TRUE)

# Export just the distinct names mentioned by artists per song
unique <-  data %>% 
  # add column which indicates if a name represents a person or something else
  mutate(person = ifelse(is.na(nonPerson), TRUE, FALSE)) %>% 
  # find distinct names mentioned by an artist in each song
  group_by(artist, song) %>% 
  distinct(name, .keep_all = TRUE) %>% 
  # remove any excess white space around the names
  mutate(name = trimws(name)) %>% 
  # filter out this R.Kelly song
  filter(song != "She's Got That Vibe") %>% 
  # keep only
  select(c("artist", "name", "song", "person", "sentence", "year", "highestRank")) %>% 
  ungroup()
