local coreTime = {}

coreTime.__index = coreTime
function coreTime.new()
    local this = {
        pastSecond = nil,
        secondCounter = 0
    }
    setmetatable(this,coreTime)
    return this
end

function coreTime:getCurrentTimeAll()

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

function coreTime:testFunc()
    print("ln 35 hello world")
end

function coreTime:getCurrentHour()
    
    local date = os.time()

    local second = 60
    local sec2hour = second * second -- seconds in an hour
    local sec2day = sec2hour * 24 -- seconds in a day
    
    local hour = math.floor((date % sec2day / sec2hour)+3)
    if hour > 24 then
        hour = 0
    end
end

function coreTime:getCurrentMinute()
    local date = os.time()
    local second = 60
    local sec2hour = second * second -- seconds in an hour
    return math.floor(date % sec2hour / second)
end

function coreTime:getCurrentSec()
    local date = os.time()
    return date % 60
end

function coreTime:setTimerSecond(secondLimit)
    
    local CurrentSec = self:getCurrentSec()

    if self.pastSecond == nil then
        self.pastSecond = CurrentSec
    end
    
    local c1 = math.max(CurrentSec,self.pastSecond)
    local c2 = math.min(CurrentSec,self.pastSecond)
    print("CurrentSec = " .. CurrentSec .. " pastSecond = " .. self.pastSecond .." dt = " .. c1-c2 .. " secondCounter = ".. self.secondCounter)
    
    if c1 - c2 >= 1 then
        self.pastSecond = CurrentSec
        self.secondCounter = self.secondCounter + 1
    end

    if self.secondCounter >= secondLimit then
        self.secondCounter = 0
        return true
    end

    return false
end

return coreTime 