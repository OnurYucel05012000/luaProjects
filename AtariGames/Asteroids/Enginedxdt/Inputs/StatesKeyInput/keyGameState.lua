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
        self.gameState.Keys.up = true            
    elseif key == "s" then
        self.gameState.Keys.down = true
    end
    
end

function keyGameState:keyReleased(key)

    if key == "w" then
        self.gameState.Keys.up = false
    elseif key == "s" then
        self.gameState.Keys.down = false
    end

end


return keyGameState