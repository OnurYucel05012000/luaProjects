local gppButton={}

gppButton.__index = gppButton

---comment
---@param x integer
---@param y integer
---@param width integer
---@param height integer
---@param id string
---@param color table
---@return table 
function gppButton.new(x,y,width,height,labelOBJ,drawMode,id,color)
    local this = {
        x=x,
        y=y,
        width=width,
        height = height,
        color=color,
        id = id,

        label = labelOBJ,
        labelPos = "lefttop",
        drawMode = drawMode,
    }

    setmetatable(this,gppButton)
    return this

end

function gppButton:draw()
    
    love.graphics.setColor(self.color)
            
    love.graphics.rectangle(self.drawMode,self.x,self.y,self.width,self.height)

    if self.labelPos == "lefttop" then
        love.graphics.print(self.label.text,self.x,self.y)    
    end
end

return gppButton