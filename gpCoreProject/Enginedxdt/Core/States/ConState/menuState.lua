local MOD_MenuState={}

function MOD_MenuState.newMenuState()
    return{
        stateManager = nil,
        guiOBJ = nil,
        
        
        init = function (self,statemanager_)
            self.stateManager = statemanager_

            self.guiOBJ = require("Enginedxdt.Core.guipV0_2.gpCore")
            self.guiOBJ:init()

            self.guiOBJ.createCursorY(100,100,"id_cursory")



        end
        ,        
        update = function (self,dt)
            
        end        
        ,
        draw = function (self)
            self.guiOBJ.draw()
            love.graphics.print("New Game",100,100)
        end
    }
end

return MOD_MenuState