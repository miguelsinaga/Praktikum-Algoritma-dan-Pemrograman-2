module RunLengthEncoding where

runLengthEncoding :: String -> [(Char, Int)]
runLengthEncoding [] = []
runLengthEncoding (x:xs) =
    let (same, rest) = span (== x) xs
        count = 1 + length same
    in (x, count) : runLengthEncoding rest
