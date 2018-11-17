local class = require 'lib/middleclass'
Sprite = class('Sprite')

function Sprite:initialize(img,width,height)
    self.img       = img 
    self.width     = width 
    self.height    = height
--    self.numFrames = img:getHeight() * img:getWidth() / (width*height)
    
    self.frames   = {}
    print(img)
      
    print(img:getHeight())
    for y = 0, img:getHeight() - height, height do
        for x = 0, img:getWidth() - width, width do
            table.insert(self.frames, love.graphics.newQuad(x, y, width, height, img:getDimensions()))
        end
    end
    
    self.quads      = self.frames --quads represents current animation from spriteSheet 
    self.currentTime= 0 
    self.duration   = 1
    self.frame      = 1
    
end

function Sprite:setAnimation(firstFrame,lastFrame,duration)
    self.quads = {}
    self.currentTime = 0
    for i=firstFrame,lastFrame do 
        table.insert(self.quads,self.frames[i])
    end 
    self.duration = duration
end 

function Sprite:animate(dt)
    self.currentTime = self.currentTime + dt
    if self.currentTime >= self.duration then 
        self.currentTime = self.currentTime - self.duration
    end
    self.frame = math.floor(self.currentTime / self.duration * #self.quads)+1
end 

function Sprite:draw(x,y,angle,size)
	love.graphics.draw(
		self.img,
		self.quads[self.frame],
        x,
        y,
        angle,
        2,
        2,
        size/2,
        size/2
    )
end





--[[function newAnimation(image, width, height, duration)
    local animation = {}
    animation.spriteSheet = image;
    animation.quads = {};
 
    for y = 0, image:getHeight() - height, height do
        for x = 0, image:getWidth() - width, width do
            table.insert(animation.quads, love.graphics.newQuad(x, y, width, height, image:getDimensions()))
        end
    end
 
    animation.duration = duration or 1
    animation.currentTime = 0
 
    return animation
end]]--

