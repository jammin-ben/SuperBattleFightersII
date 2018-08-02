extends KinematicBody2D

var health = 3
var maxSpeed = 300
var accel = 20
var friction = 25
var motion = Vector2()

func _ready():
	pass

func _getHit():
	if health>1:
		health-=1
	else:
		 _die()
	pass

func _die():
	pass

func _move():
	pass