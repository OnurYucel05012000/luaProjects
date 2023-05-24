
local function collisionAABB()
    local A
    local B
    
    if 
        A.x < B.x + B.width   and
        A.x + A.width > B.x   and
        A.y < B.y + B.height  and
        A.y + A.height > B.y
    then
        return true
    end
    return false
end