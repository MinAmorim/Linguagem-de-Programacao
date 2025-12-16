% Programa principal para demonstrar as portas e circuitos
% Os sinais são representados como streams

functor
import
   Browser
   Logic at 'logicGates.ozf'
   Circ  at 'circuits.ozf'
define
   % Converte lista comum em stream
   fun {ToStream L}
      case L of nil then nil
      [] X|Xr then X | {ToStream Xr} end
   end

   {Browser.browse 'Trabalho Oz - Ravena Marques Carvalho (RA: 566823) / Yasmim Santos de Amorim (RA: 566326)'}

   local
    % Sinais de entrada
      A  = {ToStream [0 0 0 0 1 1 1 1]}
      B  = {ToStream [0 0 1 1 0 0 1 1]}
      C  = {ToStream [0 1 0 1 0 1 0 1]}
      S  = {ToStream [0 1 0 1 0 1 0 1]}
      D0 = {ToStream [0 0 0 0 1 1 1 1]}
      D1 = {ToStream [1 1 1 1 0 0 0 0]}

      % Exemplos de portas
      AndAB = {Logic.andG A B}
      XorAB = {Logic.xorG A B}
      NotA  = {Logic.notG A}

      % Circuitos
      Ymux = {Circ.mux2 S D0 D1}
      Ymaj = {Circ.majority3 A B C}
      Comp = {Circ.comparator1 A B}
      Ypar = {Circ.parity3 A B C}
   in
      {Browser.browse '--- Portas ---'}
      {Browser.browse andAB#{Logic.sigTake 8 AndAB}}
      {Browser.browse xorAB#{Logic.sigTake 8 XorAB}}
      {Browser.browse notA#{Logic.sigTake 8 NotA}}

      {Browser.browse '--- Circuitos ---'}
      {Browser.browse mux2#{Logic.sigTake 8 Ymux}}
      {Browser.browse maj3#{Logic.sigTake 8 Ymaj}}
      {Browser.browse eq#{Logic.sigTake 8 Comp.eq}}
      {Browser.browse gt#{Logic.sigTake 8 Comp.gt}}
      {Browser.browse lt#{Logic.sigTake 8 Comp.lt}}
      {Browser.browse parity3#{Logic.sigTake 8 Ypar}}
   end
end
