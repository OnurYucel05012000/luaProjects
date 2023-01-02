local MOD_Label={}

function MOD_Label.newLabel(x,y,text)
    return{
        x=x,
        y=y,
        width = 0,
        height = 0,
        
        text=text,
        color = {255,0,0},
        

        scalefactorX = 1,
        scalefactorY = 1,

        id = "id_test",
        
        draw = function (self)
            love.graphics.print(self.text,self.x,self.y,0,self.scalefactorX,self.scalefactorY)
        end
        ,
        setText = function (self,text_)
            self.text = text_
        end
        ,
        getPosition = function (self)
            return {self.x , self.y}
        end
        ,
        getText = function (self)
            return self.text
        end
        ,
        getID = function (self)
            return self.id 
        end
        ,
        getColor = function (self)
            return self.color   
        end
        ,
        setPosition = function (self,x_,y_)
            self.x = x_
            self.y = y_
        end
        ,
        setID = function (self,id_)
            self.id = id_
        end
        ,
        setColor = function (self,color_)
            self.color = color_
        end
    }
end

return MOD_Label