functor
import
Browser
Gates at '/home/navarrotheus/Documents/Projetos/ufc/lip-CK0115/trabalho01/questao03/circuit.ozf'
define
	X=1|0|1|0|_
	Y=0|1|1|0|_
	{Browser.browse {Gates.andG X Y}}
	{Browser.browse {Gates.orG X Y}}
	{Browser.browse {Gates.xorG X Y}}
end