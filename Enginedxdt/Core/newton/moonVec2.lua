local moonVec2d = {
    __VERSION = "moonVec2d.lua : 0.0.1",
    __DESCRIPTION = "vector",
    __LUA_VERSION = "lua_54"
}

-------------------------------------
-- private functions
-------------------------------------
local function checkisInteger (x,y)
    if type(x) ~= "number" or type(x) ~= "number" then
        error("invalid value type")
    end
end

--------------------------------------
-- public functions
--------------------------------------
moonVec2d.__index = moonVec2d
function moonVec2d.new(x,y)
    checkisInteger(x,y)
    local this = {
        x=x,
        y=y
    }
    setmetatable(this,moonVec2d)
    return this
end

function moonVec2d:div(value)
    self.x = self.x / value
    self.y = self.y / value
end

function moonVec2d:mult(value)

    self.x = self.x * value
    self.y = self.y * value

end

function moonVec2d:sub(vec2)
    self.x = self.x - vec2.x
    self.y = self.y - vec2.y
end

function moonVec2d:add(vec2)
    self.x = self.x + vec2.x
    self.y = self.y + vec2.y
end

function moonVec2d:magnitude()
    return math.sqrt(self.x*self.x + self.y*self.y)
end

function moonVec2d:normalize()
    local magnitude = self:magnitude()
    
    if magnitude ~= 0 then
        return {
            x = self.x / magnitude,
            y = self.y / magnitude
        }        
    end
    
end

function moonVec2d:dotProduct()
    
end

function moonVec2d:rotate()
    
end

function moonVec2d:angleBetween()
    
end

return moonVec2d