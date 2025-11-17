#!/bin/sh
Reg=-RIN
Pro=-JD80/30/0/50/16
ps=answer.ps
gmt gmtset MAP_FRAME_TYPE fancy
CPT=aman.cpt
GRD=Aman-Gupta/topo30.grd
grdcut $GRD $Reg -Gtmp1.grd -V
gmt grdsample tmp1.grd -Gtmp.grd -I0.5m -r -nc+c -V
#gmt grdmath -25 tmp1.grd MAX=tmp2.grd
gmt grdgradient tmp.grd -A315 -Ggradient.grd -Nt -V
gmt grdimage $Reg $Pro tmp.grd -C$CPT -K > $ps
gmt pscoast $Reg $Pro -Df -W1p,red,dashed -Bf4g4 -Na/1p,red -I1/0.3p,blue -O -K >> $ps
# echo "82.2723 22.7284" | gmt psxy $Reg $Pro -Si3p -Gred -W5p,red -O -K >> $ps
# cat "location.dat" | awk '{print $2,$1}' | gmt psxy $Reg $Pro -Sc3p -Gblue -W4,blue -O -K >> $ps
okular $ps