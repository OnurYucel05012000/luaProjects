local Player = {}

Player.__index = Player

function Player.new(x,y,width,height)
    local this = {
        x=x,
        y=y,
        width=width,
        height=height,
        speed = 50,

        direction = {up = false,right = false,down = false,left = false},
        currentDirection = {up = false,right=false,down = false,left = false},

        keyLock = {up = false,right = false,down = false,left = false}
    }
    setmetatable(this,Player)
    return this
end

function Player:update(dt)
    --up--
   if self.currentDirection.up then
    self.y = self.y - self.speed*dt

   --right--
   elseif self.direction.right then
    self.x = self.x + self.speed*dt

    --down--
   elseif self.currentDirection.down  then
    self.y = self.y + self.speed*dt

    --left--
   elseif self.direction.left then
    self.x = self.x - self.speed*dt

   end
   
end

function Player:draw()
    love.graphics.rectangle("line",self.x,self.y,self.width,self.height)
end


return Player