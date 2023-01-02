MOD_Player ={}


function MOD_Player.createPlayers(x,y,width,height)
    local player_tb={}
    player_tb.x =x
    player_tb.y =y
    player_tb.width = width
    player_tb.height = height
  
    return player_tb
end

return MOD_Player