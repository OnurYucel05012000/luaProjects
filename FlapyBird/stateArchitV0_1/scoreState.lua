local MOD_ScoreState ={}

function MOD_ScoreState.newScoreState(statemanager_)
    return{
        stateManager = statemanager_,
        
        init = function (self)
            
        end
        ,
        update = function (self,dt)
            
        end
        ,
        draw = function (self)            
            love.graphics.print("scoreState")
        end
    }
end


return MOD_ScoreState