var xxvel = knockbackVel[0]*dt
var yyvel = knockbackVel[1]*dt

var r = bbox_right
var l = bbox_left
var b = bbox_bottom
var t = bbox_top

if !collision_rectangle(r+xxvel,t+yyvel,l+xxvel,b+yyvel,Wall,0,1){
	x+=knockbackVel[0]*dt
	y+=knockbackVel[1]*dt
}
else{
	knockbackVel[0]=0	
	knockbackVel[1]=0
}
	show_debug_message("I'm at a wall!")

if(abs(knockbackVel[0])>2 or abs(knockbackVel[1])>2){
	knockbackVel[0]*=.96
	knockbackVel[1]*=.96
}
else{
	knockbackVel=[0,0]	
}