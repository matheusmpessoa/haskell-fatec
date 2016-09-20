# Teoria Haskell

## P1
Dia 26/09 - em duplas sorteadas

Categorias a funtores

---

## Categorias

Categorias estão por trás do funcionamento de **funtores**.

Maneira de representar coisas.

Coleção de três componentes:

1. Coleção de Objetos(ob(c)) - não necessariamente um conjunto. Não tem relação com o objeto da P.O.O.
    Qualquer coisa para categorizar.

2. Coleção de morfismos (hom(c)) - Um morfismo relaciona dois objetos A e B.
    Qualquer coisa de relação.

3. Noção de composição de Morfismos (.) 

    ```haskell
    g :: A -> B
    ```

    e 

    ```haskell
    f :: B -> C
    ```

    então

    ```haskell
    f.g :: A->C
    ```
### Lei do elemento neutro

```haskell
id_B :: B -> B
f :: A -> B
id_A :: A -> A

id_B . f :: A -> B
f . id_A :: A -> B
```

### Lei da associatividade

Qualquer categoria a lei tem que valer.

Se você acha um atalho você tem de respeitar essa lei.


#### Exemplos

1. Exemplo caminho dos ônibus:

    ```haskell
    (h º g) º f = h º (g º f)
    ```

    Visão geral das categorias.
    ```haskell
    A -> B -> C -> D
    ```

    Passo a passo
    ```haskell
    A ->f
    B ->g
    C ->h
    D
    ```

    Atalhos
    ```haskell
    g º f
    h º g
    ```

2. Exemplo de regra que não se enquadra nessa lei pois não tem associatividade:

    ```haskell
    (f.g).h :: A -> B
    id_B . h :: A -> B
    h :: A -> B

    f.(g.h) = f . id_A = f :: A -> B
    ```
    
#### Lei do Hask

Tipos dos objetos/morfismos estudados: int, bool, double, pessoa, moeda, bolsa, qualquer função.

1. Objetos
2. Morfismos
3. Composição
4. Identidades
5. Associatividade

---

## Funtores

Funtor é o jeito de relacionar duas categorias.

Funtor preserva relação, mesmo se transformando.

Funtor é um endofuntor, ou seja, a categoria de entrada dos funtores é Hask e a saida também é Hask.
Um funtor em Haskell possui king * -> e deve ser uma instância do Typeclass Functor.

Utiliza-se fmap.

#### Exemplos
Para criar um funtor:
```haskell
F A = X
F B = X
F C = Y
F id_A = id_X
F id_B = id_X
F f = id_X
F id_C = id_X
```

fmap
```haskell
data Humano = Bia | Pedro deriving Show

data Vampiro a = Vampiro a deriving Show

instance Functor Vampiro where
    fmap f (Vampiro x) = Vampiro (f x)

amor :: Humano -> Humano
amor Bia = Pedro
amor Pedro = Bia

-- pra testar:
fmap amor (Vampiro Bia)
-- Resultado: Vampiro Pedro 
```

### Lista

Lista é um funtor.

fmap funciona com listas.

Listas sempre precisam de tipos kind 2.


### Maybe

Funtores que apresentam erros ou não.


### Just

Algo que deu certo.

Porque just é um funtor?

```haskell
fmap (*2) (Just 4)
Just *
```

#### Exemplos

Nothing (erro):
```haskell
fmap (*2) Nothing
Nothing
```
Quando algo for da errado é retornado nothing.


Reverse
```haskell
fmap reverse (Just "OLA)
Just "ALO"
```

Tipos do fmap
```haskell
:t fmap
fmap :: Functor f => (a -> b) -> f a -> f b
```

```haskell
:t map
map :: (a -> b) -> [a] -> [b]
```

---

### Monoide

```haskell
safeDiv' 10 2 <> safeDiv' 4 2
Just (Sum {getSum = 7.0})
```

```haskell
((x -> [x]) . (\x -> [x])) 5
[[5]]

((x -> [x+1]) . (\x -> [x])) 5
(\x -> [x+1]) [5] = [[5]+1]
```