local MOD_Player={}

function MOD_Player.newPlayer(x,y,width,height)
    return
{
    x = x,
    y = y,
    width = width,
    height = height,
    speedY = 20,

    update = function (self,dt)
        self.speedY = self.speedY + 100*dt
        self.y = self.y + self.speedY*dt      
    end
    ,
    draw = function (self)
        love.graphics.rectangle("fill",self.x,self.y,self.width,self.height)
    end
}
end

return MOD_Player