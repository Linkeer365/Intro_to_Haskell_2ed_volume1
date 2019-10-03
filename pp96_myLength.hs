-- length'::[a] -> a
-- 这里要怎么进行签名呢?
length' [] = 0
length' [x] = 1
length' (x:xs) = length' xs + 1

main::IO()

main=print $ length' 

-- null实现用列表长度为0去做即可, 这里就不多写了
