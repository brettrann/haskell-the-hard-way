import Data.List (foldl')
evenSum l = foldl' (\x y -> x+y) 0 (filter even l)
