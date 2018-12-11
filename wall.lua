local class = require 'lib/middleclass'
Wall = class('Wall')
function Wall:initialize(world,x,y)
    self.body        = love.physics.newBody(world, x, y, "static")
    self.shape       = love.physics.newRectangleShape(96, 96)
    self.fixture     = love.physics.newFixture(self.body, self.shape)
    self.img         = love.graphics.newImage("wall_basic.png")
end
function Wall:step()
end
function Wall:draw()
    local x,y = self.body:getPosition()
    love.graphics.draw(self.img,x,y,0,1,1,48,48)
end