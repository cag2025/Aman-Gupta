#!/bin/sh
Reg=-R68/100git /6/38
Pro=-Jm0.5
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
echo "88.864 27.173" | gmt psxy $Reg $Pro -BWS -Sa20p -Gred -W0.3p,black -O -K >> $ps

echo '88.864 27.173 5/4/2021'| awk '{print $1, $2-3, $3}' | gmt pstext $Reg $Pro -BWS -F+f15p,black -K -O >> $ps

okular $ps
