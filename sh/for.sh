#!/bin/sh
for var in A B C;do
    echo "var is $var"
done
for FILENAME in chap?; do mv $FILENAME $FILENAME~;done
