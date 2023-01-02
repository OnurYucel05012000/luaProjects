_G.love = love
local Player = {}

local function createPlayer()
    Player.x = 100
    Player.y = 100
    Player.speed = 200
    
end

function love.load()
    createPlayer()
end

function love.keyreleased(key)
    
end

function love.keypressed(key)
    
end

function love.update(dt)
    if love.keyboard.isDown("w") then
        Player.y = Player.y - Player.speed*dt
    end
    if love.keyboard.isDown("s") then
        Player.y = Player.y + Player.speed*dt
    end
    if love.keyboard.isDown("a") then
        Player.x = Player.x - Player.speed*dt
    end
    if love.keyboard.isDown("d") then
        Player.x = Player.x + Player.speed*dt
    end
end

function love.draw()
    love.graphics.translate(-Player.x+400,-Player.y+300)
    love.graphics.print("x = "..tostring(Player.x).." y = "..tostring(Player.y),Player.x,Player.y-50)

    love.graphics.setColor(0.2,0.89,0)
    love.graphics.circle("fill",40,40,20,10)    
    love.graphics.setColor(0.2,0,0.67)
    love.graphics.circle("fill",200,40,20,10)
    
    
    love.graphics.setColor(0.2,0.34,0)
    love.graphics.circle("fill",Player.x,Player.y,20,10)

    love.graphics.line(0,0,500,0)
    love.graphics.line(0,0,0,500)

end

function love.quit()
    print("===closing love2D===")
end

