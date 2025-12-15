module LogicGates
  ( notGate
  , andGate
  , orGate
  , xorGate
  ) where

-- Porta NOT: 
notGate :: [Int] -> [Int]
notGate = map (1 -)

-- Porta AND: 
andGate :: [Int] -> [Int] -> [Int]
andGate = zipWith (*)

-- Porta OR: 
orGate :: [Int] -> [Int] -> [Int]
orGate = zipWith max

-- Porta XOR: 
xorGate :: [Int] -> [Int] -> [Int]
xorGate = zipWith (\x y -> (x + y) `mod` 2)
