local MOD_Time={}

function MOD_Time.newTimeOBJ()
    return
{

    ---{saat,dakika,saniye} dondurur
    ---@param self any
    ---@return table
    getCurrentTimeAll = function (self)
        local date = os.time()

        local second = 60
        local sec2hour = second * second -- seconds in an hour
        local sec2day = sec2hour * 24 -- seconds in a day
        
        local hour = math.floor((date % sec2day / sec2hour)+3)
        if hour > 24 then
            hour = 0
        end
    
        return {
            hour = hour,
            min = math.floor(date % sec2hour / second),
            sec = date%second
        }        
    end
    ,
    getCurrentHour = function (self)
            
        local date = os.time()

        local second = 60
        local sec2hour = second * second -- seconds in an hour
        local sec2day = sec2hour * 24 -- seconds in a day
        
        local hour = math.floor((date % sec2day / sec2hour)+3)
        if hour > 24 then
            hour = 0
        end
    end
    ,
    getCurrentMinute = function (self)
        local date = os.time()
        local second = 60
        local sec2hour = second * second -- seconds in an hour
        return math.floor(date % sec2hour / second)
    end
    ,
    getCurrentSec = function (self)

        local date = os.time()
        return date % 60
    end
    
}
end


return MOD_Time 