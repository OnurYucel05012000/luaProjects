local gppLabel={}

gppLabel.__index = gppLabel

function gppLabel.new(text,x,y)
    local this = {
        x=x,
        y=y,
        width = 0,
        height = 0,
        
        text=text,
        color = {255,0,0},
        

        scalefactorX = 1,
        scalefactorY = 1,

        id = "id_test"
    }
    setmetatable(this,gppLabel)
    return this
end

function gppLabel:draw()    
    love.graphics.print(self.text,self.x,self.y,0,self.scalefactorX,self.scalefactorY)
end
    

return gppLabel