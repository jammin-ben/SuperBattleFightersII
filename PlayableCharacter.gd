extends "res://Character.gd"

var up   =KEY_W
var left =KEY_A
var down =KEY_S
var right=KEY_D

func _ready():
	pass
	
func _move():
	#ACCELERATE
	if Input.is_key_pressed(right):
		if (motion.x+accel)<maxSpeed:
			motion.x+=accel
		else:
			motion.x=maxSpeed
	if Input.is_key_pressed(left):
		if (motion.x-accel)>-maxSpeed:
			motion.x-=accel
		else:
			motion.x=-maxSpeed
			
	if Input.is_key_pressed(down):
		if (motion.y+accel)<maxSpeed:
			motion.y+=accel
		else:
			motion.y=maxSpeed
	if Input.is_key_pressed(up):
		if (motion.y-accel)>-maxSpeed:
			motion.y-=accel
		else:
			motion.y=-maxSpeed
			
	#FRICTION
	if (!Input.is_key_pressed(left) && !Input.is_key_pressed(right)) || (Input.is_key_pressed(left)&&Input.is_key_pressed(right)):
		if (motion.x > friction):
			motion.x-=friction
		elif(motion.x < -friction):
			motion.x+=friction
		else:
			 motion.x=0
	if !Input.is_key_pressed(up) && !Input.is_key_pressed(down):
		if (motion.y > friction):
			motion.y-=friction
		elif(motion.y < -friction):
			motion.y+=friction
		else:
			 motion.y=0
	
	if (abs(motion.x)>0 && abs(motion.y)>0):
		maxSpeed = 219
	else:
		maxSpeed=300
	
	move_and_slide(motion)
	pass