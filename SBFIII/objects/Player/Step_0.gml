
dt = delta_time/1000000

if(free){
	//checkForKeyboardInput()
	tankCheckForKeyboardInput()
}
if(knockbackVel!=[0,0])
	applyKnockback()
animate()
if(charging){
	move()
}