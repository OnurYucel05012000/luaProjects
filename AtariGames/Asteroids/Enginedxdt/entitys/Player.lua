local Player = {}

Player.__index = Player

function Player.new(location,velocity,acceleration,width,height)
    local this = {
        location = location,
        velocity = velocity,
        accerelation = acceleration,
        width=width,
        height=height,
        speed = 200
    }
    setmetatable(this,Player)
    return this
end

function Player:update(dt)
      
end

function Player:draw()
    love.graphics.rectangle("line",self.location.x,self.location.y,self.width,self.height)
end


return Player