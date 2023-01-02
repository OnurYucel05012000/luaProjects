local MOD_GameState={}

function MOD_GameState.newGameState()
    return
{
    stateManager = nil,
    
    --Birimler--
    logicUnit = nil,
    renderUnit = nil,

    init_Units = function (self)
        local logicUnit_Class = require("Enginedxdt.Core.Units.logicUnit.logicUnit")
        local renderUnit_Clas  =require("Enginedxdt.Core.Units.renderUnit.renderUnit")

        self.logicUnit = logicUnit_Class.newLogicUnit()
        self.renderUnit = renderUnit_Clas.newRenderUnit()

        self.logicUnit:init()
        self.renderUnit:init()

    end
    ,
    init = function (self,statemanager_)

        self.stateManager = statemanager_        

        self:init_Units()
    end
    ,    
    checkGameOver = function (self)

    end           
    ,
    resetGame = function (self)
    
    end
    ,
    update = function (self,dt)
        self.logicUnit:update(dt)
    end
    ,
    draw = function (self)
        self.renderUnit:draw()
        
        love.graphics.print("gameState")
    end        
    }    
end

return MOD_GameState