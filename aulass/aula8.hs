module Aula8 where
import Control.Monad

-- Neste caso a transformacao natural
-- abaixo , pega um Int e o coloca
-- sob acao de um funtor Maybe.
-- transfNat :: Int -> Maybe Int
-- transfNat x = Just (x+1)

tnf :: Int -> [Int]
tnf x = [x+1]

f :: Int -> Int
f x = x+1

tng :: Int -> [Int]
tng x = [x+2]

g :: Int -> Int
g x = x+2

{--
(tnf <=< tng) 3 = join(fmap tnf (tng(3)))
primeiro calcula tng em 3 resultando [5],
depois joga tnf, via fmap, para dentro de [5]
resultando em [tnf 5] = [[6]] e finalmente
o join elimina uma lista, resultando em [6]
<=< - chamase KLEISLI ARROW e viva dentro Control.Monad (ela serve para compor duas trans. naturais)


Monad eh um monoide na categoria dos endofuntores
(Objetos: Transf Naturais)

Se uma monad é um monoide
mempty = return
mappend = <=<

(monad um funtor que compoe)

KLEISLI serve para composicao de transformações
naturais e o bind (>>=) serve aplicacao de trans naturais em um valor
monadico (m b), O (>>=) tem a mesma funcao do ($), porem, o ($) pode
ser omitido ja o bind nao.

O >> ignora o primeiro parametro
--}

--data () = ()
main :: IO ()
-- io = void
main = putStrLn "Digite um nome: " >>
        getLine >>= \x -> putStrLn ("Ola " ++ x)

main' :: IO ()
main' = do
        putStrLn "Digite um nome: "
        x <- getLine
        putStrLn ("Ola " ++ x)

main2 :: IO ()
main2 = do
    putStrLn "Digite um numero: "
    x <- readLn
    putStrLn ("O numero eh: " ++ show(x+1))

main2' :: IO ()
main2' = putStrLn "Digite um numero " >>
        getLine >>= \x -> putStrLn ("O numero eh: " ++ show(x+1))



{--
1) Faca um programa que receba string do teclado
e mostre-o em ordem reversa (imperativa)

2) Faca um programa que multiplique dois numeros (funcional)
--}

ex1 :: IO ()
ex1 = putStrLn "Digite uma palavra " >>
    getLine >>= \x -> putStrLn ("A palavra eh" ++ show(reverse(x)))

