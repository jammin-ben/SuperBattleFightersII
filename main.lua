require "animation_handler"
require "player" 
require 'scene'
require 'Bull'
require 'miscFunctions'
require 'wall'
function love.load()
    mainScene = Scene:new()
    world = love.physics.newWorld(0, 0, false)
    love.graphics.setBackgroundColor( .1, .15, .4 )

    mainScene:addChild(Bull:new(world, 30 ,100, 100, "w", "s", "a", "d","Minotaur.png",64))
    mainScene:addChild(Bull:new(world, 300 ,10, 100, "up", "down", "left", "right","Minotaur.png",64))
    mainScene:addChild(Wall:new(world,300,100))
--    mainScene:addChild(Dude:new(world, 333, 10, 200, "up", "down", "left", "right","player_s.png",32))
    world:setCallbacks(beginContact, endContact, preSolve, postSolve)

end

function love.update(dt)
    world:update(dt)
    mainScene:update(dt)

end

function love.draw()
    mainScene:draw()
    drawDebugShapes()
end
