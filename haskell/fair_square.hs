isPalindrome :: (Integral a, Show a)=> a -> Bool
isPalindrome x = s == reverse s where
  s = show x
  
checkResult :: (Integral a, Show a) => a -> Bool
checkResult x = all isPalindrome [x, x^2]

main = do
  putStrLn $ show $ take 39 [x^2 | x <- [1..], checkResult x]
