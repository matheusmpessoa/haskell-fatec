module Aula6 where

-- Bolsa tem um tipo / se 'a' for inteiro todos serao inteiros
-- bolsa a tem o nome de type parameter
-- Define que possui uma bolsa diferente para cada tipo
data Bolsa a =  Bolsa a | Mochila a a

-- Apenas tipos a que sejam instancia de Show
instance (Show a) => Show (Bolsa a) where
    show (Bolsa x) = "Uma bolsa com valor " ++ show x
    show (Mochila x y) = "Uma mochila com " ++ show x ++ " "

--Sempre vai ser char
data Tipo = ValueC1 Char | 
            ValueC2 Char Char | 
            ValueC3 Char Char Char 


-- Pattern Matching
-- ValueC1 x
-- ValueC2 x y
-- ValueC3 x y z

--Tipos kind 1
--Int, bool, char

--Tipos kind 2
--Arvore, Lista


-- Exercicio
-- Crie a funcao somarBolsa que recebe duas Bolsas de Inteiros e retorna a soma desses inteiros dentro da Bolsa
-- Pattern Matching para value constructor
-- somarBolsa (Bolsa 9) (Bolsa 9)
somarBolsa :: Bolsa Int -> Bolsa Int -> Bolsa Int
somarBolsa (Bolsa x) (Bolsa y) = Bolsa (x+y)
somarBolsa (Mochila a b) (Mochila c d) = Mochila (a+c) (b+d)
somarBolsa _ _ = Bolsa 0

-- Exercicio
-- Crie o tipo Item com os value constructors
-- Borracha, Lapis, Caneta e Pincel
-- Crie uma instancia de show de modo a mostrar a msg: 
-- Item escolhido: Pincel, por exemplo
data Item = Borracha  | Lapis | Caneta | Pincel
-- Apenas tipos a que sejam instancia de Show
instance Show Item where
    show (Borracha) = "Item escolhido: Borracha " 
    show (Lapis) = "Item escolhido: Lapis"
    show (Caneta) = "Item escolhido: Caneta"
    show (Pincel) = "Item escolhido: Pincel"
    show (_) = "Erro!"
    
-- hask2-romefeller.c9.users.io / warp



data Dia = Segunda | Terca | Quarta | Quinta |
           Sexta | Sabado | Domingo deriving Show

-- Coisa eh um tipo quassui um TYPE VARIABLE
-- a e possui tres values constructors
-- 1) UmaCoisa: possui um campo do tipo a
-- 2) DuasCoisas: possui dois campos do tipo a
-- 3) Nada: Sem campos

-- POLIMORFISMO PARAMETRICO: A partir
-- de uma type variable a, eh possivel
-- montar estrutura especifica para
-- cada a fixado.
-- Exemplo: Coisa String, Coisa Int, ...
-- [String], [Int], ...
data Coisa a = Nada | UmaCoisa a |
               DuasCoisas a a  deriving Show



-- PARA FAZER UM TYPECLASS EH NECESSARIO DEFINIR UMA FUNCAO
-- QUE TERA SEU COMPORTAMENTO DEPENDENTE DAS INSTANCIAS.
-- NO CASO, SimNao Int tera que ter uma funcao
-- resposta :: Int -> Bool
class SimNao a where
    resposta :: a -> Bool

instance SimNao Int where
    resposta 0 = False
    resposta _ = True

instance SimNao Bool where
    resposta = id

instance SimNao Char where
    resposta x
        | elem x "AEIOUaeiou" = True
        | otherwise = False

func :: (Show a, SimNao a) => a -> String
func x = (reverse . show . resposta) x

foo :: (Show a) => a -> Bool
foo y = "Ola" == (show y)
