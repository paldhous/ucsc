# From R to interactive charts and maps

It is possible to make online, interactive charts and maps directly from R/RStudio, thanks to a group of R packages collectively known as [**htmlwidgets**](http://www.htmlwidgets.org/).

These packages take instructions in R code, and write the JavaScript and HTML necessary to make charts using popular JavaScript visualization libraries. They also allow you to easily export the charts that you create in R as responsively designed web pages, which can be embedded in other projects through simple [**iframes**](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/iframe).

This means you can work in a single environment to both process data and make online charts. Maintaining a simple, streamlined workflow makes it easier to produce graphics quickly on news deadlines.

### The data we will use

Download the data for this session from [here](data/interactives-r.zip), unzip the folder and place it on your desktop. It contains the following files:

- `disease_democ.csv` Data illustrating a controversial theory suggesting that the emergence of democratic political systems has depended largely on nations having low rates of infectious disease, as used previously.
- `kindergarten.csv` Data from the [California Department of Public Health](https://data.chhs.ca.gov/dataset/school-immunizations-in-kindergarten-by-academic-year), documenting enrollment and the number of children with complete immunizations at entry into kindergartens in California from 2001 to 2015, as used previously.
- `nations.csv` Data from the World Bank Indicators portal, as used previously.
- `food_stamps.csv` [US Department of Agriculture data](http://www.fns.usda.gov/pd/supplemental-nutrition-assistance-program-snap) on the number of participants, in millions, in the federal Supplemental Nutrition Assistance Program from 1969 to 2016, as used previously.
- `seismic.zip` Zipped shapefile (see below) with data on the annual risk of a damaging earthquake for the continental United States, from the [US Geological Survey](https://earthquake.usgs.gov/hazards/induced/).
- `test.html` Web page to embed the interactive charts and maps we make today.

#### A note on shapefiles

Shapefiles are a common format for geographical data, which actually consist of a series of files. At a minimum, a shapefile must contain three component files, with the same root name and the following extensions:

- `.shp` The main file containing the geometry of the points, lines or polygons mapped in the shapefile.
- `.dbf` A database file in dBASE format containing a table of data relating to the components of the geometry. For example, in a world shapefile giving national boundaries, this table might contain data about the countries including their names, capital cities, population, annual GDP, and so on.
- `.shx` A positional index of the shapefile’s geometry.

There are several optional file types that may also be included, including a `.prj` file, which defines the map projection to be used when loading the shapefile into mapping software.


### Setting up

Launch RStudio, create a new RScript, and set the working directory to the downloaded data folder. Save the script as `interactives.R`.

First we will install the package **htmlwidgets**, which makes it possible to save the charts and maps we make as web pages. Then we will a package called **[devtools](https://cran.r-project.org/web/packages/devtools/devtools.pdf)**, which we will in turn use to install the latest development version of **ggplot2**, which is recommended if you want to turn your static **ggplot2** charts into interactive Plotly charts.

```R
# install and load htmlwidgets
install.packages("htmlwidgets")
library(htmlwidgets)

# install devtools
install.packages("devtools"
library(devtools))

# install development version of ggplot2
install_github("hadley/ggplot2")
```

### Make ggplot2 charts into interactive Plotly charts

**[plotly](https://plot.ly/r/getting-started/)** is an R package for creating interactive web-based charts using the [plotly.js](https://plot.ly/javascript/) JavaScript library, which  powers the Plotly web app that we worked with earlier. It includes a function `ggplotly` that converts charts made with **ggplot2** directly into Plotly charts.

#### Make an interactive version of the food stamps dot-and-line chart

The following code installs and loads the package (which also automatically loads ggplot2), loads **readr** and **dplyr**, then loads the food stamps data we used previously.

```R
# install and load plotly
install.packages("plotly")
library(plotly)

# load readr, dplyr
library(readr)
library(dplyr)

# load data
food_stamps <- read_csv("food_stamps.csv")
```
Now we will remake the dot-and-line chart from the last class, and turn it into a Plotly chart.

```R
# dot-and-line chart
food_stamps_chart <- ggplot(food_stamps, aes(x = year, y = food_stamps)) + 
  xlab("") +
  ylab("Participants (millions)") +
  xlab("") +
  theme_minimal(base_size = 14) +
  geom_point() +
  geom_line()

print(food_stamps_chart)
```

This saves a **ggplot2** chart in your environment, as we've seen before. The following code turns this into a Plotly chart, which should appear in the `Viewer` tab at bottom right:

```R
food_stamps_interactive <- ggplotly(food_stamps_chart)
```

<iframe width="100%" height="450" frameborder="0" scrolling="no" src="food_stamps_dot_line1.html"></iframe>

Just like when we made Plotly charts in the web app, the default interactive chart has some controls that appear at top right when you hover over the chart. The default tooltip also contains the abbreviated variable names from the data.

But it is fairly easy to fix these problems. This code removes the controls:

```R
# remove Plotly controls
food_stamps_interactive <- ggplotly(food_stamps_chart) %>% 
  config(displayModeBar = FALSE)

print(food_stamps_interactive)
```

And this code reformats the tooltips, by editing the tooltip text in the plotly object in your environment:

```R
# edit the tooltips
food_stamps_interactive$x$data[[1]]$text <- paste0("Year: ", food_stamps$year, "<br>",
                                                  "Participants (millions): ",food_stamps$food_stamps)

print(food_stamps_interactive)
```

In class, we will explore why this works by examining the structure of the plotly object using `str(food_stamps_interactive)`

The above uses R's `paste0` function to concatenate text; `<br>` is HTML code for a new line.

We can now save the chart as a standalone web page by selecting `Export>Save as Web Page...` from the `Viewer` tab menu.

Running this code would achieve the same result:

```R
# save chart as a web page
saveWidget(food_stamps_interactive, "food_stamps_interactive.html", selfcontained = TRUE, libdir = NULL, background = "white")
```

Open the saved web page in your browser and notice that the chart is completely responsive: It will adjust its size to fit the space available.

So now we can embed the chart in the file `test.html`, just like we did for the chart exported from the Plotly web up in a previous class:

Open the `test.html` file in Sublime Text. Insert the code into the page and edit as follows:

```JavaScript
<div class="container">

    <iframe width="100%" height="450" frameborder="0" scrolling="no" src="food_stamps_interactive.html"></iframe>

  </div> <!-- /.container -->
```

This should be the result:

<iframe width="100%" height="450" frameborder="0" scrolling="no" src="food_stamps_dot_line2.html"></iframe>

#### Make an interactive version of the disease and democracy scatterplot

This code creates the basic scatterplot with a linear trend line, without mappping `income_group` to the color of the points:

```R
# load data
disease_democ <- read_csv("disease_democ.csv")

# make static chart
disease_democ_chart <- ggplot(disease_democ, aes(x = infect_rate, y = democ_score)) +
  xlab("Infectious disease prevalence score") + 
  ylab("Democratization score") +
  theme_minimal(base_size = 14) +
  geom_point() +
  geom_smooth(method = lm, se = FALSE)

# make interactive version
disease_democ_interactive <- ggplotly(disease_democ_chart) %>%
  config(displayModeBar = FALSE)

# edit the tooltips
disease_democ_interactive$x$data[[1]]$text <- paste0("Country:", disease_democ$country, "<br>",
                                                     "Disease prevalence score: ", disease_democ$infect_rate, "<br>",
                                                     "Democratization score: ", disease_democ$democ_score)


disease_democ_interactive$x$data[[2]]$text <- paste0("Disease prevalence score:", disease_democ$infect_rate, "<br>",
                                                    "Democratization score: ", disease_democ$democ_score)

# plot the chart
print(disease_democ_interactive)
```
This should be the result:

<iframe width="100%" height="450" frameborder="0" scrolling="no" src="disease_democ1.html"></iframe>

Notice here that we edited the tooltips for both the `geom_point` and `geom_smooth` layers. For the points layer, we have added the `country` data to the tooltip, which would not otherwise appear.

The following code creates the final version of this chart from the previous class, with customization including a qualitative ColorBrewer palette for the points, to color them by the World Bank income group.

For charts that use color to represent a categorical variable, editing the tooltips by the method above becomes more difficult. But there is another approach:

```R
# make static chart
disease_democ_chart <- ggplot(disease_democ, aes(x=infect_rate,
                                                 y=democ_score,
                                                 text=paste0(country,"<br>",
                                                             "Disease: ",infect_rate,"<br>",
                                                             "Democratization: ",democ_score),
                                                 group = 1)) +
  xlab("Infectious disease prevalence score") + 
  ylab("Democratization score") +
  theme_minimal(base_size = 14) +
  geom_smooth(method = lm, se = FALSE, color = "black", linetype = "dotdash", size = 0.3) +
  geom_point(aes(color=income_group), size = 3, alpha = 0.5) +
  scale_x_continuous(limits=c(0,60)) +
  scale_y_continuous(limits=c(0,100)) +
  scale_color_brewer(palette = "Set1",
                     name="Income group",
                     breaks=c("High income: OECD","High income: non-OECD","Upper middle income","Lower middle income","Low income"))

# make interactive version
disease_democ_interactive <- ggplotly(disease_democ_chart, tooltip="text") %>% 
  config(displayModeBar = FALSE)
  
# plot the chart
print(disease_democ_interactive)
```
This should be the result:

<iframe width="100%" height="450" frameborder="0" scrolling="no" src="disease_democ2.html"></iframe>

In the code above, we used an `aes` mapping of `text`, feeding the values to appear in the tooltip into a text string by concatenating them using `paste0`. After doing this, we also added `group = 1` to the `aes` mapping. This ensures there are no problems if one of the variables doesn't appear in any layer: Here, for example, `country` is missing form the `geom_smooth` layer.

Having set up the text for the tooltip, it can then be added in the `ggplotly` function using `tooltip = text`.

### Practice making other interactive charts

In class, as time allows, you'll try to create interactive versions of other charts from the previous class.

### Make a map of seismic risk and earthquakes using Leaflet

[Leaflet](http://leafletjs.com/) is the most widely-used JavaScript library for making interactive online maps. It can be used from R with the [**leaflet**](http://rstudio.github.io/leaflet/) package, another part of the **htmlwidgets** framework. So we need to install and load that, together with a package called **[rgdal](https://cran.r-project.org/web/packages/rgdal/rgdal.pdf)**, which makes it possible to load shapefiles and other geodata into R.

```R
# install and load leaflet and rdgal
install.packages("leaflet")
install.packages("rgdal")
library(leaflet)
library(rgdal)
```

We are going to recreate a version of [this map](http://paldhous.github.io/earthquakes/), which I originally coded using Leaflet from scratch from similar data.

First let's see how to make a basic Leaflet map, centered on Santa Cruz:

```R
# make leaflet map centered on Santa Cruz
leaflet() %>% 
  setView(lng = -122.0825853, lat = 36.9758862, zoom = 11) %>%
  addTiles()
```
This map should appear in the `Viewer`:

<iframe width="100%" height="450" frameborder="0" scrolling="no" src="santa_cruz1.html"></iframe>


The `leaflet` function creates a leaflet map.

The `setView` function sets the starting position of the map, centering it on the defined coordinates and with the defined zoom level; `addTiles` adds [OpenStreetMap](https://www.openstreetmap.org/) tiles to the map, which would otherwise be blank. Notice that the map is interactive, and can be panned and zoomed just like a Google Map.

We aren't limited to using OpenStreetMap tiles:

```R
# make leaflet map centered on Santa Cruz with Carto tiles
leaflet() %>%
  setView(lng = -122.0825853, lat = 36.9758862, zoom = 11) %>%
  addProviderTiles("CartoDB.Positron")
```

The map should now look like this:

<iframe width="100%" height="450" frameborder="0" scrolling="no" src="santa_cruz2.html"></iframe>

The `addProviderTiles` function uses the [Leaflet Providers](https://github.com/leaflet-extras/leaflet-providers) plugin to add various tiles to a map. You can see the available options [here](http://leaflet-extras.github.io/leaflet-providers/preview/).

Now load the data we need to make the earthquakes map, starting with the `seismic` shapefile, using the `readOGR` function from **rgdal**.

```R
# load seismic risk shapefile
seismic <- readOGR("seismic", "seismic")
```
The two mentions of `seismic` refer to the folder and the shapefile within it, respectively.

You should now have in your environment an object called `seismic` which is a `SpatialPolygonsDataFrame`.

We can also load data on earthquakes, directly from the US Geological Survey earthquakes API, described in the notes for the class on finding and downloading data:

```R
# load quakes data from USGS earthquakes API
quakes <- read_csv("https://earthquake.usgs.gov/fdsnws/event/1/query?starttime=1960-01-01T00:00:00&minmagnitude=6&format=csv&latitude=39.828175&longitude=-98.5795&maxradiuskm=6000&orderby=magnitude")
```

Using this url, we have loaded earthquakes since the start of 1960 that had a magnitude of 6 and above, within a 6,000 kilometer radius of the geographic center of the continental United States.

Let's look at a summary of the `seismic` data:

```R
# view summary of seismic_risk data
summary(seismic)
```

This should be returned in the R Console:

```R
Object of class SpatialPolygonsDataFrame
Coordinates:
      min       max
x -124.71 -66.98701
y   24.60  49.36968
Is projected: FALSE 
proj4string :
[+proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0]
Data attributes:
   ValueRange
 < 1    : 3  
 1 - 2  :12  
 10 - 12: 2  
 2 - 5  : 8  
 5 - 10 : 4  
```
The data defining the annual risk of a damaging earthquake is in the variable `ValueRange`. But the categories of this binned variable are not in the right order. To correct that, we should convert the variable from text to a `factor`, or categorical variable, and then change the order, using an R package called **[forcats](https://cran.r-project.org/web/packages/forcats/forcats.pdf)**, which is part of the **tidyverse**.

```R
# load required package
library(forcats)

# convert to factor/categorical variable
seismic$ValueRange <- as.factor(seismic$ValueRange)

# reorder the levels of the factor
seismic$ValueRange <- fct_relevel(seismic$ValueRange, c("< 1","1 - 2","2 - 5","5 - 10", "10 - 12"))

# view summary of seismic_risk data
summary(seismic)
```

Now the categories should be in the correct order:

```R
Object of class SpatialPolygonsDataFrame
Coordinates:
      min       max
x -124.71 -66.98701
y   24.60  49.36968
Is projected: FALSE 
proj4string :
[+proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0]
Data attributes:
   ValueRange
 < 1    : 3  
 1 - 2  :12  
 2 - 5  : 8  
 5 - 10 : 4  
 10 - 12: 2 
```

Next we will load the seismic risk data into a leaflet map:

```R
# load the seismic risk data into a leaflet map
seismic_map <- leaflet(data=seismic)
```
You should now see an object of type `leaflet` in your environment.

Now we can make a map with two layers just a few lines of code:

```R
# set color palette
pal <- colorFactor("Reds", seismic$ValueRange)

# plot map
seismic_map %>%
  setView(lng = -98.5795, lat = 39.828175, zoom = 4) %>%
  addProviderTiles("CartoDB.Positron") %>% 
  addPolygons(
    stroke = FALSE,
    fillOpacity = 0.7,
    smoothFactor = 0.1,
    color = ~pal(ValueRange)
  ) %>%
  # add historical earthquakes
  addCircles(
    data = quakes, 
    radius = sqrt(10^quakes$mag)*30, 
    color = "#000000",
    weight = 0.2,
    fillColor ="#ffffff",
    fillOpacity = 0.5,
    popup = paste0("<strong>Magnitude: </strong>", quakes$mag, "</br>",
                   "<strong>Date: </strong>", format(as.Date(quakes$time), "%b %d, %Y"))
  ) %>%
  # add legend
  addLegend(
    "bottomright", pal = pal, values = ~ValueRange,
    title = "annual % risk of damaging quake",
    opacity = 0.7,
    labels = labels
  )
```

This should be the result:

<iframe width="100%" height="450" frameborder="0" scrolling="no" src="earthquakes.html"></iframe>

The function `colorFactor` assigns a named ColorBrewer palette to a categorical variable.

The function `addPolygons` adds polygons to the map: `stroke = FALSE` gives them no outline; `fillOpacity = 0.7` makes them slightly transparent; `color = ~pal(ValueRange))` uses the palette to color the polygons according to values in the `ValueRange` data.

(To see how to set up a color palette for a continuous variable, see [this class](https://paldhous.github.io/ucb/2016/dataviz/week13.html).)

`smoothFactor` controls the extent to which the polygons are simplified. See what happens to the map if you replace `0.1` with `10`. Simplified polygons will load more quickly, but there's a trade-off with the appearance of the map. Choose an appropriate value for your maps through trial and error.

`addCircles` adds circles to the map, using the `quakes` data; `color` sets the color for their outlines, while `weight` sets the thickness of these lines; `fillColor` and `fillOpacity` style the circles' interiors.

The size of the circles is set by `radius = sqrt(quakes$mag^10)*30`. Here `30` is simply a scaling factor for all of the circles, set by trial and error to give a reasonable appearance on the map. The size of the circles is set from the variable `mag` in the quakes data, which is their magnitude. We have raised 10 to the power of these magnitude values: This is a quirk of working with earthquake magnitudes, which are on a logarithmic scale, so that a magnitude difference of 1 corresponds to a 10-fold difference in earth movement, as recorded on a seismogram.

When scaling circles to make a Leaflet map, use the values from the data, but always take their square roots, using the `sqrt` function. This is important, to ensure that the circles are scaled correctly, by area, rather than by radius. The code sets the diameter (or twice the radius) of the circles, so the `sqrt` is necessary to correct for the squaring of these values in the equation for the area of a circle: `Area = π * r^2`.

`popup` is used to define the HTML code the appears in the popup that appears when any quake is clicked or tapped. The code above uses `paste0` to concatenate a series of elements, separated by commas, that will write the HTML. They include the `mag` and `time` values from the quakes data, the latter being formatted as an easy-to-read date using R's `format` function for dates. See [here](https://www.statmethods.net/input/dates.html) for more on formatting dates in R.

I hope these examples illustrate the potential of **htmlwidgets**. There are many more which we have not covered. Understanding how the code for each will take some time. But if you follow the documentation, the results can be impressive.

### Further reading/resources

[htmlwidgets Showcase](http://www.htmlwidgets.org/showcase_leaflet.html)
Links to documentation and code examples for the leading htmlwidgets.

[htmlwidgets Gallery](http://gallery.htmlwidgets.org/)
A more extensive collection of htmlwidgets



