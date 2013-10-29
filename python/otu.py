#!/usr/bin/python

# encoding: U-TF8
"""base on yuguo's perl programs
"""
import os

def run_perl(perlname, opts):
    optall = ''
    for opt in opts:
        optall += opt
    os.system(perlname + optall)
    
def mk_otu1(func):
    option1 = [r" -s 1 -in meta.fasta -gp meta.groups",]
    run_perl(func, option1)
    print 'good, mk_otu1 done'
    
def mk_otu2(func):    
    option2 = [r" -s 2a3456 -in meta.fasta -gp meta.groups",]
    run_perl(func, option2)
    print 'good, mk_otu2 done'
    
def mk_otu(func):
    mk_otu1(func)
    mk_otu2(func)
    print 'good, mk_otu done'
    
def classify(func):
    option2 = r" -s 2c -in meta.fasta -gp meta.groups -na meta.names -p 10"
    run_perl(func, option2)
    print 'good, classify done'
    
def map_otu_tax(func):
    option = {}
    option["s"] = '7'
    option["list"] = " -list meta.unique.align.good.filter.pick.precluster.fn.list"
    option["tax"] = " -tax meta.unique.species.wang.taxonomy"
    option["gp"] = " -gp meta.good.pick.groups"
    option["na"] = " -na meta.names"
    option["share"] = " -share meta.unique.align.good.filter.pick.precluster.fn.shared"
    get_oturep = ['s','list','tax','gp','na']
    mk_rarefaction = ['s','dist','list','na','share','gp']

    run_perl(func, [option[key] for key in get_oturep])
    run_perl(func, [option[key] for key in mk_rarefaction])
        
perl = r"pipe-otutax.pl"

step = 0
"""mk_otu1(perl)
print "mk_otu1 done."
step += 1

mk_otu2(perl)
print "mk_otu2 done."
print "mk_otu done."
step += 1

classify(perl)
print "mk_otu done."
step += 1

map_otu_tax(perl)
print "map_otu_tax done"
step += 1

if step == 4:
    print "wahaha,all done."
"""

