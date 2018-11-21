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
    self.attackKey = "p"
    self.moving = false
end

function Character:step(dt)
    if(self.state == "free") then 
        self:checkForInput(dt)
    elseif(self.state == "action") then 
        self:actionStep(dt)
    end 
    if (self.moving) then
        self:animate(dt)
    end
end

function Character:checkForInput(dt)
    local ANGLE_UP_RIGHT = math.pi * 7 / 4
    local ANGLE_UP_LEFT = math.pi * 5 / 4
    local ANGLE_DOWN_RIGHT = math.pi / 4
    local ANGLE_DOWN_LEFT = math.pi * 3 / 4
    local ANGLE_DOWN = math.pi / 2
    local ANGLE_UP = 3 * math.pi / 2
    local ANGLE_RIGHT = 0
    local ANGLE_LEFT = math.pi

    if
        love.keyboard.isDown(self.up) or
        love.keyboard.isDown(self.down) or
        love.keyboard.isDown(self.left) or
        love.keyboard.isDown(self.right) or
        love.keyboard.isDown(self.attackKey)
    then
        self.moving = true
    else
        self.moving = false
    end

    -- RIGHT_X
    if love.keyboard.isDown(self.right) then 
        -- RIGHT_UP
        if love.keyboard.isDown(self.up) then 
            self.direction = ANGLE_UP_RIGHT
            self:move(dt)
        -- RIGHT_DOWN
        elseif love.keyboard.isDown(self.down) then
            self.direction = ANGLE_DOWN_RIGHT
            self:move(dt)
        -- RIGHT
        else 
            self.direction = ANGLE_RIGHT
            self:move(dt)
        end 
            
    -- LEFT_X
    elseif love.keyboard.isDown(self.left) then 
        -- LEFT_UP
        if love.keyboard.isDown(self.up) then 
            self.direction = ANGLE_UP_LEFT
            self:move(dt)
        -- LEFT_DOWN
        elseif love.keyboard.isDown(self.down) then
            self.direction = ANGLE_DOWN_LEFT
            self:move(dt)
        -- LEFT
        else 
            self.direction = ANGLE_LEFT
            self:move(dt)
        end
    -- DOWN
    elseif love.keyboard.isDown(self.down) then
        self.direction = ANGLE_DOWN
        self:move(dt)
    -- UP
    elseif love.keyboard.isDown(self.up) then 
        self.direction = ANGLE_UP
        self:move(dt)
    end 
        
    if love.keyboard.isDown('p') then 
        self:attack(dt)
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
    self.sprite:draw(self.x, self.y, self.angle, self.size)
end 

Dude = Character:subclass('Dude')