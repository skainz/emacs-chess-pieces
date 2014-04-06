#!/bin/bash

size=96

outdir=${size}x${size}

mkdir -p ${outdir}

cd svg
for i in $(ls -1); do

bitmap=$(echo $i| awk 'BEGIN{FS="_"} { if ($6 == "1.svg") { printf "%s","black"} else { printf "%s","white" };printf "-%s.xpm\n",tolower($5)}')

echo $i
echo $bitmap
path_bitmap="../${outdir}/$bitmap"
convert -antialias -background none -resize ${size}x  "$i" ${path_bitmap}

sed -i -e 's/None/background/g' ${path_bitmap}

done


