class Thing
  @@num_things = 0
  def initialize(aName, aDescription)
    @@num_things += 1
  end
end

class MyClass
  @@classvar = 1000
  @instvar = 1000
  def self.classMethod
    if @instvar == nil then
      @instvar = 10
    else
      @instvar += 10
    end
    if @@classvar == nil then
      @@classvar = 10
    else
      @@classvar += 10
    end
  end
  def instanceMethod
    if @instvar == nil then
      @instvar = 1
    else
      @instvar += 1
    end

    if @@classvar == nil then
      @@classvar = 1
    else
      @@classvar += 1
    end
  end
  def showVars
    return "(instance method) @instvar = #{@instvar}, @@classvar = #{@@classvar}"
  end
  def self.showVars
    return "(class method) @instvar = #{@instvar}, @@classvar = #{@@classvar}"
  end
end
class MyClass
  def initialize(aStr)
    @avar = aStr
  end
  def self.new(aStr)
    super
    @anewvar = aStr.swapcase
  end
end

class Creature
  def initialize(aSpeech)
    @speech = aSpeech
  end
  def talk
    puts(@speech)
  end
end

ob = Object.new
class << ob
  def blather(aStr)
    puts "blather,blather #{aStr}"
  end
end

class MyClass
  def instanceMethod
    puts "This is an instance method"
  end
end

ob = MyClass.new
ob.instanceMethod

def aMethod(a=10, b=20, c=100, *d)
  return a,b,c,d
end

begin
  x = 1/0
rescue Exception
  x = 0
  puts $!.class
  puts $!
end
puts x
def calc(val1, val2)
  begin
    result = val1 / val2
  rescue Exception => e
    puts e.class
    puts e
    result = nil
  end
  return result
end
