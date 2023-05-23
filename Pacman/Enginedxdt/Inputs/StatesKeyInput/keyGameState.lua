local keyGameState = {}

keyGameState.__index = keyGameState
function keyGameState.newKeyboardInp_GameState(gameState_)
    local this = {
      gameState = gameState_,  
    }
    setmetatable(this,keyGameState)
    return this
end

function keyGameState:keyPressed(key)

    if key == "w" then
        if self.gameState.Player.currentDirection.down then            
            self.gameState.Player.currentDirection.down = false
            self.gameState.Player.currentDirection.up = true
        end        
        self.gameState.requestDirection.up = true

    elseif key == "d" then
        
    elseif key == "s" then
        if self.gameState.Player.currentDirection.up then            
            self.gameState.Player.currentDirection.up = false
            self.gameState.Player.currentDirection.down = true
        end        
        self.gameState.requestDirection.down = true
    elseif key == "a" then
        
    end
    
end

function keyGameState:keyReleased(key)

end


return keyGameState