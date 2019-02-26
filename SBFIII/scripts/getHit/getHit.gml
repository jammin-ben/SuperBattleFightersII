var me = argument0
var angle = argument1
if not me.invincible{
	me.hp-=1
	me.alarm[2]=me.iFrames
	me.col=c_red
	me.invincible=true
	me.knockbackVel=[1000,1000]
	me.knockbackVel[0]*=cos(angle*pi/180)
	me.knockbackVel[1]*=-sin(angle*pi/180)
	if(me.hp<=0)
		die(me)

	
}