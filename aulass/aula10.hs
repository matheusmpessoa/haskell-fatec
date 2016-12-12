module Aula10 where

import Control.Applicative

data Passageiro = Passageiro {passageiroNome :: String,
                              passageiroIdade :: Int,
                              passageiroPassaporte :: String}
             deriving Show

data Nome = Nome {nome :: String} deriving Show

