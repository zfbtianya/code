#!/bin/sh   

dir=`pwd`

for file in `ls ${dir}`;do
    cd "$file"
    cat "1*">"../out/$file/1"
    cat "2*">"../out/$file/2.fastq"
    cd ..
done
    

