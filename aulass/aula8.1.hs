module Main where

-- data () = ()
main' :: IO ()
main' = do
    putStrLn "Digite uma palavra: "
    x <- getLine
    putStrLn $ reverse x

main :: IO ()
main = putStrLn "Digite uma palavra: " >> getLine >>= \x -> putStrLn $ reverse x
