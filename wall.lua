local class = require 'lib/middleclass'
Wall = class('Wall')
function Wall:initialize(world,x,y)
    self.body        = love.physics.newBody(world, x, y, "static")
    self.shape       = love.physics.newRectangleShape(96, 96)
    self.fixture     = love.physics.newFixture(self.body, self.shape)
end
function Wall:step()
end
function Wall:draw()
end