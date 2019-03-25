/// @description Insert description here
// You can write your code in this editor
draw_set_halign(fa_center);

if(paused){
    draw_sprite_ext(screenShot,0,0,0,1,1,0,c_gray,1);
	draw_sprite_ext(pause_s,idx,room_width/2,room_height/2,2,2,0,c_white,1);
}