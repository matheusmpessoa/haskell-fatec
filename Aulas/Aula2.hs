module Aula2 where


-- Dia eh chamado de data constructor
-- E o lado direito sao chamados de
-- value constructors

data Dia = Segunda | Terca | Quarta | Quinta | Sexta | Sabado | Domingo deriving Show

{-
Encontra um padrao especifico na(s) entrada(s)
da funcao. Age de acordo com os values
constructors do tipo de entrada.
-}

diaDeBalada :: Dia -> Bool
diaDeBalada Domingo = True
diaDeBalada Segunda = True
diaDeBalada _ = False

--Nome funcao / Parametro / Tipo
numDias :: Dia -> Int
numDias Domingo = 1
numDias Segunda = 2
numDias Terca = 3
numDias Quarta = 4
numDias Quinta = 5
numDias Sexta = 6
numDias Sabado = 7

{- 
Faca uma funcao chamada salario que implemente
a seguinte regra de negocio:
- Todo trabalhador aos domingos ganha o dobro do salario
- Aos sabados 75% a mais
- Qualquer outro dia mais nao ha acrescimo
A funcao deve ser receber um Dia e o valor
bruto do salario por hora a ser calculado
-}

-- Funcao :: Tipo -> param1 -> retorno
salario :: Dia -> Double -> Double
salario Domingo x = x*2
salario Sabado x = x*1.75
salario _ x = x

{- 
Faca o tipo Day que possua como value
constructors os dias da semana em ingles.
Faca as funcoes traduzirIP que traduz os dias
em ingles para portugues e traduzirPI que traduz
portugues para o Ingles.
-}
data Day = Monday | Tuesday | Wednesday | Thursday | Friday | Saturday | Sunday deriving Show
traduzirIP :: Dia -> Day
traduzirIP Domingo = Sunday
traduzirIP Segunda = Monday
traduzirIP Terca = Tuesday
traduzirIP Quarta = Wednesday
traduzirIP Quinta = Thursday
traduzirIP Sexta = Friday
traduzirIP Sabado = Saturday

traduzirPI :: Day -> Dia
traduzirPI Sunday = Domingo
traduzirPI Monday = Segunda
traduzirPI Tuesday = Terca
traduzirPI Wednesday = Quarta
traduzirPI Thursday = Quinta
traduzirPI Friday = Sexta
traduzirPI Saturday = Sabado

{- 
reverse.show.traduzirIP $ Wed
reverse (show (traduzirIP Wed))
(reverse.show.traduzirIP) Wed
Direita pra Esquerda
-}


-- TUPLAS
mult :: (Int, Int) -> Int
mult x = fst x * snd x

mult' :: (Int, Int) -> Int
mult' (x,y) = x*y

{- 

1) Faca uma funcao que receba um inteiro e 
eh retornado o dobro - deste inteiro -
na primeira coordenada de uma tupla,
o triplo na segunda e o quadruplo na terceira.

2) Faca o tipo Pessoa que pode ser Fisica ou Juridica,
e o tipo Imposto que pode ser ISS, IRPF ou ICMS. 
Faca a funcao devePagar que recebe uma tupla de Pessoa e um Imposto.
Esta funcao informa se esta pessoa deve pagar ou nao este imposto.

-}

--1
calcTupla :: Int -> (Int,Int,Int)
calcTupla x = (x*2,x*3,x*4)

--2
data Pess = Fisica | Juridica deriving Show
data Imp = ISS | IRPF | ICMS deriving Show

devePagar :: (Pess,Imp) -> Bool
devePagar (Fisica,IRPF) = True
devePagar (Fisica,_) = False
devePagar (Juridica,IRPF) = False
devePagar (Juridica,_) = True

-- Pattern Matching na entrada da função eh possivel definir um valor padrao
-- de entrada que se ajusta ao tipo em questão.
agenda :: DiaSemana -> String --agenda é função
agenda Sexta = "Dia de maldade"
agenda Sabado = "Dia de ressaca"
agenda Domingo = "Dia de descanso"
agenda _ = "Dia de faculdade"
-- Para testar, digite: agenda quinta


--Nome funcao / Parametro / Tipo
numDias :: Int -> Dia
numDias 1 = Domingo
numDias 2 = Segunda
numDias 3 = Terca
numDias 4 = Quarta
numDias 5 = Quinta
numDias 6 = Sexta
numDias 7 = Sabado
numDias _ = undefined
-- Para retornar erro, digite: numDias 15
-- Para retornar entre os dias da semana, digite: [Segunda .. Quinta]

-- Para descobrir o tipo de uma lista, digite: :t [Segunda .. Quinta]

-- Para descobrira a agenda dos dias digitados:
-- [agenda x | x <- [Segunda .. Quinta]]
-- Resultado: ["Dia de descanso"], ["Dia de descanso"], ["Dia de descanso"], ["Dia de descanso"], ["Dia de maldade"]

-- DERIVINGS
-- Show -> Para mostrar na tela um resultado daquele tipo
-- Enum -> Para o uso de ..


-- VALUE CONSTRUCTOR
-- Fica sempre ao lado direito da igualdade da palavra data. Indica todos os valores assumidos por aquele tipo.
