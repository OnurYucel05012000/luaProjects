local Label ={}

Label.__index = Label

function Label:new(text,id,x,y,color)
    local this ={
        text = text,
        id = id,
        x =x,
        y =y,

        color=color
    }
    setmetatable(this,Label)
    return this
end

function Label:draw()
    
    love.graphics.setColor(self.color)
    love.graphics.print(self.text,self.x,self.y)
    
end


return Label