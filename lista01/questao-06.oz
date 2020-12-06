% item a
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

% item b
for I in
   1..10 do {Browse {GenericPascal Add I}}
end
