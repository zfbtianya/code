#!/bin/bash
alias p='echo'
p zfb
echo "Is it morning? Please anser yes or no."
read YES_OR_NO
case "$YES_OR_NO" in
    yes|y|Yes|YES)
        echo "Good moring!";;
    [nN]*)
        echo "Good Afternoon!";;
    *)
        echo "Sorry, $YES_OR_NO not recognized. Enter yes or no."
        exit 1;;
esac
exit 0
