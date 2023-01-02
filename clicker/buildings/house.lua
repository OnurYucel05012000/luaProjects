Mod_House={}

local houseCost = 5
local houseCostMult = 1.08
local houseProduction = 0.1
local numberofHouse = 0
local upgradeCost = 10
local houseUpradeMult = 1.07

function Mod_House.create()
    _G.money = _G.money - houseCost
    houseCost = houseCost * houseCostMult

    numberofHouse = numberofHouse + 1
end

function Mod_House.draw() 
    ---love.graphics.print(tostring(math.floor(factory_cost)),500,85)
       
end


---comment
---@return integer
function Mod_House.getHouseProduction()
    return houseProduction * numberofHouse
end

function Mod_House.getHouseUpgradeCost()
    return upgradeCost
end

---@return integer
function Mod_House.getCost()
    return houseCost
end

function Mod_House.setHouseProduction()
    _G.money = _G.money - upgradeCost
    houseProduction = houseProduction * houseUpradeMult
    upgradeCost = upgradeCost * 1.09
end


return Mod_House