library(tidyverse)

# accessing data from github repo
data <- read.csv("https://raw.githubusercontent.com/the-pudding/data/master/names-in-songs/allNames.csv", stringsAsFactors = FALSE, header = TRUE)

# Find the number of songs that each artist uses a name in
unNameArtist <- data %>% 
  # create column indicating if name refers to a person or not
  mutate(person = ifelse(is.na(nonPerson), TRUE, FALSE)) %>% 
  # keep all names used distinctly by the artist in each song
  group_by(artist, song) %>% 
  distinct(name, .keep_all = TRUE) %>% 
  # count the number of songs that contain each name 
  group_by(artist, person, name) %>% 
  summarise(n = n()) 

# Find the number of songs each artist has that contain names (regardless of usage)
artistLookupAll <- data %>% 
  group_by(artist) %>% 
  # Find just unique songs by that artist
  distinct(song) %>% 
  # Count how many there are
  summarise(count = n()) %>% 
  # Add a column indicating that the name could refer to people & non-people
  mutate(person = FALSE)

# Find the number of songs each artist has that contain names (that represent people only)
artistLookup<- data %>% 
  # Filter names not used to represent a person
  filter(is.na(nonPerson)) %>% 
  group_by(artist) %>% 
  # Find just unique songs by that artist
  distinct(song) %>% 
  # Count how many there are
  summarise(count = n()) %>% 
  # add a column indicating that the names are only people
  mutate(person = TRUE)

# Combine the above data frames by row
allLookup <- rbind(artistLookup, artistLookupAll)

# Bind with our count of name mentions per artist
unNameArtistLookup <- unNameArtist %>% 
  left_join(allLookup) %>% 
  # Change the column names
  rename(names = n, songs = count)
