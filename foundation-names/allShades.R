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

------------------- # COMBINE DATA # -------------------
# Import necessary files
# these files are all available in this repo
ulta <- read_csv("https://github.com/the-pudding/data/blob/master/foundation-names/ulta.csv")
sephora <- read_csv("https://github.com/the-pudding/data/blob/master/foundation-names/sephora.csv")

# manually created crosswalk to match brand and product names across resellers
usCrosswalk <- read_csv("https://github.com/the-pudding/data/blob/master/foundation-names/crosswalks/sephora_ulta_crosswalk.csv")

# combine data and use crosswalk to consolidate duplicate products
sephoraUpdated <- sephora %>%
  # standardize brand presentation
  mutate(ultaBrand = case_when(
    brand == "Hourglass" ~ "HOURGLASS",
    brand == "CLINIQUE" ~ "Clinique",
    brand == "IT Cosmetics" ~ "It Cosmetics",
    brand == "tarte" ~ "Tarte",
    brand == "Urban Decay" ~ "Urban Decay Cosmetics",
    TRUE ~ brand
  )) %>%
  distinct(brand, product, description, .keep_all = TRUE) %>%
  left_join(crosswalk, by = c("ultaBrand" = "s_brand", "product" = "s_product")) %>%
  # when no ulta-styled product was specified, use the product name as specified by sephora
  mutate(u_product = case_when(
    is.na(u_product) ~ product,
    TRUE ~ product
  ))

# remove any sephora products that also appear at ulta
onlySephora <- sephoraUpdated %>%
  mutate(u_product = trimws(u_product), product = trimws(product)) %>%
  anti_join(ulta, by = c("ultaBrand" = "brand", "u_product" = "product")) %>%
  select("ultaBrand", "product", "url", "description", "imgSrc", "imgAlt", "name", "specific" ) %>%
  rename("brand" = "ultaBrand")

allFoundations <- rbind(ulta, onlySephora)

# helper functions for cleaning up data
transparent <- c("Translucent", "Non-Tinted")
'%!in%' <- function(x,y)!('%in%'(x,y))




------------------- # EXTRACT COLORS # -------------------
# create function to access the swatch from the url and extract the color from it
extractColors <- function(swatch_url, store, n = 2, cs = "RGB", .pb = NULL){
  # This part handles the progress bar
  if ((!is.null(.pb)) && inherits(.pb, "Progress") && (.pb$i < .pb$n)) .pb$tick()$print()
  Sys.sleep(0.001)

  # find swatch image
  # sephora only provided partial url, ulta's is full
  full_url <- ifelse(store == "sephora", glue("https://www.sephora.com{swatch_url}"), swatch_url)

  # read the image from url
  image <- image_read(full_url) %>%
    # resize to 30 px wide (for speed)
    image_resize("30") %>%
    # reduce to specified most common colors
    image_quantize(max = n, colorspace = cs) %>%
    # convert to imager object for easier dataframe export
    magick2cimg()

  hex <- image %>%
    RGBtoHSV() %>%
    # reshape into a wide data frame
    as.data.frame(wide="c") %>%
    # add hex value for each color
    mutate(hex=hsv(rescale(c.1, from=c(0,360)),c.2,c.3),
           hue = c.1,
           satHex = c.2,
           value = c.3)

  hslImg <- image %>%
    # convert to HSL to sort by hue
    RGBtoHSL() %>%
    # reshape into a wide data frame
    as.data.frame(wide="c") %>%
    # add hex value for each color
    mutate(hue = c.1,
           sat = c.2,
           lightness = c.3)

  combo <- left_join(hex, hslImg, by = "hue") %>%
    # count the frequency of each color
    count(hex, hue, sat, lightness, sort = TRUE) %>%
    # print out our specified colorspace
    mutate(colorspace = cs)

  df <- combo %>%
    # keep relevant info
    select(colorspace, hex, hue, sat, lightness) %>%
    # keep only most common hex value
    filter(row_number() == 1) %>%
    mutate(searchImage = swatch_url)

  # Uncomment below to save to file after each swatch is processed
  #filePath <- here::here("assets", "data", "processed_data", glue("{store}Colors.csv"))

  #write.table(df, file = filePath, row.names = FALSE, append = TRUE, sep = ",", col.names = !file.exists(filePath))
}


# Extract colors from both ulta and sephora products
ultaSwatchURLs <- ulta$imgSrc
ultaPb <- progress_estimated(length(ultaSwatchURLs))
ultaSwatches <- map2_dfr(ultaSwatchURLs, "ulta", extractColors, .pb = ultaPb)

sephoraSwatchURLs <- sephora$imgSrc
sephoraPb <- progress_estimated(length(sephoraSwatchURLs))
sephoraSwatches <- map2_dfr(sephoraSwatchURLs, "ulta", extractColors, .pb = ultaPb)

# Combine Sephora and Ulta swatches
allSwatches <- rbind(sephoraSwatches, ultaSwatches)

# Combine color data with original foundation data
foundationsWithSwatches <- left_join(allFoundations, allSwatches, by = c("imgSrc" = "searchImage"))  %>%
  # remove any names that are in the vector "transparent"
  filter(name %!in% transparent)

# Find any brand/product combinations that may still be duplicates
duplicateProductCheck <- foundationsWithSwatches %>%
  distinct(url, .keep_all = TRUE) %>%
  count(brand, product) %>%
  filter(n > 1)

# remove the duplicates
removeDuplicates <- duplicateProductCheck %>%
  left_join(foundationsWithSwatches) %>%
  select(-n) %>%
  # remove sephora duplicates
  filter(!str_detect(url, "sephora"))

noDuplicates <- foundationsWithSwatches %>%
  anti_join(duplicateProductCheck)

# combine remaining data
allShades <- rbind(removeDuplicates, noDuplicates) %>%
  # remove any that use the same image source and may have otherwise snuck through
  distinct(imgSrc, .keep_all = TRUE)

# write to file (uncomment to write to file, otherwise, file available in this repo)
# write_csv(allShades, here::here("assets", "data", "processed_data", "allShades.csv"))
