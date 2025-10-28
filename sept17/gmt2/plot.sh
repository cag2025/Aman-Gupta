#!/bin/sh
Reg=-R68/100/6/50 #region specifies India
Pro=-Jm0.5
ps=answer.ps

gmt gmtset MAP_FRAME_TYPE fancy
CPT=aman.cpt
GRD=/home/amann/cag2025/Aman-Gupta/topo30.grd
gmt grdcut $GRD $Reg -Gtmp1.grd -V

gmt grdsample tmp1.grd -Gtmp.grd -I0.5m -r -nc+c -V

gmt grdgradient tmp.grd -A315 -Ggradient.grd -Nt -V

gmt grdimage $Reg $Pro tmp.grd -C$CPT -K > $ps

gmt pscoast $Reg $Pro -Df -W0.5p,black,dashed -Bf4g4 -Na/1p,red -Ir/0.7p,blue -O -K >> $ps

okular $ps