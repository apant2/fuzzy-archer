#This script converts data from GAPIT into a gff3 format, currently to display on JBrowse
#Works in python 2.7.9 |Anaconda 2.2.0 (x86_64)| (script shows you the current version of python running)
#Requires use of pandas and numpy
#To Do:

import pandas as pd;
import numpy as np;
import os;
import sys;
print "The current version of python running is: " + sys.version;

files = [f for f in os.listdir(".") if f.split(".")[-1]=="csv"];

if not os.path.exists("./out"):
    os.makedirs("./out")

for f in files:
    filename, file_ext = os.path.splitext(f);
    gff3_file = pd.read_csv(f);
    gff3_file["seqid"] = gff3_file["Chromosome"];
    gff3_file["source"] =  filename;
    gff3_file["type"] = "Microarray";
    gff3_file["start"] = gff3_file["Position "];
    gff3_file["end"] = gff3_file["Position "];
    gff3_file["score"] = gff3_file["P.value"];
    gff3_file["strand"] =".";
    gff3_file["phase"] = ".";
    gff3_file["attributes"] = 'Name='+gff3_file["SNP"];

    out = gff3_file.ix[:, 'seqid':];
    out_path="./out/"+filename+".gff3";
    out.to_csv(path_or_buf=out_path, sep="\t",header=False,index=False)

#ID; Alias; Parent; Name; Target; Gap
