local GameState={}

GameState.__index = GameState
function GameState.newGameState()
    local this = {
        
    stateManager = nil,
    
    blockList = {},
        
    blockClass = nil,
    collisionClass = nil,

    Player = nil,
    requestDirection = {up = false,down = false,right=false,left = false},
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
    self.Player = playerClass.new(32*4,32*4,32,32)

    self.Keys.up = false
    self.Keys.down = false
    self.Keys.right = false
    self.Keys.left = false

    self.Player.currentDirection.down = true

end  

function GameState:init (statemanager_)

    self.stateManager = statemanager_
    
    self.blockClass = require("Enginedxdt.objects.Block")
    
    -------------TILE LOADER------------------
    local tileLoader = require("Enginedxdt.TileManager.TileLoader").new()
    
    tileLoader:load_toTable("world.txt")

    local x = 0
    local y = 0

    for _, rows in ipairs(tileLoader.tilemap) do
        for _, tile in ipairs(rows) do
            if tile == 1 then
                self:create_Block(x,y)
            end
            x = x + 32
        end
        x = 0
        y = y + 32
    end

    -------------TILE LOADER------------------
    
    self:init_Player()

    self.collisionClass = require("Enginedxdt.Core.newton.Collision")
end

-----------------------------------------------------
--create()
-----------------------------------------------------

function GameState:create_Block(x,y)
    table.insert(self.blockList,self.blockClass.init(x,y,32,32))
end

------------------------------------------------------
--collisionDetection()
------------------------------------------------------
function GameState:collision_forRequestDirection(tempPlayer)
    for index,block in ipairs(self.blockList) do
        if self.collisionClass.collisionAABB(tempPlayer,block) then
            return true
        end
    end
    return false
end

function GameState:collision_Player_x_Blocks()
    for index, block in ipairs(self.blockList) do
        if self.collisionClass.collisionAABB(self.Player,block) == true then
            
            if self.Player.currentDirection.up then
                self.Player.currentDirection.up = false                

            elseif self.Player.currentDirection.down then
                self.Player.currentDirection.down = false
            end
            
            break
        end
    end

    local tempPlayer = {
     x = self.Player.x ,
     y = self.Player.y ,
     width = self.Player.width,
     height = self.Player.height
    }

    
    if self.requestDirection.up == true and self.requestDirection.up ~= self.Player.currentDirection.up then
        
        tempPlayer.y = tempPlayer.y - 32                
        if not (self:collision_forRequestDirection(tempPlayer)) then
            self.Player.currentDirection.up = true                 
            self.requestDirection.up = false
        end

    elseif self.requestDirection.down == true and self.requestDirection.down ~= self.Player.currentDirection.down then
        
        tempPlayer.y = tempPlayer.y + 32
        if not (self:collision_forRequestDirection(tempPlayer)) then
            self.Player.currentDirection.down = true
            self.requestDirection.down = false
        end

    end    
    
    --self.Player.keyLock.up = false
    --self.Player.keyLock.down = false

end
------------------------------------------------------
--gameLogic()
------------------------------------------------------

------------------------------------------------------
--update()
------------------------------------------------------
function GameState:update (dt)
    self:collision_Player_x_Blocks()
    self.Player:update(dt)
end

------------------------------------------------------
--draw()
------------------------------------------------------

function GameState:draw ()
    
    --DRAW TILES
    for _, value in ipairs(self.blockList) do
        value:draw()
    end
    --DRAW TILES

    love.graphics.print("gameState")

    
    self.Player:draw()
end        


return GameState