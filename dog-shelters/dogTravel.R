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

# accessing data from github repo
dogDescriptions <- read.csv("https://raw.githubusercontent.com/the-pudding/data/master/dog-shelters/dogDescriptions.csv", stringsAsFactors = FALSE, header = TRUE)


regexLocs <- dogDescriptions %>%
  # Find any instance of "from" to the end of its sentence
  mutate(from = str_extract_all(description, "from (.*?)[.?!]", simplify = FALSE),
         # extract any instance of "located in" that doesn't start with "families" or "organization"
         located = str_extract_all(description, "\\w*(?<!families|organization) located in (.*?)[.?!]", simplify = FALSE))


cleanRegex <- regexLocs %>%
  # combine all extracted chunks into one column
  gather("regex", "sentence", c("from", "located")) %>%
  # remove any dogs that didn't have any indication of travelling
  filter(!is.na(sentence)) %>%
  # separate out multiple chunks for a single animal and remove anything after the word "to"
  unnest(sentence) %>%
  mutate(onlySent = gsub("[[:space:]]to(.*?)[.?!]", "", sentence))
# setup spacyR for entity recognition
use_condaenv("spacy_condaenv", required = TRUE)
cnlp_init_spacy()
labelEntities <- function(text, id){
  ent <- spacy_extract_entity(text, extended = TRUE)

  if (!is.null(ent)){
    tags <- ent %>%
      filter(ent_type == "GPE") %>%
      mutate(id = id)


    fileName = here::here("assets", "data", "processed_data", today(), "from_locations.csv")

    # Write to file
    write.table(tags, file = fileName, row.names = FALSE, append = TRUE, sep = ",", col.names = !file.exists(fileName))
  }
}

# find the entities
fromLoc <- purrr::walk2(cleanRegex$onlySent, cleanRegex$id, labelEntities)
manualLoc <- read_csv(here::here("assets", "data", "processed_data", "2019-09-20", "cleaned_locations.csv"))

cleanLoc <- manualLoc %>%
  # remove any with TRUE in remove column
  filter(is.na(remove)) %>%
  # convert shelter state to full state name for comparison
  mutate(shelterLoc = case_when(
    !is.na(state.name[match(contact_state, state.abb)]) ~ state.name[match(contact_state, state.abb)],
    contact_state == "DC" ~ "Washington DC",
    TRUE ~ contact_state
  )) %>%
  mutate(origin = ifelse(is.na(manual), found, manual),
         match = origin == shelterLoc) %>%
  filter(match == FALSE) %>%
  distinct(id, origin, .keep_all = TRUE) %>%
  select(-c(contact_city, contact_state, found, manual, remove, match))
