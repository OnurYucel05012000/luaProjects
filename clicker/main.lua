_G.love = love

_G.money = 0

local past_second = os.time() % 60

local fabrika_mod = require("buildings.factory")
local house_mod = require("buildings.house")
local gpCore_mod = require("gui_plus.gpCore")
local input_mouseMOD = require("inputs.mouse_Input")
local resLoaderMOD = require("resourceLoader.resLoader")
local coreSettingsMOD = require("settings.coreSettings")
---=========RES===========---
local cark 
local fabrika
local fabrikaIMG_upgrade
---=========RES===========---

local function createButtons()

    gpCore_mod.createButton({ 10,70,100,30},"click_button","tikla bana",{255,0,0},coreSettingsMOD.colorWHITE)
    gpCore_mod.createButton({ 200,70,110,30},"id_fabrika","fabrika al",{0,255,0},coreSettingsMOD.colorWHITE)
    gpCore_mod.createButton({ 200,120,110,30},"id_FactoryUpgrade","fabrika yukselt",{0,0,255},coreSettingsMOD.colorWHITE)
    gpCore_mod.createButton({ 200,170,110,30},"id_house","ev al",{255,255,0},coreSettingsMOD.colorGREEN)

    gpCore_mod.setLabel("fabrika al " .. tostring(fabrika_mod.getCost()),"id_fabrika")
    gpCore_mod.setLabel("fabrika yukselt " .. tostring(fabrika_mod.getFactoryUpgradeCost()),"id_FactoryUpgrade")
    gpCore_mod.setLabel("ev al "..tostring(house_mod.getCost()),"id_house")


end

local function loadRes()

    cark = resLoaderMOD.loadImage("res/cark.png")
    fabrika = resLoaderMOD.loadImage("res/fabrika.png")
    fabrikaIMG_upgrade = resLoaderMOD.loadImage("res/fabrika_upgrade.png")

end

function love.load()
    loadRes()
    createButtons()
    input_mouseMOD.load()
end

function love.mousepressed()

    input_mouseMOD.mousePressed()
    
end

function love.mousemoved()
    ---local mouse_tb = {love.mouse.getX(),love.mouse.getY(),5,5}

    ---if gpCore_mod.hoveredRIndex(mouse_tb) > -1 then
       -- gpCore_mod.setButtonColor(coreSettingsMOD.colorBLUE,gpCore_mod.hoveredRIndex(mouse_tb))    
    --end
    
end

function love.keypressed(key)
     
end

function love.update(dt)

    local current_time = (os.time()%60)
    if past_second ~= current_time then
        past_second = current_time
       ----============================----
       _G.money = _G.money + fabrika_mod.getFactoryProduction() + house_mod.getHouseProduction()
       ----============================----
       
       
    end    
    
end

local function drawRes()


    
    love.graphics.draw(fabrika,160,70,0,0.5,0.5)
    
    love.graphics.draw(fabrikaIMG_upgrade,160,120,0,0.5,0.5)
    
    love.graphics.draw(cark,10,10,0,0.5,0.5)
end

function love.draw()

   
   

   love.graphics.print(tostring(_G.money),60,10)
   love.graphics.print(tostring(fabrika_mod.getFactoryProduction() + house_mod.getHouseProduction()),60,50)
   
   fabrika_mod.draw()
   gpCore_mod.draw()
   
   drawRes()

end


-----==============GET/SET================---
function GetGPCore()
    return gpCore_mod
end

function GetFactory()
    return fabrika_mod
end

function GetHouse()
    return house_mod
end
-----==============GET/SET================---

