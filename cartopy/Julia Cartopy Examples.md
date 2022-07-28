## Julia Cartopy Examples
Last Update: 2022-07-28<br>

#### Contents

<ul>
<li><a href="#installation">Installation</a></li>
<li><a href="#3Dortho">3D Earth observed from infinite distance</a></li>
<li><a href="#3Dperspective">3D Earth observed from finite altitude</a></li>
<li><a href="#2DWorldMap-2color">2D world map</a></li>
<li><a href="#2DWorldMap-stockImg">2D world map with stock image</a></li>
<li><a href="#linesPoints">Draw points, lines, & great circles</a></li>
<li><a href="#features">Add features</a></li>
<li><a href="#imageOverlay">Overlay images</a></li>
<li><a href="#vectorOverlay">Overlay vectors</a></li>
</ul>

#### Cartopy Installation<a name="installation"></a>

1. In the Julia command line: `using Conda; Conda.add("Cartopy")`
1. In computer's command line (Terminal on Mac, Command Prompt on Windows): `conda install -c conda-forge cartopy`

--

#### Python → Julia PyPlot Translation<a name="translation"></a>

When using Python modules (of which Cartopy is an example) in Julia rather than in Python, the syntax generally changes as follows:

* Python & Julia 1.0: `ax.stock_img()`
* Julia ≤0.7: `ax[:stock_img]()`

--

#### 3D Earth observed from infinite distance<a name="3Dortho"></a>

```julia
using PyPlot, PyCall
ccrs = pyimport("cartopy.crs")
feature = pyimport("cartopy.feature")

lat = 15 # degrees
lon = -50 # degrees
ax = subplot(projection=ccrs.Orthographic(lon, lat))

ax.set_global() # make the map global rather than have it zoom in to the extents of any plotted data

ax.add_feature(feature.OCEAN, color="navy")
ax.add_feature(feature.LAND, color="lightgray")

axis("off")
```

<p align="center">
    <img src="https://raw.githubusercontent.com/jpwspicer/Gists/master/cartopy/output/3Dortho.png" width="500" align="middle" />
</p>

--

#### 3D Earth observed from finite altitude<a name="3Dperspective"></a>

```julia
using PyPlot, PyCall
ccrs = pyimport("cartopy.crs")
feature = pyimport("cartopy.feature")

lat = 38 # degrees
lon = 14 # degrees
alt = 100e3 # meters

ax = subplot(projection=ccrs.NearsidePerspective(central_latitude=lat, central_longitude=lon, satellite_height=alt))
ax.set_global()
ax.gridlines(lw=0.5, ls="--")

ax.add_feature(feature.OCEAN, color="navy")
ax.add_feature(feature.LAND, color="lightgray")

axis("off")
```

<p align="center">
    <img src="https://raw.githubusercontent.com/jpwspicer/Gists/master/cartopy/output/3Dperspective.png" width="500" align="middle" />
</p>

--

#### 2D world map<a name="2DWorldMap-2color"></a>

```julia
using PyPlot, PyCall
ccrs = pyimport("cartopy.crs")
feature = pyimport("cartopy.feature")

ax = subplot(projection=ccrs.PlateCarree())
ax.set_global()

ax.add_feature(feature.OCEAN, color="navy")
ax.add_feature(feature.LAND, color="lightgray")

axis("off")
```

<p align="center">
    <img src="https://raw.githubusercontent.com/jpwspicer/Gists/master/cartopy/output/2DWorldMap-2color.png" width="500" align="middle" />
</p>

--

#### 2D world map with stock image<a name="2DWorldMap-stockImg.png"></a>

```julia
using PyPlot, PyCall
ccrs = pyimport("cartopy.crs")

ax = subplot(projection=ccrs.PlateCarree())
ax.set_global()
ax.stock_img()

axis("off")
```

<p align="center">
    <img src="https://raw.githubusercontent.com/jpwspicer/Gists/master/cartopy/output/2DWorldMap-stockImg.png" width="500" align="middle" />
</p>

--

#### Draw points, lines, & great circles<a name="linesPoints"></a>

```julia
using PyPlot, PyCall
ccrs = pyimport("cartopy.crs")

ax = subplot(projection=ccrs.Robinson())

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

<p align="center">
    <img src="https://raw.githubusercontent.com/jpwspicer/Gists/master/cartopy/output/linesPoints.png" width="500" align="middle" />
</p>

--

#### Add features<a name="features"></a>

```julia
using PyPlot, PyCall
ccrs = pyimport("cartopy.crs")
feature = pyimport("cartopy.feature")

