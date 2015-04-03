# Datasets

These links include datasets that we will use in class, and others you may find interesting to explore. Click on the title links to download the data. Please [contact me](mailto:peter@peteraldhous.com) **before the class** in which data will be used if you have any problems downloading!

#### [UK Clinical Trials Gateway](./data/UKCTG.zip)
Sample of 100 individual clinical trial webpages from which we will extract data using Import.io.

#### [California Medicare spending](./data/medicare.zip)
CSV file documenting reimbursements per enrollee in Medicare, the main U.S. government healthcare programme for retirees, by county in California, for various categories of payment. We will use this data to demonstrate reshaping data from "wide" to "long" format, using Open Refine.

#### [UC Berkeley grants](./data/ucb_grants.zip)
CSV file documenting U.S. federal government grants to the University of California, Berkeley, in 2013, downloaded from [USASpending.gov](http://usaspending.gov/). We will use this data to illustrate data cleaning and processing using Open Refine.

#### [Geocoding](./data/geocoding.zip)

A sample of addresses in San Francisco, for use in geocoding exercise, in two text files.

#### [Pfizer payments to doctors](./data/pfizer.zip)

A series of files for our database class: SQLite database detailing payments by the drug company Pfizer to doctors; tab-delimited text file containing the same data; and tab-delimited text file documenting warning letters from the U.S. Food and Drug Administration to doctors involved in research on experimental drugs or medical devices. Data used in reporting [this news story](http://www.newscientist.com/article/dn18806-revealed-pfizers-payments-to-censured-doctors.html).

#### [Nations](./data/nations.zip)

This is the main dataset we will use for visualization using Tableau Public.

- `nations.csv` Data from the [World Bank Indicators](http://data.worldbank.org/indicator/all) portal, which is an incredibly rich resource. Contains the following fields:
 -  `iso_a3` [Three-letter code](http://unstats.un.org/unsd/tradekb/Knowledgebase/Country-Code) for each country, assigned by the [International Organization for Standardization](http://www.iso.org/iso/home/store/catalogue_tc/catalogue_detail.htm?csnumber=63545).
 - `country` Country name.
 - `year`
 - `region` `income_group` World Bank [regions and current income groups](http://siteresources.worldbank.org/DATASTATISTICS/Resources/CLASS.XLS), explained [here](http://data.worldbank.org/about/country-and-lending-groups).
 - `population` Estimated [total population](http://data.worldbank.org/indicator/SP.POP.TOTL) at mid-year, including all residents apart from refugees.
 - `gdp_percap` [Gross Domestic Product per capita](http://data.worldbank.org/indicator/NY.GDP.PCAP.PP.CD) in current international dollars, corrected for purchasing power in different territories.
 - `life_expect` [Life expectancy](http://data.worldbank.org/indicator/SP.DYN.LE00.IN) in years for a child born in the year in question, if prevailing patterns were to stay the same throughout its life.
 - `population` Estimated [total population](http://data.worldbank.org/indicator/SP.POP.TOTL) at mid-year, including all residents apart from refugees.
 - `birth_rate` Number of [live births during the year per 1,000 people](http://data.worldbank.org/indicator/SP.DYN.CBRT.IN), based on mid-year population estimate.
 - `neonat_mortal` [Neonatal mortality rate](http://data.worldbank.org/indicator/SH.DYN.NMRT): number of babies dying before reaching 28 days of age, per 1,000 live births in a given year.


#### [North Atlantic storms](./data/storms.zip)

`storms.csv` contains [data on tropical storms and hurricanes](http://www.aoml.noaa.gov/hrd/hurdat/Data_Storm.html) compiled by the Hurricane Research Division of the U.S. National Oceanic and Atmospheric Administration. I have processed the [raw data](http://www.aoml.noaa.gov/hrd/hurdat/hurdat2.html) to give the following fields:
- `name` Official name for each storm; unnamed storms are listed as `Unnamed` and also numbered.
- `year` `month` `day` `hour` `minute` Date and time fields for each observation. For recent storms, observations are recorded every six hours.
- `timestamp` Date and time fields combined into a full timestamp for each observation in standard `YYYY-MM-DD HH:MM` format.
- `record_ident` The entry `L` indicates the time at which a storm made landfall, defined as the center of the system crossing a coastline, recorded from 1991 onwards. Other entries are explained in the file `newhurdat-format.pdf`.
- `status` Options include `HU` for hurricane, `TS` for tropical storm and `TD` for tropical depression. Other entries are explained in `newhurdat-format.pdf`.
- `latitude` `longitude` Geographic coordinates for the center of the system at each observation.
-  `max_wind_kts` `max_wind_kph` `max_wind_mph` Maximum sustained wind for each observation.
- `min_press` Minimum air pressure at the center of the system for each observation.

We will visualize this data using Tableau Public. The file contains data on storms from 1990 to 2013.

#### [Infectious disease and democracy](.data/disease_democ.zip)

Tab-delimited text file with data from the [Global Infectious Diseases and Epidemiology Network](http://www.gideononline.com) and [Democratization: A Comparative Analysis of 170 Countries](http://www.amazon.com/Democratization-Comparative-Analysis-Countries-Routledge/dp/0415318602), addressing a controversial theory claiming that the extent to which a country has developed a democratic political system is driven largely by the historical prevalence of infectious disease. We will visualize this data using Tableau Public.

#### [Ebola outbreak](https://datamarket.com/topic/1871/ebola-2014-west-africa-outbreak)

You may wish to explore data on the West African ebola virus outbreak compiled by [Caitlin Rivers](http://www.caitlinrivers.com/), a graduate student in computational epidemiology at Virginia Tech in Blacksburg. To view the data, select `Download ZIP` from Rivers' [ebola Github repository](https://github.com/cmrivers/ebola), which also details the data she has compiled.





