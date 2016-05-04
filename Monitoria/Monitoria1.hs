module Monitoria1 where

data Arvore = Galho | Folha | Nada deriving show

mapF :: (Int -> Int) ->Arvore -> Arvore
mapF (\x ->x*2)

Arvore = (Galho 4 (Galho 2 (Folha 1) (Folha 3)) 
        (Galho 6 (Folha 5) (Nada))))
f1 = mapF (*2) Arvore
f2 = mapF (-1) Arvore
f3 = mapF (\x->foldL(2*)x[1..x]) Arvore
f4 = mapF (\x->foldL(1*)x[x'|x'<-[1..x],((mod x'2)==0)]) Arvore