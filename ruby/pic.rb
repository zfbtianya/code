# -*- coding: utf-8 -*-
require 'gruff'

g = Gruff::Line.new
g.font = File.expand_path("/home/zengfb/.fonts/simsun.ttc")
g.title = "My Graph"
g.data("火星",[1,2,3,4,4,3])
g.data("土星",[8,2,3,4,4,8])
g.labels = {0=>"2006",2=>"2008",4=>"2010"}
g.write('a.png')
