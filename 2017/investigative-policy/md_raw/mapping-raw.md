# Making maps with Carto


#### The data we will use

Download from [here](data/mapping.zip), unzip the folder and place on your desktop. It contains the following:

`mapping` Folder containing:
- `oregon_dams_csv` Data on dams in Oregon, from the state's [dams inventory](http://apps.wrd.state.or.us/apps/misc/dam_inventory/).
- `oregon_seismic_risk` Data om seismic risk for the state, [calculated by](http://earthquake.usgs.gov/hazards/products/conterminous/) the U.S. Geological Survey.

#### Getting started with CartoDB, and uploading data

[**CartoDB**](http://qgis.org/en/site/) is a cloud-based mapping application that makes it easy to produce interactive, online maps. These maps can include [animations of data over time](http://docs.cartodb.com/tutorials/introduction_torque.html). It is also a geospatial database, allowing you to process geodata using Structured Query Language.

Login to a new CartoDB account, and you should see a screen like this:

![](./img/cartodb_1.jpg)

Open the drop-down menu under `Maps` at top left and switch to `Your datasets`. The click the green `NEW DATASET` button at top right:

![](./img/cartodb_2.jpg)

You should now see the following screen:

![](./img/cartodb_3.jpg)

With the `Data file` tab selected, click the `Browse` button, navigate to the zipped `oregon_seismic_risk.zip` shapefile and click `Open`. Then click the green `Connect dataset` button.

CartoDB can import geodata in a variety of formats, including CSV, [KML](https://developers.google.com/kml/?hl=en), [GeoJSON](http://geojson.org/) and zipped [shapefiles](https://en.wikipedia.org/wiki/Shapefile). See [here](http://docs.cartodb.com/cartodb-editor.html) for more on imports and supported data formats.

Once the data has imported, you will see the uploaded data table in `DATA VIEW`:

![](./img/cartodb_4.jpg)

Notice that, in addition to the fields from the original data, each row has been given a `cartodb_id`, which is a unique identifier for each. The table also has a field called `the_geom` which has the tag `GEO`. This field is central to how CartoDB works, defining the geometry of any map you make. These geometries can be points, lines or polygons (areas) -- which is what we have here.

You can rename fields, sort the table by the data in them, or change their data type (for example from numbers to strings of text), by clicking the downward-pointing triangle next to the header of each.

The important column in this data is `acc_val`, which represents the peak ground accelaration expected over 50 years, with a two-percent probability. The numbers are expressed as a percentage of *g*, the acceleration due to gravity.

Switch to `MAP VIEW` to see the basic, unstyled map:

![](./img/cartodb_5.jpg)

Click the small return arrow at top left to go back to the overview of your datasets.

Notice that the top menu has a link to `DOCUMENTATION`, which has links to CartoDB's technical manuals. The `Data library` link contains useful datasets that you can import into your own account. Take a few minutes to explore what's there, before returning to your `Datasets`.

Now click the `NEW DATASET` button again and import the file `oregon_dams.csv`, which should look like this in the `DATA VIEW`:

![](./img/cartodb_6.jpg)

Notice that `the_geom` for points is given by their longitude and latitude co-ordinates.

Notice that there is a column called `hazard`, with valaues of `H` for high, `S` for significant, and `L` for low. `H` means a dam could cause loss of human life if it failed; `S` means failure could cause significant economic or environmental damage. However, these ratings do not mean that a dam is *likely* to fail.

Click on the `MAP VIEW` to see the locations of all of the dams:

![](./img/cartodb_7.jpg)


#### Run a SQL query to select potentially hazardous dams in high seismic risk zones

We will now run the following query, to filter the dams to return those with a hazard rating of `H` or `S` only in the zones of highest seismic risk, where `acc_val` is `40` or more:

```SQL
SELECT oregon_dams.*
FROM oregon_dams, oregon_seismic_risk
WHERE ST_WITHIN(oregon_dams.the_geom, oregon_seismic_risk.the_geom) AND oregon_seismic_risk.acc_val >= 40 AND (oregon_dams.hazard = 'H' OR oregon_dams.hazard='S')
```

CartoDB is based on a [PostgreSQL](http://www.postgresql.org/) database. It works similarly to SQLite, although the syntax for some queries is a little different. [Here](http://www.postgresqltutorial.com/) is a PostgreSQL tutorial, if you would like to learn more.

Importantly, CartoDB allows you you run spatial/grographic queries using an extension to PostgreSQL called [PostGIS](http://postgis.net/). PostGIS functions can, for instance, calculate distances or areas, and all begin with the prefix `ST_`. See [here](http://postgis.net/docs/manual-2.2/PostGIS_Special_Functions_Index.html) for a full list of PostGIS special functions.

The query above uses `ST_Within` (see [here](http://postgis.net/docs/manual-2.2/ST_Within.html)) to select everything from the `oregon_dams` dataset where the geometry for those points falls within the geometry of the `oregon_seismic_risk` zones, if `acc_val` is 40 or more. When running a query like this, referencing `the_geom` from two datasets/tables, both tables must appear in the `FROM` clause, separated by a comma.

Click `Apply query` and you will be prompted to `create dataset from query`. Click on this link, and rename the new dataset as `oregon_dams_hazard` by clicking on its name at top left.

Select the `MAP VIEW` to see the filtered dataset on a map:

![](./img/cartodb_8.jpg)


#### Create a map combining two datasets

Exit this map and reopen the `oregon_seismic_risk` dataset. Then click the `VISUALIZE` button at top right.

You will then see a prompt to create a new map. Click the green `OK, CREATE MAP` button. Rename this map `oregon_seismic_dams` by clicking on its name at top left.

Now add `oregon_dams_hazard` to the map, by clicking on the blue `+` button to the right. At the dialog box, select the `oregon_dams` dataset and click the `ADD LAYER` button.

Now select `MAP VIEW` to see both layers on the same map:

![](./img/cartodb_9.jpg)

#### Select a basemap

Close the panel at bottom left suggesting interesting maps.

Now choose a basemap for your visualization, by clicking `Select basemap` at bottom left. Take a few minutes to explore the built-in basemap options.

#### Style the maps using the CartoDB wizard

Notice that the toolbar at right has tabs numbered `1` and `2`. It you hover over them, you will see that they correspond to the `oregon_seismic_risk` and `oregon_dams_hazard` layers respectively.

Click on `1` to expose the `Map layer wizard` for the `oregon_seismic_risk` layer, which can also be reached by clicking the paintbrush icon:

![](./img/cartodb_10.jpg)

(You can collapse the wizards at any time by clicking to the left of any of the icons.)

Notice that opening the wizard has also exposed blue toggle controls for each layer, which can be used to turn the visibility for each on and off. Hide the `oregon_dams_hazard` layer so we can see what we are doing.

Scroll from left to right through the visualization options, and select `CHOROPLETH` to make a map where larger values for seismic risk correspond to more intense colors

Set `acc_val` as the data `Column`, select `5 Buckets`, and set them by `Quantile`. The map should now look like this:

![](./img/cartodb_11.jpg)

Now click `2` to switch to the `oregon_dams_hazard` layer, and turn on its visibility.

In the `Map layer wizard`, select `CATEGORY` and color the circles by their hazard level, by selecting `hazard` as the data `Column`. The map should now look like this:

![](./img/cartodb_12.jpg)

Go back into the `Map layer` wizard and manually edit the colors, by clicking on the colored boxes, selecting new colors so that high risk dams are emphasized with a more intense color:

![](./img/cartodb_13.jpg)


#### Edit the legend

The meaning of legend will not immediately be obvious to someone who does not know what the numbers mean, and what `H` and `S` refer to.

For the `oregon_dams_hard` layer, click on the legend icon:

![](./img/cartodb_14.jpg)

Change the `Title` from `empty` to `Dam hazard`:

![](./img/cartodb_15.jpg)

Now click on the `</>` link to the HTML for the legend, and edit to the following, and click `Apply`:

```CSS
<div class='cartodb-legend category'>	
<div class="legend-title">Dam hazard</div>
<ul>
	<li>
		<div class="bullet" style="background: #0F3B82"></div> High
	</li>
	<li>
		<div class="bullet" style="background: #5CA2D1"></div> Significant
	</li>
</ul>
</div>
```
Edit the legend for the `oregon_seismic_risk` layer, adding `Seismic risk` for title, and replacing the numbers for `Left label` and `Right label` with `Low` and `High`.  Click `Apply` and the map should look like this:

![](./img/cartodb_16.jpg)


#### Configure tooltips

Select the `oregon_dams_hazard` layer, and click the infowindow icon:

![](./img/cartodb_17.jpg)

In the `Hover` tab, select the `dam_name` toggle control, and uncheck `title`. Now the dam's name should appear when you hover over each point.


#### Configure the map options, and publish

We are almost ready to publish the map, but before doing so, click `Options` at the bottom left of the map to select the controls and other items you want to include. Here  the `Search box`, which geocodes locations entered by the user and zooms to them, is disabled; the option to switch to a `Fullscreen` view of the map is enabled:

![](./img/cartodb_18.jpg)

Also explore the `Add Element` button at top left, which allows you to add a title and other annotations to your map.

Having finished working on the visualization, click the `PUBLISH` button at top right. This will call up the following options:

![](./img/cartodb_19.jpg)

Copy the code from `Embed it` to obtain an [iframe](http://www.w3schools.com/tags/tag_iframe.asp) which will allow you to embed the map on any web page, in the following format:

```CSS
<iframe width="100%" height="520" frameborder="0" src="https://ucbdataviz.cartodb.com/viz/4330edb0-0f24-11e6-b1df-0e5db1731f59/embed_map" allowfullscreen webkitallowfullscreen mozallowfullscreen oallowfullscreen msallowfullscreen></iframe>
```
(Note that you can edit the dimensions of the iframe -- here set at `100%` of the width of the div in which it appears -- and `520` pixels high) as required.)

#### Further reading/resources

[CartoDB tutorials](http://docs.cartodb.com/tutorials.html)
