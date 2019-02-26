local class = require 'lib/middleclass'
require 'player'
Bull = Character:subclass('Bull')

function Bull:initialize(world, x, y, speed, up, down, left, right, sprite, size, attackKey)
    Character.initialize(self, world, x, y, speed, up, down, left, right, sprite, size, attackKey)
    self.direction = 0
    self.turnSpeed = 3
	self.attackKey = attackKey 
    -- self.turnSpeed = 40
end
function Bull:walk(dt)
    self:rotate(dt)
    Character.walk(self, dt)
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