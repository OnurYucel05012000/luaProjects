local MOD_MouseInput={}

function MOD_MouseInput.newMouse(statemanager_)
    return
{
    stateManager = statemanager_,

    gameStatePTR = nil,

    init = function (self)
        self.gameStatePTR = self.stateManager.gameStatePTR    
    end
    ,
    ---A{x,y,width,height},B{x,y,width,height}
    ---@param self any
    ---@param A table
    ---@param B table
    ---@return boolean
    collisionDetection = function (self,A,B)
        if 
            A.x < B.x + B.width  and
            A.x + A.width > B.x   and
            A.y < B.y + B.height  and
            A.y + A.height > B.y
        then
            return true
        end

        return false
    end
    ,
    mousereleased = function (self)
        local Icons = self.gameStatePTR.Icons
        for _, icon in ipairs(Icons) do
            if icon.clicked then
                icon.clicked = false
            end
        end
    end
    ,
    mousepressed = function (self)
        local Icons = self.gameStatePTR.Icons
        local mouseX,mouseY = love.mouse.getX(),love.mouse.getY()

        for _, icon in ipairs(Icons) do
                        
           if self:collisionDetection({x=mouseX,y=mouseY,width=3,height=3},{x=icon.x,y=icon.y,width = icon.width,height =icon.height})then
             icon.clicked = true
           end
        end

    end
}
end

return MOD_MouseInput