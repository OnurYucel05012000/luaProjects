local Player = {}

Player.__index = Player

function Player.new(x,y,width,height)
    local this = {
        x=x,
        y=y,
        width=width,
        height=height,
        speed = 200,

        direction = nil,

        keyLock = {up = false,right = false,down = false,left = false}
    }
    setmetatable(this,Player)
    return this
end

function Player:update(dt)
    --up--
   if self.direction == 1 and not (self.keyLock.up) then
    self.y = self.y - self.speed*dt

   --right--
   elseif self.direction == 2 and not (self.keyLock.right)then
    self.x = self.x + self.speed*dt

    --down--
   elseif self.direction == 3 and not (self.keyLock.down) then
    self.y = self.y + self.speed*dt

   elseif self.direction == 4 and not (self.keyLock.left)then
    self.x = self.x - self.speed*dt

   end
   
end

function Player:draw()
    love.graphics.rectangle("line",self.x,self.y,self.width,self.height)
end


return Player