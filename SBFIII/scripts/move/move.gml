//r is the rightmost point of the collision box 
//l is the leftmost
var xvel = Speed * cos(angle*pi/180) * dt
var yvel = -1 * Speed * sin(angle*pi/180) * dt
var r = bbox_right 
var l = bbox_left
var b = bbox_bottom 
var t = bbox_top

var otherdude = collision_rectangle(r+xvel,t+yvel,l+xvel,b+yvel,Player,0,1)
var otherdudeAtWall = false
if otherdude!=noone{
	xvel*=1/2
	yvel*=1/2
	otherdudeAtWall=script_execute(getPushed,otherdude,xvel,yvel) //Push and find out if I can continue moving 
	//*
}
if(!otherdudeAtWall) {
	if(xvel >= 0 and yvel < 0){ //Going right-up
		if(!collision_rectangle(r,t,r+xvel+1,b,Wall,0,1))
			x+=xvel
		if(!collision_rectangle(r,t,l,t+yvel,Wall,0,1))
			y+=yvel
	}
	else if(xvel < 0 and yvel < 0){//left up
		if(!collision_rectangle(l,t,l+xvel,b,Wall,0,1))
			x+=xvel
		if(!collision_rectangle(r,t,l,t+yvel,Wall,0,1))
			y+=yvel
	}
	else if(xvel < 0 and yvel>=0){//left down 
		if(!collision_rectangle(l,t,l+xvel,b,Wall,0,1))
			x+=xvel
		if(!collision_rectangle(r,b,l,b+yvel+1,Wall,0,1))
			y+=yvel
	}
	else {//right down
		if(!collision_rectangle(r,t,r+xvel+1,b,Wall,0,1))
			x+=xvel
		if(!collision_rectangle(r,b,l,b+yvel+1,Wall,0,1))
			y+=yvel
	}	
	curr_animation=[0,12]
}
