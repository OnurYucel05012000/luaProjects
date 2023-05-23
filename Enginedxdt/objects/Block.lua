local Block ={}

Block.__index = Block
function Block.init(x,y,width,height)
    local this = {
        x = x,
        y = y,
        width = width,
        height = height
    }
    setmetatable(this,Block)
    return this
end

function Block:draw()
    love.graphics.rectangle("line",self.x,self.y,self.width,self.height)
end

return Block