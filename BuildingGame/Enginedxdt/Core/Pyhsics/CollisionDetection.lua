local MOD_CollisionDetection = {}


function MOD_CollisionDetection.AABB(A,B)
    if 
        A.x < B.x + B.width  and
        A.x + A.width > B.x   and
        A.y < B.y + B.height  and
        A.y + A.height > B.y
    then
        return true
    end

    return false
end

return MOD_CollisionDetection