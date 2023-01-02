local Button={}

Button.__index = Button

function Button:new()
    local this = {

    }
    setmetatable(this,Button)
    return this
end

return Button