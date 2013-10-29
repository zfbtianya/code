#!/usr/bin/ruby
begin
  "firstzfbxend".match(/(zfb(.))/)
  $\="\n\n"
  $,="\t"
  $;="\t"
  print ($<).class
  print [$>,$<,$*]
  p $:
  #$stdout.write
  print "a\nb\nc\tddd".split
  puts [$&,$`,$',$+,$1,$2,$3,$~].join
  puts 'a'
  puts 'b'
  print 'a','b','c'
#  1/0

end

=begin
i0 = 1
loop {
  i1 = 2
  puts defined? i0
  puts defined? i1
  break
}
puts defined? i0
puts defined? i1
=end
=begin
module Test_variable
$Global = "world!"

class Class1
  @@I = 0
  def initialize()
    @name = "Zfb."
  end
  def test()
    a = 1234
    puts a
  end
end
=end
=begin
class Example
  VAR1 = 100
  VAR2 = 200
  def show
    puts "Value of first Constant is #{VAR1}"
    puts "Value of second Constant is #{VAR2}"
  end
end
# Create Objects
object=Example.new
object.show


p __FILE__
p __LINE__
p ?a
p 'a'
hsh = colors = { "red" => 0xf00, "green" => 0x0f0, "blue" => 0x00f }
puts colors
puts hsh

MR_COUNT = 0
module Foo
  MR_COUNT = 0
  ::MR_COUNT = 1    # set global count to 1
  MR_COUNT = 2      # set local count to 2
end
puts MR_COUNT       # this is the global constant
puts Foo::MR_COUNT  # this is the local "Foo" constant
CONST = ' out there'
class Inside_one
  CONST = proc {' in there'}
  def where_is_my_CONST
    ::CONST + ' inside one'
  end
end
class Inside_two
  CONST = ' inside two'
  def where_is_my_CONST
    CONST
  end
end
puts Inside_one.new.where_is_my_CONST
puts Inside_two.new.where_is_my_CONST
puts Object::CONST + Inside_two::CONST 
$debug=1
print "debug\n" if $debug
x = 1
unless x>2
  puts "x is less than 2"
else
  puts "x is greater than 2"
end
$age =  5
case $age
when 0 .. 2
  puts 3 .. 2
when 3 .. 6
  puts "little child"
when 7 .. 12
  puts "child"
when 13 .. 18
  puts "youtch"
else
  puts "adult"
end

$i = 0;
$num = 5;
begin
  puts("Inside the loop i = #$i" );
  $i +=1;
end while $i < $num

for i in 0..5
  if i < 2 then
    puts "Value of local variable is #{i}"
    #redo #break,next
  end
end
=end
=begin
Value of local variable is 0
Value of local variable is 0
............................
=end
=begin
def sample (*test)
  puts "The number of parameters is #{test.length}"
  puts test.class
  for i in 0...test.length
    puts "The parameters are #{test[i]}"
  end
end
sample "a","b","c"
sample "a","b","c",'d'

class Accounts
  def reading_charge
  end
  def Accounts.return_date
    puts 'Accounts.return_date'
  end
end
Accounts.return_date
def test
   puts "You are in the method"
   yield
   puts "You are again back to the method"
   yield
end
test {puts "You are in the block"}
end
=end
