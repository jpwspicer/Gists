## Julia Cartopy Examples
Last Update: 04.20.2019 (update to Julia 1.0)<br>

##### Contents

<ul>
<li><a href="#installation">Installation</a></li>
<li><a href="#globalMap">Global Map with Points & Lines</a></li>
<li><a href="#imageOverlay">Image Overlay</a></li>
<li><a href="#wmtsEarthAtNight">WMTS (Earth at Night)</a></li>
<li><a href="#featureCreation">Feature Creation</a></li>
<li><a href="#mapTileAcquisition">Map Tile Acquisition</a></li>
<li><a href="#features">Features</a></li>
</ul>

### Cartopy
#### Installation<a name="installation"></a>

1. In computer's command line (Terminal on Mac, Command Prompt on Windows): `conda install -c scitools cartopy`
1. In the Julia command line: `using Conda;	Conda.add("Cartopy")`

 
--

#### Python → Julia PyPlot Translation<a name="translation"></a>

When using Python modules (of which Cartopy is an example) in Julia rather than in Python, the syntax generally changes as follows:

* Python & Julia 1.0: `ax.stock_img()`
* Julia ≤0.7: `ax[:stock_img]()`


#### Cartopy Examples

##### Global Map with Points & Lines<a name="globalMap"></a>

```julia
using PyPlot, PyCall
ccrs = pyimport("cartopy.crs")

ax = subplot(projection=ccrs.Robinson())

# make the map global rather than have it zoom in to the extents of any plotted data
ax.set_global()

ax.stock_img()
ax.coastlines()

scatter(-0.08, 51.53, transform=ccrs.PlateCarree(), zorder=4, s=40, linewidth=1.5, edgecolor="k", color="yellow")
scatter(132, 43.17, transform=ccrs.PlateCarree(), zorder=4, s=80, linewidth=2, edgecolor="b", color="c")
scatter(-58.3817, -34.6033, transform=ccrs.PlateCarree(), zorder=4, s=60, linewidth=2, edgecolor="g", color="orange")

plot([-0.08, 132], [51.53, 43.17], transform=ccrs.PlateCarree(), linewidth=3, "r")
plot([-58.3817, 132], [-34.6033, 43.17], transform=ccrs.Geodetic(), linewidth=3, "m")

title("Global Map with Points & Lines")
```

