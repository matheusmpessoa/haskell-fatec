module ProvaCorrigida where

import Data.Monoid


{-
A fun¸c˜ao min no Haskell retorna o menor entre dois n´umeros, por exemplo, min 4 5 = 4.
(a) Crie um tipo Min com um campo inteiro que seja instˆancia de Ord, Eq e Show (deriving).
(b) Crie uma instˆancia de Monoid para Min (maxBound representa o maior inteiro existente no Haskell).
(c) Quanto vale a express˜ao Min (-32) <> Min (-34) <> Max (-33)?
(d) Explique sua escolha para o mempty.
(e) Crie uma fun¸c˜ao minAll que recebe um [Min] e retorna um Min contendo o menor valor
-}

data Min = Min Int  deriving (Ord, Eq, Show)
{-o elemento neutro retorna o maior elemento, como a função
retorna o menor então o maior se torna o elemento neutro-}
{-retorna o menor valor entre a e b-}

instance Monoid Min where
    mempty = Min (maxBound)
    mappend (Min a)(Min b) = Min (min a b)

minAll :: [Min]->Min
minAll x = mconcat x



{-
O tipo data Valido a = Sim a | Nao representa um contˆeiner de valores v´alidos. Usando este tipo
(a) (0.5) Crie uma instˆancia de Funtor para Valido.
(b) (1.0) Fa¸ca uma fun¸c˜ao safeLog :: Double → Double → V alido Double que faz o log (n˜ao h´a log de n´umeros
negativos) de modo seguro.
(c) (0.5) Crie uma express˜ao para representar 4 − log 9 onde o log ´e feito pelo safeLog.
(d) (0.5) Crie uma fun¸c˜ao elevarT odos :: [V alido Double] → [V alido Double] que eleva ao quadrado todos os
elementos da lista passada por parˆametro.
-}


data Valido a = Sim a | Nao deriving Show

instance Functor Valido where
    fmap f (Sim x) = Sim (f x)
    fmap f Nao = Nao

safeLog :: Double -> Double -> Valido Double
safeLog x y |x < 0 = Nao
            |otherwise = (Sim (logBase x y))

funcLog = safeLog 4 9

elevarTodos :: [Valido Double] -> [Valido Double]
elevarTodos [] = []
elevarTodos xs = map (fmap (**2)) xs

{-
Considere a seguinte fun¸c˜ao:
twice :: (t -> t) -> t -> t
twice f x = f(f x)
e responda:
(a) O que faz a fun¸c˜ao?
(b) Qual o valor da express˜ao twice(\x -> x + 3)5?
(c) Qual o valor da express˜ao twice(\x -> x ++['G'])”AF”?
(d) Qual o valor da express˜ao map(twice(*2))[-2..2]?
(e) Qual o tipo da fun¸c˜ao?
-}

{-
a) recebe uma funcão qualquer aplica a si mesma e a interner na x
b) twice(\x → x + 3)5 = 11 = 5+3 = 8 +3 = 11
c)twice(\x -> x ++['G'])"AF" ="AFGG" = AF ++ G = AFG = AFG ++ G = AFGG
d)map(twice(*2))[-2..2] = [-8,-4,0,4,8] = [-2, -1 ,0 ,1 ,2] = [-4, -2, 0, 2, 4] = [-8, -4, 0, 4, 8]
-}

twice f x = f(f x)


{-Fa¸ca uma fun¸c˜ao foo que retorne todas as combina¸c˜oes (tipo [String]) de uma String como no exemplo abaixo:
(a) foo ’’ate’’ = [””,”a”,”t”,”ta”,”e”,”ea”,”et”,”eta”]
(b) foo ’’fi’’ = [””,”f”,”i”,”if”]
(c) foo ’’d’’ = [””,”d”]
Dica: foldl com valor inicial [ [ ] ]. Tipo do foldl :: (b− > a− > b)− > b− > [a]− > b
-}

foo :: String -> [String]
foo [] = [[]]
foo (x:xs) = xss ++ map (x:) xss
    where xss = foo xs



{-
(a) (1.0) Qual o valor da express˜ao wd [8,9,1,3,-2];
(b) (0.5) Fa¸ca o ”teste de mesa” da express˜ao acima;
(c) (0.5) Explique com clareza a linha 3.
c = ela recebe uma ordenada a, recebe uma lista de a e devolve uma lista ordenada de a
(d) (0.5) Explique com clareza as linhas 4 e 5.
linha 4, se a lista for vazia, devolve vazia
linha 5, ela ordena a lista, onde tudo que for menor que o centro [x] fica a esquerda e maior a direita
-}
{-ela pega o meio e tudo que for menor vai para a esquerda e tudo que for maior vai para a direita-}
wd :: (Ord a) => [a] -> [a]
wd [] = []
wd (x:xs) = wd sm ++ [x] ++ wd ms
        where
            ms = filter(>=x) xs
            sm = filter(< x) xs


