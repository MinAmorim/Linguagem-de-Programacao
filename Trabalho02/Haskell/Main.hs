module Main where

import Circuits

main :: IO ()
main = do
  -- Sinais de teste (Lazy Streams)
  let a   = cycle [0, 0, 1, 1]
      b   = cycle [0, 1, 0, 1]
      sel = cycle [0, 1, 0, 1] 

  -- Teste 1: Multiplexador 2:1
  let saidaMux = mux2 a b sel
  putStrLn "\n[1] Teste Multiplexador 2:1"
  putStrLn "Entradas: A=[0,0,1,1], B=[0,1,0,1], Sel=[0,1,0,1]"
  putStrLn "Saida (Esperado: [0,1,1,1]):"
  print (take 4 saidaMux)  

  -- Teste 2: Meio Subtrator (A - B)
  let (diff, borrow) = meioSubtrator a b
  putStrLn "\n[2] Teste Meio Subtrator"
  putStrLn "Diferenca (A XOR B):"
  print (take 4 diff)      
  putStrLn "Borrow (Emprestimo):"
  print (take 4 borrow)    

  -- Teste 3: Comparador de Bits
  let iguais = comparadorBit a b
  putStrLn "\n[3] Teste Comparador de Igualdade"
  putStrLn "Iguais? (1=Sim, 0=Nao):"
  print (take 4 iguais)    
