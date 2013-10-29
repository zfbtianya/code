#!/usr/bin/python
import threading
import time

def context(tJoin):
	print 'in threadContext.'
	tJoin.start()
	tJoin.join()
	print 
