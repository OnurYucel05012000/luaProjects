local PlayerClass = {}

PlayerClass ={
    name = "",
    x = 0,
    y = 0,
    speed = 0,
    
}


function PlayerClass:move()
    print("moving"..self.name)
end

function PlayerClass:new(t)
    t = t or {}
    setmetatable(t,self)
    self.__index = self
    return t
end

function PlayerClass:draw()
    print("drawing"..self.name)
end

function PlayerClass:update()
    print("updating"..self.name)
end

return PlayerClass