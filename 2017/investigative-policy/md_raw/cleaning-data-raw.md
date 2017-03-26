# Cleaning and processing data

In this class, we will consider how to recognize and clean “dirty” data. We will also review some common data formats, and learn how to convert from one to another.

### The data we will use

Download the data for this class from [here](data/cleaning-data.zip), unzip the folder and place it on your desktop. It contains the following folders and files:

`cleaning` Folder containing:

- `techexports.xls` [High-technology exports](http://data.worldbank.org/indicator/TX.VAL.TECH.CD) from 1990 to 2015, in current US dollars, from the UN Comtrade database, supplied via the World Bank. High-technology exports include products in aerospace, computers, pharmaceuticals, scientific instruments, and electrical machinery.

- `ny_dr_discip_actions.xls` The data on disciplinary actions against doctor in New York state, scraped from [this website](https://w3.health.ny.gov/opmc/factions.nsf/byphysician?OpenView) in the previous class.

- `ucb_stanford_2014.csv` Data on federal government grants to UC Berkeley and Stanford University in 2014, downloaded from [USASpending.gov](https://www.usaspending.gov/Pages/Default.aspx).

`geocoding` Folder containing:

- `sf_test_addresses.tsv` Text file containing a list of 100 addresses in San Francisco.
- `sf_addresses_short.tsv` The first 10 addresses from the previous file.
- `refine-geocoder.json` A script in JSON format that we will use to automate geocoding.


### Can I trust this data?

Having identified a possible source of data for your project, you need to ask: Is it reliable, accurate and useful? If you rush into analysis or visualization without considering this question, your hard work may be undermined by the maxim: “Garbage In, Garbage Out.”

The best rule of thumb in determining the reliability of a dataset is find out whether it has been used for analysis before, and if so, by whom. If a dataset was put together for an academic study, or is actively curated so it can be made available for experts to analyse, you can be reasonably confident that it is as complete and accurate as it can be -- the US Geological Survey's earthquake data is a good example.

While in general you might be more trusting of data downloaded from a `.gov` or `.edu` domain than something found elsewhere on the web, don’t simply assume that it is reliable and accurate. Before using any dataset, do some background research to find out how it was put together, and whether it has been rigorously checked for errors. If possible, try to speak to the people responsible for managing the database, and any academics or other analysts who have used the data. They will be your best guide to a dataset’s strengths and weaknesses.

Even for well-curated data, make a point of speaking with experts who compile it or use it, and ask them about the data's quirks and limitations. From talking with experts on hurricanes, for example, I know not to place too much trust in data on North Atlantic storms prior to about 1990, before satellite monitoring was well developed -- even though the [data available from the National Oceanic and Atmospheric Adminstration](http://www.aoml.noaa.gov/hrd/hurdat/Data_Storm.html) goes back to 1851.

Always ask probing questions of a dataset before putting your trust in it. Is this data complete? Is it up-to-date? If it comes from a survey, was it based on a representative sample of people who are relevant to your project? Remember that the first dataset you find online may not be the most relevant or reliable.

### Recognize dirty data

In an ideal world, every dataset we find would have been lovingly curated, allowing us to start analysing and visualising without worrying about its accuracy.

In practice, however, often the best available data has some flaws, which may need to be corrected as far as is possible. So before starting to work with a new dataset, look for common errors.

Look for glitches in the alignment of columns, which may cause data to appear in the wrong field.

For people’s names, look for variations in spelling, format, initials and accents, which may cause the same person to appear in multiple guises. Similar glitches may affect addresses, and any other information entered as text.

Some fields offer some obvious checks: if you see a zip code that contains anoything other than five or nine digits, for instance, you know it must be wrong.

Dates can also be entered incorrectly, so it’s worth scanning for those that fall outside the timeframe that should be covered by the data.

Also scan numbers for any obvious outliers. These values are worth checking out. Are they correct, or did someone misplace a decimal point or enter a number in the wrong units?

Other common problems are white spaces before and after some entries, which may need to be stripped out.

At all stages of your work, pay attention to zeros. Is each one actually supposed to represent zero, or should the cell in fact be empty? Take particular care exporting data from one software tool and importing to another, and check how empty cells, or "nulls," have been handled.

#### Is your data wide, or long?

Particularly when data shows a time series for a single variable, it is often provided like the example below, downloaded from the [World Bank's data site](http://data.worldbank.org/indicator/?tab=all) on the [value of high-technology exports](http://data.worldbank.org/indicator/TX.VAL.TECH.CD?view=chart) for different countries and groups of countries over time, expressed in current US dollars. There are four variables in this data, which I've color-coded to make them easier to spot:

![](./img/cleaning_data_1.jpg)

The variables are:
- `Country Name` Yellow
- `Country Code` Green
- `Year` Blue
-  `High-Tech Exports` Pink

While this "wide" data format makes the spreadsheet easier for people to scan, most software for data analysis and visualization wants the data in a neat "long" format, with one variable in each column, like this:

![](./img/cleaning_data_2.jpg)

So you may need to convert data from wide to long format.

### Clean and process data with Open Refine

Checking and cleaning "dirty" data can be the most labor intensive part of  many data journalism projects, but **[Open Refine](http://openrefine.org/)** (formerly Google Refine) can streamline the task -- and also create a reproducible script to quickly repeat the process on data that must be cleaned and processed in the same way.

When you launch Open Refine, it opens in your web browser. However, any data you load into the program will remain on your computer -- it does not get posted online.

The opening screen should look like this:

![](./img/cleaning_data_3.jpg)


#### Reshape data from wide to long format

Click the `Browse` button and navigate to the file `techexports.xls`. Click `Next>>`, and check that data looks correct:

![](./img/cleaning_data_4.jpg)

Open Refine should recognize that the data is in a Excel spreadsheet file, but if not you can use the panel at bottom to specify the correct file type and format for the data. If your file has some initial header lines that need to be ignored, Open Refine can deal with that, too.

Numbers and dates should appear in green, plain text in black. Also change the `Project name` to remove the `xls`.

When you are satisfied that the data has been read correctly, click the `Create Project >>` button at top right. The screen should now look like this:

![](./img/cleaning_data_5.jpg)

As you can see, the data is in wide format, with values for technology exports by country organized in columns, one for each year. To convert this to long format, click on the small downward-pointing triangle for the first of these year columns, and select `Transpose>Transpose cells across columns into rows`.

Fill in the dialog box as below, making sure that `From Column` and `To Column` are highlighted correctly, that the `Key column` and `Value column` have been given appropriate names, and that `Fill down in other columns` is checked. (Failing to do check this box will mean that the region names each will only appear once in the reshaped data, rather than being copied down to appear next to the corresponding data for year and oil production.)

![](./img/cleaning_data_6.jpg)

Click `Transpose` and then the `50` rows link, to see the first 50 rows of the reshaped data:

![](./img/cleaning_data_7.jpg)

Click the `Export` button at top right and you will see options to export the data in a variety of file types, including `Comma-separated value` and `Excel` spreadsheet.

#### Clean dirty data

Click the Open Refine logo at top left to return to the opening screen. Create a new project from the file `ucb_stanford_2014.csv`.

When importing a CSV or other text file, check that the correct column separator has been recognized, and also make sure to check `Parse cell text into numbers, dates ...`, otherwise every column will be imported as plain text:

![](./img/cleaning_data_8.jpg)

Once imported, the project should look like this:

![](./img/cleaning_data_9.jpg)

Again, each field/column has a button with a downward-pointing triangle. Click on these buttons and you get the option to create “facets” for the column, which provide a powerful way to edit and clean data.

Click on the button for the field `Recipent City`, and select `Facet>Text facet`. A summary of the various entries now appears in the panel to the left:

![](./img/cleaning_data_10.jpg)

The numbers next to each entry show how many records there are for each value.

We can edit entries individually: Select `Veterans Bureau Hospi`, which is clearly not a city, click on the `Edit` link, change it to `Unknown`. (If cleaning this data for a real project, we would need to check with an external source to get the actual city for this entry.)

Another problem is that we have a mixture of cases, with some entries in Title or Proper Case, some in UPPERCASE. We can fix this back in the field itself. Click its button again and select `Edit cells>common transforms>To titlecase`.

Now notice that we apparently have duplicate entries for `Berkeley`, `Palo Alto` and `Stanford`. This is the result of trailing white space after the city names for some entries. Select `Edit cells>common transforms>Trim leading and trailing whitespace` and notice how the problem resolves:

![](./img/cleaning_data_11.jpg)

Having cleaned this field, close the facet by clicking the cross at top left.

Now create a text facet for the field `Recipient`:

![](./img/cleaning_data_12.jpg)

What a mess! The only possibilities are Stanford or Berkeley, yet there are multiple variants of each, many including `Board of Trustees` for Stanford and `Regents of` for UC Berkeley.

First, manually edit `Interuniveristy Center for Japanese Language` to `Stanford`, which is where this center is based.

We could continute editing manually, but to illustrate Open Refine's editing functions click on the `Cluster` button. Here you can experiment with different clustering algorithms to edit entries that may be variants of the same thing. Select `key collision` and `metaphone3`, then start checking the clusters and renaming them as `Berkeley` or `Stanford` as appropriate:

![](./img/cleaning_data_13.jpg)

Click `Merge Selected & Close` and the facet can then be quickly edited manually:

![](./img/cleaning_data_14.jpg)

Often we may need to convert fields to text, numbers or dates. For example, click on the button for `Award Date` and select `Edit cells>common transforms>To date` and see that it changes from a string of text to a date in standard format.

Notice the field `Award amount`, which is a value in dollars. Negative values are given in brackets. Because of these symbols, the field is being
recognized as a string of text, rather than a number. So to fix this problem, we have to remove the symbols.

Select `Edit colum>Add column based on this column...` and fill in the dialog box as follows:

![](./img/cleaning_data_15.jpg)

This is the expression:

```Javascript
value.replace('$','').replace(',','').replace('(','-').replace(')','')
```

Here `value` refers to the value in the original column, and `replace` is a function that replaces characters in the value. We can run several `replace` operations by "chaining" them together.

In this expression we are replacing the `$` symbols, the commas separating thousands, and the closing brackets with nothing; we are replacing the opening brackets with a hyphen to designate negative numbers.

Click `OK` and the new column will be created. Note that it is still being treated as text, but that can be corrected by selecting `Edit cells>common transforms>To number`.

This is just one example of many data transformation functions that can be accessed using Open Refine's expression language, called GREL. Learning these functions can make Open Refine into a very powerful data processing tool. Study the "Further reading" links for more.

Open Refine's facets can also be used to inspect columns containing numbers. Select `Facet>Numeric facet` for the new field. This will create a histogram showing the distribution of numbers in the field:

![](./img/cleaning_data_16.jpg)

We can then use the slider controls to filter the data, which is good for examining possible outliers at the top of bottom of the range. Notice that here a small number of grants have negative values, while there is one grant with a value of more than $3 billion from the National Science Foundation. This might need to be checked out to ensure that it is not an error.

While most of the data processing we have explored could also be done in a spreadsheet, the big advantage of Open Refine is that we can extract a "pipeline" for processing data to use when we obtain data in the same format in future.

Select `Undo / Redo` at top left. Notice that clicking on one of the steps detailed at left will transform the data back to that stage in our processing. This means you don't need to worry about making mistakes, as it's always possible to revert to an earlier state, before the error, and pick up from there.

Return to the final step, then click the `Extract` button. At the dialog box, check only those operations that you will want to perform in future (typically generic transformations on fields/columns, and not correcting errors for individual entries). Here I have unchecked all of the corrections in the text facets, and selected just those operations that I know I will want to repeat if I obtain data from this source again:

![](./img/cleaning_data_17.jpg)

This will generate JSON in the right hand panel that can be copied into a blank text file and saved.

To process similar data in future. Click the `Apply` button on the `Undo / Redo` tab, paste in the text from this file, and click `Perform Operations`. The data will then be processed automatically.

When you are finished cleaning and processing your data, click the `Export` button at top right to export as a CSV file or in other formats.

Open Refine is a very powerful tool that will reward efforts to explore its wide range of its functions for manipulating data, and to learn its expression language. See the Further Reading for more.

### Geocode addresses with Open Refine

To illustrate its potential, we will use Open Refine to produce latitude and longitude co-ordinates from a list of addresses -- a process known as "geocoding" that is often required before data can be put onto a map.

There are several geocoding APIs, which can be accessed in various ways. The number of requests allowed per day and the terms of use vary from service to service: [Google's](https://developers.google.com/maps/documentation/geocoding/) free service, for instance, allows each user to geocode 2,500 addresses per day, and specifies that the resulting coordinates may only be used to make a Google Map.

Because of this restriction, we will instead use the services offered by Microsoft's [Bing Maps](http://msdn.microsoft.com/en-us/library/ff701714.aspx), and [MapQuest](http://developer.mapquest.com/web/products/open/geocoding-service) (which is based on OpenStreetMap's [Nominatim](http://nominatim.openstreetmap.org/) service), to geocode [this sample of addresses](./data/geocoding.zip) in San Francisco.

These geocoding APIs can both be accessed from Open Refine. Here is how to geocode addresses from Open Refine using the Bing API:

You will need a Bing Maps API key. To obtain that, follow the steps [here](http://www.gpsvisualizer.com/geocoder/key.html#bing). If you don't already have a Microsoft Account, you will first need to [create one](https://signup.live.com/signup.aspx?sf=1&id=38936&ru=https://account.live.com/%3fwa%3dwsignin1.0&tw=0&fs=0&kv=0&cb=&cbcxt=&wp=SAPI&wa=wsignin1.0&wreply=https://account.live.com/%3fwa%3dwsignin1.0&bk=1413566923&uiflavor=web&uaid=3affa9094c4e4ca5aa721863467ee2f0&mkt=EN-US&lc=1033&lic=1).

Create a new Open Refine project by importing a text file containing complete addresses in one column, with the heading `address`. Our test data is already in this format; use `sf_test_addresses_short.txt` for this exercise.

From the `address` column, select `Edit column>Add column by fetching URLs...`, call the column `bing_json` and use the following expression:

```Javascript
"http://dev.virtualearth.net/REST/v1/Locations?q=" + escape(value, "url") + "&key=BingMapsKey"
```

Note that you will have to enter your own Bing API key in place of `BingMapsKey`. Also, set the `Throttle delay` to 500 milliseconds for faster processing. This expression constructs a URL that will query the Bing geocoding API and return data for the address in question in JSON format.

From the `bing_json` column, select `Edit column>Add column based on this column...`, call the column `bing_lat_lon` and use this expression to extract the latitude and longitude from the JSON returned by the API:

```Javascript
with(value.parseJson().resourceSets[0].resources[0].point.coordinates, pair, pair[0] +", " + pair[1])
```

Split the `bing_lat_lon` column into to two columns by selecting `Edit column>Split into several columns`, then rename these columns `bing_latitude` and `bing_longitude`.

From the `bing_json` column, select `Edit column>Add column based on this column...`, call the column `bing_confidence` and use this expression to extract the Bing API's confidence in the accuracy of its geocoding:

```Javascript
with(value.parseJson().resourceSets[0].resources[0].confidence, v, v)
```

From the `bing_json` column, select `Edit column>Add column based on this column...`, call the column `bing_type` and use this expression to extract the type of place that the Bing API has geocoded:

```Javascript
with(value.parseJson().resourceSets[0].resources[0].entityType, v, v)
```
For a full address, this should return `Address` when the geocoding has been successful.

Finally, delete the `bing_json` column by selecting `Edit column>Remove column`.

It is now possible to extract JSON code that will allow you repeat these steps on any data in the same format.

[Here](https://github.com/paldhous/refine-geocoder) I have created an Open Refine geocoder that uses both the Bing and Mapquest Open APIs, with instructions on how to use it. The `geocoding` folder contains the JSON from my Open Refine geocoder. To use it you will also need a Mapquest API key, which you can obtain from [here](https://developer.mapquest.com/).


### Standardize names with Mr People

For processing names from a string of text into a standardized format with multiple fields, you may wish to experiment with **[Mr People](http://people.ericson.net/)**, a web app made by Matt Ericson, a member of the graphics team at *The New York Times*.

![](./img/cleaning_data_18.jpg)

(Source: [Mr People](http://people.ericson.net/))

It takes a simple list of names and turns them into separate fields for title, first name, last name, middle name and suffix.

Mr People can save you time, but it is not infallible -- for instance, it may give errors where people have multiple titles or suffixes, such as “MD, PhD.” So always check the results before moving on to further analysis.

See how it performs with the `Physician Name` column from the file `ny_dr_discip_actions.xls`. You'll notice that some entires fail to parse, and others would need some further manual editing!

### Convert from one data format to another

**[Mr Data Converter](http://shancarter.github.io/mr-data-converter/)** is a web app made by Shan Carter, formerly of the graphics team at *The New York Times*, now with Google, that makes it easy to convert data from a spreadsheet or delimited text file to JSON or XML.

Copy the data from a `CSV` or tab-delimited text file and paste it into the top box, select the output you want, and it will appear at the bottom. You will generally want to select the `Properties` variants of JSON or XML.

You can then copy and paste this output into a text editor, and save the file with the appropriate suffix (`xml`, `json`).

![](./img/cleaning_data_19.jpg)

(Source: [Mr Data Converter](http://shancarter.github.io/mr-data-converter/))

To convert data from JSON or XML into text files, use Open Refine. First create a new project and import your JSON or XML file. Then use the `Export` button and select `Tab-separated value` or `Comma-separated value` to export as a text file.

### Further reading/resources


[Open Refine Wiki](https://github.com/OpenRefine/OpenRefine/wiki)

[Open Refine Documentation](https://github.com/OpenRefine/OpenRefine/wiki/Documentation-For-Users)

[Open Refine Recipes](https://github.com/OpenRefine/OpenRefine/wiki/Recipes)

