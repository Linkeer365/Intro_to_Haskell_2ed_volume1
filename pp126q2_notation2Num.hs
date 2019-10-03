import Data.List

romeNotations ::[String]
romeNotations = ["M","CM","D","CD","C","XC","L","XL","X","IX","V","IV","I"]

romeAmount::[Int]
romeAmount = [1000,900,500,400,100,90,50,40,10,9,5,4,1]

pair::[(String,Int)]
pair = zip romeNotations romeAmount

-- getValueByKey::[(a,a)] -> a -> a
-- getValueByKey someTupleList someKey = 

-- find':: String -> [a] -> Int
-- find' key tupleList =

-- 因为库函数里头的find返回一个Just的鬼东西不知道是什么, --> 之后要去查一下Just 是什么!
-- 自定义Just, 范围比较小, 抽象度不高.
find'::String -> Int 
find' key = romeAmount!!((length (takeWhile (/=key) romeNotations)) +1 -1)


notation2Num::String -> Int
notation2Num [] = 0
notation2Num notations  | firstTwoCharList `elem` romeNotations     = find' firstTwoCharList + notation2Num (drop 2 notations)
                        | otherwise                                 = find' firstOneCharList + notation2Num (drop 1 notations)
                        where fstElem          = head notations
                              sndElem          = head (tail notations)
                              firstOneCharList = ([fstElem])
                              firstTwoCharList = ([fstElem]++[sndElem])

main::IO()
main = print $ notation2Num "MCM"
-- 这样子写有点麻烦, 因为既要定义M>D, 同时也要定义 M> C, 就非常繁琐!!
-- 有没有类型类能够直接帮我定义好这些大小关系的呢?, 就比如说我定义好了 M > C , C > D, 就能直接推导出 M > D这样的?
-- 另一个问题, 就是, 如果出现了 IM这种情况, 显然是有问题的, 出现这种错误可以直接将判定终止, 这个要怎么去写.

-- notSmaller:: Char -> Char -> Bool
-- notSmaller 'M' 'D' = True
-- notSmaller 'D' 'C' = True
-- notSmaller 'C' 'X' = True
-- notSmaller 'L' 'X' = True
-- notSmaller 'X' 'V' = True
-- notSmaller 'V' 'I' = True
-- notSmaller a b = if (a==b) then True else False

-- main::IO()
-- main=print $ notSmaller


