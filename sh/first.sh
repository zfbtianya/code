#! /bin/bash
a="hello world"
echo "A is:" $a
num=2
echo "this is the ${num}nd"
echo "this is the {$num}nd"
var=1
var=$var+1
echo $var
let "var+=1"
echo $var
[ -f "somefile" ]
[ -x "/bin/ls" ]
[ -n "$var" ] && echo "var is a num"
[ -f "etc/shadow" ] && echo "This computer uses shadow passwords"
mybashrc=~/.bashrc
[ -r "$mybashrc" ] || { echo "Can not read $mailfolder" ; exit 1; }
echo "----------------"
echo "$mybashrc is:"
echo '==============='
grep "^#" $mybashrc
#自动解压bzip2,gzip和zip
ftype="$(file "$1")"
case "$fype" in
    "$1: Zip archive"*)
        unzip "$1" ;;
    "$1: gzip compressed"*)
        gunzip "$1" ;;
    "$1: bzip2 compressed"*)
        bunzip2 "$1" ;;
    *) echo "File $1 can not be uncompreessed with smartzip" ;;
    esac
#select
echo "What is your favourite OS?"
select var in "Linux" "Gnu Hurd" "Free BSD" "Other"; do
break;
done
echo "You have selected $var"
#loop:for,while
for var in A B C ;do
    echo "var is $var"
done
#list a content summary of a number of RPM packages
for rpmpackage in $@; do
    if [ -r "$rpmpackage" ];then
    echo "==============$rpmpackage ========="
    rpm -qi -p $rpmpackage
    else
        echo "ERROR: cannot read file $rpmpackage"
    fi
done
echo "$@"



