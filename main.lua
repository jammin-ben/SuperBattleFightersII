require "animation_handler"
require "player" 
require 'scene'

function love.load()
    mainScene = Scene:new()
    world = love.physics.newWorld(0, 0, false)
    love.graphics.setBackgroundColor( 255, 255, 100 )

    mainScene:addChild(Player:new(world, 30 ,10, 100, "w", "s", "a", "d","Minotaur.png",64))
    mainScene:addChild(Player:new(world, 333, 10, 100, "up", "down", "left", "right","Minotaur.png",64))
    world:setCallbacks(beginContact, endContact, preSolve, postSolve)

end
function beginContact(a, b, coll)
    print("contact has begun!!")
end
function endContact(a, b, coll)
    print("contact has ended")
end
function preSolve(a, b, coll)
    -- print("preSolve")
end
function postSolve(a, b, coll, normalimpulse, tangentimpulse)
    -- print("postSolve")
end

function love.update(dt)
    world:update(dt)
    mainScene:update(dt)
end

function love.draw()
    mainScene:draw()
    -- drawDebugShapes()
end

function love.keypressed(key)
    if (key) == 'escape' then
        love.event.quit()
    end
end
function drawDebugShapes()
    for _, body in pairs(world:getBodyList()) do
        for _, fixture in pairs(body:getFixtureList()) do
            local shape = fixture:getShape()
    
            if shape:typeOf("CircleShape") then
                local cx, cy = body:getWorldPoints(shape:getPoint())
                love.graphics.circle("fill", cx, cy, shape:getRadius())
            elseif shape:typeOf("PolygonShape") then
                love.graphics.polygon("fill", body:getWorldPoints(shape:getPoints()))
            else
                love.graphics.line(body:getWorldPoints(shape:getPoints()))
            end
        end
    end
end