ax = subplot(projection=ccrs.PlateCarree())
ax.set_extent([80, 170, -45, 30])

ax.stock_img()

# Create a feature for States/Admin 1 regions at 1:50m from Natural Earth
states_provinces = feature.NaturalEarthFeature(
        category="cultural",
        name="admin_1_states_provinces_lines",
        scale="50m",
        facecolor="none"
)

ax.add_feature(feature.LAND)
ax.add_feature(feature.COASTLINE)
ax.add_feature(states_provinces, edgecolor="gray")
```

<p align="center">
    <img src="https://raw.githubusercontent.com/jpwspicer/Gists/master/cartopy/output/features1.png" width="500" align="middle" />
</p>

```julia
using PyPlot, PyCall
ccrs = pyimport("cartopy.crs")
feature = pyimport("cartopy.feature")

ax = subplot(projection=ccrs.PlateCarree())
ax.set_extent([-20, 60, -40, 40])

ax.add_feature(feature.LAND)
ax.add_feature(feature.OCEAN)
ax.add_feature(feature.COASTLINE)
ax.add_feature(feature.BORDERS, linestyle=":")
ax.add_feature(feature.LAKES, alpha=0.5)
ax.add_feature(feature.RIVERS)
```

<p align="center">
    <img src="https://raw.githubusercontent.com/jpwspicer/Gists/master/cartopy/output/features2.png" width="500" align="middle" />
</p>

--

#### Overlay images<a name="imageOverlay"></a>

```julia
using PyPlot, PyCall
cartopy = pyimport("cartopy")

fig = figure(figsize=(8, 12))

fname = joinpath(cartopy.config["repo_data_dir"], "raster", "sample", "Miriam.A2012270.2050.2km.jpg")
img_extent = (-120.67660000000001, -106.32104523100001, 13.2301484511245, 30.766899999999502)
img = imread(fname)

ax = subplot(projection=ccrs.PlateCarree())
title("Hurricane Miriam from the Aqua/MODIS satellite\n2012 09/26/2012 20:50 UTC")

xlim(img_extent[1]-1, img_extent[2]+1) # set a margin around the data

# add the image. Because this image was a tif, the "origin" of the image is in the upper left corner
imshow(img, origin="upper", extent=img_extent, transform=cartopy.crs.PlateCarree())
ax.coastlines(resolution="50m", color="k", linewidth=1)

# mark a known place to help us geo-locate ourselves
plot(-117.1625, 32.715, "bo", markersize=7, transform=ccrs.Geodetic())
text(-117, 33, "San Diego", transform=ccrs.Geodetic())
```

<p align="center">
    <img src="https://raw.githubusercontent.com/jpwspicer/Gists/master/cartopy/output/imageOverlay.png" width="500" align="middle" />
</p>

--

#### Overlay vectors<a name="vectorOverlay"></a>

```julia
using PyCall, PyPlot

ccrs = pyimport("cartopy.crs")
feature = pyimport("cartopy.feature")

"""
Returns `(x, y, u, v, crs)` of some vector data
computed mathematically. 
"""
function sample_data(shape=(20, 30))
    x = range(311.9, stop=391.1, length=shape[2])
    y = range(-23.6, stop=24.8, length=shape[1])

    x2d, y2d = repeat(x', length(y), 1), repeat(y, 1, length(x))
    u = 10(2cos.(2deg2rad.(x2d) .+ 3deg2rad.(y2d .+ 30)).^2)
    v = 20cos.(6deg2rad.(x2d))

    return x, y, u, v
end

ax = subplot(projection=ccrs.Orthographic(-10, 45))
ax.set_global()
ax.gridlines()

# The crs will be a rotated pole CRS, meaning that the vectors will be unevenly spaced in regular PlateCarree space.
crs = ccrs.RotatedPole(pole_longitude=177.5, pole_latitude=37.5)

ax.add_feature(feature.OCEAN, zorder=0)
ax.add_feature(feature.LAND, zorder=0, edgecolor="k")

x, y, u, v = sample_data()
ax.quiver(collect(x), collect(y), u, v, transform=crs)
```

<p align="center">
    <img src="https://raw.githubusercontent.com/jpwspicer/Gists/master/cartopy/output/vectorOverlay.png" width="500" align="middle" />
</p>

--