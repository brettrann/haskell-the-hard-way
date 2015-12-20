type Name = String
type Color= String

showInfos :: Name -> Color -> String
showInfos name color = "Name: " ++ name
                       ++ ", Color: " ++ color
name :: Name
name = "Robin"
color :: Color
color = "Blue"
-- switch name/color it still works. becayse the types are just aliases for String.
main = putStrLn $ showInfos color name
