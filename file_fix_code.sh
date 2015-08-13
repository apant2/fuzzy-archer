#!/bin/bash
#Simple bash script to repalce Chr in many files with nothing so the gff3 files' chromosome ID aligns properly to the genome in JBrowse

for f in *.gff3; do
  sed -i '' "s/Chr//g" $f
done
