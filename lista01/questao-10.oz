% codigo do livro
declare
C={NewCell 0}
thread I in
  I=@C
  C:=I+1
end
thread J in
  J=@C
  C:=J+1
end

{Browse @C}

% com delay
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
