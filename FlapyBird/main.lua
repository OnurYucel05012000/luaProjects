_G.love = love

local Rects = {}
local Bird

local point = 0

local constWIN_HEIGHT = 600
local constWIN_WIDTH = 700

local function collisionDetection()
    for _, pipe in ipairs(Rects) do
        if
           Bird.x + Bird.width > pipe.upperX       and
           Bird.y < pipe.upperY + pipe.upperHeight and
           Bird.x < pipe.upperX + pipe.upperWidth
           or
           Bird.x + Bird.width  > pipe.lowerX       and
           Bird.y + Bird.height > pipe.lowerY       and
           Bird.x < pipe.lowerX + pipe.lowerWidth

        then
          return true
        end        
    end
end
        
local function createBird(x,y,width,height)
    local playerClass = require("entity.Player")
    Bird = playerClass.newPlayer(x,y,width,height)
end

--[[

nesne sinifi yapsak hepsinin ayri cizim fonksiyonu olur
ayri olsa..

]]--
local function createRect(x,y,width,height)
    local Rect = {}

    Rect.spaceBetweenPipes = 200

    Rect.upperX = x
    Rect.upperY = y
    Rect.upperWidth = width
    Rect.upperHeight = height
    
    Rect.lowerX = x 
    Rect.lowerY = Rect.upperHeight + Rect.spaceBetweenPipes
    Rect.lowerWidth = width
    Rect.lowerHeight = constWIN_HEIGHT- (height+Rect.spaceBetweenPipes)

    Rect.speed = 100
    Rect.passed = false

    table.insert(Rects,Rect)
end

local function drawPipes()
    love.graphics.setColor(0,255,0)

    for _, rect in ipairs(Rects) do        
    
        love.graphics.rectangle("fill",rect.upperX,rect.upperY,rect.upperWidth,rect.upperHeight)
        love.graphics.rectangle("fill",rect.lowerX,rect.lowerY,rect.lowerWidth,rect.lowerHeight)    

    end
end

local function init()

    
    local rnd = love.math.random(10,constWIN_HEIGHT-100)
    createRect(400,0,30,rnd)
    
    rnd = love.math.random(10,constWIN_HEIGHT-100)
    createRect(700,0,30,rnd) 

    createBird(100,200,32,32)
end

local function checkGamePlaying()
    if Bird.y > 600 then
        Bird.y = 100
        point = 0
    end

    for _, pipe in ipairs(Rects) do
        if Bird.x > pipe.upperX + pipe.upperWidth and not pipe.passed then            
            point = point + 1
            pipe.passed = true
        end
    end


    if collisionDetection()then
      print("collisionDetection()")
      point = 0
      Bird.y = 100
    end
end
--===============================--
function love.load()
    init()
    
end

function love.keypressed(key)    
    if Bird.y > 10 then
        Bird.speedY = -50    
    end
    
end

function love.update(dt)

    for _, rect in ipairs(Rects) do
        rect.upperX = rect.upperX - 1
        rect.lowerX = rect.lowerX - 1        
    end  

    Bird:update(dt)

    checkGamePlaying()

    for index, pipe in ipairs(Rects) do
        if pipe.upperX < 0 - pipe.upperWidth then
            table.remove(Rects,index)
            createRect(700,0,30,love.math.random(20,constWIN_HEIGHT-100))
        end
    end

end

function love.draw()

    love.graphics.setColor(0.0 , 0.1 , 0.255)
    love.graphics.rectangle("fill",0,0,constWIN_WIDTH,constWIN_HEIGHT)

    
    
    drawPipes()
    Bird:draw()

    love.graphics.print("BirdspeedY = "..tostring(Bird.speedY))
    love.graphics.print("point = "..tostring(point),0,15)
    

    
    
end

function love.quit()
    print("===closing love2D===")
end