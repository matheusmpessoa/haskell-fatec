{-
a. monte uma expressão (usando o ghci) para o que se pede
    1. lambda para verificar se uma lista não é nula
        (\x -> x /= [])
    2. lambda para filtrar palavras de tamanho maior que 30 de um array de strings xs
        (\xs -> (filter (\x -> length(x) >= 30) xs)) ["array de palavras"]
    3. lambda para receber uma String s e retorna-la em ordem reversa sendo do tipo Maybe String
    (\x -> (Just(reverse(x)))) "batata"
    4. lambda para o maior numero entre os números x e 12
    (\x -> x (max x 12)) 15

b. Dê o tipo das seguintes funções
    1. \x ->["Olá" ++ x]
        String -> [String]
    2. \t ->Just$t == "true"
        String -> Maybe Bool
c. Faça funções (dando o tipo da função e da forma mais generica possível) para o que se pede
    1. uma função que receba uma lista e a devolva sem os dois primeiros elementos(Dica: pattern matching)
        doisPri :: [a]->[a]
        doisPri [] = []
        doisPri (x:y:xs) = xs
    2. uma função que receba dois Maybe Int e retorne o menor deles (Dica: pattern matching)
        menorJus :: Maybe Int -> Maybe Int -> Maybe Int
        menorJus (Just x) (Just y) = min (Just x) (Just y)
        teste: menorJus  (Just 10) (Just 24)
    3. uma função que receba um valor x qualquer e retorne [Just x]
        justx :: x -> [Maybe x]
        justx x = [Just x]
    4. uma função que receba um vetor de Int (de tamanho qualquer) e retorne a soma dos quadrados dos elementos.
    (exemplo: se a entrada for [0,2,1] o retorno deve ser 5)
        vet :: [Int] -> Int
        vet xs = sum [x*x | x<-xs]
-}

doisPri :: [a]->[a]
doisPri [] = []
doisPri (x:y:xs) = xs


menorJus :: Maybe Int -> Maybe Int -> Maybe Int
menorJus (Just x) (Just y) = min (Just x) (Just y)


justx :: x -> [Maybe x]
justx x = [Just x]

vet :: [Int] -> Int
vet xs = sum [x*x | x<-xs]
