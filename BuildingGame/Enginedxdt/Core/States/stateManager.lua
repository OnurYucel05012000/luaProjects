local MOD_StateManager={}

function MOD_StateManager.newStateManager()
    return{
        currentState = nil,
        
        gameStatePTR = nil,
        menuStatePTR = nil,

        initManager = function (self)
           local gameStateClass = require("Enginedxdt.Core.States.ConState.gameState")
           local menuStateClass = require("Enginedxdt.Core.States.ConState.menuState")            
         
         
          self.menuStatePTR     = menuStateClass.newMenuState()
          self.gameStatePTR     = gameStateClass.newGameState()
   
          self.menuStatePTR:init(self)
          self.gameStatePTR:init(self)
                 
          self:setCurrentState(self.gameStatePTR)
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