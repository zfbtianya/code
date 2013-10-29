#!/usr/bin/ruby

puts "top"+'-'*10
puts self
1.times do
  puts "3"+'-'*10
  puts self
  class A
    puts "class A"+'-'*10
    puts self
    def hi
      puts self
      puts %{hello}
    end
  end
end
puts '-'*10+"run"+'-'*10
puts self
A.new.hi
