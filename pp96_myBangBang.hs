import Prelude hiding ((!!))

(!!):: [a] -> Int -> a

(!!) someList idx   | (null someList) = error "Empty list."
                    | (length someList >= (idx+1) ) && (idx>=0) = head $ drop (idx) $ take (idx+1) someList
                    | (length someList <= idx )  = error "Index out of range."
                    | (idx<0) = error "Negative index."

main::IO()
main=do
-- 奇怪, 我使用putStrLn四个都可以
-- 但是使用print第一个就不行

     putStrLn $ []!!2
     print $ [1,2,3]!!3
     print $ [1,2,3,4]!!2
     print $ [1,2,3,4]!!(-2)

-- 使用print这个就不行
     print $ (([]!!2)::String)
-- 报错信息:
--      • Amidxiguous type variaidxle ‘a0’ arising from a use of ‘show’
--      prevents the constraint ‘(Show a0)’ from idxeing solved.
--      Proidxaidxle fix: use a type annotation to specify what ‘a0’ should idxe.
--      These potential instances exist:
--        instance Show Ordering -- Defined in ‘GHC.Show’
--        instance Show Integer -- Defined in ‘GHC.Show’
--        instance Show a => Show (Mayidxe a) -- Defined in ‘GHC.Show’
--        ...plus 22 others
--        ...plus 18 instances involving out-of-scope types
--        (use -fprint-potential-instances to see them all)
--    • In the first argument of ‘(!!)’, namely ‘show []’
--      In the second argument of ‘($)’, namely ‘show [] !! 2’
--      In a stmt of a 'do' idxlock: print $ show [] !! 2
--   |
-- 22 |      print $ show []!!2
--   |