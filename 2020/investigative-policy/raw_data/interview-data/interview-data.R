library(tidyverse)
library(readxl)

# list files to process
drug_lists <- list.files("/Users/peteraldhous/Dropbox/ucb-dataj/2018/raw-data/week5&6/medicare_drug_lists", full.names = T)

files <- list.files("/Users/peteraldhous/Dropbox/ucb-dataj/2018/raw-data/week5&6/medicare_prescriptions", full.names = T)

opioids1 <- drug_lists %>%
  map_dfr(read_excel, sheet = 2, skip = 2) %>%
  filter(!is.na(`Generic Name`))

opioids2 <- drug_lists %>%
  map_dfr(read_excel, sheet = 3, skip = 2)  %>%
  filter(!is.na(`Generic Name`))

opioids <- bind_rows(opioids1,opioids2) %>%
  select(2,3) %>%
  unique()
names(opioids) <- c("drug_name","generic_name")
rm(opioids1,opioids2)
  
medicare <- tibble()

# doing in a loop with garbage collection to avoid memory overload
# also freeing up memory during loop using CleanMyMac
y = 2013
for (f in files) {
  print(y)
  tmp <- read_tsv(f) %>%
    filter(nppes_provider_state == "CA") %>%
    inner_join(opioids) %>%
    select(1:6,8:11,14) %>%
    mutate(year = y)
  medicare <- bind_rows(medicare, tmp)
  rm(tmp)
  gc()
  y = y +1
}

write_csv(medicare,"ca_medicare_opioids.csv",na="")

# npi state license crosswalk
npi_license <- read_csv("/Users/peteraldhous/Dropbox/ucb-dataj/2018/raw-data/week5&6/nber/sstatelic.csv") %>%
  filter(plicstate == "CA")

write_csv(npi_license, "npi_license.csv", na="")
