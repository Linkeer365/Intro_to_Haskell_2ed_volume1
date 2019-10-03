-- 这个中缀运算符要怎么处理呢?

map':: a -> [a] -> [a]
map' a [] = error "map': empty list."
map' a [x] = [a x]
map' a (x:xs) = take (length xs + 1) ([a x] ++ map' a xs)

main::IO()
main=print $ map' (a) [1]