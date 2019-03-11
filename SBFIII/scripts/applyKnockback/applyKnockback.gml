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
if(abs(knockbackVel[0])>20 or abs(knockbackVel[1])>20){
	knockbackVel[0]*=knockbackFriction
	knockbackVel[1]*=knockbackFriction
}
else{
	knockbackVel=[0,0]	
}