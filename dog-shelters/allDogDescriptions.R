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
## # access saved username and key
## user <- Sys.getenv("PF_ID2")
## pw <- Sys.getenv("PF_PW2")
## 
## # generate new token each session
## tokenURL <- "https://api.petfinder.com/v2/oauth2/token"
## auth <- POST(url = "https://api.petfinder.com/v2/oauth2/token",
##                    body = list(grant_type = "client_credentials",
##                                client_id = user, client_secret = pw),
##                    encode = "json")
## 
## token <- content(auth)$access_token
# Pings API and accesses results
accessResults <- function(state, start_page = 1){
  base <- "https://api.petfinder.com/v2/animals?"
  req <- GET(url = paste0(base, "type=dog&status=adoptable&limit=100&location=", state, "&page=", start_page), add_headers(Authorization = paste("Bearer", token)))

 req
}
# Cleans results, converts to data frame and exports to file
cleanResults <- function(results, state){
  animals <- content(results)$animals

  # Flatten results to df
  pupAttr <- animals %>%
    {
      tibble(
        id = map_chr(., "id", .default = NA),
        org_id = map_chr(., "organization_id", .default = NA),
        url = map_chr(., "url", .default = NA),
        type = map_chr(., "type", .default = NA),
        species = map_chr(., "species", .default = NA),
        breed_primary = map_chr(., c("breeds", "primary"), .default = NA),
        breed_secondary = map_chr(., c("breeds", "secondary"), .default = NA),
        breed_mixed = map_lgl(., c("breeds", "mixed"), .default = NA),
        breed_unknown = map_chr(., c("breeds", "unknown"), .default = NA),
        color_primary = map_chr(., c("colors", "primary"), .default = NA),
        color_secondary = map_chr(., c("colors", "secondary"), .default = NA),
        color_tertiary = map_chr(., c("colors", "tertiary"), .default = NA),
        age = map_chr(., "age", .default = NA),
        sex = map_chr(., "gender", .default = NA),
        size = map_chr(., "size", .default = NA),
        coat = map_chr(., "coat", .default = NA),
        fixed = map_lgl(., c("attributes", "spayed_neutered"), .default = NA),
        house_trained = map_lgl(., c("attributes", "house_trained"), .default = NA),
        declawed = map_lgl(., c("attributes", "declawed"), .default = NA),
        special_needs = map_lgl(., c("attributes", "special_needs"), .default = NA),
        shots_current = map_lgl(., c("attributes", "shots_current"), .default = NA),
        env_children = map_lgl(., c("environment", "children"), .default = NA),
        env_dogs = map_lgl(., c("environment", "dogs"), .default = NA),
        env_cats = map_lgl(., c("environment", "cats"), .default = NA),
        name = map_chr(., "name", .default = NA),
        description = map_chr(., "description", .default = NA),
        tags = map(., "tags", .default = NA_character_),
        photo = map_chr(., c("photos", 1, "full"), .default = NA_character_),
        status = map_chr(., "status", .default = NA),
        posted = map_chr(., "published_at", .default = NA),
        contact_city = map_chr(., c("contact", "address", "city"), .default = NA),
        contact_state = map_chr(., c("contact", "address", "state"), .default = NA),
        contact_zip = map_chr(., c("contact", "address", "postcode"), .default = NA),
        contact_country = map_chr(., c("contact", "address", "country"), .default = NA)
      )
    }

  # tag list to vector
  pup_df <- pupAttr %>%
    rowwise() %>%
    mutate(tags = paste(unlist(tags), collapse = "|")) %>%
    mutate(stateQ = state,
           accessed = lubridate::today())

  # check if directory for today's data collection exists
  todayDir <- here::here("assets", "data", "raw_data", today())
  dogsDir <- here::here("assets", "data", "raw_data", today(), "dogs")
  sheltersDir <- here::here("assets", "data", "raw_data", today(), "shelters")

  # if directory doesn't exist, create it
  if (!dir.exists(todayDir)) dir.create(todayDir)
  if (!dir.exists(dogsDir)) dir.create(dogsDir)
  if (!dir.exists(sheltersDir)) dir.create(sheltersDir)

  # create new fileName
  fileName <- here::here("assets", "data", "raw_data", today(), "dogs", glue::glue("{state}_dogs.csv"))

  # Write to file
  write.table(pup_df, file = fileName, row.names = FALSE, append = TRUE, sep = ",", col.names = !file.exists(fileName))
}
# Function to loop through for remaining pages
findOtherPages <- function(state, start_page){
  req <- accessResults(state, start_page)
  cleanResults(req, state)
}
findDogs <- function(state, .pb = NULL){
  # adding progress bar
  if ((!is.null(.pb)) && inherits(.pb, "Progress") && (.pb$i < .pb$n)) .pb$tick()$print()

  # start accessing API
  req <- accessResults(state, start_page = 1)

  max_pages <- content(req)$pagination$total_pages

  cleanResults(req, state)

  # Loop through the remaining pages
  pages <- c(2:max_pages)
  argList <- list(state = state, pages = pages)
  args <- cross_df(argList)

  purrr::walk2(args$state, args$pages, findOtherPages)
}
# Due to a bug in the PetFinder API, I was encouraged to use zipcodes for the state of Nevada
# All other states and DC simply used their state abbreviation
nvZip <- c("89009", "89011", "89014", '89015', '89019', '89024', '89027','89032', '89048', '89052', '89074', '89101','89103', '89104','89107','89113','89117','89118','89119','89120','89121','89122','89123','89128','89129','89130','89131','89134','89135','89136','89139','89143','89145','89146','89147','89148','89149','89183','89193','89406','89408','89410','89415','89423','89429','89431','89434','89436','89445','89447','89450','89451','89460','89502','89506','89511','89512','89523','89701','89702','89703','89704','89706','89801')
statesToCheck <- c(state.abb, nvZip, "DC")

