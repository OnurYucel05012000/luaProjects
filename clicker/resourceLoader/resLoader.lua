Mod_resLoader={}

---@param path string
---@return any
function Mod_resLoader.loadImage(path)
    return love.graphics.newImage(path)
end


return Mod_resLoader