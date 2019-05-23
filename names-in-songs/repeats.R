library(tidyverse)

# accessing data from github repo
data <- read.csv("https://raw.githubusercontent.com/the-pudding/data/master/names-in-songs/allNames.csv", stringsAsFactors = FALSE, header = TRUE)

repeatInd <- data %>% 
  # add a column to denote whether or not the name is likely reffering to a person
  mutate(person = ifelse(is.na(nonPerson), TRUE, FALSE)) %>% 
  group_by(artist, song, person) %>% 
  # count the number of times a name was used inside a song
  count(name, sort = TRUE) %>% 
  # Keep only the top name per song
  mutate(row = row_number()) %>% 
  filter(row == 1) %>%  
  select(-row) %>% 
  ungroup() 
