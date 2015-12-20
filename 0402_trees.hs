treeFromList :: (Ord a) => [a] -> BinTree a
treeFromList [] = Empty
treeFromList (x:xs) = Node x (treeFromList (filter (<x) xs))
                             (treeFromList (filter (>x) xs))
data BinTree a = Empty
                 | Node a (BinTree a) (BinTree a)
                    deriving (Eq, Ord)

instance (Show a) => Show (BinTree a) where
  show t = "< " ++ replace '\n' "\n: " (treeshow "" t)
    where
    -- don't show empty
    treeshow pref Empty = ""

    -- Leaf
    treeshow pref (Node x Empty Empty ) = (pshow pref x)

    -- Right branch is empty
    treeshow pref (Node x left Empty) =
                  (pshow pref x ) ++ "\n" ++
                  (showSon pref "`--" "   " left)

    -- Left branch is empty
    treeshow pref (Node x Empty right) =
                  (pshow pref x) ++ "\n" ++
                  (showSon pref "`--" "   " right)

    -- Tree with left and right children non empty
    treeshow pref (Node x left right) =
                  (pshow pref x) ++ "\n" ++
                  (showSon pref "|--" "|  " left) ++ "\n" ++
                  (showSon pref "`--" "   " right)

    -- shows a tree using some prefixes to make it nice
    showSon pref before next t =
                  pref ++ before ++ treeshow (pref ++ next) t

    -- pshow replaces "\n" by "\n"++pref
    pshow pref x = replace '\n' ("\n"++pref) (show x)

    -- replaces one char by another string
    replace c new string =
      concatMap (change c new) string
      where
        change c new x
          | x == c = new
          | otherwise = x:[] -- "x"

main = do
  putStrLn "Int binary tree:"
  print $ treeFromList [7,2,4,8,1,3,6,21, 12, 23]
  print $ treeFromList ["foo","bar","baz","gor","yog"]
  print $ ( treeFromList
              (map treeFromList ["baz","zara","bar"]))
  putStrLn "\nTree of Binary trees of Char binary trees:"
  print $ (treeFromList . map (treeFromList . map treeFromList))
            [ ["YO","DAWG"]
            , ["I","HEARD"]
            , ["I","HEARD"]
            , ["YOU","LIKE","TREES"] ]
