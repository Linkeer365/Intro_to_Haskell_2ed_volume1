head'::[a] -> a
head' []  = error "head': empty list."
head' someList = someList!!0

last'::[a] -> a
last' []  = error "last': empty list."
last' someList = someList!!(length someList-1)

init'::[a] -> [a]
init' [] = error "init': empty list."
-- init' [x] = [] 理论依据是:
-- Prelude Data.List> init [1]
-- []
init' [x] = []
init' someList = take ((length someList)-1) someList

tail'::[a]->[a]
tail' [] = error "tail': empty list."
-- tail' [x] = [] 理论依据是:
-- Prelude Data.List> tail [1]
-- []
tail' [x]=[]
tail' (x:xs) = xs



main::IO()
main=print $ tail' [1,2,3] 