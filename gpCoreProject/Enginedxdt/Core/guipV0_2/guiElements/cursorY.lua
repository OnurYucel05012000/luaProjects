local MOD_CursorY ={}

function MOD_CursorY.newCursorY(x,y,id)
    return{
        x=x,
        y=y,
        speed = 10,
        id=id,
        color={255,255,255},

        draw = function (self)
           love.graphics.setColor(self.color)
           love.graphics.circle("fill",self.x,self.y,10,3)
           --love.graphics.rectangle("fill",self.x,self.y,300,200)
        end
        ,
        ---comment
        ---@param self any
        ---@param x_ integer
        ---@param y_ integer
        setPosition=function (self,x_,y_)
            self.x = x_
            self.y = y_
        end
        ,
        setColor = function (self,color_)
            self.color = color_
        end
        ,
        getPosition = function (self)
            return {x=self.x,y=self.y}
        end
        ,
        getColor = function (self)
            return {r=self.color[1],g=self.color[2],b=self.color[3]}
        end
        
        
    }
end


return MOD_CursorY