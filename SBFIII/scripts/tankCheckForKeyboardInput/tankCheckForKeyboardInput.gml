var up    = keyboard_check(upkey)
var down  = keyboard_check(downkey)
var left  = keyboard_check(leftkey)
var right = keyboard_check(rightkey)
var atk   = keyboard_check_pressed(punchkey)

if atk
	punch()
else{
	if up {
		Speed=maxSpeed
		move() 
	}
	else if down{
		Speed=-maxSpeed/3*2
		move()
	}
	else curr_animation = [0,1]
	
	if left{
		angle += turnSpeed * dt	
	}
	if right{
		angle -= turnSpeed * dt 
	}
	if(angle > 360) angle -= 360
	if(angle < 0) angle += 360
}