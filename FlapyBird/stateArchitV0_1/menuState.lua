local MOD_MenuState={}

function MOD_MenuState.newMenuState(statemanager_,guiOBJ_)
    return{
        stateManager = statemanager_,
        
        
        init = function (self)
            
        end
        ,        
        update = function (self,dt)
            
        end
        ,
        drawMenuLabels = function ()
        
        end
        ,
        draw = function (self)
           love.graphics.print("menuState")
        end
    }
end

return MOD_MenuState