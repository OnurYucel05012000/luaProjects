local MOD_GameState={}

function MOD_GameState.newGameState()
    return
{
    stateManager = nil,
    
    --Birimler--
    logicUnit = nil,
    renderUnit = nil,

    --Binalar--
    Buildings ={},
    Building_Class = nil,

    Icons ={},

    
    init_Units = function (self)
        local logicUnit_Class = require("Enginedxdt.Core.Units.logicUnit.logicUnit")
        local renderUnit_Clas = require("Enginedxdt.Core.Units.renderUnit.renderUnit")

        self.logicUnit = logicUnit_Class.newLogicUnit()
        self.renderUnit = renderUnit_Clas.newRenderUnit()

        self.logicUnit:init()
        self.renderUnit:init()

    end
    ,
    ---comment
    ---@param self any
    ---@param type string
    ---@param x integer
    ---@param y integer
    ---@param width integer
    ---@param height integer
    createBuilding = function (self,type,x,y,width,height)

        if type == "house" then
            table.insert(self.Buildings,self.Building_Class.newHouse(x,y,width,height))    
        end
        
    end
    ,
    createIcon = function (self,x,y,width,height)
        local tempIcon ={}
        
        tempIcon.x = x
        tempIcon.y = y
        tempIcon.width = width
        tempIcon.height = height
        tempIcon.clicked = false

        table.insert(self.Icons,tempIcon)
    end
    ,
    init = function (self,statemanager_)

        self.stateManager = statemanager_        

        self:init_Units()
        

        self.Building_Class = require("Enginedxdt.objects.house") 
        
        self:createIcon(10,550,32,32)
        self:createBuilding("house",100,500,32,32)
    
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

        local mouseX,mouseY = love.mouse.getX(),love.mouse.getY()

        for _, icon in ipairs(self.Icons) do
            if icon.clicked then
                icon.x = mouseX - 20
                icon.y = mouseY - 20
            end
        end
    end
    ,
    drawIcon = function (self)
        for _, icon in ipairs(self.Icons) do
            love.graphics.rectangle("line",icon.x,icon.y,icon.width,icon.height)
        end
    end
    ,
    draw = function (self)
        self.renderUnit:draw()
        self:drawIcon()
        
        for _, building in ipairs(self.Buildings) do
            building:draw()
        end
        love.graphics.print("gameState")
    end        
    }    
end

return MOD_GameState