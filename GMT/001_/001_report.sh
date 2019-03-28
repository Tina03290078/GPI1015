#set file name
out_ps=001_report.ps
input_list=ATM.csv
  
gmt set PS_MEDIA A4 
gmt makecpt -Crainbow -T0.1/500/1 -Z -Qo > eq.cpt
  
# start gmt session
gmt psxy -R0/1/0/1 -JX1c -T -K -P > $out_ps 
  
gmt psbasemap -R119/123/21/26 -Jm4 -B1 -G0/250/250 -O -K >> $out_ps
gmt pscoast -R -J -B -W1 -G200/200/0 -Df -Ia -O -K >> $out_ps

awk -F"[,°'〞 ]" 'NR>1 {print $9":"$11":"$13$16, $1":"$3":"$5$8}' $input_list | gmt psxy -R -J -Sc0.3 -Gred -O -K >> $out_ps

  
# end gmt session
gmt psxy -R -J -O -T >> $out_ps 
# convert to pdf
gmt psconvert $out_ps -P -Tf
# convert to png
gmt psconvert $out_ps -P -Tg