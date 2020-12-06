% item a
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

% item b

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
