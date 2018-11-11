class = require('lib/middleclass/middleclass')
require "animation_handler"
require "player" 
require 'scene'

function love.load()
    world = love.physics.newWorld(0, 0, true)
    love.graphics.setBackgroundColor( 255, 255, 100 )

    Player   = Player:new(world, 30 ,10, 100, "w", "s", "a", "d")
    -- Player2  = Player:new(world, 333,10,100,"i","k","j","l")
    Player2  = Player:new(world, 333, 10, 100, "up", "down", "left", "right")
    world:setCallbacks(beginContact, endContact, preSolve, postSolve)
end

function beginContact(a, b, coll)
    print("contact has begun!!")
end
function endContact(a, b, coll)
    print("contact has ended")
end
function preSolve(a, b, coll)
    print("preSolve")
end
function postSolve(a, b, coll, normalimpulse, tangentimpulse)
    -- print("postSolve")
end

function love.update(dt)
    world:update(dt)
    Player:step(dt)
    Player2:step(dt)
end

function love.draw()
    love.graphics.draw(Player.animation.spriteSheet, Player.animation.quads[Player.frame], Player.x,Player.y,Player.angle,1,1,64,64)
    love.graphics.draw(Player2.animation.spriteSheet, Player2.animation.quads[Player2.frame], Player2.x,Player2.y,Player2.angle,1,1,64,64)
end

function love.keypressed(key)
    if (key) == 'escape' then
        love.event.quit()
    end
end