#! /usr/bin/env ruby
class ThrowExceptionL<Exception
  p 'Err L'
end
begin
  raise ThrowExceptionL,"got err"
rescue ThrowExceptionL=>e
  p "Err #{e}"
end
#! /usr/bin/env ruby

p ARGV
`cp src des`
src = find_src()
des = find_des()

def find_src(path,pattern)
  arr = []
  if is_file?(path.first)
    if path.first =~ pattern
      arr += path.first
    end
  elsif is_path?(path.first)
    find_src(path.first)
  end
end
      
end
def find_des()
end

def cp(src,des)
  `touch #{src}`
end

def src_path(arr = ARG)
  pre = "~/lustre/scripts/"
  for s in arr
    return pre + 'its/' if s =~ /its/
    return pre + '16s/' if s =~ /16s/
  end
end

def src_name(arr)
  for s in arr
      return s if s =~ /uni/
      return s if s =~ /otu/
      return s if s =~ /tax/
      return s if s =~ /map/
  end 
end

def des_path(arr)
  return './'
end

def des_name(arr)
  src_name(arr)
end

def des_pre(arr)
  for s in arr
    return s[5..-1] if s =~ /-pre=.*/
  end
  return ''
end

def src(arr)
  return src_path(arr) + src_name(arr)
end

def des(arr)
  return des_path(arr)+des_pre(arr)+des_name(arr)
end

Thread.start{
  while true
    p "thread1"
  end
  }
while true
  p "thread2"
end
#! /usr/bin/env ruby

class MegaGreeter
  attr_accessor :names

  # Create the object
  def initialize(names = "world")
    @names = names
  end

  # Say hi to everybody
  def say_hi
    if @names.nil?
      puts "..."
    elsif @names.respond_to?("each")
      # @names is a list of some kind, iterate!
      @names.each do |name|
        puts "Hello #{name}!"
      end
    else
      puts "Hello #{@names}!"
    end
  end
  #Say bye to everybody
  def say_bye
    if @names.nil?
      puts "..."
    elsif @names.respond_to?("join")
      p "Goodbye #{@names.join(", ")}. Come back soon!"
    else
      p "Goodbye #{@names}. Come back soon!"
    end
  end
end

if __FILE__ == $0
  mg = MegaGreeter.new
  mg.say_hi
  mg.say_bye

  # Change name to be "Zeke"
  mg.names = "Zeke"
  mg.say_hi
  mg.say_bye

  #Change the name to an array of names
  mg.names = ["Albert","Brenda","Charles","Dave",
              "Englebert"]
  mg.say_hi
  mg.say_bye

  # Change to nil
  mg.names = nil
  mg.say_hi
  mg.say_bye
end
class SongList
  def initialize
    @songs = Array.new
  end
end
class SongList
  def append(aSong)
    @songs.push(aSong)
    self
  end
end
class SongList
  def deleteFirst
    @songs.shift
  end
  def deleteLast
    @songs.pop
  end
end
class SongList
  def [] (key)
    if key.kind_of?(Integer)
      @songs[key]
    else
      # ...
    end
  end
end
class SongList
  def [](key)
    if key.kind_of?(Integer)
      return @songs[key]
    else
      for i in 0...@songs.length
        return @songs[i] if key == @songs[i].name
      end
    end
  end
end
#
# The Dining Philosophers - thread example
#
require "thread"

N=7    # number of philosophers
$forks = []
for i in 0..N-1
  $forks[i] = Mutex.new
end
$state = "-o"*N

def wait
  sleep rand(20)/10.0
end

def think(n)
  wait();
end

def eat(n)
  wait();
end

def philosopher(n)
  while true
    think n
    $forks[n].lock
    if not $forks[(n+1)%N].try_lock
      $forks[n].unlock    # avoid deadlock
      next
    end
    $state[n*2] = ?|;
    $state[(n+1)%N*2] = ?|;
    $state[n*2+1] = ?*;
    print $state, "\n"
    eat(n)
    $state[n*2] = ?-;
    $state[(n+1)%N*2] = ?-;
    $state[n*2+1] = ?o;
    print $state, "\n"
    $forks[n].unlock
    $forks[(n+1)%N].unlock
  end
end

for i in 0..N-1
  Thread.start{philosopher(i)}
  sleep 0.1
end
sleep
exit
p $_
p "------------\n"
p 'argv=',ARGV.shift,"\n"
p ARGV ;
p $_
p '_=',"\n"
#$_,'\n'

require "thread"
m = Mutex.new
v = 0;

Thread.start{
  while true
    m.synchronize{
      v = v +100
    }
  end
}

while true
  m.synchronize{
    v = v -33
  }
end

def f1
  p caller
end
def f2
  f1
end
def f3
  f2
end

f3
