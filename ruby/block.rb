#!/usr/bin/ruby


def calculation(a,b,&block)
  block.call(a,b)
end

puts calculation(5,5) {|a,b| a+b}
Filter = lambda do |array,&block|
  array.select(&block)
end
p Filter.call([1,2,3,4]){|n| n.even?}

=begin
def test
  i = 1
  puts "you are in the method"
  yield i
  i+=1
  puts 'zfb'
  yield i
end
test {|i| puts "hello #{i}"}
=end
