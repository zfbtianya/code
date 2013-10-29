#!/usr/bin/env ruby


def go(x,y)
  (x .. (y**0.5).to_i).all_palindromes
end

class Range
  def all_palindromes
    results = []
    self.each do |i|
      if i.is_palindrome? && (j = i ** 2).is_palindrome?
        results << j
      end
    end
    results
  end
end

class Integer
  def is_palindrome?
    to_s.is_palindrome?
  end
end

class String
  def is_palindrome?
    results = true
    (0 .. self.size / 2).each do |i|
      results &&= (self[i] == self[-1-i]) and results
      return results unless results
    end
    results
  end
end

puts go(1,10**14)
