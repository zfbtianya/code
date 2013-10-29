#!/usr/bin/env ruby

str = "what day is it today?"

result = []
while token = str.slice(/\w+/)
  result.push token
  str = $'
end

p result                        # =>
