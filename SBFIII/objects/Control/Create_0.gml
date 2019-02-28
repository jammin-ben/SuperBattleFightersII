background_color = c_aqua
var i;
for (i = 0; i < instance_number(Player); i += 1)
   {
   players[i] = instance_find(Player,i);
   }
global.mute=false