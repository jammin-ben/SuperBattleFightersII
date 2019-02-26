/// @description Insert description here
// You can write your code in this editor
obj = instance_place(x,y,Wall)
if(obj!=noone)
	instance_destroy(obj)

var _list = ds_list_create();
var _num = instance_place_list(x, y, Player, _list, false);
if _num > 0
    {
    for (var i = 0; i < _num; ++i;)
        {
		if searchList(enemies,_list[| i])
			{
				getHit(_list[| i])
			}
		}
    }
ds_list_destroy(_list);