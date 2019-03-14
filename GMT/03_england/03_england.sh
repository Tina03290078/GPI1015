# set file name
out_ps=03_england.ps
  
# reset output paper size to A4
gmt set PS_MEDIA A4
  
# start gmt session
gmt psxy -R0/1/0/1 -JX1c -T -K -P > $out_ps
  
gmt pscoast -R49/60/-11/4 -Jm1 -B1 -W1 -Df -Ia -P -O -K>> $out_ps
  
# end gmt session
gmt psxy -R -J -O -T >> $out_ps
  
# convert to pdf
gmt psconvert $out_ps -P -Tf
# convert to png
gmt psconvert $out_ps -P -Tg

