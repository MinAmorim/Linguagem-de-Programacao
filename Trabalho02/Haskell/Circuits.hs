module Circuits
  ( mux2
  , meioSubtrator
  , comparadorBit
  ) where

import LogicGates

-- 1. Multiplexador 2:1 
-- Seleciona entre entrada A ou B baseado no sinal S
-- Z = (not S and A) or (S and B)
mux2 :: [Int] -> [Int] -> [Int] -> [Int]
mux2 a b s =
  orGate (andGate a (notGate s))
         (andGate b s)

-- 2. Meio Subtrator 
-- Subtrai dois bits (A - B)
-- Diferença = A XOR B
-- Borrow (Empresta) = (NOT A) AND B
meioSubtrator :: [Int] -> [Int] -> ([Int], [Int])
meioSubtrator a b = (diff, borrow)
  where
    diff   = xorGate a b
    borrow = andGate (notGate a) b

-- 3. Comparador de Igualdade
-- Verifica se dois bits são iguais,retorna 1 se forem iguais.
-- Lógica: NOT (A XOR B) 
comparadorBit :: [Int] -> [Int] -> [Int]
comparadorBit a b = notGate (xorGate a b)
