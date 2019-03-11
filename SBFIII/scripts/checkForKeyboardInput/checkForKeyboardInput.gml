var up    = keyboard_check(upkey)
var down  = keyboard_check(downkey)
var left  = keyboard_check(leftkey)
var right = keyboard_check(rightkey)
var atk   = keyboard_check_pressed(punchkey)
var chrge = keyboard_check_pressed(chargekey) 


if atk
	punch()

else if (chrge and canCharge)
	charge()

else if right and up{
	dir = 45
	move()
	rotate()
}
else if up and left { 
	dir = 135
	move()
	rotate()
}
else if left and down{
	dir = 225
	move()
	rotate()
}
else if right and down{
	dir =315
	move()
	rotate()
}
else if down{
	dir = 270
	move()
	rotate()
}
else if up {
	dir = 90
	move()
	rotate()
}
else if left{ 
	dir = 180
	move()
	rotate()
}
else if right{ 
	dir = 0
	move()
	
	rotate()
}	
else
	curr_animation=[0,1]