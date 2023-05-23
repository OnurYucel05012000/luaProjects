local SoundManager={}

local soundList={}
local musicList={}

function SoundManager.new()
    
end

function SoundManager:add(path,type,id)
    local audioFile ={}

    audioFile.file = love.audio.newSource(path,type)
    audioFile.id = id
    
    if type =="static" then
                
        table.insert(soundList,audioFile)

    elseif type == "stream" then
                
        table.insert(musicList,audioFile)

    end
    
end

local function findIndex(id,listType)
    
    if listType == "sound" then
                
        for index, value in ipairs(soundList) do
            if value.id == id then
                return index
            end
        end

    elseif listType == "music" then

        for index, value in ipairs(musicList) do
            if value.id == id then
                return index
            end
        end

    end

end

function SoundManager:play(id,listType)
    local index = findIndex(id,listType)
    
    if listType == "music" then
        musicList[index].file:play()
    elseif listType == "sound" then
        soundList[index].file:play()    
    end

end

function SoundManager:stop()
    
end


return SoundManager