/// @description Create Hitbox, Start timer for freedom
//Getting location:
var xoffset = 64
var yoffset = 32*arm
var dst = sqrt(power(xoffset,2)+power(yoffset,2))
var thtoffset = arctan(-yoffset/xoffset)
p=instance_create_layer(x+cos(thtoffset+angle*pi/180)*dst,y-sin(thtoffset+angle*pi/180)*dst,"Instances",Hitbox)
p.enemies=enemies
p.angle=angle

var spf = 1/sprite_get_speed(minotaur_s)//seconds per frame
alarm[1]=3*spf*room_speed //free after 3 frames

arm *= -1