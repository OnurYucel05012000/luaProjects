local keyboardInput={}

keyboardInput.__index = keyboardInput
function keyboardInput.newKeyboard(stateManager_)

  local this = {
   stateManager = stateManager_,

   keyGameState = nil,
   keyMenuState = nil,

  }
  setmetatable(this,keyboardInput)
  return this
end

function keyboardInput:init()
  local keyGameState_Class = require("Enginedxdt.Inputs.StatesKeyInput.keyGameState")
  self.keyGameState = keyGameState_Class.newKeyboardInp_GameState(self.stateManager.gameStatePTR)

  local keyMenuState_Class = require("Enginedxdt.Inputs.StatesKeyInput.keyMenuState")
  self.keyMenuState = keyMenuState_Class.newKeyboardInp_MenuState(self.stateManager)
end

function keyboardInput:keypressed(key)
  if key == "escape" then
    love.event.quit()
  end

  --oyun durumu icin--
  if self.stateManager.currentState  == self.stateManager.gameStatePTR then
    self.keyGameState:keyPressed(key)
  end   
end

function keyboardInput:keyreleased(key)
  --oyun durumu icin--
  if self.stateManager.currentState  == self.stateManager.gameStatePTR then
    self.keyGameState:keyReleased(key)
  end     
end

return keyboardInput