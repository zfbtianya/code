#!/usr/bin/env ruby

class Array
  def each1
    for e in self
      yield e
    end
  end
end

[1,3,4].each1 {|x| puts x}

