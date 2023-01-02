local MOD_GameState={}

function MOD_GameState.newGameState(stateManager_)
    return{
    stateManager = stateManager_,
    init = function (self)

    end
    ,
    --oyuncu ile altin arasinda carpisma
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
    checkGameOver = function (self)

    end           
    ,
    resetGame = function (self)
    
    end
    ,
    update = function (self,dt)

    end
    ,
    draw = function (self)
        love.graphics.print("gameState")
    end        
    }    
end

return MOD_GameState