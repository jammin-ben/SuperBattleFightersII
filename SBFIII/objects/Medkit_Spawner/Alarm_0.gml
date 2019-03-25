/// @description Spawn Medkit
if instance_place(x,y,Medkit) == noone{
	instance_create_layer(x+32,y+32,"Instances",Medkit)
}
Alarm[0]=20*room_speed