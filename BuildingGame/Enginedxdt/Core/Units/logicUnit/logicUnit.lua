local MOD_LogicUnit={}

function MOD_LogicUnit.newLogicUnit()
return
{

    init = function (self)
      
    end
    ,
    update = function (self,dt)
      
    end
    ,
    
    collisionDetection = function(self)
        
        if 
            self.player.x < self.coin.x + self.coin.width   and
            self.player.x + self.player.width > self.coin.x   and
            self.player.y < self.coin.y + self.coin.height  and
            self.player.y + self.player.height > self.coin.y
        then
            return true
        end
        return false
    end
    ,
}
end
return MOD_LogicUnit