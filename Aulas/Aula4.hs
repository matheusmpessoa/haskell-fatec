module Aula4 where
    
data Unidade = Unidade deriving Show

-- unidade eh um tipo que tem um value constructor, a propria unidade    
-- Os values constructors sao os valores dos data constructors.
-- Os value constructors podem carregar campos.
-- data Binario = Zero | Um
-- data Pessoa = Fisica String Int | Juridica String 
-- () -> significa a unidade (unity)


teste :: () -> Int
teste x = 0
-- teste ()
-- 0

teste2 :: Int -> ()
teste2 x = ()
--teste2 4
--() ele retorna a propria unidade
--lembra o singleton

--------------------------------
--o undefined tem tipo
--todo tipo tem seu undefined
--undefined significa algo que nao eh contavel

data Sozinho --nao tem nenhum data constructor
teste3 :: Sozinho -> Int
teste3 x = 0

--------------------------------------
foo :: () -> Sozinho -> Int
foo x y = 0
-- foo undefined undefined
--0
-- a unidade tem dois valores (unidade e undefined)

-----------------------------------------
foo2 :: [Sozinho] -> Int
foo2 x = 0
--foo2 [undefined] ou foo2 undefined

--------------------------------------------------------------------------------
-- 1) currying, eh um conceito da programacao funcional:
-- eh a tecnica que consiste em transformar uma funcao
-- em uma sequencia de funcoes com menos prametros que a original
-- ex: let f = somar 5 //atribui ao f a funcao de somar mais 5
-- f 10 
-- 15
somar :: Int -> Int -> Int
somar x y = x+y

----------------------

-- 2) funcao anonima(lambda): p1 p2 p3 ... pn -> EXPRESSAO 
--exemplo (\x -> 2*x)
-- pode calcular a hora que quiser
--ex: let soma3 = (\x y -> x+y) 3
-- = (\y -> 3+y)
-- = soma3 5 // (3+5)

volume :: Double -> Double -> Double -> Double
volume x y z = x*y*z

-----------------------

-- 3) HIGH-ORDER FUNCTION (funcao de alta ordem)
-- eh uma funcao que recebe via parametro(s) funcoes e/ou retorna funcoes

aplicar :: (Int -> Int) -> Int
aplicar f = 1 + f 6
-- chama a funcao f com argumento 6
-- soma 1

-- aplicar ((\x y -> x+y) 10)
-- = aplicar (\y -> 10+y)
-- = 1 + (\y -> 10+y) 6
-- = 1 + 16
-- = 17

-- como retornar uma funcao
mult :: Int -> (Int -> Int)
mult x = (\y -> x*y)

mult' :: Int -> Int -> Int
mult' x y = x*y

-------------------------

-- map eh uma maneira melhor de fazer o list comprehension
-- map (2*) [1..5]
-- = (2*) [1,2,3,4,5]
-- = [2*1, 2*2, 2*3, 2*4, 2*5]
-- = [2,4,6,8,10]

-- filter
-- filter (\x -> elem x "AEIOU") "FATEC" // vai eliminar as consoantes "AE"
-- filter (x -> noteElem x "AEIOU") "FATEC" // elimina as vogais "FTC"
-- filter (x -> noteElem x "AEIOU") (reverse "FATEC") // elimina as vogais e inverte -> "CTF"
-- filter (>=4) [1..10] // numeros maiores que 4 "[4,5,6,7,8,9,10]"

----------------------

data Pessoa = Pessoa String Int deriving Show

maior :: Pessoa -> Bool
maior (Pessoa _ idade) = idade >= 18
--filter (\(Pessoa _ idade) -> idade >=18)

filtrarMaiores :: [Pessoa] -> [Pessoa]
filtrarMaiores xs = filter maior xs 
-- let ps = [Pessoa "Joao" 24, Pessoa "Guilherme" 34, Pessoa "Beatriz" 20, Pessoa "Matheus" 15]
-- filtrarMaiores ps
-- [Pessoa "Joao" 24,Pessoa "Guilherme" 34,Pessoa "Beatriz" 20]

-----------------------

{-
a) Faca o tipo Metragem com os values constructors Metro e Kilometro.
b) Faca o tipo Medida que possua os campos Double e Metragem
c) Faca a funcao converter que converte Metros para Kilometros e vice-versa
d) Faca a funcoes converterTodos converte todos os elementos de uma lista de medida
e) Faca a funcao maior5 que filtra qualquer medida maior que 5 sem importar a metragem
-}


data Metragem = Metro | Kilometro deriving Show
data Medida = Medida Double Metragem deriving Show

--Medida carrega um Double e uma Metragem em sua declaracao
converter :: Medida -> Medida 
converter (Medida x Metro) = Medida (x/1000) Kilometro
converter (Medida x Kilometro) = Medida (x*1000) Metro

converterTodos :: [Medida] -> [Medida]
converterTodos xs = map converter xs



{-*
HIGH-ORDER FUNCTIONS: Em Haskell as funcoes
sao tratadas como valores comuns. Ou seja,
sao passadas via parametro ou retornadas.

CURRYING: Eh o ato de chamar funcao
com menos parametros do que definido. O resultado
disso eh uma funcao com os parametros restantes.
*-}

somar :: Int -> (Int -> Int)
somar x = \y -> x+y

dobro :: Int -> Int
dobro x = 2*x

func :: (Int -> Int) -> Int
func f = 2 + f 10

somarTres :: Int -> Int -> Int -> Int
somarTres x y z = x+y+z

elimNeg :: [Int] -> [Int]
elimNeg xs = filter (\x -> x>=0) xs
