var me = argument0
var xvel = argument1
var yvel = argument2

var r = me.bbox_right
var l = me.bbox_left
var b = me.bbox_bottom
var t = me.bbox_top

var wall = collision_rectangle(r+xvel+1,t+yvel,l+xvel,b+yvel+1,Wall,0,1)
if wall = noone{
	me.x+=xvel
	me.y+=yvel
}
return wall != noone