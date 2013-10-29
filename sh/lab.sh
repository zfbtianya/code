#!/bin/sh
#文件批量重命名
#我想把它们的名字的第一个1个字母变为"q"，其它的不变
for i in `ls`; do mv -f $i `echo $i | sed 's/^./q/'`; done
#修改前面5个字母为zhaozh
for i in `ls`; do mv -f $i `echo $i | sed 's/^...../zhaozh/'`; done
#所有的小写字母变大写字母
 for i in `ls`; do mv -f $i `echo $i | tr a-z A-Z`; done
exec ruby -S -x $0 "$@"
#! ruby
