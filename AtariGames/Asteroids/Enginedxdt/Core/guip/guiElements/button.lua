local MOD_gpCoreButton={}

---comment
---@param x integer
---@param y integer
---@param width integer
---@param height integer
---@param id string
---@param color table
---@return table 
function MOD_gpCoreButton.newButton(x,y,width,height,labelOBJ,drawMode,id,color)
    return{
        x=x,
        y=y,
        width=width,
        height = height,
        color=color,
        id = id,

        label = labelOBJ,
        labelPos = "lefttop",
        drawMode = drawMode,

        draw = function (self)

            love.graphics.setColor(self.color)
            
            love.graphics.rectangle(self.drawMode,self.x,self.y,self.width,self.height)

            if self.labelPos == "lefttop" then
                love.graphics.print(self.label.text,self.x,self.y)    
            end
            
        end
        ,
        setColor = function (self,colorPar)
            
            self.color = colorPar
        end
        ,
        getColor = function (self)
            return self.color
        end
        ,
        setLabel = function (self,text_)
            self.label:setText(text_)
        end
        ,
        getLabelText = function (self)
            return self.label.text
        end
        ,
        setPosition = function (self,x_,y_)
            self.x = x_
            self.y = y_
        end
        ,
        getPosition = function (self)
            return{self.x,self.y}
        end
        ,
        getWidth = function (self)
            return self.width
        end
        ,
        getHeight = function (self)
            return self.height
        end
        ,
        getID = function (self)
            return self.id
        end
        ,
        setID = function (self,id_)
            self.id = id_
        end
        ,
        setDrawMode = function (self,mode)
            self.drawmode = mode
        end
        

    }
end

return MOD_gpCoreButton