# Importing Packages

## For folder structure
library(here)

## For data import/cleaning
library(tidyverse)
library(purrr)
library(rlang)

# Importing Data
# Assuming that allData.csv has been downloaded from allData.zip and kept in a folder called `raw_data` within the current working directory.
# Download allData.zip from https://github.com/the-pudding/data/tree/master/birth_control/allData.zip
allData <- read.csv(here("raw_data", "allData.csv"))

# Prepare to combine the METHX variables by month (every 4 columns = 1 month of responses)
monthNumbers <- c(1:48)

startMonth <- seq(from = 1, to = 192, by = 4)
endMonth <- seq(from = 4, to = 192, by = 4)
months <- as.data.frame(cbind(startMonth, endMonth))

fullSwitch <- allData %>% 
  select(num_range("METHX", 1:192), c("EVERUSED", "CASEID")) %>% 
  filter(EVERUSED == 1) %>% 
  select(-EVERUSED)

idsOnly <- fullSwitch %>% 
  select("CASEID")

methodsOnly <- fullSwitch %>% 
  select(-CASEID)

condenseAll <- function(monthNum){
  monthName <- paste0("month_", monthNum)
  
  df <- methodsOnly %>% 
    unite(!!monthName, sort(as.numeric(months$startMonth[monthNum]:months$endMonth[monthNum])), sep = ",") %>% 
    select(c(!!monthName)) 
}

partUsage <- map_dfc(monthNumbers, condenseAll) %>% 
  mutate_all(funs(str_replace_all(., ",NA", ""))) %>% 
  cbind(idsOnly) %>% 
  select("CASEID", month_1:month_48) %>% 
  gather(month, value = "method", month_1:month_48) %>% 
  mutate(month = gsub("month_", "", month))

# Create a new data frame called same time
sameTime <- allData %>% 
  # Keep the columns indicating if users combined methods at the same or different times in the month
  select(num_range("SIMSEQX", 1:48), CASEID) %>% 
  # Collect all "same/different" time columns into one
  gather(month, value = "time", SIMSEQX1:SIMSEQX48) %>% 
  # Eliminate the SIMSEQX code to just end up with a number representing month
  mutate(month = gsub("SIMSEQX", "", month))


usageTime <- partUsage %>%
  left_join(sameTime, by = c("CASEID", "month")) %>% 
  filter(time == 1)

usageMap <- usageTime %>% 
  group_by(CASEID, method) %>% 
  summarise(count = n()) %>% 
  mutate(prev = lag(method))

networkData <- usageMap %>% 
  separate(method, c("method_1", "method_2", "method_3", "method_4"), sep = ",")

# Keep respondents that used 4 types of birth control
networkData_4Types <- networkData %>% filter(!is.na(method_4))
networkData_4Types12 <- networkData_4Types %>% select(-c(method_3, method_4)) %>% rename(m_a = method_1, m_b = method_2)
networkData_4Types34 <- networkData_4Types %>% select(-c(method_1, method_2)) %>% rename(m_a = method_3, m_b = method_4)
networkData_4Types13 <- networkData_4Types %>% select(-c(method_2, method_4)) %>% rename(m_a = method_1, m_b = method_3)
networkData_4Types14 <- networkData_4Types %>% select(-c(method_2, method_3)) %>% rename(m_a = method_1, m_b = method_4)
networkData_4Types23 <- networkData_4Types %>% select(-c(method_1, method_4)) %>% rename(m_a = method_2, m_b = method_3)
networkData_4Types24 <- networkData_4Types %>% select(-c(method_1, method_3)) %>% rename(m_a = method_2, m_b = method_4)

networkData_4All <- bind_rows(networkData_4Types12, networkData_4Types34, networkData_4Types13, networkData_4Types14, networkData_4Types23, networkData_4Types24)

# Limit to people that have used 3 types
networkData_3Types <- networkData %>% filter(!is.na(method_3) & is.na(method_4))
networkData_3Types12 <- networkData_3Types %>% select(-c(method_3, method_4)) %>% rename(m_a = method_1, m_b = method_2)
networkData_3Types13 <- networkData_3Types %>% select(-c(method_2, method_4)) %>% rename(m_a = method_1, m_b = method_3)
networkData_3Types23 <- networkData_3Types %>% select(-c(method_1, method_4)) %>% rename(m_a = method_2, m_b = method_3)

networkData_3All <- bind_rows(networkData_3Types12, networkData_3Types13, networkData_4Types23)

# Limit to people that have used 2 types
networkData_2Types <- networkData %>% filter(!is.na(method_2) & is.na(method_3) & is.na(method_4))
networkData_2Types12 <- networkData_2Types %>% select(-c(method_3, method_4)) %>% rename(m_a = method_1, m_b = method_2)

# Limit to people that have used 1 type
networkData_1Type <- networkData %>% filter(is.na(method_2) & is.na(method_3) & is.na(method_4)) %>% select(-c(method_3, method_4)) %>% rename(m_a = method_1, m_b = method_2)

allNetworkData <- bind_rows(networkData_4All, networkData_3All, networkData_2Types12)


commonCombo <- allNetworkData %>% 
  group_by(m_a, m_b) %>% 
  summarise(uniqueR = n_distinct(CASEID)) %>% 
  arrange(desc(uniqueR)) %>% 
  ungroup() %>% 
  mutate(row = row_number())


## Arrive at our final multipleMethods.csv data
multipleMethods <- allNetworkData %>% 
  group_by(m1 = pmin(m_a, m_b), m2 = pmax(m_a, m_b)) %>% 
  summarise(uniqueR = n_distinct(CASEID)) %>% 
  arrange(desc(uniqueR)) %>% 
  ungroup() %>% 
  mutate(row = row_number()) %>% 
  filter(row <= 15) %>% 
  select(-row)