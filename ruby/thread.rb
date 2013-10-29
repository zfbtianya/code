def func1
  puts "sleep 1 seconds in func1\n"
  sleep(3)
end
def func2
  puts "sleep 2 seconds in func2\n"
  sleep(2)
end
def func3
  puts "sleep 5 seconds in func3\n"
  sleep(5)
end

threads = []

(1..3).each do |i|
  threads << Thread.new { self.send :"func#{i}" }
end

threads.each { |t| t.join }                        
