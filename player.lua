local class = require 'lib/middleclass'
Character = class('Character')
function Character:initialize(world,x,y,speed,up,down,left,right,image,size)
    self.x = x 
    self.y = y
    self.speed =speed
    self.sprite     = Sprite:new(love.graphics.newImage(image),size,size)
    self.sprite:setAnimation(1,12,1)
    self.frame       = 1
    self.xvel        = 0
    self.yvel        = 0
    self.angle       = 0
    self.up          = up 
    self.down        = down 
    self.left        = left
    self.right       = right
    self.body        = love.physics.newBody(world, x, y, "dynamic")
    self.shape       = love.physics.newRectangleShape(128, 128)
    self.fixture     = nil
    self.size        = size   
    self.body:setMass(10)
    self.fixture     = love.physics.newFixture(self.body, self.shape)
    self.actionTimer = 0
    self.state       = "free" --Modelling movement as a simple finite state machine, with free and punching being the current states. 
end

function Character:step(dt)
    if(self.state == "free") then 
        self:checkForInput(dt)
    elseif(self.state == "attack") then 
        self:attackStep(dt)
    end 
    self:animate(dt)
end

function Character:checkForInput(dt)

    if love.keyboard.isDown(self.right) then 
        if love.keyboard.isDown(self.up) then 
            self.angle = math.pi*7/4
            self:move(dt)
        elseif love.keyboard.isDown(self.down) then
            self.angle = math.pi /4
            self:move(dt)
        else 
            self.angle = 0
            self:move(dt)
        end 
            
    elseif love.keyboard.isDown(self.left) then 
        if love.keyboard.isDown(self.up) then 
            self.angle = math.pi*5/4
            self:move(dt)
        elseif love.keyboard.isDown(self.down) then
            self.angle = math.pi *3/4
            self:move(dt)
        else 
            self.angle = math.pi
            self:move(dt)
        end
    elseif love.keyboard.isDown(self.down) then
        self.angle = math.pi/2
        self:move(dt)

    elseif love.keyboard.isDown(self.up) then 
        self.angle = 3*math.pi/2
        self:move(dt)
    end 
    

end

function Character:move(dt)
    self.xvel = math.cos(self.angle)*self.speed
    self.yvel = math.sin(self.angle)*self.speed 
    self.x    = self.x + self.xvel  *dt
    self.y    = self.y + self.yvel  *dt
    self.body:setPosition(self.x, self.y)
    
end


function Character:attack()
    self.state = "attack"
    self.actionTimer = .5
    self.sprite:setAnimation(13,17,self.actionTimer)
    
end

function Character:attackStep(dt)
    self.actionTimer = self.actionTimer - dt 
    print(self.actionTimer)
    if (self.actionTimer <= 0) then 
        self.state = "free"
        self.sprite:setAnimation(1,12,1)
    end
end

function Character:animate(dt)
   self.sprite:animate(dt)
end

function Character:draw()
    x= self.x 
    local y= self.y
    local angle = self.angle 
    local size = self.size 
    
    self.sprite:draw(x,y,angle,size)

end 

Dude = Character:subclass('Dude')
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
        self:attack()
       -- self.sprite:setAnimation(13,17,.5)
    end 
end 