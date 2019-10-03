f :: Num num => num -> num
f x  = 4*x+1

main :: IO()
main = print $ f 5