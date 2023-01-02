local MOD_Rock={}

function MOD_Rock.newRock(x_,y_,width_,height_,image_,quads_)
    return
{
    x=x_,
    y=y_,
    width=width_,
    height=height_,
    speed = 200,
    
    image = image_,
    quads = quads_,

    update = function (self,dt)
        self.y = self.y + self.speed * dt
    end
    ,
    draw = function (self)
        love.graphics.draw(self.image,self.quads[1],self.x,self.y)
        --love.graphics.rectangle("fill",self.x,self.y,self.width,self.height)
    end
}
end
return MOD_Rock