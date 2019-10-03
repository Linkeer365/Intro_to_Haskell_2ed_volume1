-- fib 函数声明及函数定义
fib :: Int -> Int
fib 0 = 0
fib 1 = 1
fib n = fib (n -1) + fib(n - 2)
-- 开始使用fib函数
main :: IO ()
-- 这个$作用是, 提升fib优先级, 相当于一个括号的代替品.
-- 例子: f (g x) == f $ g x
-- https://stackoverflow.com/questions/19521246/what-does-mean-do-in-haskell#19521376
main = print $ fib 10