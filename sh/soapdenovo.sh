#!/bin/bash

for ((i=2;i<=106;i+=1));do
    mkdir ./configs/config_$i
    path=`pwd`
    dir=$path/out/Sample_ZXM-$i
    trim1=$dir/trim1.fastq
    trim2=$dir/trim2.fastq
    trim_unpaired=$dir/trim_unpaired.fastq
    congfig=./configs/config_$i
    cp ./configs/config.tmp $config
    echo "q1=$trim1">> $config
    echo "q2=$trim2">> $config
    echo "q=$trim_unpaired">> $config
done
    
