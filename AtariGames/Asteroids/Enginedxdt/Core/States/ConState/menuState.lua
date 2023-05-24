local menuState={}

menuState.__index = menuState
function menuState.newMenuState()
    local this = {
        stateManager = nil,
        guiOBJ = nil,          
    }
    setmetatable(this,menuState)
    return this
end

function menuState:init(statemanager_)
    self.stateManager = statemanager_

    self.guiOBJ = require("Enginedxdt.Core.guip.gpCore")
    self.guiOBJ:init()

    self.guiOBJ.createCursorY(100,100,"id_cursory")

end


-------------------------------
-- standart functions
-------------------------------

function menuState:update()
    
end

function menuState:draw()
    self.guiOBJ.draw()
    love.graphics.print("New Game",100,100)    
end

return menuState