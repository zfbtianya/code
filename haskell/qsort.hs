qsort :: Ord a => [a] -> [a]
qsort [] = []
qsort (p:xs) = (qsort lesser) ++ [p] ++ (qsort greater)
  where
    lesser = filter (< p) xs
    greater = filter (>= p) xs
qsort1 [] = []
qsort1 (p:xs) = qsort1 [x | x<-xs, x<p]  ++ [p] ++ qsort1 [x | x<-xs, x>p]

fac n = if n == 0 then 1 else n * fac (n - 1)
secsToWeeks secs = let perMinute = 60
                       perHour = 60 * perMinute
                       perDay = 24 * perHour
                       perWeek = 7 * perDay
                   in secs /perWeek
classify age = case age of
  0 -> "newborn"
  1 -> "infant"
  2 -> "toddler"
  _ -> "senior citizen"
split [] = []
split [a] = a
split ([body|tail]) = tail
