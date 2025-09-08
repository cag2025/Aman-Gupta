### Azimuthal Equidistant Projection

The **Azimuthal Equidistant** projection is an azimuthal projection that maintains true distances and directions from a central point. All great circles passing through the center are straight lines. The poles plot as circles.

#### **-J**`a|A`: Sets Azimuthal Equidistant Projection.
**Options**:
* `a<width>` or `a<scale>`: Centered on the North Pole.
* `A<width>` or `A<scale>`: Centered on the South Pole.
* `<lon>/<lat>`: Defines the projection's center.
* `+a`: Plots azimuths instead of longitudes.
* `+t<lon>`: Sets the meridian pointing "up".

**Example**
Plots a global view centered on 100ºW/40ºN, showing true distances from that point.

`gmt coast -R0/360/-90/90 -Ja-100/40/15c -Baf -Ggray -Sblue > map.ps`
* `-Ja-100/40/15c`: Azimuthal Equidistant, centered at 100ºW/40ºN, 15 cm wide.

***

### Gnomonic Projection

The **Gnomonic** projection is a perspective projection from the center of the globe. It's unique because all **great circles are straight lines**. It is not equal-area or conformal, and distortion is significant away from the center.

#### **-J**`f|F`: Sets Gnomonic Projection.
**Options**:
* `f<width>` or `f<scale>`: Defines the map size.
* `<lon>/<lat>`: Sets the projection center.
* `+a<horizon>`: Sets the maximum angle from the center to the edge (in degrees, `< 90`).

**Example**
Plots a view of Europe with a 60-degree horizon, centered on 0ºE/50ºN.

`gmt coast -R-30/30/30/70 -Jf0/50/15c+a60 -Baf -Gtan -Slightblue > map.ps`
* `-Jf0/50/15c+a60`: Gnomonic, centered at 0ºE/50ºN, 15 cm wide with a 60° horizon.

***

### Mercator Projection

The **Mercator** projection is a cylindrical, conformal projection famous for its straight rhumb lines. It's often used for navigational charts and world maps, though it severely distorts areas at high latitudes.

#### **-J**`m|M`: Sets Mercator Projection.
**Options**:
* `m<width>` or `m<scale>`: Defines the map size.
* `<lon>`: Sets a central meridian.
* `/<lat>`: Sets a standard parallel.

**Example**
Plots a Mercator map of the world centered on the Prime Meridian.

`gmt coast -R-180/180/-80/84 -Jm18c -Baf -Gtan -Slightblue > map.ps`
* `-Jm18c`: Mercator, 18 cm wide.

***

### Transverse Mercator Projection

The **Transverse Mercator** projection is a cylindrical projection where the cylinder touches a meridian instead of the equator. Distortion increases away from the central meridian. It's widely used in the UTM (Universal Transverse Mercator) system.

#### **-J**`t|T`: Sets Transverse Mercator Projection.
**Options**:
* `t<width>` or `t<scale>`: Defines the map size.
* `<lon>/<lat>`: Sets the central meridian and a latitude of origin.

**Example**
Plots a map centered on 120ºE, suitable for mapping a region spanning north-south.

`gmt coast -R115/125/20/30 -Jt120/10c -Baf -Ggreen -Sblue > map.ps`
* `-Jt120/10c`: Transverse Mercator centered at 120ºE, 10 cm wide.

### Polar Stereographic Projection

The **Polar Stereographic Projection** is an azimuthal projection that is **conformal** and commonly used for maps of the Arctic and Antarctic. It projects the globe onto a plane tangent to one of the poles.

#### **-J**`<p|P>`: Sets Polar Projection.
**Options**:
* `p<width>` or `p<scale>`: Stereographic projection for the **Northern Hemisphere**.
* `P<width>` or `P<scale>`: Stereographic projection for the **Southern Hemisphere**.
* `l<lat>`: Sets the standard parallel where the scale is true.
* `+a`: Plots azimuths instead of longitudes.
* `+t<lon>`: Sets the meridian pointing "up".

**Example**
Plots the Arctic region using a Polar Stereographic projection.

`gmt pscoast -R-180/180/60/90 -Jp15cl60+t0 -Baf -Gred -Sblue > arctic.ps`
* `-Jp15c`: Polar Stereographic, 15 cm wide.
* `l60`: Sets the true-scale latitude at 60ºN.
* `+t0`: Sets the 0º meridian to point straight up.