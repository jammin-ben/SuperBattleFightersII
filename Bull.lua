local class = require 'lib/middleclass'
require 'player'
Bull = Character:subclass('Bull')

function Bull:initialize(world,x,y,speed,up,down,left,right,sprite,size)
    Character.initialize(self,world,x,y,speed,up,down,left,right,sprite,size)
    self.direction = 0
    self.turnSpeed = 3
end
function Bull:move(dt)
    self:rotate(dt)
    Character.move(self,dt)
end 

function Bull:rotate(dt)
    --normalize angle between 0 and 2pi 
    if(self.angle >= 2*math.pi) then self.angle = self.angle - 2*math.pi end 
    if(self.angle <  0) then self.angle = self.angle + 2*math.pi end
    --turn 
    if(math.abs(self.angle - self.direction) > self.turnSpeed*dt) then 
        if ((self.direction > self.angle and self.direction - self.angle <= math.pi) or (self.angle > self.direction and self.angle -self.direction > math.pi))then 
            self.angle = self.angle + self.turnSpeed*dt 
        else
            self.angle = self.angle - self.turnSpeed*dt 
        end
    else
        --at intended direction 
        self.angle = self.direction 
    end
end

--Violates DRY (dont repeat yourself) 
function Bull:checkForInput(dt)  --This function is designed to make movement feel bigger for the bull character, with turn speed accounted for
    if love.keyboard.isDown(self.right) then 
        if love.keyboard.isDown(self.up) then 
            self.direction = math.pi*7/4
            self:move(dt)
        elseif love.keyboard.isDown(self.down) then
            self.direction = math.pi /4
            self:move(dt)
        else 
            self.direction = 0
            self:move(dt)
        end 
            
    elseif love.keyboard.isDown(self.left) then 
        if love.keyboard.isDown(self.up) then 
            self.direction = math.pi*5/4
            self:move(dt)
        elseif love.keyboard.isDown(self.down) then
            self.direction = math.pi *3/4
            self:move(dt)
        else 
            self.direction = math.pi
            self:move(dt)
        end
    elseif love.keyboard.isDown(self.down) then
        self.direction = math.pi/2
        self:move(dt)
    elseif love.keyboard.isDown(self.up) then 
        self.direction = 3*math.pi/2
        self:move(dt)
    end 
        
    if love.keyboard.isDown('p') then 
        self:attack(dt)
    end 
end 
