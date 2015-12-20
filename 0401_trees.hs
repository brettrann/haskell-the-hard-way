import Data.List

data BinTree a = Empty
                 | Node a (BinTree a) (BinTree a)
                              deriving (Show)

treeFromList :: (Ord a) => [a] -> BinTree a
treeFromList [] = Empty
treeFromList (x:xs) = Node x (treeFromList (filter (<x) xs))
                             (treeFromList (filter (>x) xs))

main = print $ treeFromList [4, 8, 3, 6, 6, 2, 3, 1]
