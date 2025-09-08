#!/bin/sh
# Reg=-R68/100/6/50
Reg=-RIN
Pro=-Ju0.5
ps=answer.ps

gmt gmtset MAP_FRAME_TYPE fancy

CPT=aman.cpt
GRD=~/Desktop/topo30.grd
gmt grdcut $GRD $Reg -Gtmp1.grd -V

gmt grdsample tmp1.grd -Gtmp.grd -I0.5m -r -nc+c -V

#gmt grdmath -25 tmp1.grd MAX=tmp2.grd

gmt grdgradient tmp.grd -A315 -Ggradient.grd -Nt -V

gmt grdimage $Reg $Pro tmp.grd -C$CPT -K > $ps
#
gmt pscoast $Reg $Pro -Df -W0.5p,black,dashed -Bf2g2 -Na/1p,black -I1/0.3p,blue -O -K >> $ps

echo "80 25" | gmt psxy $Reg $Pro -Si3p -Gred -W5p,red -O -K >> $ps

echo "78.17 23.73" | gmt psxy $Reg $Pro -Sc3p -Gblue -W5,blue -O -K >> $ps

echo "78.77 24.22" | gmt psxy $Reg $Pro -Sc3p -Gblue -W5,blue -O -K >> $ps

echo "88.13 27.45" | gmt psxy $Reg $Pro -Sc5p -Gblue -W5,blue -O >> $ps


okular $ps