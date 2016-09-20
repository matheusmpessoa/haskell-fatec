module Aula7 where

import Data.Monoid

{-data Humano = Bia | Pedro deriving Show

data Vampiro a = Vampiro a deriving Show

instance Functor Vampiro where
    fmap f (Vampiro x) = Vampiro (f x)

amor :: Humano -> Humano
amor Bia = Pedro
amor Pedro = Bia

-- pra chamar:
fmap amor (Vampiro Bia)
-- Vampiro Pedro 

-}

------------------------------------------

data Valido a = Sim a | Nao 
-- data Maybe a = Just a | Nothing

{-instance Functor Valido where
    fmap f (Sim x) = Sim (f x)
    fmap f Nao = Nao

instance (Show a) => Show (Valido a) where
    show (Sim x) = show x
    show Nao = "erro"-}

(\?) :: Double -> Double -> Maybe Double
(\?) x 0 = Nothing
(\?) x y = Just (x/y)

-- (\?) para nomear a função pode ser qualquer coisa
-- para chamar:
-- safeDiv 4 2 
-- Sim 2.0
-- A diferença do 2.0 do 2 é que o 2.0 passou por um processo para ser validado


-- fmap (2*) (Sim 8)
-- 16
-- fmap (2*) Nao
-- erro

--transformações naturais
toJust :: a -> Maybe a
toJust x = Just x
-- converte pra just

toList :: a -> [a]
toList x = [x]
-- prende numa lista

toList' :: a -> [a]
toList' x = [x+1]

f :: Int -> Int
f x = x+1



safeDiv :: Double -> Double -> Maybe Double
safeDiv _ 0 = Nothing
safeDiv x y = Just (x/y)

safeDiv' :: Double -> Double -> Maybe (Sum Double)
safeDiv' _ 0 = Nothing
safeDiv' x y = Just (Sum (x/y))

validar :: String -> Maybe String
validar "" = Nothing
validar x = Just x

func :: Int -> [Int]
func x = [x]

func2 :: Int -> Maybe Int
func2 x = Just x
