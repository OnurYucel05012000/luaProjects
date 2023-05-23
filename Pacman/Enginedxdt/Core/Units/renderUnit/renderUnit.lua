local MOD_renderUnit={}

function MOD_renderUnit.newRenderUnit()
    return{
       
        init = function (self)
            
        end
        ,
        draw = function (self)
            love.graphics.line(100,100,200,300)
        end        
        
    }
end

return MOD_renderUnit