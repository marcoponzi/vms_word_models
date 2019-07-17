mkdir -p images
for w in $*
do
for gramm in grammar/EMS_edited.lark  grammar/Stolfi_reduced.lark
do
  gname=`echo $gramm | sed -e 's%.*/%%' | sed -e 's/_.*//'`
  echo $gname
  echo $w | python tree_img.py $gramm 
  source ./tree_label.sh $w'_'$gname'.png'
  rm $w'_'$gname'.png'

done
montage -geometry +0+0 -tile 1x2 $w'_Stolfi'*'.PNG' $w'_EMS'*'.PNG' $w'_BOTH.PNG' 
mv *PNG images
done