# Setting up progress bar
pb <- progress_estimated(length(limitedStates))

# Creating fallback in case an error occurs
findSafely <- possibly(findDogs, otherwise = NA)

purrr::walk(statesToCheck, findSafely, .pb = pb)
dogFiles <- list.files(path = here::here("assets", "data", "raw_data", today(), "dogs" ))
# read all files in and bind them together
dogs <- purrr::map_dfr(dogFiles, .f = function(file){

  location <- here::here("assets", "data", "raw_data", today(), "dogs", file)
  read_csv(location, col_names = TRUE,
           cols(
             .default = col_character(),
             breed_mixed = col_logical(),
             breed_unknown = col_logical(),
             fixed = col_logical(),
             house_trained = col_logical(),
             declawed = col_logical(),
             special_needs = col_logical(),
             shots_current = col_logical(),
             env_children = col_logical(),
             env_dogs = col_logical(),
             env_cats = col_logical()
           ))
}) %>%
  # eliminate any duplicates
  distinct(id, .keep_all = TRUE)

# write to file
write.csv(dogs, here::here("assets", "data", "raw_data", today(), "allDogs.csv"), row.names = FALSE)
# To get full dog descriptions, I need to use the V1 API 
# Pings API and accesses results
accessShelters <- function(shelterID, start_page = 1){
  userV1 <- Sys.getenv("PF_V1")
  base <- "https://api.petfinder.com/shelter.getPets?"
  req <- GET(url = paste0(base, "key=", userV1,
        "&id=", shelterID, "&format=json&type=dog&status=A&count=1000&output=full&offset=", start_page))

 req
}
# Cleans results, converts to data frame and exports to file
cleanShelters <- function(results, shelterID){
  animals <- content(results)$petfinder$pet$pet

  # Flatten results to df
  pupAttr <- animals %>%
    {
      tibble(
        id = map_chr(., c("id", "$t"), .default = NA),
        org_id = map_chr(., c("shelterId", "$t"), .default = NA),
        type = map_chr(., c("animal", "$t"), .default = NA),
        description = map_chr(., c("description", "$t"), .default = NA),
      )
    }

  # tag list to vector
  pup_df <- pupAttr

  # create new fileName
  fileName <- here::here("assets", "data", "raw_data", today(), "shelters", glue::glue("{shelterID}_pets.csv"))

  # Write to file
  write.table(pup_df, file = fileName, row.names = FALSE, append = TRUE, sep = ",", col.names = !file.exists(fileName))
}
# Use the shelter ID's from the V2 API to find all animals available for adoption through that shelter
lookupShelter <- function(shelterID, .pb = NULL){
  # adding progress bar
  if ((!is.null(.pb)) && inherits(.pb, "Progress") && (.pb$i < .pb$n)) .pb$tick()$print()
  Sys.sleep(0.001)

  req <- accessShelters(shelterID, start_page = 1)

  cleanShelters(req, shelterID)
}
# Create function that creates a new CSV for each shelter
findShelters <- function(date = today()){
  # start by loading all of the data back into R
  dogs <- read.csv(here::here("assets", "data", "raw_data", date, "allDogs.csv"), stringsAsFactors = FALSE, header = TRUE)

  # limit it down to just the unique shelter ids
  shelters <- dogs %>%
    count(org_id)

  sheltersList <- shelters$org_id

  pb = progress_estimated(length(sheltersList))

  purrr::walk(sheltersList, lookupShelter, .pb = pb)
}

# Run function
findShelters()

dogDescriptions <- dogs %>% 
  mutate(id = as.character(id)) %>% 
  select(-description) %>% 
  left_join(shelterPets, by = c("id", "org_id")) %>% 
  distinct(id, .keep_all = TRUE)

# write to file
write.csv(dogDescriptions, here::here("assets", "data", "raw_data", today(), "allDogDesc.csv"), row.names = FALSE)
