Player = {x = 0, y = 0, speed = 1, size = 1,  up = "up", down = "down", left = "left", right = "right"}

function Player:new (x,y,speed,size,up,down,left,right)
    self.__index = self 
    
    return setmetatable({
        x         = x,
        y         = y,
        speed     = speed,
        size      = size,
        animation = newAnimation(love.graphics.newImage("player_s.png"), 32, 32, 1),
        frame     = 1,
        xvel      = 0,
        yvel      = 0,
        up        = up, 
        down      = down, 
        left      = left, 
        right     = right
    },self)
end

function Player:toString()

    str = string.format("Pos:(%i,%i) Speed: %i Size: %i", self.x, self.y,self.speed,self.size)
    return str
end

function Player:move(dt)
    self.x = self.x + self.xvel*dt  
    self.y = self.y + self.yvel*dt

end 

function Player:animate(dt)
    self.animation.currentTime = self.animation.currentTime + dt
    if self.animation.currentTime>=self.animation.duration then 
        self.animation.currentTime = self.animation.currentTime-self.animation.duration
    end 
    self.frame = math.floor(self.animation.currentTime / self.animation.duration * #self.animation.quads)+1


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

dudeManBro = Player:new(50,50,60,20,"up","down","left","right")
return dudeManBro