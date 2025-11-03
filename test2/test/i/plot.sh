#!/bin/sh
Reg=-R68/110/6/50
Pro=-Jq0.4
ps=answer.ps
gmt gmtset MAP_FRAME_TYPE fancy
CPT=aman.cpt
GRD=~/Desktop/topo30.grd
gmt grdcut $GRD $Reg -Gtmp1.grd -V
gmt grdsample tmp1.grd -Gtmp.grd -I0.5m -r -nc+c -V
#gmt grdmath -25 tmp1.grd MAX=tmp2.grd
gmt grdgradient tmp.grd -A315 -Ggradient.grd -Nt -V
gmt grdimage $Reg $Pro tmp.grd -C$CPT -K > $ps
gmt pscoast -BWS $Reg $Pro -Df -W0.5p,black,dashed -B2g2 -Na/1p,black -I1/0.3p,blue -O -K >> $ps
echo "73.825 15.492" | gmt psxy -BWS $Reg $Pro -Si3p -Gred -W9p,red -O -K >> $ps
echo "99.920 30.9113" |gmt psxy -BWS $Reg $Pro -Sa3p -Gblue -W5,blue -O -K >> $ps
echo "90.489 39.1210" | gmt psxy -BWS $Reg $Pro -Sa3p -Ggreen -W5,green -O -K >> $ps
echo "103.489 20.1250" | gmt psxy -BWS $Reg $Pro -Sa3p -Gyellow -W5,yellow -O -K >> $ps

# This command uses -ST to ensure the triangles are inverted.
gmt psxy -BWS cities.dat $Reg $Pro -Sc3p -Gblack -W5,black -O -K >> $ps

# Step 8: Label the cities
cat cities.dat | awk '{print $2,$1-1,$3}' | gmt pstext $Reg $Pro -BWS -F+f15p,black -K -O >> $ps

okular $ps