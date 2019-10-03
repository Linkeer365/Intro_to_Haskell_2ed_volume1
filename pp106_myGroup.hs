-- 这个签名不难写, 因为要判断相等, 因此Eq肯定要有, 
-- 因为最后是[[1,1],[2],[3,3]]这样, 那么肯定使用[[a]]类型
-- 2019年10月3日20:07:50 , 半小时想不出来group要怎么写
group'::Eq a => [a] -> [[a]]
-- 先写特解, 启发思路
-- 实现失败, 不知道怎么将这个状态单纯用x和xs描述出来
-- 比如说 1,1, 这个东西显然是要在读到 1/= 2 的时候, 才能++ 进去, 这么说来就需要一个列表来存这个1,1, 并且1/=2的时候, 需要
-- 借此判断一下
-- 1. 如果空列表, 那么很好, 直接将单个元素插入列表, 再插入总的列表
-- 2. 如果列表非空, 那么要将这个重复列表插入总的列表, 然后重复列表清空.
group' [] = []
group' [x] = [[x]]

-- not (null (takeWhile (/=head someList) (tail someList))) -> 判断是否"无重复数字", then则无重复数字, else表示有重复数字
-- span的思想,(因为肯定是从头开始重复!) 
-- 将重复的元素直接takeWhile dropWhile进行一波分割.
group' someList =   if not (null (takeWhile (/=head someList) (tail someList))) then group' [head someList] ++ group' (tail someList)
                    else [takeWhile (==head someList) someList] ++ group' (dropWhile (==head someList) someList)


main::IO()  
main=print $ group' [1,2,2,3,4]
