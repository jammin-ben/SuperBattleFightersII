var me = argument0
var xvel = argument1
var yvel = argument2

var r = me.bbox_right
var l = me.bbox_left
var b = me.bbox_bottom
var t = me.bbox_top

if !collision_rectangle(r+xvel,t+yvel,l+xvel,b+yvel,Wall,0,1){
	me.x+=xvel
	me.y+=yvel
}
//return collision_rectangle(r+xvel,t+yvel,l+xvel,b+yvel,Wall,0,1)
	