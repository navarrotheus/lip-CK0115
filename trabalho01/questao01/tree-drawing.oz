functor
export 
   depthFirst:DepthFirst
   addXY:AddXY
define
    Scale=30
    proc {DepthFirst Tree Level LeftLim ?RootX ?RightLim}
        case Tree
        of tree(x:X y:Y left:leaf right:leaf ...) then
            X=LeftLim
            RootX=X
            RightLim=X
            thread Y=Scale*Level end
        [] tree(x:X y:Y left:L right:leaf ...) then
            X=RootX
            thread Y=Scale*Level end
            {DepthFirst L Level+1 LeftLim RootX RightLim}
        [] tree(x:X y:Y left:leaf right:R ...) then
            X=RootX
            thread Y=Scale*Level end
            {DepthFirst R Level+1 LeftLim RootX RightLim}
        [] tree(x:X y:Y left:L right:R ...) then
            LRootX LRightLim RRootX RLeftLim
           in
            RootX=X
            thread X=(LRootX+RRootX) div 2 end
            thread Y=Scale*Level end
            thread RLeftLim=LRightLim+Scale end
            {DepthFirst L Level+1 LeftLim LRootX LRightLim}
            {DepthFirst R Level+1 RLeftLim RRootX RightLim}
        end
    end

    fun {AddXY Tree}
        case Tree
        of tree(left:L right:R ...) then
            {Adjoin Tree
                tree(x:_ y:_ left:{AddXY L} right:{AddXY R})}
        [] leaf then
            leaf
        end
    end
end