![Global Map](https://raw.githubusercontent.com/jpwspicer/Gists/master/cartopy/01globalMap.png "Global Map")

--

##### Image Overlay<a name="imageOverlay"></a>

```julia
using PyPlot, PyCall
cartopy = pyimport("cartopy")

fig = figure(figsize=(8, 12))

fname = joinpath(cartopy.config["repo_data_dir"], "raster", "sample", "Miriam.A2012270.2050.2km.jpg")
img_extent = (-120.67660000000001, -106.32104523100001, 13.2301484511245, 30.766899999999502)
img = imread(fname)

ax = subplot(projection=ccrs.PlateCarree())
title("Hurricane Miriam from the Aqua/MODIS satellite\n2012 09/26/2012 20:50 UTC")

# set a margin around the data
xlim(img_extent[1]-1, img_extent[2]+1)

# add the image. Because this image was a tif, the "origin" of the image is in the
# upper left corner
imshow(img, origin="upper", extent=img_extent, transform=cartopy.crs.PlateCarree())
ax.coastlines(resolution="50m", color="k", linewidth=1)

# mark a known place to help us geo-locate ourselves
plot(-117.1625, 32.715, "bo", markersize=7, transform=ccrs.Geodetic())
text(-117, 33, "San Diego", transform=ccrs.Geodetic())
```

![Image Overlay](https://raw.githubusercontent.com/jpwspicer/Gists/master/cartopy/02imageOverlayExample.png "Image Overlay")

--

##### WMTS (Earth at Night)<a name="wmtsEarthAtNight"></a>

```julia
# Interactive WMTS (Web Map Tile Service)
# This example demonstrates the interactive pan and zoom capability
# supported by an OGC web services Web Map Tile Service (WMTS) aware axes.
# The example WMTS layer is a single composite of data sampled over nine days
# in April 2012 and thirteen days in October 2012 showing the Earth at night.
# It does not vary over time.
# The imagery was collected by the Suomi National Polar-orbiting Partnership
# (Suomi NPP) weather satellite operated by the United States National Oceanic
# and Atmospheric Administration (NOAA).

using PyPlot, PyCall
ccrs = pyimport("cartopy.crs")

url = "http://map1c.vis.earthdata.nasa.gov/wmts-geo/wmts.cgi"
layer = "VIIRS_CityLights_2012"

ax = subplot(projection=ccrs.PlateCarree())
ax.add_wmts(url, layer)
ax.set_extent([-15, 25, 35, 60])

title("Europe at Night April/October 2012")
```

![Earth at Night](https://raw.githubusercontent.com/jpwspicer/Gists/master/cartopy/03wmtsEarthAtNight.png "Earth at Night")

--

##### Feature Creation<a name="featureCreation"></a>

```julia
using PyPlot, PyCall
ccrs = pyimport("cartopy.crs")
cfeature = pyimport("cartopy.feature")

ax = subplot(projection=ccrs.PlateCarree())
ax.set_extent([80, 170, -45, 30])

# Put a background image on for nice sea rendering.
ax.stock_img()

# Create a feature for States/Admin 1 regions at 1:50m from Natural Earth
states_provinces = cfeature.NaturalEarthFeature(
        category="cultural",
        name="admin_1_states_provinces_lines",
        scale="50m",
        facecolor="none"
)

ax.add_feature(cfeature.LAND)
ax.add_feature(cfeature.COASTLINE)
ax.add_feature(states_provinces, edgecolor="gray")
```

![Feature Creation](https://raw.githubusercontent.com/jpwspicer/Gists/master/cartopy/04featureCreationExample.png "Feature Creation")

--

##### Map Tile Acquisition<a name="mapTileAcquisition"></a>

```julia
# Demonstrates cartopy's ability to draw map tiles which are downloaded on
# demand from the MapQuest tile server. Internally these tiles are then combined
# into a single image and displayed in the cartopy GeoAxes.

using PyCall, PyPlot
ccrs = pyimport("cartopy.crs")
cimgt = pyimport("cartopy.io.img_tiles")

# matplotlib = pyimport("matplotlib")
# matplotlib.use("tkagg")
# plt = pyimport("matplotlib.pyplot")
# transforms = pyimport("matplotlib.transforms")

# Target longitude/latitude coordinates (Eyjafjallajökull volcano).
coords = [-19.613333, 63.62]

# Create a MapQuest open aerial instance.
map_quest_aerial = cimgt.MapQuestOpenAerial()

# Create a GeoAxes in the tile's projection and limit its extent to a small lat/lon range.
ax = subplot(projection=map_quest_aerial.crs)
ax.set_extent([-22, -15, 63, 65])

# Add the MapQuest data at zoom level 8.
ax.add_image(map_quest_aerial, 8)

# Add a marker at the target coordinates.
plot(coords[1], coords[2], marker="o", color="yellow", markersize=12, 
     alpha=0.7, transform=ccrs.Geodetic())

# Use the cartopy interface to create a matplotlib transform object
# for the Geodetic coordinate system. We will use this along with
# matplotlib's offset_copy function to define a coordinate system which
# translates the text by 25 pixels to the left.
geodetic_transform = ccrs.Geodetic()._as_mpl_transform(ax)
text_transform = matplotlib.transforms.offset_copy(geodetic_transform, units="dots", x=-25)

# Add text 25 pixels to the left of the target.
text(coords[1], coords[2], "Eyjafjallajökull",
     verticalalignment="center", horizontalalignment="right",
     transform=text_transform,
     bbox=Dict("facecolor"=>"wheat", "alpha"=>0.5, "boxstyle"=>"round"))
```

![MapTileAcquisition](https://raw.githubusercontent.com/jpwspicer/Gists/master/cartopy/05mapTileAcquisitionExample.png "MapTileAcquisition")

--

##### Features<a name="features"></a>

```julia
using PyPlot, PyCall
ccrs = pyimport("cartopy.crs")
cfeat = pyimport("cartopy.feature")

ax = subplot(projection=ccrs.PlateCarree())

ax.add_feature(cfeat.LAND)
ax.add_feature(cfeat.OCEAN)
ax.add_feature(cfeat.COASTLINE)
ax.add_feature(cfeat.BORDERS, linestyle=":")
ax.add_feature(cfeat.LAKES, alpha=0.5)
ax.add_feature(cfeat.RIVERS)

ax.set_extent([-20, 60, -40, 40])
```

![Features](https://raw.githubusercontent.com/jpwspicer/Gists/master/cartopy/06featuresExample.png "Features")

--