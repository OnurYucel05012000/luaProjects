local Player = {}

Player.__index = Player

function Player.new(location,velocity,acceleration,width,height)
    local this = {

        location = location,
        velocity = velocity,
        acceleration = acceleration,

        width=width,
        height=height,

        angle = 0
        
    }
    setmetatable(this,Player)
    return this
end

function Player:applyForce(force)
    self.acceleration:add(force)
    
end

function Player:update(dt)

    self.velocity:add(self.acceleration)
    self.location:add(self.velocity)

    self.acceleration:mult(0)
end

function Player:draw()
    love.graphics.push()

    love.graphics.translate(self.location.x,self.location.y)    
    love.graphics.rotate(self.angle)
    love.graphics.rectangle("line",-self.width/2,-self.height/2,self.width,self.height)
    
    local r = 0.5
    local y = r * math.sin(self.angle)
    local x = r * math.cos(self.angle)

    love.graphics.line(-self.width,-self.height,x,y)

    love.graphics.pop()
end


return Player