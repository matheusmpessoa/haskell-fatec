module Aula5 where

{-- 0 é um value constructor de Integer e nao uma condição booleana
fat :: Integer -> Integer
fat 0 = 1
fat k = k * fat(k-1) --}

{-- GUARDS pra cada | inserido é uma condiçao que ele vai testar ate chegar no otherwise:
        uma serie de verificações booleanas executadas em ordem ate chegar no otherwise--}
fat :: Integer -> Integer
fat k
     | k <= 1 = 1
     | otherwise = k * fat (k-1)


fib :: Integer -> Integer
fib n
    |n <= 2 = 1
    | otherwise = fib (n-1) + fib (n-2)
{-- map fib [1..10]
[1,1,2,3,5...]--}


--------------------------------

eliminarVogais :: String -> String
eliminarVogais [] = [] --se chegar no fim da lista retorna []
eliminarVogais (x:xs)
               | elem x "AEIOUaeiou" = eliminarVogais xs
               | otherwise = x : eliminarVogais xs -- : coloca um caractere na frente da lista

-- a recursao elimina a palavra ate chegar no vazio

{-- exercicio: Faca recursivamente o que se pede:
    a) elimine todas as palavras de 4 letras de uma lista de strings e faça o teste de mesa do exercicio
    b) Elimine todos os pares "AA" de uma string e faça o teste de mesa
--}

eliminarPalavras :: [String] -> [String]
eliminarPalavras [] = []
eliminarPalavras (x:xs)
                 | length x == 4 = eliminarPalavras xs
                 | otherwise = x : eliminarPalavras xs

eliminarDuas :: String -> String
eliminarDuas [] = []
eliminarDuas (x:y:xs)
              | elem x "A" && elem y "A" = eliminarDuas xs
              | otherwise = x : eliminarDuas (y:xs)
eliminarDuas (x:xs) = x:xs

{-
eA "TAAB" = 'T' : eA "AAB" = "TB"
  x:'T' y:'A' xs:'AB'
eA "AAB" = eA "B" = "B"
  T: x:'A' y:'A' xs:'B'
eA "B" = "B"
 x:'B' y:[]
-}

{-

Dizer oq acontece com a funcao
-}

foo :: String -> String
foo [] = []
foo (x:y:z:xs)
    | x == 'A' && y == 'B' && z == 'C' = foo xs
    | otherwise = x : foo (y:z:xs)
foo x = x

{-

x:'D' y:'A' z:'B' xs:'CD' -- Cai no segundo pattern
foo "DABCD" = D : foo "ABCD"

x:'A' y:'B' z:'C' xs:'D' -- Cai no primeiro pattern pois x,y,z sao iguais
foo "ABCD" = foo "D"

x:'D' = 'D' -- cai no terceiro pattern pois só tem um elemento
foo "D" = "D"

saida:
"DD"

-}

----------------------------------------------------------

{- foldl (+) 0 [1,2,3,5,10]

= foldl (+) (0+1) [2,3,5,10]
= foldl (+) (0+1+2) [3,5,10]
= foldl (+) (0+1+2+3) [5,10]
= foldl (+) (0+1+2+3+5) [10]
= foldl (+) (0+1+2+3+5+10) []

= (0+1+2+3+5+10) = 21
------------------------------

foldl (\x y -> lenght y) 0 ["FATEC", "SANTOS", "AMA", "JAVA"]
= foldl f (0 + length "FATEC") ["SANTOS", "AMA", "JAVA"]
= foldl f ( 0 + length "FATEC" + length "SANTOS") ["AMA","JAVA"]
= foldl f (0 + length "FATEC" + length "SANTOS" + length "AMA") ["JAVA"]
= foldl f (0 + length "FATEC" + length "SANTOS" + length "AMA" + length "JAVA")


foldl (\x y -> EXPRESSAO ENVOLVENDO x e/ou y) inicial lista
x representa a acumulação do valor inicial com o resultado da expressao
y eh alguem da lista
(VOCE SEMPRE PODE IGNORAR SE NECESSARIO X OU Y DO LAMBDA)
(se precisar ignorar o x (\_ y -> EXPRESSAO)
(se precisar ignorar o y (\x _ -> EXPRESSAO)
(se precisar usar os dois (\x y -> EXPRESSAO)

O FOLDL SEMPRE USA UMA FUNCAO DE DOIS PARAMETROS

a) FAÇA UM FOLDL PARA CONTAR LETRAS DE UMA PALAVRA
Resposta: foldl (\x _ -> x+1) 0 "FATEC"
          5
Teste:
foldl (\x _ -> x+1) 0 "ABA"
= foldl (\x _ -> x+1) (0+1) "BA"
= foldl (\x _ -> x+1) (0+1+1) "A"
= foldl (\x _ -> x+1) (0+1+1+1) ""
= 3

b) FAÇA UMA FOLDL PARA REVERTER UMA STRING
Resposta: foldl (\xs x -> x:xs) [] "FATEC" Ou foldl (\x y -> y: x) [] "FATEC"
          CETAF
Jeito do Prof: foldl (\x y -> [y] ++ x) "" "FATEC"
-}



-- HIGH-ORDER FUNCTIONS: Em Haskell as funcoes
-- sao tratadas como valores comuns. Ou seja,
-- sao passadas via parametro ou retornadas.

-- CURRYING: Eh o ato de chamar funcao
--com menos parametros do que definido. O resultado
--disso eh uma funcao com os parametros restantes.

-- EXPRESSAO LAMBDA: FUNCAO SEM CORPO.
-- REPRESENTA UM VALOR DO TIPO FUNCAO

dobro :: Int -> Int
dobro x = 2*x

aplicar :: (Int -> Int) -> Int
aplicar f = 1 + f 10

aplicar2 :: (Int -> Int -> Int) -> Int
aplicar2 f = 1 + f 10 20

somarTres :: Int -> Int -> Int -> Int
somarTres x y z = x+y+z

tamanho :: String -> Int
tamanho x = length x

rabo :: String -> String
rabo x = tail x
