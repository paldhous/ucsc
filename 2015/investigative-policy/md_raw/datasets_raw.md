# Datasets

Click on the title links to download the data. Please [contact me](mailto:peter@peteraldhous.com) **before the class** in which data will be used if you have any problems downloading!

### [Acquiring and cleaning data](./data/acquiring-cleaning.zip)

`cleaning` Folder containing:
- `CA_counties_medicare.xls` Spreadsheet with data on Medicare reimbursement per enrollee by California county in 2012, from the [Dartmouth Atlas of Healthcare](http://www.dartmouthatlas.org). Includes the following fields:
 - `enrollees` Medicare enrollees in 2012.
 - `total` Total Medicare reimbursements per enrollee.
 - `hospital` Hospital & skilled nursing facility reimbursements per enrollee.
 - `physician` Physician reimbursements per enrollee.
 - `outpatient` Outpatient facility reimbursements per enrollee.
 - `homehealth` Home health agency reimbursements per enrollee.
 - `hospice` Hospice reimbursements per enrollee.
 - `medequip` Durable medical equipment reimbursements per enrollee.

- `ucb_grants.csv` Data on grants from the U.S. federal government to the University of California, Berkeley, in 2013, from [USASpending.gov](http://usaspending.gov/).

`geocoding` Folder containing:

- `sf_test_addresses.tsv` Text file containing a list of 100 addresses in San Francisco.
- `sf_addresses_short.tsv` The first 10 addresses from the previous file.
- `refine-geocoder.json` A script in JSON format that we will use to automate geocoding.

`UKCTG` Folder containing a samples of web pages detailing clinical trials, downloaded form the [U.K. Clinical Trials Gateway](http://www.ukctg.nihr.ac.uk/trials.aspx).

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

`storms` Folder containing:
- `storms.csv` contains [data on tropical storms and hurricanes](http://www.aoml.noaa.gov/hrd/hurdat/Data_Storm.html), from 1990 to 2013, compiled by the Hurricane Research Division of the U.S. National Oceanic and Atmospheric Administration. I have processed the [raw data](http://www.aoml.noaa.gov/hrd/hurdat/hurdat2.html) to give the following fields:
 - `name` Official name for each storm; unnamed storms are listed as `Unnamed` and also numbered.
 - `year` `month` `day` `hour` `minute` Date and time fields for each observation. For recent storms, observations are recorded every six hours.
 - `timestamp` Date and time fields combined into a full timestamp for each observation in standard `YYYY-MM-DD HH:MM` format.
 - `record_ident` The entry `L` indicates the time at which a storm made landfall, defined as the center of the system crossing a coastline, recorded from 1991 onwards. Other entries are explained in the file `newhurdat-format.pdf`.
 - `status` Options include `HU` for hurricane, `TS` for tropical storm and `TD` for tropical depression. Other entries are explained in `newhurdat-format.pdf`.
 - `latitude` `longitude` Geographic coordinates for the center of the system at each observation.
 -  `max_wind_kts` `max_wind_kph` `max_wind_mph` Maximum sustained wind for each observation.
 - `min_press` Minimum air pressure at the center of the system for each observation.
- `newhurdat-format.pdf` More explanation of the raw storms data from NOAA, including the full list of storm `status` codes.






