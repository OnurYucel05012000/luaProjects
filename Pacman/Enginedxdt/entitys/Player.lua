local Player = {}

Player.__index = Player

function Player.new(x,y,width,height)
    local this = {
        x=x,
        y=y,
        width=width,
        height=height,
        speed = 50,
        
        currentDirection = {stopped = false,up = false,right=false,down = false,left = false},

    }
    setmetatable(this,Player)
    return this
end

function Player:update(dt)
   
    if self.currentDirection.stopped then
        return
    end

    --up--
   if self.currentDirection.up then
    self.y = self.y - self.speed*dt

   --right--
   elseif self.currentDirection.right then
    self.x = self.x + self.speed*dt

    --down--
   elseif self.currentDirection.down  then
    self.y = self.y + self.speed*dt

    --left--
   elseif self.currentDirection.left then
    self.x = self.x - self.speed*dt

   end
   
end

function Player:draw()
    love.graphics.rectangle("line",self.x,self.y,self.width,self.height)
end


return Player