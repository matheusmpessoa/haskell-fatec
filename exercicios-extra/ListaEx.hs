module ListaEx where
{-
   Faça uma função que retorne o desvio padrão de um [Double] usando foldl.
 O desvio padrão de um vetor é dado por σ =rPn i=1(xi−x)2 n−1, onde x é a média deste vetor


Dados não agrupados
[2, 3, 4, 3, 5, 4, 3]

1º Passo
x = somatorio x / n

--}

{--somatorio :: [Int] -> [Int]
somatorio xs = sum xs

media :: [Int] -> Double
media x = somatorio / (length somatorio)--}

somaPopulacao :: [Int] -> Int
somaPopulacao [] = 0
somaPopulacao (a:x) = a + somaPopulacao x

mediaX :: [Int] -> Double
mediaX [] = 0.0
mediaX
