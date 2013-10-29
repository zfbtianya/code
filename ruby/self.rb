#!/usr/bin/ruby

def hi
  puts self
  puts "hello"
end

def self.hi2
  puts self
  puts "hello2"
end

hi
#self.hi
hi2
self.hi2
