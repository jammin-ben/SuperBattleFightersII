
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
//Step 1: consolidate movement script
//Step 2: create collision check in movement script for other bull which is recursive