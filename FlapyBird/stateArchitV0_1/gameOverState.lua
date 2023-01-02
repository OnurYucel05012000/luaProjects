local MOD_GameOverState={}

function MOD_GameOverState.newGameOverState(statemanager_)
    return{

        stateManager = statemanager_,

        init = function (self)
            
        end
        ,
        update = function (self)
            
        end
        ,
        draw = function (self)
            love.graphics.print("gameOver state")
        end
    }
end

return MOD_GameOverState