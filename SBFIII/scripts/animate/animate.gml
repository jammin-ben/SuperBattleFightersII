var spf = 1/sprite_get_speed(minotaur_s)//seconds per frame
if(image_index+spf*dt>curr_animation[1] or image_index < curr_animation[0])
	image_index = curr_animation[0]