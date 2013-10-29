#!/usr/bin/python
# -*- coding=utf-8
import os,sys

f = open('a.txt','w')
lines = ['first line\n','secondd line\n','third line\n','芝麻开门\n','俄罗斯\n']
f.writelines(lines)
f.close
reads = open('a.txt','r').readlines()
for line in reads:
    print line,
print ''
