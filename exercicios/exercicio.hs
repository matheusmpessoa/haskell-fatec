module Exercicio where

{-
Exercício 1.2
Gere as listas [1,11,121,1331,14641,161051,1771561] e
[1,2,3,5,6,7,9,10,11,13,14,15,17,18,19,21,22,23,25,26,27,29,30,31,33,34,35,37,38,39] usando list comprehension
-}

-- funcao / param / [retorno lista]
-- [expressao | lista de iteracao, filtro, filtro, ... ]
lista1 :: Int -> [Int]
lista1 n = [11^x | x <- [0..n] ]

lista2 :: Int -> [Int]
lista2 n = [x | x <- [0 .. n], mod x 4 /=  0]



{-
Exercício 1.3 Faça o tipo Temperatura que pode ter valores Celsius, Farenheit
ou Kelvin. Implemente as funções:
1. converterCelsius: recebe um valor double e uma temperatura e faz a conversão
para Celsius.
2. converterKelvin: recebe um valor double e uma temperatura e faz a conversão
para Kelvin.
3. converterFarenheit: recebe um valor double e uma temperatura e faz a conversão
para Farenheit.
-}

--Tipo temperatura pode ter esses valores:
--Data constructor = value constructor
data Temperatura = Celsius | Farenheit |  Kelvin deriving Show

-- Funcao :: Tipo -> param1 -> retorno
converterKelvin :: Temperatura -> Double -> Double
converterKelvin Celsius x = x + 273.15
converterKelvin Farenheit x = (x-32)/1.8 + 273.15
converterKelvin Kelvin x = x

converterCelsius :: Temperatura -> Double -> Double
converterCelsius Kelvin x = x -273.15
converterCelsius Farenheit x = (x-32)/1.8
converterCelsius Celsius x = x

converterFarenheit :: Temperatura -> Double -> Double
converterFarenheit Celsius x = x*1.8+32
converterFarenheit Kelvin x = (x-273.15)*1.8 +32
converterFarenheit Farenheit x = x
