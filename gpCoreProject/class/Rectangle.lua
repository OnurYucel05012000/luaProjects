local Rectangle={}

Rectangle.__index = Rectangle

--static--
local houseText = "hmmm"

---comment
---@param x integer
---@param y integer
---@param width integer
---@param height integer
---@param color table
---@return table
function Rectangle:new(x,y,width,height,color)
    local this =
    {
        x = x,
        y = y,
        color = color,
        width = width,
        height= height
    }
    setmetatable(this, Rectangle)
    return this
end

function Rectangle:area()
    return self.width*self.height
end

function Rectangle:setHouseText(str)
    houseText = str
end

function Rectangle:getHouseText()
    return houseText
end

return Rectangle