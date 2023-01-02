--[[_G.love = love

local stateManager
local keyboardInput 
local mouseInput

local function init()
    local stateManager_Class = require("Enginedxdt.Core.States.stateManager")
    stateManager = stateManager_Class.newStateManager()
    stateManager:initManager()

    local keyboardInput_Class = require("Enginedxdt.Inputs.keyboardInput")
    keyboardInput = keyboardInput_Class.newKeyboard(stateManager)
    keyboardInput:init()

    local mouseInput_Class = require("Enginedxdt.Inputs.mouseInput")
    mouseInput = mouseInput_Class.newMouse()
    mouseInput:init()
end

function love.mousereleased()
    
end

function love.mousepressed()
    
end

function love.keypressed(key)
    keyboardInput:keypressed(key)
end

function love.keyreleased(key)
    keyboardInput:keyreleased(key)
end

function love.load()
    init()
end

function love.update(dt)
    stateManager:update(dt)
end

function love.draw()
    stateManager:draw()
end
]]--