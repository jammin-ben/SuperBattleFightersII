var xxvel = knockbackVel[0]
var yyvel = knockbackVel[1]

var r = bbox_right
var l = bbox_left
var b = bbox_bottom
var t = bbox_top

if !collision_rectangle(r+xxvel,t+yyvel,l+xxvel,b+yyvel,Wall,0,1){
	x+=knockbackVel[0]*dt
	y+=knockbackVel[1]*dt
}
else
	show_debug_message("I'm at a wall!")

if(abs(knockbackVel[0])>2 or abs(knockbackVel[1])>2){
	knockbackVel[0]*=.94
	knockbackVel[1]*=.97
}
else{
	knockbackVel=[0,0]	
}