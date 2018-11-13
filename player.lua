local class = require 'lib/middleclass'
Character = class('Character')
function Character:initialize(world,x,y,speed,up,down,left,right,sprite,size)
    self.x = x 
    self.y = y
    self.speed =speed
    self.animation = newAnimation(love.graphics.newImage(sprite), size, size, 2)
    self.frame     = 1
    self.xvel      = 0
    self.yvel      = 0
    self.angle     = 0
    self.direction = 0 --This refers to the intended direction
    self.turnSpeed = 3 --Speed of turn, in radians per second 
    self.up        = up 
    self.down      = down 
    self.left      = left
    self.right     = right
    self.body      = love.physics.newBody(world, x, y, "dynamic")
    self.shape     = love.physics.newRectangleShape(128, 128)
    self.fixture   = nil
    self.size      = size   
    self.body:setMass(10)
    self.fixture   = love.physics.newFixture(self.body, self.shape)
end

function Character:checkForInput(dt)
    if love.keyboard.isDown(self.right) then 
        if love.keyboard.isDown(self.up) then 
            self.angle = math.pi*7/4
        elseif love.keyboard.isDown(self.down) then
            self.angle = math.pi /4
        else 
            self.angle = 0
        end 
            
    elseif love.keyboard.isDown(self.left) then 
        if love.keyboard.isDown(self.up) then 
            self.angle = math.pi*5/4
        elseif love.keyboard.isDown(self.down) then
            self.angle = math.pi *3/4
        else 
            self.angle = math.pi
        end
    elseif love.keyboard.isDown(self.down) then
        self.angle = math.pi/2

    elseif love.keyboard.isDown(self.up) then 
        self.angle = 3*math.pi/2
    end 
end

function Character:move(dt)
    self.xvel = math.cos(self.angle)*self.speed
    self.yvel = math.sin(self.angle)*self.speed 
    self.x    = self.x + self.xvel*dt
    self.y    = self.y + self.yvel*dt
    self.body:setPosition(self.x, self.y)
end

function Character:animate(dt)
    self.animation.currentTime = self.animation.currentTime + dt
    if self.animation.currentTime >= self.animation.duration then 
        self.animation.currentTime = self.animation.currentTime - self.animation.duration
    end 
    self.frame = math.floor(self.animation.currentTime / self.animation.duration * #self.animation.quads)+1
end

function Character:step(dt)
    self:checkForInput(dt)
    self:move(dt)
    self:animate(dt)

end

Dude = Character:subclass('Dude')
Bull = Character:subclass('Bull')

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

function Bull:checkForInputBull(dt)  --This function is designed to make movement feel bigger for the bull character, with turn speed accounted for
    if love.keyboard.isDown(self.right) then 
        if love.keyboard.isDown(self.up) then 
            self.direction = math.pi*7/4
        elseif love.keyboard.isDown(self.down) then
            self.direction = math.pi /4
        else 
            self.direction = 0
        end 
            
    elseif love.keyboard.isDown(self.left) then 
        if love.keyboard.isDown(self.up) then 
            self.direction = math.pi*5/4
        elseif love.keyboard.isDown(self.down) then
            self.direction = math.pi *3/4
        else 
            self.direction = math.pi
        end
    elseif love.keyboard.isDown(self.down) then
        self.direction = math.pi/2

    elseif love.keyboard.isDown(self.up) then 
        self.direction = 3*math.pi/2
    end 
    
end 