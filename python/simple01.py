#!/usr/bin/python

import sys
filename = sys.argv[1]
oldfile = open(filename,'r')
newfile = open('uni.txt','w')
repfile = open('rep.txt','w')
olddic = {}
newset = {}
repset = {}
for line in oldfile.readlines():
    if line[0] == '>':
        index = line[1:]
        olddic[index] = ''
    else:
        olddic[index] += line 
for k,v in olddic.iteritems():
    if v not in [value for value in newset.iterkeys()]:
        newset[v] = [k]
    else:
        newset[v].append(k)
for k,v in newset.iteritems():
    newfile.write('>' + v[0])
    newfile.write(k)
    if len(v) > 1:
        for item in v:
            repfile.write(item)
        repfile.write('-'*10)
        repfile.write('\n')

oldfile.close()
newfile.close()
repfile.close()
        
        
