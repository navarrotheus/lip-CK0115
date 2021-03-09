functor
import
    Browser
    ParserOps at '/home/navarrotheus/Documents/Projetos/ufc/lip-CK0115/trabalho01/questao02/parser.ozf'
define
    A={ParserOps.prog
        [program countToTen ';'
         while count '<' 10 'do' count ':=' count '+' 1 'end']
        _}
    {Browser.browse A}
end

