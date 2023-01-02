_G.love = love

---ping pong
---y hizi oyuncuya carptikca rastgele articak
---x hizi ise articak 

local players = {}
local ball={}

local SPEED = 5
local SCREEN_WIDTH = 1200
local SCREEN_HEIGHT = 600

local point1,point2 = 0,0
local state
local fontRes
local ballVX_increase = 1.02

local keys ={}

local gpCore = require("gui_plus.gpCore")
local ball_mod = require("entitys.Ball")
local player_mod = require("entitys.Player")

function RestartGame()
   love.graphics.setBackgroundColor(0,0,0)
   players[1].y = 0
   players[2].y = 0
   
   ball = ball_mod.createBall(250,250,20,20)
end

local function gameOverState()
   if point1>point2 then
       love.graphics.print("p1 win",100,100)
   else
      love.graphics.print("p2 win",100,100)
   end
end

function CollisionDetection(index)
   
   if 
      ball.x + ball.width      >= players[index].x                              and
      ball.x                   <= players[index].x +  players[index].width      and
      ball.y + ball.height     >= players[index].y                              and
      ball.y                   <= players[index].y +  players[index].height
   then
         return true
   end
   
   return false
end

local function moveBall(dt)
   
   --[[if collisionDetection() == true then
      
      if players[1].x  + players[1].width > ball.x then
         ballVy = ballVy * -1
      else
         ballVx = ballVx * -1
      end
      ---ball.x = ball.x + ballVx*dt*4

      
      ball.x = ball.x + ballVx*dt
      ball.y = ball.y + ballVy*dt
      createCollisionPoints(ball.x,ball.y)
   end]]--
   ---or ball.y <= 0 or ball.y >= 500 
   
   
end

local function menuState()
    gpCore.draw()
    love.graphics.print("MENU",200,100,0,5)
    if gpCore.isClicked("id_gamestart") == true and love.mouse.isDown(1) == true then
      state = "game"
    end
end

local function gameState()
   
   love.graphics.rectangle("fill",
   players[1].x ,
   players[1].y ,
   players[1].width ,
   players[1].height )

   love.graphics.rectangle("fill",
   players[2].x ,
   players[2].y ,
   players[2].width ,
   players[2].height )
   
   ball_mod.draw()

   love.graphics.setFont(fontRes)
   love.graphics.print("DENEME",100,100)
   love.graphics.print(tostring(point1),200,200)
   love.graphics.print(tostring(point2),200,240)
end

local function loadFontRes()
    fontRes = love.graphics.newFont("res/arial.ttf")
end

function love.load()

   table.insert(players,player_mod.createPlayers(10,0,30,100))
   table.insert(players,player_mod.createPlayers(SCREEN_WIDTH - 50,0,30,100))

   ball = ball_mod.createBall(250,250,20,20)
   
   ballVx = math.random(2) == 1 and 100 or -10
   ballVy = math.random(-50,50) * 1.5

   gpCore.createButton({200,200,100,30},"id_gamestart"," Start ",{255,0,0},{255,255,255})
   loadFontRes()
   keys.w = false
   keys.s = false
   keys.up = false
   keys.down =false

   state = "menu"
end

function love.mousepressed()
    
end

function love.mousemoved()
   --
end

function love.keypressed(key)
     if key == "w" then
      keys.w = true
        
     end
     if key == "s" then
      keys.s = true
        
     end

     if key == "up" then
      keys.up = true
        
     end
     if key == "down" then
      keys.down = true
        
     end

     if key =="p"then
        restartGame()
     end
end

function love.keyreleased(key)
   if key == "w" then
      keys.w = false
   end
   if key == "s" then
      keys.s = false
   end
   if key == "up" then
      keys.up = false
   end
   if key == "down" then
      keys.down = false
   end
end

function love.update(dt)
   if state == "game" then
      ball_mod.update(dt)

      ---===win conditions===---
     
      if ball_mod.ball.x <= 0 then
         point2 = point2 + 1
         RestartGame()
      elseif ball_mod.ball.x >= SCREEN_WIDTH - 10 then
         point1 = point1 + 1
         RestartGame()
      end
      ---===win conditions===---

      if keys.w == true and players[1].y >= 0 then
         players[1].y = players[1].y - SPEED
      end
      if keys.s == true and players[1].y < SCREEN_HEIGHT - players[1].height then
         players[1].y = players[1].y + SPEED
      end
      if keys.up == true and players[2].y >= 0 then
         players[2].y = players[2].y - SPEED
      end
      if keys.down == true and players[2].y < SCREEN_HEIGHT - players[2].height then
         players[2].y = players[2].y + SPEED  
      end
      
      ---====hareketli oyuncular=====----
      --[[if players[1].y <= ball.y then
         players[1].y = players[1].y + SPEED
      else
         players[1].y = players[1].y - SPEED
      end
  
      if players[2].y <= ball.y then
         players[2].y = players[2].y + SPEED
      else
         players[2].y = players[2].y - SPEED
      end]]--

   end
    
end

function love.draw()

   if state == "game" then
      gameState()
   elseif state == "menu" then
      menuState()
   end
   
end

