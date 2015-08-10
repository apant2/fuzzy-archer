#!/bin/bash
#This bash script will add every gff3 file in a directory to your gbrowse dataview
#This script must be accessed through the JBrowse folder or else it wont work
echo "Type the directory you want to execute the script over, then hit [ENTER]"
read dir
echo "Type the output dataview, then hit [ENTER]"
read dataview

echo "The script will now loop through each gff3 file in the directory, and add it to the browser"
for f in $dir/*.gff3
do
  tracklabel="${dir/f% (*).gff3}"
  bin/flatfile-to-json.pl --gff $f --out data/$dataview --trackLabel $tracklabel
done
