functor
import
    Browser
    TreeOps at '/home/navarrotheus/Documents/Projetos/ufc/lip-CK0115/trabalho01/questao01/tree-drawing.ozf'
define
    Tree = tree(key:a val:1
	        left:tree(key:b val:2
                    left:tree(key:k val:11
                            left:tree(key:l val:12 left:leaf right:leaf)
                            right:tree(key:m val:13 left:leaf right:leaf)
                        )
                    right:tree(key:n val:14 left:leaf
                            right:tree(key:j val:10 left:leaf right:leaf)
                        )
                )
	        right:tree(key:c val:3
                    left:tree(key:d val:4
                        left:tree(key:f val:6 left:leaf right:leaf)
                        right:tree(key:g val:7
                            left:tree(key:h val:8 left:leaf right:leaf)
                            right:tree(key:i val:9 left:leaf right:leaf)
                        )
                    )
                    right:tree(key:e val:5 left:leaf right:leaf)
                )
           )
                
    TreeAddedXY = {TreeOps.addXY Tree}
    {TreeOps.depthFirst TreeAddedXY 1 30 _ _}
    {Browser.browse TreeAddedXY}
end