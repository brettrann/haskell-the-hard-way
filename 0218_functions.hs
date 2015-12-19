import Data.List (foldl')
evenSum l = foldl' (+) 0 (filter even l)
