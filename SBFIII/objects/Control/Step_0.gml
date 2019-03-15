/// @description Insert description here
// You can write your code in this editor
if(keyboard_check(ord("P"))) 
	room_restart()
	
//pause logic
if(keyboard_check_pressed(vk_space)){
    paused = !paused;
    if(!sprite_exists(screenShot)){
        screenShot = sprite_create_from_surface(application_surface,0,0,room_width,room_height,0,0,0,0);    
    
	}
}

if(paused){
    instance_deactivate_all(1);
}else{
    if(sprite_exists(screenShot)){
        sprite_delete(screenShot);
    }
	idx=0
    instance_activate_all();
}