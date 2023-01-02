MOD_Ball={}

local ballVx,ballVy = 100,100
local ballVX_increase = 1.02
local ball = {}

function MOD_Ball.createBall(x,y,width,height)
    
    ball.x = x;
    ball.y = y;
    ball.width = width
    ball.height = height
    
 end

function MOD_Ball.update(dt)
    if CollisionDetection(1) == true then
        ball.x = players[1].x + players[1].width
        ballVx = ballVx * -ballVX_increase
     
        if ballVy < 0 then
           ballVy = -math.random(10,150)
        else
           ballVy = math.random(10,150)
        end
        
     end
  
     if CollisionDetection(2) == true then
        ball.x = players[2].x - ball.width
        ballVx = ballVx * -ballVX_increase
  
        if ballVy < 0 then
           ballVy = -math.random(10,150)
        else
           ballVy = math.random(10,150)
        end
        
     end
     
  
     if ball.y >= 590 then
        ballVy = ballVy * -1
        
     elseif ball.y <= 0 then
        ballVy = ballVy * -1
        
     end
  
    
  
  
     ball.x = ball.x + ballVx*dt
     ball.y = ball.y + ballVy*dt
       
end

function MOD_Ball.draw()
   love.graphics.rectangle("line",
   ball.x,
   ball.y,
   ball.width,
   ball.height)
end


 return MOD_Ball