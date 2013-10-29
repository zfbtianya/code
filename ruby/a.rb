# -*- coding: utf-8 -*-
require 'gruff'

g = Gruff::Pie.new
g.font = File.expand_path("/home/zengfb/.fonts/simsun.ttc")
g.title = "My Graph"
g.data("火星",[1,2,3,4,4,3])
g.data("土星",[4,8,7,9,8,9])
g.data("水星",[2,3,1,5,6,8])
g.data("木星",[9,9,10,8,7,9])
g.labels = {0=>"2006",2=>"2008",3=>"2010"}
g.write('a.png')
