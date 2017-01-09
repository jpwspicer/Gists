## Julia Basemap Examples
Last Update: 12.16.2015<br>

##### Contents

<ul>
<li><a href="#installation">Installation</a></li>
<li><a href="#translation">Translation</a></li>
<li><a href="#contours">Contours</a></li>
<li><a href="#greatCircles">Great Circles</a></li>
<li><a href="#dayNight">Day / Night</a></li>
</ul>

### Basemap
#### Installation<a name="installation"></a>

To install and begin using Basemap, run the following commands in the Julia command line:
```julia
	using Conda
	Conda.add("basemap")
```
N.B. After using the commands you may have to checkout and rebuild PyPlot and/or PyCall (`Pkg.checkout("<pkg>")`, `Pkg.build("<pkg>")`).
 
--

#### Python -> Julia PyPlot Translation<a name="translation"></a>

When using Python modules (of which Basemap is an example) in Julia rather than in Python, the syntax generally changes as follows:

Python - `map.fillcontinents(color='coral')`

Julia - `map[:fillcontinents](color="coral")`

As you can see, Julia simply replaces the '`.`' syntax with '`[:]`' syntax. 

Some Python functions are not replicated in Julia and must be either substitued or calculated by hand:

Python → Julia

`X, Y = meshgrid(x,y)` → `X, Y = repmat(x', length(y), 1), repmat(y, 1, length(x))`

`parallels = np.arange(0., 90, 10.)` → `parallels = collect(0:10:90)`

`np.indices((nlats, nlons))[0,:,:]` → `convert(Array{Float64}, repmat([i for i=1:nLats], 1, nLons))`

`np.indices((nlats, nlons))[1,:,:]` → `convert(Array{Float64}, repmat([j for j=1:nLons]', nLats))`


#### Basemap Examples

##### Contours<a name="contours"></a>

```julia
	using PyPlot, PyCall
	@pyimport mpl_toolkits.basemap as basemap

	# Set up orthographic map projection with perspective of satellite looking down at 45N, 100W.
	# Use low resolution coastlines.
	map = basemap.Basemap(projection="ortho", lat_0=45, lon_0=-100, resolution="l")

	# Draw coastlines, country boundaries, fill continents.
	map[:drawcoastlines](linewidth=0.25)
	map[:drawcountries](linewidth=0.25)
	map[:fillcontinents](color="coral",lake_color="aqua")

	# Draw the edge of the map projection region (the projection limb)
	map[:drawmapboundary](fill_color="aqua")

	# Draw lat/lon grid lines every 30 degrees.
	map[:drawmeridians](collect(0:30:360))
	map[:drawparallels](collect(-90:30:90))

	# Make up some data on a regular lat/lon grid.
	nLats = 73; nLons = 145; delta = 2*pi/(nLons-1)
	lats = convert(Array{Float64}, repmat(0.5*pi - delta*[i for i=1:nLats], 1, nLons))
	lons = convert(Array{Float64}, repmat(delta*[j for j=1:nLons]', nLats))

	wave = 0.75*(sin(2*lats).^8).*cos(4*lons)
	mean = 0.5*cos(2*lats).*(sin(2*lats).^2 + 2)

	# Compute native map projection coordinates of lat/lon grid.
	x, y = map(rad2deg(lons), rad2deg(lats))

	# Contour data over the map.
	cs = map[:contour](x, y, wave+mean, 15, linewidths=1.5)
	title("Global Contour Lines")
```

![Contour](https://raw.githubusercontent.com/jpwspicer/Julia/master/basemap/01contourExample.png "Contour")

--

##### Great Circles<a name="greatCircles"></a>

```julia
	using PyPlot, PyCall
	@pyimport mpl_toolkits.basemap as basemap

	lightBlue = (220/255, 220/255, 255/255)
	lightGreen = (230/255, 255/255, 230/255)

	# Set up mercator map projection.
	map = basemap.Basemap(llcrnrlon=-100, llcrnrlat=20, urcrnrlon=20, urcrnrlat=60,
	            rsphere=(6378137.00, 6356752.3142),
	            resolution="l", projection="merc",
	            lat_0=40, lon_0=-20, lat_ts=20)
	map[:drawcoastlines](linewidth=0.5)
	map[:fillcontinents](color=lightGreen, lake_color=lightBlue)
	map[:drawcountries](linewidth=0.25)
	map[:drawmapboundary](fill_color=lightBlue)

	# Draw parallels & meridians
	map[:drawmeridians](collect(-180:30:180), labels=[1,1,0,1])
	map[:drawparallels](collect(10:20:90), labels=[1,1,0,1])

	# Start, end coordinates (New York & London)
	ny  = (40.78, -73.98)
	lon = (51.53, 0.08)

	# Draw great circle route between New York and London
	map[:drawgreatcircle](ny[2], ny[1], lon[2], lon[1], linewidth=3, color="m")
	for (lat, lon) in [ny, lon]
	    x, y = map(lon, lat)
	    map[:scatter](x, y, zorder=3, s=60, edgecolor="k", color="yellow")
	end

	title("Great Circle from New York to London")
```

![Great Circle](https://raw.githubusercontent.com/jpwspicer/Julia/master/basemap/02greatCircleExample.png "Great Circle")

--

##### Day / Night<a name="dayNight"></a>

```julia
	using PyPlot, PyCall
	@pyimport mpl_toolkits.basemap as basemap

	# Miller projection
	map = basemap.Basemap(projection="mill", lon_0=180)

	# Plot coastlines, draw label meridians and parallels
	map[:drawcoastlines](linewidth=0.5)
	map[:drawcountries](linewidth=0.25)
	map[:fillcontinents](color="coral", lake_color="aqua")
	map[:drawmeridians](collect(map[:lonmin]:60:map[:lonmax]+30), labels=[0,0,0,1])
	map[:drawparallels](collect(-90:30:90), labels=[1,0,0,0])
	map[:drawmapboundary](fill_color="aqua")

	# Shade the night areas using current time in UTC
	CS = map[:nightshade](now(Dates.UTC))
	title("Day/Night Map for " * strftime(time()) * " (UTC)")
```

![Day / Night](https://raw.githubusercontent.com/jpwspicer/Julia/master/basemap/03dayNightExample.png "Day / Night")