# Datasets

Click on the title links to download the data. Please [contact me](mailto:peter@peteraldhous.com) **before the class** in which data will be used if you have any problems downloading!

### [Acquiring data](./data/acquiring-data.zip)

Contains:

- `urls.txt` links scraped from State of New York site documenting disciplinary actions against doctors.

- `ny_dr_discip_urls.html` web page with a table giving links to pages documenting individual disciplinary actions against New York doctors.

### [Cleaning data](./data/cleaning-data.zip)

`cleaning` Folder containing:

- `techexports.xls` [High-technology exports](http://data.worldbank.org/indicator/TX.VAL.TECH.CD) from 1990 to 2015, in current US dollars, from the UN Comtrade database, supplied via the World Bank. High-technology exports include products in aerospace, computers, pharmaceuticals, scientific instruments, and electrical machinery.

- `ny_dr_discip_actions.xls` The data on disciplinary actions against doctor in New York state, scraped from [this website](https://w3.health.ny.gov/opmc/factions.nsf/byphysician?OpenView) in the previous class.

- `ucb_stanford_2014.csv` Data on federal government grants to UC Berkeley and Stanford University in 2014, downloaded from [USASpending.gov](https://www.usaspending.gov/Pages/Default.aspx).

`geocoding` Folder containing:

- `sf_test_addresses.tsv` Text file containing a list of 100 addresses in San Francisco.
- `sf_addresses_short.tsv` The first 10 addresses from the previous file.
- `refine-geocoder.json` A script in JSON format that we will use to automate geocoding.

### [Databases](./data/databases.zip)

`pfizer` Folder containing:

- `pfizer.sqlite` SQLite database detailing payments by the drug company Pfizer to doctors
- `pfizer.txt` Tab-delimited text file containing the same data
- `fda.txt` Tab-delimited text file documenting warning letters from the Food and Drug Administration to doctors involved in research on experimental drugs or medical devices.

Data used in reporting [this news story](http://www.newscientist.com/article/dn18806-revealed-pfizers-payments-to-censured-doctors.html).

### [Visualizing data](./data/visualizing.zip)

`nations` Folder containing:

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





