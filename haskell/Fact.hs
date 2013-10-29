module Fact where

fact :: Integer -> Integer
fact n = product [1..n]

comb n r = fact n `div` (fact r * fact (n-r))
