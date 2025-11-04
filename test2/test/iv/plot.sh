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
echo "73.825 15.492" | gmt psxy -BWS $Reg $Pro -Si3p -Gred -W9,red -O -K >> $ps
echo "99.920 30.9113" |gmt psxy -BWS $Reg $Pro -Sa3p -Gblue -W5,blue -O -K >> $ps
echo "90.489 39.1210" | gmt psxy -BWS $Reg $Pro -Sa3p -Ggreen -W5,green -O -K >> $ps
echo "103.489 20.1250" | gmt psxy -BWS $Reg $Pro -Sa3p -Gyellow -W5,yellow -O -K >> $ps
gmt psxy -BWS cities.dat $Reg $Pro -Sc3p -Gblack -W5,black -O -K >> $ps
gmt pstext -BWS cities2.dat $Reg $Pro -F+f10p,Times-Roman+jRT -D0.1i/0.1i -O -K >> $ps


cat pp_evt1.dat | awk '{print $2,$1}'| gmt psxy $Reg $Pro -B2g2 -BWS -K -O -S+0.6 -W1,blue >>$ps
cat pp_evt2.dat | awk '{print $2,$1}'| gmt psxy $Reg $Pro -B2g2 -BWS -K -O -S+0.6 -W1,green >>$ps
cat pp_evt3.dat | awk '{print $2,$1}'| gmt psxy $Reg $Pro -B2g2 -BWS -K -O -S+0.4 -W1,yellow >>$ps


okular $ps