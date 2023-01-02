local MOD_Pipe ={}

function MOD_Pipe.newPipes(x,y,width,height)
    return
{
    x = x,
    y = y,
    width = width,
    height = height,
    speedY = 20,

    update = function (self,dt)   
    end
    ,
    draw = function (self)
        
    end
}
end

return MOD_Pipe