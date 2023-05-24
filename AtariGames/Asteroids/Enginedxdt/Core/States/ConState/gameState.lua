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
    if self.Keys.up then
        local y = -0.05
        
        local r = y / math.sin(self.Player.angle)
        local x = math.sqrt( r*r - y*y )

        local force = self.vec2.new(x,y)
        self.Player:applyForce(force)
    end

    if self.Keys.down then
        local force = self.vec2.new(0,0.05)
        self.Player:applyForce(force)
    end

    if self.Keys.right then
        self.Player.angle = self.Player.angle + 0.01       
    end

    if self.Keys.left then
        self.Player.angle = self.Player.angle - 0.01
    end
    
    if self.Player.location.y <= 0 then
        self.Player.location.y = 500
    end

    if self.Player.location.x <= 0 then
        self.Player.location.x = 500
    end
    self.Player:update()
end

------------------------------------------------------
--draw()
------------------------------------------------------
function GameState:draw ()
    
    love.graphics.print("gameState")

    love.graphics.line(self.Player.location.x,self.Player.location.y,self.Player.location.x,400)
    love.graphics.line(self.Player.location.x,self.Player.location.y,400,self.Player.location.y)

    

    love.graphics.print("up : "..tostring(self.Keys.up),20,100)
    love.graphics.print("location x = "..self.Player.location.x .. " , y = " .. self.Player.location.y,20,140)
    love.graphics.print("velocity y = "..self.Player.velocity.x .. " , y = " .. self.Player.velocity.y,20,160)
    love.graphics.print("acceleration y = "..self.Player.acceleration.x .. " , y = " .. self.Player.acceleration.y,20,180)
    love.graphics.print("angle = "..self.Player.angle ,20,200)
    self.Player:draw()
end        


return GameState