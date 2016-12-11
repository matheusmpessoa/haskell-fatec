module Main where
-- data () = ()
-- Faca um programa que leia do teclado uma palavra
-- e retorne o seu reverso.
main :: IO ()
main = putStrLn "Digite um numero: " >> (readLn :: IO Int) >>=
    \x -> putStrLn "Digite outro numero: " >> (readLn :: IO Int) >>=
    \y -> putStrLn $ "A soma eh: " ++ show (x+y)
