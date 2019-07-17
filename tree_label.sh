rm /tmp/img1000.png /tmp/caption1.jpg /tmp/merge.png
convert -geometry 950 $1 /tmp/img1000.png

iwidth=950

lab=` echo $1 | sed -e '1,$s/\....$//' | sed -e 's/_/ /g'`

convert  -pointsize 20 -size $iwidth'x50' -gravity Center caption:"$lab" /tmp/caption1.jpg

montage -geometry +0+0 -tile 1x2 /tmp/img1000.png /tmp/caption1.jpg /tmp/merge.png
convert -bordercolor black -border 2x2 /tmp/merge.png $1RES.PNG
echo $1


