#!/usr/bin/python

import threading

def func():
	print 'func() pass to Thread'

t = threading.Thread(target=func)
t.start()

class MyThread(threading.Thread):
	def run(self):
		print 'MyThread extended from Thread'

t = MyThread()
t.start()
