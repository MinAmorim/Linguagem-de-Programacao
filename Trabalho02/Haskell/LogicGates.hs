module LogicGates
  ( notGate
  , andGate
  , orGate
  , xorGate
  ) where

-- função auxiliar que valida se é bit
checkBit :: Int -> Int
checkBit x
  | x == 0 || x == 1 = x
  | otherwise        = error ("esperado 0 ou 1, mas recebeu: " ++ show x)

-- Porta NOT 
notGate :: [Int] -> [Int]
notGate = map (\x -> 1 - checkBit x)

-- Porta AND 
andGate :: [Int] -> [Int] -> [Int]
andGate = zipWith (\x y -> checkBit x * checkBit y)

-- Porta OR 
orGate :: [Int] -> [Int] -> [Int]
orGate = zipWith (\x y -> max (checkBit x) (checkBit y))

-- Porta XOR 
xorGate :: [Int] -> [Int] -> [Int]
xorGate = zipWith (\x y -> (checkBit x + checkBit y) `mod` 2)
