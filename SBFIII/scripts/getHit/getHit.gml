var me = argument0
if not me.invincible{
	me.hp-=1
	me.alarm[2]=me.iFrames
	me.col=c_red
	me.invincible=true
	if(me.hp<=0)
		die(me)
}