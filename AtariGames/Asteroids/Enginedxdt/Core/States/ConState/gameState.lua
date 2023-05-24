local GameState={}

GameState.__index = GameState
function GameState.newGameState()
    local this = {
        
    stateManager = nil,
    
    Player = nil,
    vec2 = nil,
    Keys = {},
    
    }    
    setmetatable(this,GameState)
    return this
end

------------------------------------------------------
--init()
------------------------------------------------------

function GameState:init_Player()

    local playerClass = require("Enginedxdt.entitys.Player")

    local location = self.vec2.new(100,100)
    local velocity = self.vec2.new(0,0)
    local acceleration = self.vec2.new(0,0)

    self.Player = playerClass.new(location,velocity,acceleration,32,32)

    self.Keys.up = false
    self.Keys.down = false
    self.Keys.right = false
    self.Keys.left = false

end  

function GameState:init (statemanager_)

    self.stateManager = statemanager_
    
    --init vec2
    self.vec2 = require("Enginedxdt.Core.newton.moonVec2")
    
    self:init_Player()
end

------------------------------------------------------
--gameLogic()
------------------------------------------------------

------------------------------------------------------
--update()
------------------------------------------------------
function GameState:update (dt)
    
end

------------------------------------------------------
--draw()
------------------------------------------------------
function GameState:draw ()
    
    love.graphics.print("gameState")

    
    self.Player:draw()
end        


return GameState