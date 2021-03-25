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

## Loading resulting data acquired from https://www.ulta.com/makeup-face-foundation?N=26y5&Nrpp=200 and scrape.js
## The Ulta results were scraped into separate files so they need to be combined before further processing
ultaFiles <- list.files(
  path = here("scrape", "ulta"),
  pattern = "*.json",
  full.names = FALSE
)

## a function to combine all of the files
combineUlta <- function(file){
  outputFile <-  here::here("assets", "data", "raw_data", "ulta.json")

  initialData <- jsonlite::fromJSON(here::here("scrape", "ulta", file),
                                    flatten = TRUE, simplifyDataFrame = TRUE)

  ## some don't have swatches, if they don't, eliminate them
  if (length(initialData$swatches > 0)){
    data <- as.data.frame(initialData) %>%
      distinct(swatches.description, .keep_all = TRUE) %>%
      rename(imgAlt = swatches.imgAlt, description = swatches.description, imgSrc = swatches.imgSrc) %>%
      mutate(imgAlt = gsub("OUT OF STOCK", "", imgAlt),
             imgAlt = gsub("selected", "", imgAlt),
             imgAlt = trimws(imgAlt))

    outputFile <- here::here("assets", "data", "raw_data", "ulta_all.csv")
    write.table(data, file = outputFile, row.names = FALSE,
                append = TRUE, sep = ",", col.names = !file.exists(outputFile))
  }
}

## Loop through all of the files, combine them, and write to file
walk(ultaFiles, combineUlta)
ultaRaw <- read_csv(here::here("assets", "data", "raw_data", "ulta_all.csv"))


## Clean resulting data
ultaCleaned <- ultaRaw %>%
  ## remove any content in parentheses
  mutate(name = gsub("\\([^()]*\\)", "", imgAlt)) %>%
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
         name = trimws(name))
