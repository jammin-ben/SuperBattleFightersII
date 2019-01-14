--CONSIDER: fixture:setcategory with 0 = wall, 1 = player 1, 2 = player 2, 3 = painful
require "animation_handler"
require "player" 
require 'scene'
require 'Bull'
require 'miscFunctions'
require 'wall'
function love.load()
    mainScene = Scene:new()
    world = love.physics.newWorld(0, 0, false)
    love.graphics.setBackgroundColor( 25/255, 150/255, 65/255 )

    mainScene:addChild(Bull:new(world, 150 ,150, 100, "w", "s", "a", "d","Minotaur.png",64))
    mainScene:addChild(Bull:new(world, 650 ,450, 100, "up", "down", "left", "right","Minotaur.png",64))
    for x = 0, 800, 96 do 
		mainScene:addChild(Wall:new(world,x,0))
		mainScene:addChild(Wall:new(world,x,600))
	end
	for y = 0, 600, 96 do 
		mainScene:addChild(Wall:new(world,0,y))
		mainScene:addChild(Wall:new(world,800,y))
	end
    --mainScene:addChild(Wall:new(world,300,196))--size is 96
--    mainScene:addChild(Dude:new(world, 333, 10, 200, "up", "down", "left", "right","player_s.png",32))
    world:setCallbacks(beginContact, endContact, preSolve, postSolve)

end

function love.update(dt)
    world:update(dt)
    mainScene:update(dt)

end

function love.draw()
    drawDebugShapes()
    mainScene:draw()

end
