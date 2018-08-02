extends "res://PlayableCharacter.gd"

func _ready():
	up = KEY_I
	down=KEY_K
	left=KEY_J
	right=KEY_L
	pass

func _physics_process(delta):
	_move()
	pass