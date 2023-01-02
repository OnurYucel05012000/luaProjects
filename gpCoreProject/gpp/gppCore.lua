local gppCore = {}

local drawList = {}

local LabelClass = nil

function gppCore.addLib_Label()
    LabelClass = require("gpp.guiElements.Label")
end

---=====================------------------------------------
---Creating GUI ELEMENTS---
---=====================------------------------------------

---comment
---@param text string
---@param id string
---@param x integer
---@param y integer
function gppCore.newLabel(text,id,x,y,color)
   local newLabel = LabelClass:new(text,id,x,y,color)
   table.insert(drawList,newLabel) 
end

---=====================------------------------------------
---Creating GUI ELEMENTS---
---=====================------------------------------------

function gppCore.draw()
    for _, guiObject in ipairs(drawList) do
        guiObject:draw()
    end
end

return gppCore