#!/bin/sh
#we have less than 3 arguments.Print the help text:
if [ $# -lt 3 ];then
    cat <<EOF
ren --rename a number of files using red regular expressions
USAGE: ren 'regexp' 'replacement' files...
EXAMPLE: rename all *.HTM files in *.html:
ren 'HTM$' 'html' *.HTM
EOF
    exit 0
fi
OLD="$1"
NEW="$2"
#The shift command removes one argument from the list of
#command line arguments
shift
shift
#$* contains now all the files:
for file in $*;do
    if [ -f "$file" ];then
        newfile=`echo "$file" | sed "s/${OLD}/${NEW}/g"`
        if [ -f "$newfile" ];then
            echo "ERROR: $newfile exists already"
        else
            echo "renaming $file to $newfile..."
            mv "$file" "$newfile"
        fi
    fi
done
    
            
    
