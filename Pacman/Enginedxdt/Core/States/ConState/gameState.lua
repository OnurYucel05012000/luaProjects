local GameState={}

GameState.__index = GameState
function GameState.newGameState()
    local this = {
        
    stateManager = nil,
    
    blockList = {},
        
    blockClass = nil,
    collisionClass = nil,

    tileLoader = nil,

    Player = nil,
    requestDirection = {up = false,down = false,right = false,left = false}
    
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

end  

function GameState:init (statemanager_)

    self.stateManager = statemanager_
    
    self.blockClass = require("Enginedxdt.objects.Block")
    
    -------------TILE LOADER------------------
    self.tileLoader = require("Enginedxdt.TileManager.TileLoader").new()
    
    self.tileLoader:load_toTable("world.txt")

    local x = 0
    local y = 0

    for _, rows in ipairs(self.tileLoader.tilemap) do
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

function GameState:collision_Player_x_Blocks(tempPlayer)
    
   for _, value in ipairs(self.blockList) do
       if self.collisionClass.collisionAABB(tempPlayer,value) then                      
           return true
       end
   end

   return false
end
------------------------------------------------------
--gameLogic()
------------------------------------------------------

function GameState:movement_logic()
    
    --ilerde bu bolum sikinti yaratacak--
    local playerWorldX = (self.Player.x / 32) + 1
    local playerWorldY = (self.Player.y / 32) + 1
    -------------------------------------

    if  not (self.Player.currentDirection.stopped) and
        (
            self.tileLoader.tilemap[math.ceil(playerWorldY - 1)][playerWorldX] == 1 or --up
            self.tileLoader.tilemap[math.floor(playerWorldY + 1)][playerWorldX] == 1    --down
            --self.tileLoader.tilemap[playerWorldY - 1][playerWorldX] == 1    --right
            --self.tileLoader.tilemap[playerWorldY - 1][playerWorldX] == 1    --left
        ) 
    then
        print("Collision")
        self.Player.currentDirection.stopped = true

        self.Player.currentDirection.up = false
        self.Player.currentDirection.down = false
        self.Player.currentDirection.right = false
        self.Player.currentDirection.left = false

        self.requestDirection.up = false
        self.requestDirection.down = false
        self.requestDirection.right = false
        self.requestDirection.left = false
    end

    if self.requestDirection.up then            
        if self.tileLoader.tilemap[math.ceil(playerWorldY - 1)][playerWorldX] ~= 1 then
            self.requestDirection.up = false
            self.Player.currentDirection.up = true
            self.Player.currentDirection.stopped = false
        end

    elseif  self.requestDirection.down then
        if self.tileLoader.tilemap[math.floor(playerWorldY + 1)][playerWorldX] ~= 1 then
            self.requestDirection.down = false
            self.Player.currentDirection.down = true
            self.Player.currentDirection.stopped = false
        end
    end

end

------------------------------------------------------
--update()
------------------------------------------------------
function GameState:update (dt)
    
    self:movement_logic()
   

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

    love.graphics.print("up    : " .. tostring(self.Player.currentDirection.up),40,510)
    love.graphics.print("down  : " .. tostring(self.Player.currentDirection.down),40,530)
    love.graphics.print("left  : " .. tostring(self.Player.currentDirection.left),40,550)
    love.graphics.print("right : " .. tostring(self.Player.currentDirection.right),40,570)

    love.graphics.print("request up    : " .. tostring(self.requestDirection.up),200,510)
    love.graphics.print("request down  : " .. tostring(self.requestDirection.down),200,530)
    love.graphics.print("request left  : " .. tostring(self.requestDirection.left),200,550)
    love.graphics.print("request right : " .. tostring(self.requestDirection.right),200,570)

    love.graphics.print("stopped : ".. tostring(self.Player.currentDirection.stopped),150,350)
    love.graphics.print("playerWorldX : "..(self.Player.x / 32) + 1,40,370)
    love.graphics.print("playerWorldY : "..(self.Player.y / 32) + 1,40,390)

    love.graphics.print("ceil(playerWorldX) : "..math.ceil((self.Player.x / 32) + 1),200,370)
    love.graphics.print("ceil(playerWorldY) : "..math.ceil((self.Player.y / 32) + 1),200,390)
    self.Player:draw()
end        


return GameState
