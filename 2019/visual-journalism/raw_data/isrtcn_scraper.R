library(rvest)
library(tidyr)
library(dplyr)

url <- "http://www.isrctn.com/search?pageSize=2500&sort=&page=1&q=&filters=condition%3Acancer&searchType=advanced-search"

titles <- read_html(url) %>%
  html_nodes(".ResultsList_item_title") %>%
  html_text() %>%
  data.frame()

names(titles) <- "title"

titles <- titles %>%
  separate(title, c("id","descr"), " : ") %>%
  mutate(id = trimws(id),
         descr = trimws(descr))

base_url <- "http://www.isrctn.com/"

trial_data <- data.frame()

for (id in titles$id) {
  url <- paste0(base_url,id)
  print(url)
  tmp <- read_html(url) %>%
    html_nodes("dd") 
  overall_status <- tmp[6] %>%
    html_text() %>%
    trimws()
  recruit_status <- tmp[7] %>%
    html_text() %>%
    trimws()
  tmp2 <- data.frame(id,overall_status,recruit_status)
  trial_data <- bind_rows(trial_data,tmp2)
}

