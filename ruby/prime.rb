datas = (2..100).to_a
primes = []
while first = datas.shift
  primes << first
  datas.reject! { |x| x % first == 0 }
end
p primes
