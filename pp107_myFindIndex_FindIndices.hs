-- 因为不会maybe, 所以先做一个没有maybe版本的
-- 今日xjb签名第5回, 函数签名要用括号括起来!!!, 要体现出映射关系!!!
-- findIndex'::func -> [a] -> Int

-- 这才是真正训练到了签名的一节练习!!
-- 从一开始不知道函数签名要体现括号, 再到忘记使用不等关系要载入Eq类型类!!
-- (2019年10月3日05:50:24) 我感觉实现这个真是人生之幸.
findIndex':: Eq a => (a -> Bool) -> [a] -> Int
findIndex' func someList =  (length $ takeWhile (/=target) someList) +1 -1
                                where target = head $ filter func someList

-- 实现findIndices失败了, 我觉得主要是递归做得不太好...
-- 这个地方注意, 签名最后是[Int]而不是[a]!!
findIndices':: Eq a => (a -> Bool) -> [a] -> [Int]
-- 2019年10月3日15:58:16 终于想出来了
-- 加入func [] = [] 防止在后面空集的时候输出 empty list
-- map (+1) 表示每缩短一次someList都相当于偏移了1位, 以此来实现一个"计数"的作用(每处理过一个元素, 都产生一个向后偏移的结果) 
findIndices' func [] = []
findIndices' func someList = if ((head someList) `elem` targets) then (findIndex' (== (head someList)) someList):(map (+1) $ findIndices' func (tail someList)) else (map (+1) $ findIndices' func tail someList))
                                        where targets = filter func someList

main::IO()
main =  do
        print $ findIndex' even [1,3,5,7,8,9]
        print $ findIndices' even [1,2,3,4,5,6,7,8,10,12]

-- elemIndex 和 elemIndices 就是 find (==some_num) 不多提.