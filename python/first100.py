#!/usr/bin/env python

import sys
import os

def mylines():
    return ["a"+"\t"+str(i)+"\t"+str(i+1)+"\n" for i in range(200)]

def otus(line):
    return sum(map(int,line[:-1].split('\t')[1:]))

def the100th(lines):
    num =  [otus(l) for l in lines]
    num.sort()
    return num[-100]

def from1to100th(lines):
    def is_before100(l):
        return otus(l)>the100th(lines)
    return filter(is_before100,lines)

if __name__ == '__main__':
    infilename = sys.argv[1]
    lines = open(infilename,'r').readlines()
    otulines=lines[1:-1]
    
    cmd_name=infilename
    if len(lines)>100:
        out = open(outfilename,'w')
        outfilename = infilename.split('.')
        outfilename.insert(-1,'100')
        outfilename = '.'.join(outfilename)
        
        firstline = lines[0]
        middlelines = from1to100th(lines[1:-1])
        lastline = map(sum,zip(*(middlelines.line[:-1].split('\t')[1:])))
        outlines = [firstline]+middlelines+[lastline]        
        out.writelines(outlines)
        out.close()
        cmd_name=outfilename
        
    cmd='plot-heatmap.pl -i %s' %cmd_name
    os.system(cmd)
    
