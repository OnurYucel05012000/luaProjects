Mod_Input_Mouse={}

local gpCore
local fabrika
local house

function Mod_Input_Mouse.load()
    gpCore = GetGPCore()
    fabrika = GetFactory()
    house = GetHouse()
end

function Mod_Input_Mouse.mousePressed()

    if gpCore.isClicked("click_button") == true then
        _G.money = _G.money + 1
    end

    if gpCore.isClicked("id_fabrika") == true and _G.money >= fabrika.getCost() then
        gpCore.setLabel("fabrika al " .. tostring(fabrika.getCost()),"id_fabrika")
        fabrika.create()
    end

    if gpCore.isClicked("id_FactoryUpgrade") == true and _G.money >= fabrika.getFactoryUpgradeCost() then
        gpCore.setLabel("fabrika yukselt " .. tostring(fabrika.getFactoryUpgradeCost()),"id_FactoryUpgrade")
        fabrika.setFactoryProduction()
        
    end

    if gpCore.isClicked("id_house") == true and _G.money >= house.getCost()  then
        gpCore.setLabel("ev al " .. tostring(house.getCost()),"id_house")
        house.create()
    end
end

return Mod_Input_Mouse