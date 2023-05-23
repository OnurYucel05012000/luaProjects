local TileLoader = {}

TileLoader.__index = TileLoader

function TileLoader.new()
    local this = {
        tilemap = {}
    }
    setmetatable(this,TileLoader)
    return this
end
--[[
example.txt

4 4
1 0 1 1
1 1 1 1 
1 1 1 1
0 0 1 0

]]--
--txt dosyasindaki haritayi 2 boyutlu diziye atar
function TileLoader:load_toTable(path)

    if path == nil or not (type(path) == "string") then
        error("TileLoader:load_toTable() path is nil or not string")
    end

    local file = io.open(path,"r")
    
    if file == nil then
        error("ERROR : TileLoader.lua ln 18 => file not found (file nil)")
    end

    
    local mapData  = file:read("l")

    local mapWidth
    local mapHeight

    for i = 1, #mapData, 1 do
        if string.sub(mapData,i,i) == " " then
           mapWidth = string.sub(mapData,1,i)
           mapHeight = string.sub(mapData,i+1,#mapData)
           break
        end
    end

    for i = 1, mapHeight, 1 do
        --satir bilgisini al
        local rowData = file:read("l")
        
        
        --satir bilgisini parcalanir        
        local index = 1
        local rowTiles = {}

        for j = 1, mapWidth, 1 do
                                
            rowTiles[j] = tonumber(string.sub(rowData,index,index))
            index = index + 2

        end
        
        table.insert(self.tilemap,rowTiles)
    end

    file:close()
end


return TileLoader