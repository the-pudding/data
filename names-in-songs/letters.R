library(tidyverse)

# accessing data from github repo
data <- read.csv("https://raw.githubusercontent.com/the-pudding/data/master/names-in-songs/allNames.csv", stringsAsFactors = FALSE, header = TRUE)

# accessing names from social security administration from github repo
onlyNames <- read.csv("https://raw.githubusercontent.com/the-pudding/data/master/names-in-songs/onlyNames.csv", stringsAsFactors = FALSE, header = TRUE)

# keeping only names referencing people
justNames <- data %>% 
  filter(is.na(nonPerson))

# write function to find count & percentage of letters
findLetters <- function(data, position, condition){
  data %>% 
    # find either first or last letter, depending on position argument
    mutate(letter = case_when(
      position == "first" ~ str_sub(name, 1, 1),
      position == "last" ~ str_sub(name, -1 ,-1)
    )) %>% 
    # Create new column with position information
    mutate(position = position) %>% 
    # Find all of the distinct names
    distinct(name, .keep_all = TRUE) %>% 
    ungroup() %>% 
    # count all the names that start or end with each letter
    count(letter, sort = TRUE) %>% 
    # calculate percent of names from the condition that start or end
    # the same way
    mutate(percent = case_when(
      condition == "song" ~ (n / nrow(common)) * 100,
      condition == "society" ~ (n / nrow(onlyNames) * 100)
    ),
    group = condition
    )
}
compareConditions <- function(songCondition, societyCondition, person, position){
  # combine song and society conditions
  all <- rbind(songCondition, societyCondition) %>% 
    # remove the count column
    select(-n) %>% 
    # convert our long data to wide
    spread(group, percent) %>% 
    # calculate percentage difference between conditions
    mutate(dif = song - society,
           position = position, 
           person = person) %>% 
    # Remove unneccessary columns
    select(-c(society, song))
}
# Finding counts & percentages for first letters
songFirst <- findLetters(justNames, "first", "song")
societyFirst <- findLetters(onlyNames, "first", "society")

# Finding counts & percentages for last letters
songLast <- findLetters(justNames, "last", "song")
societyLast <- findLetters(onlyNames, "last", "society")

# Finding counts of names in songs for non-people
songFirstNP <- findLetters(proper, "first", "song")
songLastNP <- findLetters(proper, "last", "song") 


# Combine the song starting letters with the society starting letters
allFirst <- compareConditions(songFirst, societyFirst, TRUE, "first")
allLast <- compareConditions(songLast, societyLast, TRUE, "last")
allFirstNP <- compareConditions(songFirstNP, societyFirst, FALSE, "first")
allLastNP <- compareConditions(songLastNP, societyLast, FALSE, "last")

# Combine all results
allLetters <- rbind(allFirst, allLast, allFirstNP, allLastNP) %>% 
  # capitalize all letters
  mutate(letter = toupper(letter))
