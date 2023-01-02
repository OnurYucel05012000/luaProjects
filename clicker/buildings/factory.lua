Mod_Factory = {}

local factory_cost = 10
local factory_cost_mult = 1.09
local factory_production = 0.2
local numberof_factory = 0
local upgradeCost = 11

function Mod_Factory.create()
    _G.money = _G.money - factory_cost 
    factory_cost = factory_cost * factory_cost_mult   

    numberof_factory = numberof_factory + 1
end

function Mod_Factory.draw()
    love.graphics.print(tostring(factory_production * numberof_factory),60,30)
    ---love.graphics.print(tostring(math.floor(factory_cost)),500,85)
       
end

--==============GET/SET==============---

---comment
---@return integer
function Mod_Factory.getFactoryProduction()
    return factory_production * numberof_factory
end

function Mod_Factory.getFactoryUpgradeCost()
    return upgradeCost
end

---@return integer
function Mod_Factory.getCost()
    return factory_cost
end

function Mod_Factory.setFactoryProduction()
    _G.money = _G.money - upgradeCost
    factory_production = factory_production * 1.08
    upgradeCost = upgradeCost * 1.09
end


return Mod_Factory