mkdir -p out
rm out/*
for f in prob_obs_txt.n_word.frq_NO_bh.csv TT_freq.csv neg_king_james_36500.freq neg_TT_shifted_good_chars_no_vms_36500.freq
do
for gramm in grammar/EMS_edited.lark grammar/Stolfi_reduced.lark grammar/NormalWord.grx.lark  grammar/Stolfi_expanded.lark
do
  gname=`echo $gramm | sed -e 's%.*/%%' | sed -e 's/\..*//'`
  cat in/$f | python parse_with_lark.py $gramm | tee out/$gname$f
  cat in/1000_''$f | python parse_with_lark.py $gramm | tee out/_1000_$gname$f
done
done

for f  in out/*; do echo -n $f' '; tail -2 $f| head -1; echo; done | sort | grep -v 1000_
echo
echo
echo
for f  in out/*; do echo -n $f' '; tail -2 $f| head -1; echo; done | sort | grep 1000_

