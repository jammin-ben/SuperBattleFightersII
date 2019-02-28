var me = argument0
var angle = argument1
if not me.invincible{
	if(not global.mute){
		audio_play_sound(punch_sf,1,0)
	}
	me.alarm[0]=-1 //Cancel hitbox of incoming punch
	me.hp-=1
	me.alarm[2]=me.iFrames
	me.col=c_red
	me.invincible=true
	me.knockbackVel=[1000,1000]
	me.knockbackVel[0]*=cos(angle*pi/180)
	me.knockbackVel[1]*=-sin(angle*pi/180)
	
	me.free = false // Apply Stun
	me.alarm[1]=1*room_speed //Free up after 1 second
	me.curr_animation = [0,1]

	if(me.hp<=0)
		die(me)

	
}