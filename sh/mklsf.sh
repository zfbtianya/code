#!/bin/bash

path=`pwd`
for ((i=1;i<=16;i+=1));do
    lsfname=$path/lsfscripts/zxm$i.lsf
    beg=`expr $i "*" 7 - 7`+2
    end=`expr $beg + 7`
    
    touch $lsfname
    echo "APP_NAME=gene">>$lsfname
    echo "NP=16">>$lsfname
    echo 'RUN="RAW"'>>$lsfname
    for j in {$beg..$end};do
        shname=$path/soapscripts/sh$j.sh
        if [$end <= 106];then
            echo "bash $shname">>$lsfname
        fi
    done
done
        
