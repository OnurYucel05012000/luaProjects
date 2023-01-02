local MOD_House = {}

function MOD_House.newHouse(x_,y_,width_,height_)
return
{
   x=x_,
   y=y_,
   width=width_,
   height=height_,

   draw = function (self)
      love.graphics.rectangle("line",self.x,self.y,self.width,self.height)
   end
}
end

return MOD_House