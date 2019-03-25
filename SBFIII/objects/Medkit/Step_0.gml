/// @description Insert description here
// You can write your code in this editor
var player = instance_place(x,y,Player)
if player != noone{
	if player.hp < player.maxHp{
		if player.hp + 2 <= player.maxHp{
			player.hp+=2
		}
		else{
			player.hp = player.maxHp	
		}
		instance_destroy()
	}
}
counter += delta_time/500000
drawy = sin(counter)*4