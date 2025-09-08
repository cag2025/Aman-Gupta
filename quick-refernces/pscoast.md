pscoast Quick Reference

-J<projection>: Defines the map projection.

Options: a|A (Azimuthal), c|C (Conic), e|E (Equidistant), g|G (Geographic), m|M (Mercator), p|P (Polar), t|T (Transverse Mercator), u|U (Orthographic), v|V (General Perspective), w|W (Winkel Tripel).

-R<region>: Sets the map's geographical boundaries.

Options: <west>/<east>/<south>/<north>, a two-letter country code (e.g., FR), or a predefined region.

-D<resolution>: Controls coastline detail.

Options: f (full), h (high), i (intermediate), l (low), c (crude).

-W<pen>: Draws coastlines.

Options: A string defining thickness, color, and style, e.g., 1p,black,solid or 0.5p,blue,dashed.

-G<fill>: Fills land areas.

Options: A color name (green), an RGB code (200/255/200), a gray shade (150), or a pattern number (p28).

-S<fill>: Fills water areas.

Options: Same as -G (color, RGB, gray, or pattern).

-I<level>/<pen>: Draws rivers.

Options: Levels 1-5 for different river types: 1 (permanent major), 2 (additional major), 3 (minor), etc. Pen is optional.

-N<level>/<pen>: Draws political borders.

Options: Levels 1 (national) or 2 (state/province). Pen is optional.

-E<dcw>: Specifies properties for countries.

Options: <country_codes>+g<fill>+p<pen>. Example: -EFR,DE+gred+pblack.

-M: Outputs coastline data as a table.

Options: No further options.

-Q: Ends a clipping path.

Options: No further options.

-L<scalebar>: Adds a distance scale bar.

Options: g (geographic location), j (justification code), x (explicit coordinates), +c (compass), +f (fancy), +j (justification), +l (label), +u (units), +w (length).

Example

Plots a high-resolution map of Italy with green land and light gray water, including a scale bar.

gmt pscoast -RIT -Dh -Ggreen -Slightgray -Baf -Lg-7/42+w200k+l"200 km" > italy.ps