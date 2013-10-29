#!/usr/bin/ruby

fd = IO.sysopen("./a.txt","w")
p IO.new(fd)
io_streams = Array.new
ObjectSpace.each_object(IO){|x| io_streams << x}
p io_streams
mode = "r"
file = File.open("a.txt",mode)
puts file.inspect
puts file.read



