local MOD_textBox = {}

function MOD_textBox.newTextBox(x,y)
    return{
        x=x,
        Y=y,
        width=100,
        height=20,

        draw = function (self)
            love.graphics.rectangle("line",self.x,self.y,self.width,self.height)
        end

    }
end

return MOD_textBox