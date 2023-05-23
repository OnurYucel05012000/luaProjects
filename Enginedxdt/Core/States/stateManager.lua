local stateManager={}

stateManager.__index = stateManager
function stateManager.newStateManager()
    local this = {
        
        currentState = nil,
        
        gameStatePTR = nil,
        menuStatePTR = nil,
           
    }
    setmetatable(this,stateManager)
    return this
end

function stateManager:initManager ()
    local gameStateClass = require("Enginedxdt.Core.States.ConState.gameState")
    local menuStateClass = require("Enginedxdt.Core.States.ConState.menuState")            
 
    self.menuStatePTR     = menuStateClass.newMenuState()
    self.gameStatePTR     = gameStateClass.newGameState()

    self.menuStatePTR:init(self)
    self.gameStatePTR:init(self)
         
    self:setCurrentState(self.gameStatePTR)
end

function stateManager:getCurrentState()
    return self.currentState
end

function stateManager:setCurrentState (currentstate_)
    self.currentState = currentstate_             
end

-------------------------------
-- standart functions
-------------------------------
function stateManager:update(dt)
    self.currentState:update(dt)   
end

function stateManager:draw()
    self.currentState:draw()
end


return stateManager