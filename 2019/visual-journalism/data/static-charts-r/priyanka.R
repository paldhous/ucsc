
library(dplyr)
library(readr)
library(ggplot2)

nations <- read_csv("data-processing-r/nations.csv")

nations <- read_csv("nations.csv")

##### Priyanka version of the data processing for the first chart

#GDP in trillions for each country
gdp_country<- nations %>%
  mutate(GDP_trillions = ((gdp_percap*population)/1000000000000)) %>% # nothing after here does anything useful
  group_by(country, year)%>% # no need to group and summarize
  summarize(GDP_trillions, na.rm = TRUE) 
# without a function to summarize by (sum, max etc), 
# the last line just adds a columns called na.rm with the value TRUE in all rows
# always inspect the objects you make! You should have seen this was wrong
# more importantly, think about the structure of the data because starting
# each row is one country, one year, so there's no need to group and summarize to make the chart
# you just need to filter

#### commenting all of this out because you never, ever need to filter like this

# #filter data for China
# head(gdp_country)
# China_GDP_trillions <- gdp_country %>%
#   filter(country == "China" & !is.na(GDP_trillions)) %>%
#   select(country, year, GDP_trillions)
# 
# #filter data for Germany
# Germany_GDP_trillions <- gdp_country %>%
#   filter(country == "Germany" & !is.na(GDP_trillions)) %>%
#   select(country, year, GDP_trillions)
# 
# #filter data for Japan
# Japan_GDP_trillions <- gdp_country %>%
#   filter(country == "Japan" & !is.na(GDP_trillions)) %>%
#   select(country, year, GDP_trillions)
# 
# #filter data for United States
# US_GDP_trillions <- gdp_country %>%
#   filter(country == "United States" & !is.na(GDP_trillions)) %>%
#   select(country, year, GDP_trillions)

#filter data for 4 countries (for some reason, this isn't displaying all the years for select countries)
SetCountries_GDP_trillions <- gdp_country %>%
  filter(country %in% c("China", "Germany", "Japan", "United States") & !is.na(GDP_trillions)) %>%
  select(country, year, GDP_trillions) # seems to display all years for all countries to me

#merge select countries filtered data (had to do this instead)
GDP_merged <- do.call("rbind", list(China_GDP_trillions, Germany_GDP_trillions, Japan_GDP_trillions, US_GDP_trillions))
# no need to split and recombine the data, bu bind_rows is the simpler tidyverse was to append data
# see the class notes for this

##### Peter version of the data processing for the first chart
big4 <- nations %>%
  mutate(gpd_tn = gdp_percap*population/10^12) %>%
  filter(grepl("CHN|USA|IND|DEU",iso3c))
  
#### Priyanka version of the first chart
# plot dot-and-line chart
GDP_trillions_chart1 <- ggplot(GDP_merged, aes(x = year, y = GDP_trillions)) +
  xlab("") +
  ylab("GDP ($ trillion)") +
  theme_minimal(base_size = 14) +
  # Below, I'm suprised col worked. I'd always use color or colour to avoid confusion with col meaning column
  ylim(0,30)+ xlim(1990, 2016) + geom_line(aes(col=country)) +
  geom_point(aes(col=country)) + theme(legend.title = element_blank(), legend.position="bottom")
# because this isn't connected to the line above by +, it isn't run, hence the palette wasn't applied
scale_color_brewer(palette = "Set1") 
plot(GDP_trillions_chart1)
# also you don't really need to set limits for the axes here
# I'd also start a new line after each + 
# It makes the code easier to read

#### Peter version of the first chart
# notice I put the aes mapping of color in the initial function, so it applies to the whole chart
ggplot(big4, aes(x = year, y = gdp_tn, color = country)) +
  xlab("") +
  ylab("GDP ($ trillion)") +
  geom_point() +
  geom_line() +
  scale_color_brewer(palette = "Set1", name = "") + # a bit easier than removing title in a theme function
  theme_minimal(base_size = 14) +
  theme(legend.position = "bottom")

## Priyanka version of data processing, this is good
#GDP in trillions for each region
gdp_regions <- nations %>%
  mutate(GDP_trillions = ((gdp_percap*population)/1000000000000)) %>% # you don't need parentheses around the multiplication and division
  group_by(region, year) %>%
  summarize(total_gdp_tn = sum(GDP_trillions, na.rm = TRUE))

## Priyanka version of the second chart
#plot area chart
GDP_trillions_chart2 <- ggplot(gdp_regions, aes(x = year, y = total_gdp_tn)) +
  xlab("") +
  ylab("GDP ($ trillion)") +
  theme_minimal(base_size = 14) +
  ylim(0,125)+ xlim(1990, 2016) + geom_area(aes(fill=region), color = "white") +
  theme(legend.title = element_blank())+
  scale_color_brewer(palette = "Set2") # this does nothing becase you need to scale the fill, not the color
plot(GDP_trillions_chart2)

## Peter version of the second chart
ggplot(gdp_regions, aes(x = year, y = total_gdp_tn)) +
  xlab("") +
  ylab("GDP ($ trillion)") +
  theme_minimal(base_size = 14) +
  geom_area(aes(fill=region), color = "white") +
  theme(legend.title = element_blank())+
  scale_fill_brewer(palette = "Set2")


