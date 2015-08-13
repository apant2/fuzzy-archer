#!/bin/bash
#!/usr/bin/perl -w
#This bash script will add every gff3 file in a directory to your gbrowse dataview
#This script must be accessed through the JBrowse folder or else it wont work
#How to use:
#./multi-gff-to-json.sh [Relative File Directory] [Dataview]

FILES=("./$1/*.gff3")
DATAVIEW="./data/$2"

echo "The script will now loop through each gff3 file in the directory, and add it to the browser. Please be patient as this may take a while."
echo "Every file that is added to the dataview will be displayed below on screen."

for f in ${FILES[@]}
do
  echo "$f"
  file="$(basename "$f")"
  ./bin/flatfile-to-json.pl --gff $f --out $DATAVIEW --trackLabel "${file%.*}"
done

echo "The script has now completed. Goodbye."
