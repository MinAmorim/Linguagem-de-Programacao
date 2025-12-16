functor
export
   notG:NotG andG:AndG orG:OrG xorG:XorG
   nandG:NandG norG:NorG xnorG:XnorG
   const:Const sigTake:SigTake
define
% Verifica se o valor é um bit válido (0 ou 1)
   fun {IsBit B}
      (B==0) orelse (B==1)
   end

% Gera um sinal constante infinito (stream lazy)
   fun lazy {Const B}
      if {IsBit B} then
         B | {Const B}
      else
         raise error(notABit:B) end
      end
   end

% Utilitário para visualizar apenas os N primeiros valores do sinal
   fun {SigTake N Xs}
      if N=<0 then nil
      else
         case Xs of X|Xr then X | {SigTake N-1 Xr} end
      end
   end

% Aplica uma função a cada elemento de um sinal (1 entrada)
   fun lazy {Map1 Xs F}
      case Xs of X|Xr then
         {F X} | {Map1 Xr F}
      end
   end

% Aplica uma função combinando dois sinais de entrada
   fun lazy {Map2 Xs Ys F}
      case Xs#Ys of (X|Xr)#(Y|Yr) then
         {F X Y} | {Map2 Xr Yr F}
      end
   end

% Porta NOT
   fun {NotG A}
      {Map1 A
       fun {$ X}
          if X==0 then 1
          else
             if X==1 then 0
             else raise error(notABit:X) end
             end
          end
       end}
   end

 % Porta AND
   fun {AndG A B}
      {Map2 A B
       fun {$ X Y}
          if {IsBit X} andthen {IsBit Y} then
             if X==1 andthen Y==1 then 1 else 0 end
          else
             raise error(notABit:X#Y) end
          end
       end}
   end

% Porta OR
   fun {OrG A B}
      {Map2 A B
       fun {$ X Y}
          if {IsBit X} andthen {IsBit Y} then
             if X==1 orelse Y==1 then 1 else 0 end
          else
             raise error(notABit:X#Y) end
          end
       end}
   end

% Porta XOR
   fun {XorG A B}
      {Map2 A B
       fun {$ X Y}
          if {IsBit X} andthen {IsBit Y} then
             if X==Y then 0 else 1 end
          else
             raise error(notABit:X#Y) end
          end
       end}
   end

% Portas derivadas por composição
   fun {NandG A B} {NotG {AndG A B}} end
   fun {NorG  A B} {NotG {OrG  A B}} end
   fun {XnorG A B} {NotG {XorG A B}} end
end
