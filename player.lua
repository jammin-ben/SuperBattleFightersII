Player = {}
-- Player = {
--     x = 0,
--     y = 0,
--     speed = 1,
--     up = "up",
--     down = "down",
--     left = "left",
--     right = "right",
-- }
function Player:new (world, x, y, speed, up, down, left, right)
    self.__index = self 
    o = {
        x         = x,
        y         = y,
        speed     = speed,
        animation = newAnimation(love.graphics.newImage("minotaur_s.png"), 128, 128, 1),
        frame     = 1,
        xvel      = 0,
        yvel      = 0,
        angle     = 0,
        up        = up, 
        down      = down, 
        left      = left,
        right     = right,
        body      = love.physics.newBody(world, x, y, "dynamic"),
        shape     = love.physics.newRectangleShape(128, 128),
        fixture   = nil
    }
    o.body:setMass(10)
    o.fixture = love.physics.newFixture(o.body, o.shape)
    setmetatable(o, self)
    return o
end

function Player:toString()
    str = string.format("Pos:(%i,%i) Speed: %i Size: %i", self.x, self.y,self.speed,self.size)
    return str
end

function Player:move(dt)
    self.x = self.x + self.xvel*dt  
    self.y = self.y + self.yvel*dt
    self.body:setPosition(self.x, self.y)
end 

function Player:animate(dt)
    self.animation.currentTime = self.animation.currentTime + dt
    if self.animation.currentTime >= self.animation.duration then 
        self.animation.currentTime = self.animation.currentTime - self.animation.duration
    end 
    self.frame = math.floor(self.animation.currentTime / self.animation.duration * #self.animation.quads)+1
    if(math.abs(self.xvel)>0 or math.abs(self.yvel)>0) then --If moving, update angle
        if self.xvel>=0 
            then self.angle = math.atan (self.yvel/self.xvel) - math.pi/2
            else self.angle = math.pi + math.atan (self.yvel/self.xvel) - math.pi/2
        end 
    end
end

function Player:checkForInput(dt)
	if love.keyboard.isDown(self.right) then
		self.xvel = self.speed
	elseif love.keyboard.isDown(self.left) then 
		self.xvel = -1 * self.speed  
    else 
        self.xvel = 0
	end
	if love.keyboard.isDown(self.down) then
		self.yvel = self.speed
	elseif love.keyboard.isDown(self.up) then 
		self.yvel = -1 * self.speed 
    else 
        self.yvel = 0
	end
end
function Player:step(dt)
    self:checkForInput(dt)
    self:animate(dt)
    self:move(dt)
end

-- dudeManBro = Player:new(50,50,60,20,"up","down","left","right")
-- return dudeManBro