mkdir -p images
for w in $*
do
for gramm in grammar/EMS_V10.lark  grammar/Stolfi_reduced.lark
do
gname=`echo $gramm | sed -e 's%.*/%%' | sed -e 's/_.*//'`
echo $gname
echo $w | python tree_img.py $gramm 
source ./label_img.sh '__'$w'_'$gname'.png'
rm '__'$w'_'$gname'.png'
mv *PNG images
done
done


