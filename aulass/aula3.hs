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



-- RECORD SYNTAX: Eh possivel dar nomes aos
-- campos dos VC. Esses nomes sao funcoes de projecao
-- (GET)

data Correncia = Euro | Real |  Dolar  deriving Show

data Dinheiro = Dinheiro {valorDinheiro :: Double,
                          currDinheiro :: Correncia}
                          deriving Show

data Sexo = M | F deriving Show

data Pessoa = Pessoa {nomePessoa :: String,
                      sexoPessoa :: Sexo,
                      dinPessoa :: Dinheiro}
                      deriving Show

-- Em uma empresa Brasileira, um bonus mensal
-- foi dado aos funcionarios. As mulheres gnharam
-- 1500 reais e os homens 800. Nos Eua,
-- mulheres e homens ganham 600 Dolares a mais.
-- Na Europa nao ha bonus.

bonus :: Pessoa -> Pessoa
bonus (Pessoa n F (Dinheiro valor Real)) = Pessoa n F (Dinheiro (valor+1500) Real)
bonus (Pessoa n M (Dinheiro valor Real)) = Pessoa n M (Dinheiro (valor+800) Real)
bonus (Pessoa n s (Dinheiro valor Dolar)) = Pessoa n s (Dinheiro (valor+600) Dolar)
bonus x = x

-- EXEMPLO> Quero fazer uma funcao que some dois
-- Dinheiro

conversaoDolar :: Dinheiro -> Dinheiro
conversaoDolar (Dinheiro valor Real) = Dinheiro (0.312437*valor) Dolar
conversaoDolar (Dinheiro valor Euro) = Dinheiro (1.13*valor) Dolar
conversaoDolar x = x

conversaoEuro :: Dinheiro -> Dinheiro
conversaoEuro (Dinheiro valor Real) = Dinheiro (0.275992226*valor) Euro
conversaoEuro (Dinheiro valor Dolar) = Dinheiro (0.88*valor) Euro
conversaoEuro x = x

conversaoReal :: Dinheiro -> Dinheiro
conversaoReal (Dinheiro valor Euro) = Dinheiro (3.62*valor) Real
conversaoReal (Dinheiro valor Dolar) = Dinheiro (3.20*valor) Real
conversaoReal x = x

somarDinheiro :: Dinheiro -> Dinheiro -> Dinheiro
somarDinheiro (Dinheiro v1 Real) v2 = Dinheiro (v1 + valorDinheiro (conversaoReal v2)) Real
somarDinheiro (Dinheiro v1 Dolar) v2 = Dinheiro (v1 + valorDinheiro (conversaoDolar v2)) Dolar
somarDinheiro (Dinheiro v1 Euro) v2 = Dinheiro (v1 + valorDinheiro (conversaoEuro v2)) Euro
