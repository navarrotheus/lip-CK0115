% questao 1 item a
declare P1 P10 P100
P1 = 2
P10 = P1*P1*P1*P1*P1*P1*P1*P1*P1*P1
P100 = P10*P10*P10*P10*P10*P10*P10*P10*P10*P10

{Browse P100}

% questao 2 item a
declare Permutacao
fun {Permutacao N R}
    if R==0 then 1
    else
      N*{Permutacao N-1 R-1}
    end
end

declare Comb2
fun {Comb2 N R}
    if R==0 then 1
    else
      {Permutacao N R} div {Permutacao R R}
    end
end

{Browse {Comb2 4 2}}

% questao 2 item b
declare Fact
fun {Fact N}
  if N==0 then 1
  else
    N*{Fact N-1}
  end
end

declare Comb3
fun {Comb3 N R}
  if R==0 then 1
  else
    {Fact N}div({Fact N-R}*{Fact R})
  end
end

declare FastComb
fun {FastComb N R}
  if 2*R =< N then {Comb N R}
  else
    {Comb N N-R}
  end
end

{Browse {FastComb 4 2}}

% questao 6 item a
declare Add   
fun {Add X Y}
   X+Y
end

declare Sub
fun {Sub X Y}
   X-Y
end

declare Mult
fun {Mult X Y}
   X*Y
end

declare Mul1
fun {Mul1 X Y}
   (X+1)*(Y+1)
end

declare ShiftLeft
fun {ShiftLeft L}
   case L of H|T then
      H|{ShiftLeft T}
   else [0] end
end

declare ShiftRight
fun {ShiftRight L} 0|L end

declare GenericPascal
fun {GenericPascal Op N}
   if N==1 then [1]
   else L in
      L = {GenericPascal Op N-1}
      {OpList Op {ShiftLeft L} {ShiftRight L}}
   end
end

fun {OpList Op L1 L2}
   case L1 of H1|T1 then
      case L2 of H2|T2 then
	 {Op H1 H2}|{OpList Op T1 T2}
      end
   else nil end
end

{Browse {GenericPascal Mul1 2}}

{Browse {GenericPascal Add 2}}
{Browse {GenericPascal Sub 2}}
{Browse {GenericPascal Mult 10}} 
{Browse {GenericPascal Mult 10}} 
{Browse {GenericPascal Mul1 10}} 

% questao 6 item b
for I in
   1..10 do {Browse {GenericPascal Add I}}
end

% questao 8 correção
declare
local Acc in
   Acc={NewCell 0}
   fun {Accumulate N}
      Acc:=@Acc+N
      @Acc
   end
end

{Browse {Accumulate 5}}
{Browse {Accumulate 10}}
{Browse {Accumulate 34}}

% questao 10 com delay
declare
C={NewCell 0}
thread I in
  {Delay 10000}
  I=@C
  C:=I+1
end
thread J in
  J=@C
  C:=J+1
end

{Browse @C}

