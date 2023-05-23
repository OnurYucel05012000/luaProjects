local GameState={}

GameState.__index = GameState
function GameState.newGameState()
    local this = {
        
    stateManager = nil,
    
    blockList = {},
        
    blockClass = nil,
    collisionClass = nil,

    Player = nil,
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
            x = x + 33
        end
        x = 0
        y = y + 33
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
function GameState:collision_Player_x_Blocks()
    for index, block in ipairs(self.blockList) do
        if self.collisionClass.collisionAABB(self.Player,block) == true then
            
            if self.Player.direction == 1 then
                self.Player.keyLock.up = true
                self.Player.keyLock.down = false

            elseif  self.Player.direction == 2 then
                self.Player.keyLock.right = true
                self.Player.keyLock.left = false

            elseif  self.Player.direction == 3 then
                self.Player.keyLock.down = true
                self.Player.keyLock.up = false

            elseif  self.Player.direction == 4 then
                self.Player.keyLock.left = true
                self.Player.keyLock.right = false                
            end
            
            break
        end
    end

    --self.Player.keyLock.up = false
    --self.Player.keyLock.down = false

end
------------------------------------------------------
--gameLogic()
------------------------------------------------------
function GameState:movePlayer(dt)

    if self.Keys.up then
        self.Player.direction = 1
        self.Player:update(dt)        

    elseif self.Keys.right then
        self.Player.direction = 2
        self.Player:update(dt)        

    elseif self.Keys.down then
        self.Player.direction = 3
        self.Player:update(dt)        

    elseif self.Keys.left then
        self.Player.direction = 4
        self.Player:update(dt)
        
    end

end

------------------------------------------------------
--update()
------------------------------------------------------
function GameState:update (dt)
    self:collision_Player_x_Blocks()
    self:movePlayer(dt)
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