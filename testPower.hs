power 0 0 = 1
power _ 0 = 1
power x n = x * power x (n-1)

main :: IO()
main= print $ power 0 0

