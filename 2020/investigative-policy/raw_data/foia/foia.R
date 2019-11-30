# set working directory to the folder containing this script
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

# load required packages
library(DT)
library(tidyverse)

foia_contacts <- read.csv("FOIA-Agency-Contacts.csv") %>%
  mutate(Address = paste0(Street.Address.1,", ",Street.Address.2,", ",City,", ",State," ",Zip.code)) %>%
  select(Component,Department,Name,Title,Email,Address,Telephone,Fax)

datatable(foia_contacts, rownames = FALSE, extensions="Buttons", options = list(
  dom = "Bfrtip",
  buttons = c("copy", "csv", "excel")
))

