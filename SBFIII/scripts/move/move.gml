//r is the rightmost point of the collision box 
//l is the leftmost
var xvel = Speed * cos(angle*pi/180) * dt
var yvel = -1* Speed * sin(angle*pi/180) * dt
var r = bbox_right
var l = bbox_left
var b = bbox_bottom
var t = bbox_top

var otherdude = collision_rectangle(r+xvel,t+yvel,l+xvel,b+yvel,Player,0,1)
if otherdude!=noone{
	Speed = 100
}
else 
	Speed = 200

if(angle < 90){ //Going right-up
	if(!collision_rectangle(r,t,r+xvel,b,Wall,0,1))
		x+=xvel
	if(!collision_rectangle(r,t,l,t+yvel,Wall,0,1))
		y+=yvel
	if(otherdude!=noone){
		script_execute(getPushed,otherdude,xvel,yvel)
	}
}
else if(angle<180){//left up
	if(!collision_rectangle(l,t,l+xvel,b,Wall,0,1))
		x+=xvel
	if(!collision_rectangle(r,t,l,t+yvel,Wall,0,1))
		y+=yvel
	if(otherdude!=noone){
		script_execute(getPushed,otherdude,xvel,yvel)
	}
}
else if(angle<270){//left down 
	if(!collision_rectangle(l,t,l+xvel,b,Wall,0,1))
		x+=xvel
	if(!collision_rectangle(r,b,l,b+yvel,Wall,0,1))
		y+=yvel
	if(otherdude!=noone){
		script_execute(getPushed,otherdude,xvel,yvel)
	}
}
else{//right down
	if(!collision_rectangle(r,t,r+xvel,b,Wall,0,1))
		x+=xvel
	if(!collision_rectangle(r,b,l,b+yvel,Wall,0,1))
		y+=yvel
	if(otherdude!=noone){
		script_execute(getPushed,otherdude,xvel,yvel)
	}
}	
curr_animation=[0,12]




/*if(!collision_rectangle(,,))
x += Speed * cos(angle*pi/180) * dt
y -= Speed * sin(angle*pi/180) * dt

*/