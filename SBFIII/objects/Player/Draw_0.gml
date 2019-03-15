/// @description Insert description here
// You can write your code in this editor
draw_sprite_ext(spr, image_index, x,y, 3,3, angle, col, 1)
/*var yvel = -1* Speed * sin(angle*pi/180) * dt
var r = bbox_right-32
var l = bbox_left
var b = bbox_bottom-32
var t = bbox_top

draw_rectangle_color(r,t,l,t+yvel,c_red,c_red,c_red,c_red,0)
draw_rectangle_color(r,t,l,b,c_white,c_white,c_white,c_white,0)*/

for(var i =0; i<maxHp; i++){
	if(team==1){
		if(hp>i){//red heart
			draw_sprite(heart_s,0,100+32*i,85)
		}
		else
			draw_sprite(heart_s,1,100+32*i,85)
	}		
	else if (team==2){ //team==2
		if(hp>i){//red heart
			draw_sprite(heart_s,0,room_width-100-32*i,85)
		}
		else
			draw_sprite(heart_s,1,room_width-100-32*i,85)
	}
	else if (team==3){
		if(hp>i){
			draw_sprite(heart_s,0,100+32*i,room_height-85)
		}
		else
			draw_sprite(heart_s,1,100+32*i,room_height-85)
	}
	else if (team==4){
		if(hp>i){
			draw_sprite(heart_s,0,room_width-100-32*i,room_height-85)
		}
		else
			draw_sprite(heart_s,1,room_width-100-32*i,room_height-85)
	}
	
}