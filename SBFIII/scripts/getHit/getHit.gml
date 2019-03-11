var me = argument0
var angle = argument1
if not me.invincible{
	if(not global.mute){
		audio_play_sound(punch_sf,1,0)
	}
	me.alarm[0]=-1 //Cancel hitbox of incoming punch
	me.alarm[1]=me.iFrames-20 //Become free
	me.alarm[2]=me.iFrames //become vincible
	me.hp-=1
	me.col=c_red
	me.invincible=true
	me.knockbackVel=[me.knockbackPower,me.knockbackPower]
	me.knockbackVel[0]*=cos(angle*pi/180)
	me.knockbackVel[1]*=-sin(angle*pi/180)
	
	me.free = false // Apply Stun
	me.curr_animation = [0,1]

	if(me.hp<=0)
		die(me)

	
}