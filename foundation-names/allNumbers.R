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

------------------- # FIND NUMBER DATA # -------------------
# Import necessary files
# these files are all available in this repo
allShades <- read_csv("https://github.com/the-pudding/data/blob/master/foundation-names/allShades.csv")

# regex for identifying and extracting numbers
multLetterNumberReg <- "(([:digit:]+)([:alpha:]+)([:digit:]+)([:punct:]+)([:digit:]+))|(([:digit:]+)([:alpha:]+)([:digit:]+))|(([:alpha:]+)([:digit:]+)([:punct:]+)([:digit:]+))|(([:alpha:]+)([:digit:]+)([:alpha:]+))|(([:digit:]+)([:alpha:]+))|(([:alpha:]+)([:digit:]+))"
numberReg <- "(([:digit:]+)(\\.[:digit:]+)?)"

numbers <- allShades %>%
  # extract numbers from the non-word part of the description
  mutate(numbers = as.numeric(str_extract(specific, numberReg))) %>%
  # remove any with no numbers
  filter(!is.na(numbers))

# keep only products where each swatch in the line uses a different number
multipleNumbers <- numbers %>%
  group_by(brand, product) %>%
  arrange(numbers) %>%
  # find if there are duplicates
  group_by(brand, product, numbers) %>%
  mutate(count = n()) %>%
  ungroup() %>%
  group_by(brand, product) %>%
  mutate(max = max(count)) %>%
  # if there are, remove those products since they aren't using sequential numbers
  filter(max == 1)

# for the products where the numbers go sequentially, determine the lightness value of the first and last numbered shades
sequentialNumbers <- multipleNumbers %>%
  mutate(rowCount = case_when(
    row_number() == 1 ~ 'first',
    row_number() == n() ~ 'last',
    TRUE ~ NA_character_
  )) %>%
  # keep only the first and last shades
  filter(!is.na(rowCount)) %>%
  # make the data wider, so each row was a single product
  pivot_wider(id_cols = c("brand", "product", "url"), names_from = rowCount,
              values_from = lightness)  %>%
  # remove any with missing first or last lightness values
  filter(!is.na(first) & !is.na(last)) %>%
  # if the first swatch had a higher lightness value, the sequence went from light to dark
  mutate(lightToDark = first > last) %>%
  ungroup() %>%
  # Clinique had translucent products in this list, remove them
  filter(brand != 'Clinique') %>%
  # assign an id to each product
  mutate(id = row_number())

# add color information back in
allNumbers <- multipleNumbers %>%
  left_join(sequentialNumbers, by = c("brand", "product", "url")) %>%
  select(c(brand, product, name, specific, lightness, hex, lightToDark, numbers, id))

# write to file (uncomment if you want to save)
# write_csv(allNumbers, here::here("assets", "data", "open_data", "allNumbers.csv"))
