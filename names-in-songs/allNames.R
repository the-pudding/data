##### Code used to analyze song lyrics looking for names. Due to copyright issues, we can't release the original song lyrics
##### This code technically won't run without `lyricData` but any lyric data file (in which the lyrics are in a list within a dataframe)
##### would theoretically run

library(tidyverse)
library(here)
library(udpipe)


# accessing data from github repo
onlyNames <- read.csv("https://raw.githubusercontent.com/the-pudding/data/master/names-in-songs/names.csv", stringsAsFactors = FALSE, header = TRUE)


findName <- function(artist, song, lyrics, name){
  # Define the search field, a name with word boundaries or a space on either side
  search <- paste0("\\b(", name, ")([:space:]|\\b)")
  
  # Detect whether that string has been found
  found <- stringr::str_detect(string = lyrics, pattern = regex(pattern = search))

  if (TRUE %in% found){
    # if the name has been found in the lyrics, create a tibble
      songTibble <- tibble("artist" = artist,
                           "song" = song,
                           "lyrics" = list(lyrics),
                           "name" = name) %>% 
        # unnest the lyrics to separate rows
        unnest(lyrics) %>% 
        # create a new column called "contains" which indicates whether an individual line contained
        # the name in question
        mutate(contains = stringr::str_detect(string = lyrics, pattern = regex(pattern = search))) %>% 
        # filter the data to keep only those lines that contain names
        filter(contains == TRUE)
      
      # For each individual line that contained a name...
      parsedSong <- map_dfr(songTibble$lyrics, function(x){
        # use the udpipe package to annotate the parts of speech
          parse <-  udpipe::udpipe_annotate(x, object = ud_english)
          # and put the results in a data frame
          txt <- as.data.frame(parse)
        }) %>% 
        # keep only the lines where the token word was the name in question
          filter(token == name) %>% 
        # add metadata to the new dataframe
          mutate(artist = artist,
               song = song, 
               name = name) %>% 
        # keep only the columns that we're interested in
        select(c(artist, song, name, sentence, upos, xpos, dep_rel))
      
    # define a file name and directory for output data
    fileName = here::here("processed_data", "manualSongNamesNew.csv")
      
    # write resulting data to a csv file (appending new data on each loop)
	  write.table(parsedSong, file = fileName, row.names = FALSE, append = TRUE, sep = ",", col.names = !file.exists(fileName))
	  
	  # return the results to check in RStudio
	  return(parsedSong)
  }
}
checkAllNames <- function(artist, song, lyrics, .pb=NULL){
  # for progress bar
	if ((!is.null(.pb)) && inherits(.pb, "Progress") && (.pb$i < .pb$n)) .pb$tick()$print()

  # create a named list of arguments for pmap
  innerArgs <- list(artist, song, list(lyrics), onlyNames$Name)

  # for each name, run the findName function
  data <- pmap_dfr(innerArgs, findName)

}

# access the df of lyrics (sorry, we can't release this)
sub <- lyricDataUpdated

# using a progress bar
pb <- progress_estimated(nrow(sub))

# create a named list of arguments for pmap
args <- list(artist = sub$artist, song = sub$song, lyrics = sub$lyrics)

# use the pmap function to loop through all lyrics and all names
namesInSongs <- pmap_dfr(args, checkAllNames, .pb = pb)
