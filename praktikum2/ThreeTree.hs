module ThreeTree where

threeTree :: [Int] -> [Int]
threeTree [] = []
threeTree li  
    | mod (head li) 3 == 0 = (head li) : threeTree (tail li)
    | otherwise = threeTree (tail li)