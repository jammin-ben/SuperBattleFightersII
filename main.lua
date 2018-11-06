require "animation_handler"
require "player" 

function love.load()
    Player2 = Player:new(300,10,60,20,"w","s","a","d")
    Player  = Player:new(133,10,40,12,"i","k","j","l")

end

function love.update(dt)
    Player:checkForInput(dt)
    Player2:checkForInput(dt)
    Player:animate(dt)
    Player2:animate(dt)
    Player:move(dt)
    Player2:move(dt)
end

function love.draw()
    love.graphics.draw (Player.animation.spriteSheet, Player.animation.quads[Player.frame], Player.x,Player.y,7/4*math.pi,1)
    love.graphics.draw (Player2.animation.spriteSheet, Player2.animation.quads[Player2.frame], Player2.x,Player2.y,7/4*math.pi,1)
end