local MOD_Panel ={}

---comment
---@param elements table
---@param visible boolean
---@return table
function MOD_Panel.newPanel(elements,visible)
    return{
        elements= elements,
        visible = visible,

        draw = function (self)
            for _, element in ipairs(elements) do
                element:draw()
            end
        end
        ,
        setVisible = function (self,visible_)
            self.visible = visible_
        end
        ,
        getVisible = function (self)
            return self.visible
        end
    }
end

return MOD_Panel