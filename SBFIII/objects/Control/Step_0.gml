/// @description Insert description here
// You can write your code in this editor
if(keyboard_check(ord("P"))) 
	room_restart()
	
//pause logic
if(keyboard_check_pressed(vk_space)){
    paused = !paused;
    if(!sprite_exists(screenShot)){
        mb = instance_create_layer(room_width/2,room_height/2+96,"Instances",menu_button)
		screenShot = sprite_create_from_surface(application_surface,0,0,room_width,room_height,0,0,0,0);    
	}
}

if(paused){    
	instance_deactivate_all(1);
	instance_activate_object(mb)
	mb.depth=-1
}else{
    if(sprite_exists(screenShot)){
        sprite_delete(screenShot);
    }
	instance_destroy(mb)
	idx=0
    instance_activate_all();
}