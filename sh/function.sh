#!/bin/sh
#vim:set sw=4 ts=4 et:
help()
{
    cat <<EOF
xtitlebar --change the name of xterm,gnome-terminal or kde konsole
USAGE: xtitlebar [-h] "string_for_titlebar"
OPTIONS: -h help text
EXAMPLE: xtitlebar "cvs"
EOF
exit 0
}
# in case of error or if -h is given we call the function help:
[ -z "$1" ] && help
[ "$1" = "-h" ] && help
#send the escape sequence to change the xterm titlebar:
echo -e "33]0;$107"
#
is_directory()
{
    DIR_NAME=$1
    if [ ! -d $DIR_NAME ]; then
        return 1
    else
        return 0
    fi
}

for DIR in "$@"; do
    if is_directory "$DIR"
    then :
    else
        echo "$DIR doesn't exist. Creating it now..."
        mkdir $DIR > /dev/null 2>&1
        if [ $? -ne 0 ]; then
            echo "Can't reate directory $DIR"
            exit 1
        fi
    fi
done
