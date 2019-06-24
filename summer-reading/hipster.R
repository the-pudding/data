# For general data cleaning and analysis
library(tidyverse)
library(glue)
# Because a newer version of tidyr needed
library(rlang)
library(tidyr)


# For keeping your files in relative directories
library(here)

# For interactive/searchable tables in your report
library(DT)

# For dealing with very large datasets locally
library(data.table)

# For dealing with dates
library(lubridate)

# For Pudding-related convenience functions
library(puddingR)

# For handling big file filtered imports
library(sqldf)

# For downloading from Google Drive
library(googledrive)
# For general data cleaning and analysis
library(tidyverse)
library(glue)
# Because a newer version of tidyr needed
library(rlang)
library(tidyr)


# For keeping your files in relative directories
library(here)

# For interactive/searchable tables in your report
library(DT)

# For dealing with very large datasets locally
library(data.table)

# For dealing with dates
library(lubridate)

# For Pudding-related convenience functions
library(puddingR)

# For handling big file filtered imports
library(sqldf)

# For downloading from Google Drive
library(googledrive)
# filePath <- here::here("assets", "data", "raw_data", "checkouts--books-small.csv")

# download from local file
checkouts <- data.table::fread(filePath) %>%
	# convert checkoutdatetime to a date object
	mutate(date = mdy(CheckoutDateTime)) %>%
	select(-CheckoutDateTime)

# download catalog of physical items in inventory
# access the entire catalog here: https://data.seattle.gov/Community/Library-Collection-Inventory/6vkj-f5xf

# catalog <- fread(here::here("assets", "data", "raw_data", "inventory--books.csv"))

# use here to find the file you want and save the file path to a variable
file_path <- here::here("assets", "data", "raw_data", "book_codes.csv")

# from csv
filter <- readr::read_csv(file_path) %>% 
  dplyr::rename("group" = "Category Group", "code" = "Code", "description" = "Description")

# create a character vector of just the code values
code <- filter$code
# list the location of the entire inventory file
inventoryLoc <- here::here("assets", "data", "raw_data", "inventory.csv")

# import file and filter only the columns we want
invCol <- c("numeric", "character", "character", "character", "character", "NULL", "character", "character", "character", "NULL", "NULL", "character", "numeric" )

catalogCheck <- fread(inventoryLoc,
                      header = TRUE,
                      colClasses = invCol)

# Filter the catalog to just the parts we need
 catalogFilter <- catalogCheck %>%
   # Keep only the items whose ItemCollection are in the "code" file
   filter(ItemCollection %in% code) %>%
   # count the total number of copies of each book at each report date
   group_by(ReportDate, BibNum) %>%
   mutate(totalCopies = sum(ItemCount)) %>%
   # Keep only one entry per item per report date
   group_by(ReportDate) %>%
   distinct(BibNum, .keep_all = TRUE) %>%

 
# Further reduce the data
 catalogMinimal <- catalogFilter %>%
   # conver the date to a date object
   mutate(date = mdy(ReportDate)) %>%
   # Arrange item entries by report date
   # Noting only the earliest and latest reports of each item
   group_by(BibNum) %>%
   arrange(date) %>%
   mutate(maxDate = max(date),
          minDate = min(date),
          maxCopies = max(totalCopies)) %>%
   # Keep only one entry of each item
   distinct(BibNum, .keep_all = TRUE) %>%
   # Remove unneccessary columns
   select(-c("ReportDate", "ItemCount", "totalCopies", "date")) %>%
   fwrite(., here::here("assets", "data", "processed_data", "inventory_minimal.csv"))

# define helper that looks for items not in a specified vector
`%notin%` <- purrr::negate(`%in%`)

zero_checkouts <- full_catalog %>% 
  # Filter to books not in our checkout data 
  filter(Title %notin% checkouts$Title)
hipster <- zero_checkouts %>% 
  # Filter to just fiction books
  filter(grepl("fic", ItemCollection)) %>% 
  # Filter out uncataloged books
  filter(!grepl("Uncataloged", Title))
  
