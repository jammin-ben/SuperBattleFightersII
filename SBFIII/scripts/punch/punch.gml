if arm ==1
	curr_animation=[12,17]
else
	curr_animation=[17,22]
var spf = 1/sprite_get_speed(minotaur_s)//seconds per frame
alarm[0]=2*spf*room_speed //create hitbox after 2 frames
free = false
