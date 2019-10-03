-- min'::Int -> Int -> Int
min' a b = if (a<=b) then a else b
max' a b = if (a<=b) then b else a

-- minOfList'::[Int] -> Int
minOfList' [] = error "minOdList: No elem in list."
minOfList' [x] = x
minOfList' (x:xs) = min' x (minOfList' xs)
-- x是被取元素, xs相当于剩余列表, 因为列表的本质就是: [1,2,3,4] => 1:2:3:4:[], 所以1:[2,3,4] 就是列表!
-- 这里不要写成中括号!!, 低级错误*1

main::IO()
main=print $ minOfList' [1,2,3,4]