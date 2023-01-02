local MOD_Player ={}
function MOD_Player.newPlayer(x_,y_,width_,height_)
    return
{
    x=x_,
    y=y_,
    width=width_,
    height=height_,
    Bullets={},
    texture = nil,
    score = 0,
    
    shootingType = "singleShot",
    bulletTexture = nil,
    fireBulletSFX = nil,

    lifeImage =nil,
    life = 3,
    speed = 300,

    loadImage = function (self)
       self.bulletTexture  =love.graphics.newImage("res/images/bullet.png")
       self.lifeImage = love.graphics.newImage("res/playerlife.png")
       self.texture   = love.graphics.newImage("res/images/player.png")

       self.fireBulletSFX = love.audio.newSource("res/effects/shotingSFX.wav","static")
    end
    ,
    fireBullet = function (self)
        local tempBullet = {}

        self.fireBulletSFX:stop()
        self.fireBulletSFX:play()

        if self.shootingType == "singleShot" then            
            tempBullet.x = self.x + 10
            tempBullet.y = self.y - 20
            tempBullet.width = 10
            tempBullet.height = 25
            tempBullet.speed = 200

            table.insert(self.Bullets,tempBullet)

        elseif self.shootingType == "doubleShot" then
            tempBullet.x = self.x 
            tempBullet.y = self.y -20
            tempBullet.width = 10
            tempBullet.height = 25
            tempBullet.speed = 200

            table.insert(self.Bullets,tempBullet)

            local tempBullet2 = {}
            tempBullet2.x = self.x + self.width - 5
            tempBullet2.y = self.y -20
            tempBullet2.width = 10
            tempBullet2.height = 25
            tempBullet2.speed = 200

            table.insert(self.Bullets,tempBullet2)
        end

        
    end
    ,
    --mermileri y yonunde ilerletir
    updateBullet = function (self,dt)
        for index, bullet in ipairs(self.Bullets) do
            bullet.y = bullet.y - bullet.speed*dt
            if bullet.y < -bullet.height  then
                table.remove(self.Bullets,index)
            end
        end
    end
    ,
    --mermileri cizdirir
    drawBullet = function(self)
       for _, bullet in ipairs(self.Bullets) do
          love.graphics.draw(self.bulletTexture,bullet.x-10,bullet.y)
          love.graphics.rectangle("line",bullet.x,bullet.y,bullet.width,bullet.height)
       end
    end
    ,
    --mermi cizdirme fonksyinunu cagirir sonra oyuncuyu cizdirir
    draw = function (self)
        self:drawBullet()
        love.graphics.draw(self.texture,self.x,self.y)
        love.graphics.rectangle("line",self.x,self.y,self.width,self.height)
    end
}
end
return MOD_Player