psxy Quick Reference

psxy is a GMT module that plots lines, polygons, and symbols in 2-D. It reads x, y coordinates from a file or standard input.

-J<projection>: Defines the map projection.

Options: A string that specifies the projection type and its parameters. Examples: -Jm15c (Mercator, 15 cm wide), -JX15c/10c (Cartesian, 15x10 cm).

-R<region>: Sets the region of interest.

Options: A string like <xmin>/<xmax>/<ymin>/<ymax>.

-W<pen>: Draws lines.

Options: Defines thickness, color, and style, e.g., -W1p,black,dashed.

-S<symbol>: Plots symbols at data points.

Options:

    Symbol types: a (star), c (circle), d (diamond), h (hexagon), s (square), t (triangle), x (cross).

    Size: Append a size, e.g., -Sc0.2c for 0.2 cm circles.

    Fill/Outline: +g<fill>, +p<pen>.

    Example: -St0.5c+gred+pthin,black.

-G<fill>: Fills symbols or polygons.

Options: A color name (green), an RGB code (200/255/200), a gray shade (150), or a pattern (p28).

-L: Closes a polygon.

Options:

    +l: Draws a line from the last point to the first.

    +t: Fills a triangle from the first three points.

-F<flags>: Controls input data handling.

Options:

    +a: Appends to a file.

    +s: Ignores blank lines.

    +x: Expects a header.

-A: Plots as a closed line (polygon).

Options: No further options.

-B<parameters>: Adds a map frame.

Options: A complex string for various frame components:

    Axis Labels: -Bxa, -Bya, -Bza

    Gridlines: -Bxg, -Byg

    Frame Annotations: -Bafg (auto annotations and grid)

    Title: -B+t"Title"

    Tick Intervals: -Bx5, -By10

    Example: -Bxa10f5g5/ya5f2.5g2.5+t"My Plot"

Example

Plots data points from a file data.txt as red squares with a black outline, with a detailed frame.

gmt psxy data.txt -R0/10/0/10 -JX10c -Ss0.5c+gred+pblack -Bxa5f2.5g5/ya2f1g2+t"Data Plot" > plot.ps