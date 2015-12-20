data Name = NameConstr String
data Color = ColorConstr String


showInfos :: Name -> Color -> String
showInfos (NameConstr name) (ColorConstr color) =
                       "Name: " ++ name ++ ", Color: " ++ color
name = NameConstr "Robin"
color = ColorConstr "Blue"
-- now swapping parameter order will not compile
main = putStrLn $ showInfos color name
