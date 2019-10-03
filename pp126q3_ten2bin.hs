import Data.List
-- subtrahend 47=[32,64] -> 32
-- 出了问题不妨先check一下模式匹配
subtrahend 0 = 0
subtrahend 1 = 1
subtrahend n =  if n<0 then error "subtrahend n <0 " else last $ takeWhile (<=n) $ power2_pool
                    where power2_pool=iterate (*2) 1
-- 这个地方做一个参数绑定, 把 iterate (*2) 1 绑定为 power2_pool
-- log2 32 = 5

log2 n =    if n<=0 then error "log2 n<=0 " else (length $ takeWhile (<=n) $ power2_pool) -1
                where power2_pool=iterate (*2) 1
-- displayAsBin 5 = 10000, 这里的5 指的是指数

displayAsBin 0 = 0
displayAsBin n = if n<=0 then error "displayAsBin n<1" else 10^(n-1)

ten2bin 0 = 0
ten2bin n = (displayAsBin $ log2 $ subtrahend n) + ten2bin (n - subtrahend n)

main::IO()

main= print $ ten2bin 32