# remove duplicates where book was checked out & filed under different BibNumber
# start by creating catalog with character vector of all possible BibNumbers per title
dedupe <- full_catalog %>% 
  group_by(Title) %>% 
  summarise(allBib = toString(BibNum)) %>% 
  ungroup()
  
# Dedupe hipster dataset with new catalog
hipsterDupe <- hipster %>% 
  # combine with our deduplicated inventory
  left_join(dedupe) %>% 
  # look for a comma 
  filter(grepl(",", allBib)) %>% 
  # separate comma separated list into rows
  separate_rows(allBib, sep = ",") %>% 
  mutate(allBib = trimws(allBib),
         # mark if there is an alternate version of the book available
         altAvail = allBib %in% checkouts$BibNumber)

hipsterDupeSum <- hipsterDupe %>% 
  # Remove any where a version of the book returns TRUE
  filter(altAvail == TRUE)

hipsterDeDupe <- hipster %>% 
  # filter out any with alternate versions available
  filter(!BibNum %in% hipsterDupeSum$BibNum)
hipsterClean <- hipsterDeDupe %>% 
  # Clean the titles
  mutate(cleanTitle = gsub(" \\/ .*", "", Title)) %>% 
  # Keep only first publication year
  mutate(singleYear = gsub(",.*", "", PublicationYear),
         singleYear = gsub(" \\[.*", "", singleYear)) %>% 
  # Keep only numbers
  mutate(cleanYear = gsub("[^0-9]", "", singleYear)) %>% 
  select(c(BibNum, cleanTitle, Author, ISBN, cleanYear, Subjects, ItemType, ItemCollection, maxCopies)) %>% 
  rename(Title = cleanTitle, PubYear = cleanYear)
# binding subjects back onto books
subjects <- catalogMinimal %>% select(c(BibNum, Subjects))


#### At this point we exported the data, and manually cleaned the title, author, and added goodreads and worldcat info
#### We then downloaded the manually cleaned data and added in subjects from the original catalog



# combine subjects from worldcat and catalog
hipCats <- hipsterDeDupe %>% 
  mutate(BibNum = as.integer(BibNum)) %>% 
  left_join(subjects) %>% 
  mutate(combo = case_when(
    Subjects == "" & is.na(Category) ~ NA_character_, 
    Subjects == "" & !is.na(Category) ~ Category,
    is.na(Category) & Subjects != "" ~ Subjects,
    TRUE ~ str_c(Subjects, Category, sep = ", ")
  ))

# combine similar categories
hipCatSum <- hipCats %>% 
  filter(!is.na(combo)) %>% 
  separate_rows(combo, sep = ",") %>% 
  mutate(combo = trimws(combo),
         combo = tolower(combo)) %>% 
  count(combo, sort = TRUE)

# define categories for front-end
pnw <- c("Washington", "Oregon", "Idaho")
nonWestern <- paste0(tolower(state.name[!state.name %in% pnw]), collapse = "|")
otherCountries <- c("russia|brazil|canada|france|africa[:space:]|arctic|czech|europ|france|french|german|greenland|jamaica|nigeria|norway|nova scotia|panama|portug|spanish|vancouver")

# assign parent categories
hipCatCum <- hipCats %>% 
  mutate(combo = tolower(combo)) %>% 
  mutate(child = ifelse(grepl("child|juvenile", combo), "child", NA_character_),
         frontier = ifelse(grepl("frontier|western|pioneer", combo), "frontier", NA_character_),
         romance = ifelse(grepl("romance|relation", combo), "romance", NA_character_),
         pnw = ifelse(grepl("washington|oregon|idaho|northwest", combo), "pnw", NA_character_),
         states = ifelse(grepl(nonWestern, combo), "states", NA_character_),
         countries = ifelse(grepl(otherCountries, combo), "countries", NA_character_),
         short = ifelse(grepl("short", combo), "short", NA_character_)) %>% 
  unite(new,c(child:short), sep = ", ", na.rm = TRUE, remove = TRUE) 
