#!/usr/bin/ruby

def fun(f,a)
  f(1,a)
end

def sum(a,b)
  a+b
end

p fun(sum,1)


=begin
def five(a,b,c,d,e)
  "I was passed #{a} #{b} #{c} #{d} #{e}"
end

p five(1,2,3,4,5)
p five(1,2,4,*['a','b'])
p five(*(10..14).to_a)
=begin
def varargs(arg1,*rest)
  "Got #{arg1} and #{rest.join(', ')}"
end
p varargs("one")
p varargs("one","two")
p varargs("one","two","three")

=begin
def showRE(a,re)
  if a =~ re
    "#{$`}<<#{$&}>>#{$'}"
  else
    "no match"
  end
end
p showRE('very insterestring',/t/)
p showRE('Fats Waller',/ll/)
p showRE("this is\nthe time",/^the/)
p showRE("this is\nthe time",/is$/)
p showRE('It costs $12.',/[aeiou]/)
p showRE('It costs $12.',/[\s]/)
p "12:50am" =~ /((\d\d):(\d\d))(..)/
p "Hour is #$2,minute #$3"
p "Time is #$1"
p "AM/PM is #$4"
=begin
a = Regexp.new('^\s*[a-z]')
b = /^\s*[a-z]/
c = %r{^\s*[a-z]}
p a.class
p b.class
p c.class

=begin
while gets
  print if /start/../end/
end

=begin
class VU
  include Comparable
  attr :volume
  def initialize(volume)
    @volume = volume
  end
  def inspect
    '#' * @volume
  end
  #support for ranges
  def <=>(other)
    self.volume<=>other.volume
  end
  def succ
    raise(IndexError,"Volume too big") if @volume >= 9
    VU.new(@volume.next)
  end
end

medium = VU.new(4)..VU.new(7)
p medium.to_a
p medium.include?(VU.new(3))

=begin 
module M;end
class A;include M;end
class B < A;end
class C < B;end

b = B.new
p b.instance_of? A
p b.instance_of? B
p b.instance_of? C
p b.instance_of? M

p b.is_a? A
p b.is_a? B
p b.kind_of? C
p b.kind_of? M
p B.ancestors
=begin
class Logger
  private_class_method :new
  @@logger = nil
  def Logger.create
    @@logger = new unless @@logger
    @@logger
  end
end
p Logger.create
p Logger.create
person = "zfb"
p person.object_id
=begin
class Customer
  @@no_of_customers=0
  def initialize(id, name, addr)
    @cust_id=id
    @cust_name=name
    @cust_addr=addr
   end
  def display_details()
    puts "Customer id #@cust_id"
    puts "Customer name #@cust_name"
    puts "Customer address #@cust_addr"
  end
  def total_no_of_customers()
    @@no_of_customers += 1
    puts "Total number of customers: #@@no_of_customers"
  end
end

=begin
cust1 = Customer. new
cust2 = Customer. new

cust1=Customer.new("1", "John", "Wisdom Apartments, Ludhiya")
cust2=Customer.new("2", "Poul", "New Empire road, Khandala")
cust1.display_details()
cust1.total_no_of_customers()
p cust1.to_s

class Sample
   def hello
      puts "Hello Ruby!"
   end
end
# Now using above class to create objects
object = Sample.new
object.hello
puts object.inspect
=end
