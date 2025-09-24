module SecondLargest where

max2 :: Int -> Int -> Int
max2 x y = if x > y then x
        else y

maxlist :: [Int] -> Int
maxlist [] = 0
maxlist [x] = x
maxlist l = max2 (head l) (maxlist (tail l))

secondLargest :: [Int] -> Int
secondLargest []  = 0
secondLargest [_] = 0
secondLargest l   = maxlist (filter (/= m) l)
  where
    m = maxlist l
