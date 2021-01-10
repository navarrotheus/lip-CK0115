% questao 2
% exemplo onde N não existe durante a chamada
declare A=10
declare B
local MulByN in
   local N in
      N=3
      proc {MulByN X ?Y}
	      Y=N*X
      end
   end
   {MulByN A B}

   {Browse B} % 30
   {Browse N} % 'variable N not introduced'
end

% exemplo onde N existe mas não é 3
declare A=10
declare B
local MulByN in
   local N in
      N=3
      proc {MulByN X ?Y}
	      Y=N*X
      end
   end
   local N in
      N=10
      {MulByN A B}
      {Browse B} % 30
      {Browse N} % 10
   end
end

% questao 4 item a
case X of true then
   <s1>
[] else
   <s2>
end

% questao 4 item b

if {Label <x>} == <pattern> then
   <s1>
else
   <s2>
end



% questao 8 item b
fun {OrElse BP1 BP2}
   if {BP1} then true else {BP2} end
end

% questao 10
SMerge = proc {$ Xs Ys ?S}
	         case Xs of nil then S = Ys
	         else
	            case Ys of nil then S = Xs
	            else
	               case Xs of X|Xr then
		               case Ys of Y|Yr then
			               if X=<Y then
			                  local Mid in
			                     S = X|Mid
			                     {SMerge Xr Ys Mid}
			                  end
			               else
			                  local Mid in
			                     S = Y|Mid
			                     {SMerge Xs Yr Mid}
			                  end
			               end
		               end
		            end
	            end
	         end
	      end