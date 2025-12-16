functor
import
   Gates at 'logicGates.ozf'
export
   mux2:Mux2 majority3:Majority3 comparator1:Comparator1 parity3:Parity3
define
% Multiplexador 2:1
% Seleciona entre D0 e D1 de acordo com o seletor S
   fun {Mux2 S D0 D1}
      local NS P0 P1 in
         NS = {Gates.notG S}
         P0 = {Gates.andG NS D0}
         P1 = {Gates.andG S  D1}
         {Gates.orG P0 P1}
      end
   end

% Circuito de maioria (3 entradas)
% Saída é 1 se pelo menos dois bits forem 1
   fun {Majority3 A B C}
      local AB AC BC T in
         AB = {Gates.andG A B}
         AC = {Gates.andG A C}
         BC = {Gates.andG B C}
         T  = {Gates.orG AB AC}
         {Gates.orG T BC}
      end
   end

 % Comparador de 1 bit
% Retorna um record com eq, gt e lt
   fun {Comparator1 A B}
      local Eq Gt Lt NA NB in
         Eq = {Gates.xnorG A B}
         NA = {Gates.notG A}
         NB = {Gates.notG B}
         Gt = {Gates.andG A NB}
         Lt = {Gates.andG NA B}
         comp(eq:Eq gt:Gt lt:Lt)
      end
   end

% Paridade ímpar de três bits
   fun {Parity3 A B C}
      local T in
         T = {Gates.xorG A B}
         {Gates.xorG T C}
      end
   end
end
