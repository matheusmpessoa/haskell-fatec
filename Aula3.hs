module Aula3 where

--PATTERN MATCHING

-- TODA STRING EH UM [Char], por isso que usamos [x], pois x eh um Char
-- ++ concatena
teste :: String -> String
teste (x:xs) = xs ++ [x]

teste2 :: String -> String
-- teste2 (x:y:xs) = [y] ++ [x] ++ xs
--teste2 (x:_:xs) = reverse xs ++ [x]
--teste2 (x:y:[]) = [y] ++ [x]
--teste2 _ = "ERRO..."

-- x:y:[] indica duas letras
-- x:y:z:xs pelo menos tres letras
teste2 (x:y:z:xs) = [z] ++ [x] ++ xs


{-
Exercicio: Crie uma funcao que troque a segunda pela
quarta letra e a primeira pela terceira.
-}
teste3 :: String -> String
teste3 (a:b:c:d:xs) = [c] ++ [d] ++ [a] ++ [b] ++ xs

-------------------------------------------------------------------------

-- :t Fisica "andre" 20 eh do tipo pessoa
-- :t Juridica "Fatec" eh do tipo pessoa
-- quando vc esquece um parametro o Currying te indica o que vc esqueceu
data Pessoa = Fisica String Int | Juridica String deriving Show

-- Fisica nome idade eh um pattern matching que encaixa no tipo declarado.
-- A variavel nome eh uma String e a variavel idade eh um Int
-- aniversario . aniversario . aniversario $ Fisica "Pedro" 22
aniversario :: Pessoa -> Pessoa
aniversario (Fisica nome idade) =  Fisica nome (idade+1)
aniversario (Juridica nome) =   Juridica nome



{-
Exercicio:
Faca a funcao fusao que concatene os campos nome e some os campos idade.
A funcao deve funcionar para os dois value contructors.
-}

fusao :: Pessoa -> Pessoa -> Pessoa
fusao (Fisica nome idade) (Fisica nome2 idade2) = Fisica (nome ++ nome2) (idade+idade2)
-- console: fusao (Fisica "Matheus" 20) (Fisica "Pedro 20)


{- 
RECORD SYNTAX - Sintaxe de registro (algo que ajuda a dar nome aos campos dos values constructors)
Obs.: é possivel criar um value constructor com o mesmo nome do data Constructor

data Pessoa = Fisica {pessoaNome :: String, 
                        pessoaIdade :: Int} | 
                Juridica {pessoaNome :: String} deriving Show
Console: Fisica "Matheus" 19
Console: pessoaIdade "Matheus" 19

somarIdades :: Pessoa -> Pessoa -> Int
somarIdades (Fisica _ i)(Fisica _ i1) = i+i1
somarIdades _ _ = 0

-}

{-

Exercicio: Faca o tipo Ponto com dois campos Double representando as posicoes x y na tela.
Faca as funcoes: 
moverX: move um ponto dx unidades na direçao x.
A variavel dx eh um parametro
moverY: move um ponto dy unidades na direçao y.
A variavel dy eh um parametro
mag:extrai a distancia da origem de um ponto.

-}