f :: Int -> Bool -> Bool
f num bool2 = if num==3 && bool2 then True else False
f :: Int -> Char -> Bool
f num char = if num==4 && char=='d' then True else False

main::IO()

main = print $ f 3 