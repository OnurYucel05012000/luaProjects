local MOD_keyboardInput={}

function MOD_keyboardInput.newKeyboard(stateManager_)

return
{
  stateManager = stateManager_,

  keyGameState = nil,
  keyMenuState = nil,

  init = function (self)
    
    local keyGameState_Class = require("Enginedxdt.Inputs.StatesKeyInput.keyGameState")
    self.keyGameState = keyGameState_Class.newKeyboardInp_GameState(self.stateManager)

    local keyMenuState_Class = require("Enginedxdt.Inputs.StatesKeyInput.keyMenuState")
    self.keyMenuState = keyMenuState_Class.newKeyboardInp_MenuState(self.stateManager)
    
  end
  ,
  keypressed = function (self,key)
      
    if key == "escape" then
      love.event.quit()
    end

    if self.stateManager.currentState  == self.stateManager.gameStatePTR then
      self.keyGameState:keypressed(key)
    end   
  end
  ,
  keyreleased = function (self,key)
    if self.stateManager.currentState  == self.stateManager.gameStatePTR then
      self.keyGameState:keyreleased(key)
    end   
  end
}
end

return MOD_keyboardInput