require "animation_handler"
require "player" 

function love.load()

    love.graphics.setBackgroundColor( 255, 255, 100 )
    Player   = Player:new(30 ,10,100,"w","s","a","d")
    Player2  = Player:new(333,10,100,"i","k","j","l")

end

function love.update(dt)
    Player:step(dt)
    Player2:step(dt)
end

function love.draw()
    love.graphics.draw (Player.animation.spriteSheet, Player.animation.quads[Player.frame], Player.x,Player.y,Player.angle,1,1,64,64)
    love.graphics.draw (Player2.animation.spriteSheet, Player2.animation.quads[Player2.frame], Player2.x,Player2.y,Player2.angle,1,1,64,64)
end