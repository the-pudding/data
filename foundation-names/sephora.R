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

# RegEx for extracting numbers
multLetterNumberReg <- "(([:digit:]+)([:alpha:]+)([:digit:]+)([:punct:]+)([:digit:]+))|(([:digit:]+)([:alpha:]+)([:digit:]+))|(([:alpha:]+)([:digit:]+)([:punct:]+)([:digit:]+))|(([:alpha:]+)([:digit:]+)([:alpha:]+))|(([:digit:]+)([:alpha:]+))|(([:alpha:]+)([:digit:]+))"
numberReg <- "(([:digit:]+)(\\.[:digit:]+)?)"

## Loading resulting data acquired from https://www.sephora.com/shop/foundation-makeup and scrape.js
sephora <- jsonlite::fromJSON(here::here("assets", "data", "raw_data", "sephora.json")) %>%
  unnest(swatches) %>%
  # remove "Out of Stock" from any descriptions
  mutate(description = str_remove(description, "Out of stock: "))

## Start cleaning resulting data
sephoraAttempt <- sephora %>%
  ## remove any content in parentheses
  mutate(name = gsub("\\([^()]*\\)", "", imgAlt)) %>%
  ## remove any instance of product size to end of line
  mutate(name = str_replace(name, "(([:digit:]+)(\\.[:digit:]+)?[:space:]*(oz|fl oz)).*", " ")) %>%
  ## make a separate column for numbers
  mutate(specific = case_when(
    # look for combo of letters and numbers
    str_detect(name, multLetterNumberReg) ~ str_extract(name, multLetterNumberReg),
    # if name contains CN or WN and numbers, pull those out
    str_detect(name, "(CN|WN|Shade|No\\.) \\s*[:digit:]+(\\.[:digit:]+)?\\s") ~ str_extract(name, "(CN|WN|Shade|No\\.) \\s*[:digit:]+(\\.[:digit:]+)?\\s"),

    # if name contains numbers, pull those out
    str_detect(name, numberReg) ~ str_extract(name, numberReg),

    TRUE ~ NA_character_
  )) %>%
  mutate(name = case_when(
    # replace numbers prefaced by CN or WN
    str_detect(name, "(CN|WN|Shade|No\\.) \\s*[:digit:]+(\\.[:digit:]+)?\\s") ~ str_replace(name, "(CN|WN|Shade|No\\.) \\s*[:digit:]+(\\.[:digit:]+)?\\s*", " "),

    # replace number/letter combos (e.g., 72W 80C etc.)
    str_detect(name, multLetterNumberReg) ~ str_replace( name, multLetterNumberReg, " "),

    # Find number at start of string with no letters in string
    grepl("^\\s*[[:digit:]]+(\\.[[:digit:]]+)?\\s", name) & grepl("[A-Za-z]", name) ~ str_replace(name, "^\\s*[[:digit:]]+(\\.[[:digit:]]+)?\\s*", " "),

    # replace any remaining numbers
    str_detect(name, numberReg) ~ str_replace(name, numberReg, " "),
    name == "" ~ specific,

    TRUE ~ name,
    )) %>%
  mutate(name = str_replace(name, "[:punct:][:space:]|[:space:][:punct:]", " "),
         ## anything with two spaces had some punctuation between it, remove
         name = str_replace(name, "[:space:]{2}.*", " "),
         name = trimws(name))
