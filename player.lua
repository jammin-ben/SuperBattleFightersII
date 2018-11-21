local class = require 'lib/middleclass'
Character = class('Character')
function Character:initialize(world,x,y,speed,up,down,left,right,image,size)
    self.x           = x 
    self.y           = y
    self.speed       =speed
    self.sprite      = Sprite:new(love.graphics.newImage(image),size,size)
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
    self.state       = "free" --Modelling movement as a simple finite state machine, with free and action being the possible states.
    self.punchSide   = 1 --This alternates the punch
end

function Character:step(dt)
    if(self.state == "free") then 
        self:checkForInput(dt)
    elseif(self.state == "action") then 
        self:actionStep(dt)
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


function Character:attack(dt)
    self.state = "action"
    self.actionTimer = .5
    if(self.punchSide > 0) then
        self.sprite:setAnimation(13,17,self.actionTimer)--+ .05)  --Dirty fix for race condition
        self.punchSide = self.punchSide * -1
    else 
        self.sprite:setAnimation(18,22,self.actionTimer)
        self.punchSide = self.punchSide * -1
    end
    self.actionTimer = self.actionTimer - dt --New fix attempt, a little less dirty

end

function Character:actionStep(dt) 
    self.actionTimer = self.actionTimer - dt
    if (self.actionTimer <= 0) then 
        self.state = "free"
        self.sprite:setAnimation(1,12,1)
    end
end

function Character:animate(dt)
   self.sprite:animate(dt)
end

function Character:draw()

    self.sprite:draw(self.x,self.y,self.angle,self.size)

end 

Dude = Character:subclass('Dude')