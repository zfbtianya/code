print ( 'Enter your name:' )
name = gets
puts "Hello #{name}"
class Dog
  def initialize(aName)
    @myname = aName
  end
  attr_accessor :myname
end

class MyArray < Array
  include Comparable
  def <=> (anotherArray)
    self.length <=> anotherArray.length
  end
end
def dothings (aNum)
  i = 0
  while true
    puts ("I'm doing things...")
    i += 1
    throw(:go_for_tea) if (i == aNum)
  end
end

catch(:go_for_tea){
  dothings(5)
}
