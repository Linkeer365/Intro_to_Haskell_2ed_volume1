take'::Int -> [a] -> [a]
-- 从此可以看出, 模式匹配, 守卫式子, if then else 都是相亲相爱的, 也都是并行不悖的. 
take' 0 [] = []
take' int someList  | (int < 0) && (null someList) = error "take': empty list and negative num."
                    -- | 0 [] = []
                    | (length someList <= int) = someList
                    | (length someList > int) = take' int (init someList)

main::IO()
-- main=print $ (take' 0 ([]::String))
main = print $ take' 4 [1,2,3]