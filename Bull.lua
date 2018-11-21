local class = require 'lib/middleclass'
require 'player'
Bull = Character:subclass('Bull')

function Bull:initialize(world, x, y, speed, up, down, left, right, sprite, size)
    Character.initialize(self, world, x, y, speed, up, down, left, right, sprite, size)
    self.direction = 0
    self.turnSpeed = 3
    -- self.turnSpeed = 40
end
function Bull:move(dt)
    self:rotate(dt)
    Character.move(self, dt)
end 

function Bull:rotate(dt)
    --normalize angle between 0 and 2pi 
    if(self.angle >= 2*math.pi) then self.angle = self.angle - 2*math.pi end 
    if(self.angle <  0) then self.angle = self.angle + 2*math.pi end
    --turn 
    if(math.abs(self.angle - self.direction) > self.turnSpeed*dt) then 
				if ((self.direction > self.angle and self.direction - self.angle <= math.pi)
				or (self.angle > self.direction and self.angle -self.direction > math.pi))then 
            self.angle = self.angle + self.turnSpeed*dt 
        else
            self.angle = self.angle - self.turnSpeed*dt 
        end
    else
        --at intended direction 
        self.angle = self.direction 
    end
end

--This function is designed to make movement feel bigger for the bull character,
--with turn speed accounted for
function Bull:checkForInput(dt)

    local ANGLE_UP_RIGHT = math.pi * 7 / 4
    local ANGLE_UP_LEFT = math.pi * 5 / 4
    local ANGLE_DOWN_RIGHT = math.pi / 4
    local ANGLE_DOWN_LEFT = math.pi * 3 / 4
    local ANGLE_DOWN = math.pi / 2
    local ANGLE_UP = 3 * math.pi / 2
    local ANGLE_RIGHT = 0
    local ANGLE_LEFT = math.pi

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
