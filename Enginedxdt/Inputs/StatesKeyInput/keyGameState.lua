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
    elseif key == "d" then
        self.gameState.Keys.right = true
    elseif key == "s" then
        self.gameState.Keys.down = true
    elseif key == "a" then
        self.gameState.Keys.left = true
    end
    
end

function keyGameState:keyReleased(key)

    if key == "w" then
        self.gameState.Keys.up = false
    elseif key == "d" then
        self.gameState.Keys.right = false
    elseif key == "s" then
        self.gameState.Keys.down = false
    elseif key == "a" then
        self.gameState.Keys.left = false
    end

end


return keyGameState