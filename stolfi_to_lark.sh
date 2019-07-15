grep -v '#' $1 | sed -e 's/[0-9][0-9]*\.*[0-9]*//g' | sed -e 's/^$/ NEWL /' |\
  sed -e 's/\([A-Za-z\.]\)$/\1 |/' | tr -d '\n' | sed -e 's/ NEWL /\
/g' | sed -e 's/|$//' | sed -e 's/\([A-Za-z]\)\.\([A-Za-z]\)/\1 \2/g' | sed -e 's/\([A-Za-z]\)\.\([A-Za-z]\)/\1 \2/g'|\
# start symbol; remaining dots are empty rules; literal strings quoted
sed -e 's/NormalWord/start/' | sed -e 's/\.//g' | sed -e 's/ \([a-z][a-z]*\) / "\1" /g' |\
sed -e 's/\([A-Z][A-Z]*\)\([a-z]\)/\L\1\2/g'  | sed -e 's/\([a-z]\)\([A-Z][A-Z]*\)/\1\L\2/g' | sed -e 's/  */ /g' > $1'.lark'
