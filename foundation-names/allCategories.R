# For general data cleaning and analysis
library(tidyverse)
library(glue)
library(jsonlite)
library(stringr)
library(googledrive)

# For keeping your files in relative directories
library(here)

# For extracting the main color(s) from images
library(jpeg)
library(magick)
library(imager)
library(scales)
library(plotly)

------------------- # FIND CATEGORY DATA # -------------------
# Import necessary files
# these files are all available in this repo
allShades <- read_csv("https://github.com/the-pudding/data/blob/master/foundation-names/allShades.csv")

# categories were assigned manually
categoryCrosswalk <- read_csv("https://github.com/the-pudding/data/blob/master/foundation-names/crosswalks/category_crosswalk.csv")

# combine category and cleaned name data with shade data
shadesWithCat <- allShades %>%
  # combine with crosswalk
  left_join(categoryCrosswalk, by = "imgSrc") %>%
  # remove any shades without a category
  filter(!is.na(categories)) %>%
  # keep just the relevant information
  select(c("brand", "product", "url", "imgSrc", "nameWord", "categories", "specific", "hex", "lightness")) %>%
  rename(name = nameWord) %>%
  distinct(brand, product, imgSrc, name, .keep_all = TRUE)



# save to file (uncomment if this is needed)
# write_csv(shadesWithCat, here::here("assets", "data", "open_data", "allCategories.csv"))
