local MOD_StateManager={}

function MOD_StateManager.newStateManager()
    return{
        currentState = nil,
        
        gameStatePTR = nil,
        menuStatePTR = nil,
        gameOverStatePTR =nil,

        initManager = function (self,menuState,gameState,gameOverState)
            self.gameStatePTR = gameState
            self.menuStatePTR = menuState
            self.gameOverStatePTR = gameOverState
        end
        ,
        getCurrentState = function (self)
            return self.currentState
        end
        ,
        setCurrentState = function (self,currentstate_)
            self.currentState = currentstate_             
        end
        ,
        update = function (self,dt)
            self.currentState:update(dt)   
        end
        ,
        draw = function (self)
            self.currentState:draw()
        end

    }
end

return MOD_StateManager