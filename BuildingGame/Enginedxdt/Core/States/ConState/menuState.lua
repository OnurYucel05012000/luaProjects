local MOD_MenuState={}

function MOD_MenuState.newMenuState()
    return{
        stateManager = nil,
        guiOBJ = nil,
        backgroundImage = nil,
        rndpoints ={},
        
        
        init = function (self,statemanager_)
            self.stateManager = statemanager_

            self.guiOBJ = require("Enginedxdt.Core.guipV0_2.gpCore")
            self.guiOBJ:init()

            self.guiOBJ.createCursorY("id_cursory",100,100)
            
            --self.backgroundImage = love.graphics.newImage("res/")                        

        end
        ,        
        update = function (self,dt)
            
        end        
        ,
        draw = function (self)
            --love.graphics.draw(self.backgroundImage,0,0)
            
            self.guiOBJ.draw()
            love.graphics.print("New Game",100,100)
            love.graphics.print("Quit",100,130)
        end
    }
end

return MOD_MenuState