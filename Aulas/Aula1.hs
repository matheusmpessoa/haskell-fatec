module Aula1 where 

-- para fazer uma função em haskell 
-- nome x1 x2 x3 ... xn = expressao 

-- dobro HAS TYPE -> ::
-- sempre os que ficam antes sao os tipos da funcao e os depois do -> sao os tipos da expressao
dobro :: Int -> Int 
dobro x = 2*x 

soma :: Int -> Int 
soma y = y+1 

-- dois para os parametros e um para a saida do parametro, o ultimo tipo eh sempre o da saida
somar :: Int -> Int -> Int
somar x y = x+y


-------------------------------

v :: [Int]
v = [1..10]

a :: [Int]
a = [6, 5..1]

w :: String
w = "SANTOS"

e :: [Char]
e = ['A'..'Z']

----------------------------------------

--LIST COMPREENSHIONS 

-- [EXPRESSAO | LISTA DE INTERACAO, FILTRO, FILTRO, FILTRO, ... ]

todosPares :: Int -> [Int]
todosPares n = [x | x <- [0..n], mod x 2 == 0]


multCinco :: Int -> [Int]
multCinco n = [x | x <- [0..n], mod x 5 == 0]

todosMaisUm n = [x+1 | x<-[0..n]]
todosMenosUm n = [(-1) * x | x<-[0..n]]

filtos n = [(-1) * x | x<-[0..n], x > 3, mod x 2 == 0]

-- DOBRO DE TODOS OS NUMEROS DE 0 A N MAIORES QUE 12 E MENORES QUE 142

dobrinho n = [x * 2 | x<-[0..n], x > 12, x < 142]



ehPrimo :: Int -> Bool
ehPrimo n = length ([x | x <- [2 .. (n-1)], mod n x == 0]) == 0

lista :: [Int]
lista = [x | x <- [2 .. 100], ehPrimo x]
