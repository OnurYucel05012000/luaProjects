_G.love =love



local function getCurrentTimeAll()

    local date = os.time()

    local second = 60
    local sec2hour = second * second -- seconds in an hour
    local sec2day = sec2hour * 24 -- seconds in a day
    
    local hour = math.floor((date % sec2day / sec2hour)+3)
    if hour > 24 then
        hour = 0
    end

    return {
        hour = hour,
        min = math.floor(date % sec2hour / second),
        sec = date%second
    }
end

local function getCurrentHour()
    
    local date = os.time()

    local second = 60
    local sec2hour = second * second -- seconds in an hour
    local sec2day = sec2hour * 24 -- seconds in a day
    
    local hour = math.floor((date % sec2day / sec2hour)+3)
    if hour > 24 then
        hour = 0
    end
end

local function getCurrentMinute()
    local date = os.time()
    local second = 60
    local sec2hour = second * second -- seconds in an hour
    return math.floor(date % sec2hour / second)
end

local function getCurrentSec()
    local date = os.time()
    return date % 60
end

function love.draw()
    local current_second = os.time() % 60

    local WIN_WIDTH = 400
    local WIN_HEIGHT = 150
    
    love.graphics.setColor(0,0.5,0.5)
    love.graphics.rectangle("fill",0,0,WIN_WIDTH,WIN_HEIGHT)
    
    local scaleSize = 7
    love.graphics.setColor(0.5,0,0)
    love.graphics.print("FPS "..tostring(love.timer.getFPS()))
    
    -- hour
    love.graphics.print(tostring(getCurrentTimeAll().hour)..":",0,10,0,scaleSize,scaleSize)
    -- minutes
    love.graphics.print(tostring(getCurrentTimeAll().min)..":",140,10,0,scaleSize,scaleSize) 
    -- seconds
    love.graphics.print(tostring(getCurrentTimeAll().sec),290,10,0,scaleSize,scaleSize) 
end