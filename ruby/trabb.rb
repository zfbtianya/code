def f(x)
  Math.sqrt(x.abs)+5*x**3
end
2.times.collect{gets.to_i}.reverse.each do |x|
  y = f(x)
  puts "#{x} #{y.infinite? ? 'TOO LARGE' : y}"
end
