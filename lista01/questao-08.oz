% correção
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